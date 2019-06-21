/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr.h>
#include <device.h>
#include <sensor.h>
#include <stdio.h>
#include <misc/printk.h>
#include <assert.h>
#include <uart.h>
#include <string.h>
#include <sys/types.h>
#include <stdlib.h>

#define MODBUS_BAT_SLAVE_ADDRESS 		42

/* Test registers, used in this BAT */
enum modbus_regs
{
	MODBUS_BAT_INPUT_REG_FIRST		= 1000,
	MODBUS_BAT_INPUT_REG_TEMP_HIGH		= MODBUS_BAT_INPUT_REG_FIRST,
	MODBUS_BAT_INPUT_REG_TEMP_LOW,
	MODBUS_BAT_INPUT_REG_HUMID_HIGH,
	MODBUS_BAT_INPUT_REG_HUMID_LOW,
	MODBUS_BAT_INPUT_REG_PRESSURE_HIGH,
	MODBUS_BAT_INPUT_REG_PRESSURE_LOW,
	MODBUS_BAT_INPUT_REG_LAST		= MODBUS_BAT_INPUT_REG_PRESSURE_LOW,
};

/* Test functions, used in this BAT */
enum modbus_fn
{
	MODBUS_FN_READ_COIL			= 0x1,
/* Not supported (yet)
	MODBUS_FN_READ_INPUT_STATUS		= 0x2,
	MODBUS_FN_READ_HOLDING_REG		= 0x3,
	MODBUS_FN_READ_INPUT_REG		= 0x4,
*/
};

enum modbus_state
{
	MODBUS_EMPTY,
	MODBUS_WAIT_CR,
	MODBUS_WAIT_LF,
	MODBUS_COMPLETE,
};

struct modbus_frame
{
	uint8_t data[256];
	uint8_t cnt;
	enum modbus_state state;
};

struct modbus_data
{
	uint8_t addr;
	uint8_t fn;
	uint16_t obj_addr;
	uint16_t qty;
	uint8_t crc;
	bool complete;
};

static uint32_t hexchunk_toul(const char *start, size_t qty)
{
	char buf[qty + 1];
	memcpy(buf, start, qty);
	buf[qty] = 0;

	return strtol(buf, NULL, 16);
}

/* TODO: ugly */
static uint8_t modbus_lrc(const uint8_t *data, size_t sz)
{
	uint8_t lrc = 0;

	for (size_t i = 0; i < sz; i += 2) {
		lrc += hexchunk_toul(&data[i], 2);
	}

	return (uint8_t)(-lrc);
}

static int modbus_process_raw_frame(struct modbus_frame *buf, struct modbus_data *out)
{
	assert(out != NULL);
	assert(buf != NULL);

	if (buf->cnt != 14) {
		printf("frames with length %d are not supported yet\n", buf->cnt);
		return -1;
	}

	uint8_t crc;
	uint8_t calc_crc;

	/* TODO: better error check */

	out->addr 	= hexchunk_toul(&buf->data[0], 2);
	out->fn 	= hexchunk_toul(&buf->data[2], 2);
	out->obj_addr 	= hexchunk_toul(&buf->data[4], 4);
	out->qty 	= hexchunk_toul(&buf->data[8], 4);
	crc 		= hexchunk_toul(&buf->data[12], 2);

	if (out->addr != 42) {
		printf("not supported slave address %d\n", out->addr);
		return -1;
	}

	if (out->obj_addr != MODBUS_BAT_INPUT_REG_FIRST) {
		printf("reading regs starting from %d is not implemented\n", out->obj_addr);
		return -1;
	}

	if (out->qty != (MODBUS_BAT_INPUT_REG_LAST - MODBUS_BAT_INPUT_REG_FIRST + 1)) {
		printf("reading regs of range: %d not implmented\n", out->qty);
		return -1;
	}

	/* Exclude crc byte at the end of the packet */
	calc_crc = modbus_lrc(buf->data, buf->cnt - 2);

	if (calc_crc != crc) {
		printf("crc failed. expect: %#x, actual: %#x\n", calc_crc, crc);
	}

	return 0;
}

/**
 * \return Number of bytes processed.
 * \retval 0 Parsing already complete.
 * \retval -1 Invalid frame detected.
 */
static ssize_t modbus_process_raw_data(struct modbus_frame *buf, struct modbus_data *out, const uint8_t *new_data, size_t new_data_sz)
{
	assert(buf != NULL);
	assert(out != NULL);
	assert(new_data != NULL);

	printf("buf state: %d %d\n", buf->cnt, buf->state);

	size_t bytes_processed = 0;
	for (; bytes_processed < new_data_sz; ++bytes_processed) {
		uint8_t data_byte = new_data[bytes_processed];

		/* Check that buffer is in valid state */
		if (buf->cnt == sizeof(buf->data) - 1) {
			printf("overflow detected\n");
			buf->cnt = 0;
			buf->state = MODBUS_EMPTY;
			continue;
		}

		/* Detect frame start; if detected - should re-init parser at any state */
		if (data_byte == ':') {
			printf("frame start detected\n");
			buf->state = MODBUS_WAIT_CR;
			buf->cnt = 0;
			out->complete = false;
			continue;
		}

		switch (buf->state) {
		case MODBUS_EMPTY:
			printf("skipping data, not yet found a frame start\n");
			break;
		case MODBUS_WAIT_CR:
			/* Check allowed set of symbols */
			if ((data_byte < '0' || data_byte > '9')
					&& (data_byte < 'A' || data_byte > 'F')
					&& data_byte != '\r') {
				printf("invalid symbol detected\n");
				buf->state = MODBUS_EMPTY;
				buf->cnt = 0;
				continue;
			}

			if (data_byte == '\r') {
				printf("CR detected\n");
				buf->state = MODBUS_WAIT_LF;
				continue;
			}

			/* Only state where appending symbols is allowed */
			buf->data[buf->cnt++] = data_byte;
			break;
		case MODBUS_WAIT_LF:
			if (data_byte == '\n') {
				printf("LF detected\n");
				buf->state = MODBUS_COMPLETE;
				printf("data recv: %*s\n", buf->cnt, buf->data);

				if (modbus_process_raw_frame(buf, out) < 0) {
					/* Parsing failed, but invalid and old data can be discarded */
					buf->cnt = 0;
					return -1;
				}

				/* Parsing complete */
				buf->cnt = 0;
				out->complete = true;
				return bytes_processed;
			} else {
				printf("invalid symbol detected while waiting for LF\n");
				buf->state = MODBUS_EMPTY;
				buf->cnt = 0;
			}
			continue;
		case MODBUS_COMPLETE:
			printf("complete frame, no more symbols required\n");
			continue;
			break;
		default:
			printf("invalid state: %d\n", buf->state);
			continue;
			break;
		}
	}

	/* Need more data */
	return bytes_processed;
}

struct drv_ctx
{
	struct device *dev;
	struct drv_buf {
		uint8_t data[256];
		uint8_t cnt;
	} buf;
};

static void uart1_irq_cb(void *user_data)
{
	struct drv_ctx *ctx = user_data;
	uart_irq_update(ctx->dev);

	if (uart_irq_rx_ready(ctx->dev)) {
		int read = uart_fifo_read(ctx->dev, ctx->buf.data + ctx->buf.cnt,
			ARRAY_SIZE(ctx->buf.data) - ctx->buf.cnt);
		ctx->buf.cnt += read;
	}
}

static struct drv_ctx modbus_ctx;
static struct drv_buf modbus_safe_data;

void main(void)
{
	struct device *bme280_dev = device_get_binding("BME280");
	struct device *rs485_dev = device_get_binding("UART_1");

	modbus_ctx.dev = rs485_dev;

	int rc;

	printk("Hello World! %s\n", CONFIG_BOARD);

	if (bme280_dev == NULL) {
		printf("Could not get BME280 device\n");
		return;
	}

	printf("bme280_dev %p name %s\n", bme280_dev, bme280_dev->config->name);

	struct uart_config uart1_cfg = {
		.baudrate	= 9600,
		.parity		= UART_CFG_PARITY_NONE,
		.stop_bits	= UART_CFG_STOP_BITS_1,
		.data_bits	= UART_CFG_DATA_BITS_8,
		.flow_ctrl	= UART_CFG_FLOW_CTRL_NONE
	};

	rc = uart_configure(rs485_dev, &uart1_cfg);
	if (rc < 0) {
		printf("failed to configure uart1: %d\n", rc);
		goto err;
	}

	uart_irq_callback_user_data_set(rs485_dev, uart1_irq_cb, &modbus_ctx);

	uart_irq_rx_enable(rs485_dev);

	struct modbus_frame frame = {0};
	struct modbus_data modbus_parsed;

	while (1) {
		k_cpu_idle();

		irq_disable(DT_USART_1_IRQ);
		memcpy(&modbus_safe_data, &modbus_ctx.buf, sizeof(modbus_safe_data));
		modbus_ctx.buf.cnt = 0;
		irq_enable(DT_USART_1_IRQ);

		if (modbus_safe_data.cnt > 0) {
			printf("> data %d: %*s\n", (int)modbus_safe_data.cnt, modbus_safe_data.cnt, modbus_safe_data.data);
			size_t read = modbus_process_raw_data(&frame, &modbus_parsed, modbus_safe_data.data, modbus_safe_data.cnt);
			printf("> modbus processed: %d\n", read);
			if (modbus_parsed.complete) {
				struct sensor_value temp, press, humidity;

				sensor_sample_fetch(bme280_dev);
				sensor_channel_get(bme280_dev, SENSOR_CHAN_AMBIENT_TEMP, &temp);
				sensor_channel_get(bme280_dev, SENSOR_CHAN_PRESS, &press);
				sensor_channel_get(bme280_dev, SENSOR_CHAN_HUMIDITY, &humidity);

				printf("temp: %d.%06d; press: %d.%06d; humidity: %d.%06d\n",
					temp.val1, temp.val2, press.val1, press.val2,
					humidity.val1, humidity.val2);
			}

			modbus_safe_data.cnt -= read;
		}
	}

	return;
err:
	printf("failed to run BAT\n");
}
