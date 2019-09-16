/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr.h>
#include <device.h>
#include <sensor.h>
#include <stdio.h>
#include <gpio.h>
#include <misc/printk.h>
#include <assert.h>
#include <uart.h>
#include <string.h>
#include <sys/types.h>
#include <stdlib.h>
#include <i2c.h>

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
/* Not supported (yet)
	MODBUS_FN_READ_COIL			= 0x1,
	MODBUS_FN_READ_INPUT_STATUS		= 0x2,
	MODBUS_FN_READ_INPUT_REG		= 0x4,
*/
	MODBUS_FN_READ_HOLDING_REG		= 0x3,
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
	u8_t data[256];
	u8_t cnt;
	enum modbus_state state;
};

struct modbus_data
{
	u8_t addr;
	u8_t fn;
	uint16_t obj_addr;
	uint16_t qty;
	u8_t crc;
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
static u8_t modbus_lrc(const u8_t *data, size_t sz)
{
	u8_t lrc = 0;

	for (size_t i = 0; i < sz; i += 2) {
		lrc += hexchunk_toul(&data[i], 2);
	}

	return (u8_t)(-lrc);
}

static int modbus_process_raw_frame(struct modbus_frame *buf, struct modbus_data *out)
{
	assert(out != NULL);
	assert(buf != NULL);

	if (buf->cnt != 14) {
		printf("frames with length %d are not supported yet\n", buf->cnt);
		return -1;
	}

	u8_t crc;
	u8_t calc_crc;

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
static ssize_t modbus_process_raw_data(struct modbus_frame *buf, struct modbus_data *out, const u8_t *new_data, size_t new_data_sz)
{
	assert(buf != NULL);
	assert(out != NULL);
	assert(new_data != NULL);

	printf("buf state: %d %d\n", buf->cnt, buf->state);

	size_t bytes_processed = 0;
	for (; bytes_processed < new_data_sz; ++bytes_processed) {
		u8_t data_byte = new_data[bytes_processed];

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
	struct device *gpio_dev;
	struct drv_buf {
		u8_t data[256];
		u8_t cnt;
	} buf;
	struct drv_tx_buf {
		u8_t buf[256];
		size_t sz;
		size_t cur;
	} tx_buf;
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

	/* Check for End-of-TX */
	if (ctx->tx_buf.cur == ctx->tx_buf.sz) {
		ctx->tx_buf.cur = 0;
		ctx->tx_buf.sz = 0;
		uart_irq_tx_disable(ctx->dev);
		/* Enable RS485 RX line and disable TX */
		gpio_pin_write(ctx->gpio_dev, 5, 0);
	}

	if (uart_irq_tx_ready(ctx->dev)
			&& ctx->tx_buf.sz != 0
			&& ctx->tx_buf.cur < ctx->tx_buf.sz) {
		int written = uart_fifo_fill(ctx->dev, &ctx->tx_buf.buf[ctx->tx_buf.cur], 1);
		ctx->tx_buf.cur += written;
	}
}

static struct drv_ctx modbus_ctx;
static struct drv_buf modbus_safe_data;

#define TTSi7006_I2C_ADDRESS              0x40
#define TTSi7006_ID                       0x186

#define TTSi7006_REG_REL_HUM              0xE5
#define TTSi7006_REG_TEMP                 0xE3
#define TTSi7006_REG_TEMP_DUP             0xE0

static int si7006_reg_read(struct device *i2c_master,
			  u8_t start, u8_t *buf, int size)
{
	return i2c_burst_read(i2c_master, TTSi7006_I2C_ADDRESS,
			      start, buf, size);
}

static int si7006_reg_write(struct device *i2c_master, u8_t reg, u8_t val)
{
	return i2c_reg_write_byte(i2c_master, TTSi7006_I2C_ADDRESS,
				  reg, val);
}

static int si7006_reg_read16(struct device *i2c_master,
						u16_t start,
						u8_t *buf,
						u32_t size)
{
	u8_t addr_buffer[2];

	addr_buffer[1] = start & 0xFF;
	addr_buffer[0] = start >> 8;

	struct i2c_msg msg[2];

	msg[0].buf = (u8_t *)addr_buffer;
	msg[0].len = sizeof(addr_buffer);
	msg[0].flags = I2C_MSG_WRITE;

	msg[1].buf = (u8_t *)buf;
	msg[1].len = size;
	msg[1].flags = I2C_MSG_RESTART | I2C_MSG_READ | I2C_MSG_STOP;

	return i2c_transfer(i2c_master, msg, 2, TTSi7006_I2C_ADDRESS);
}


static void si7006_print_sn(struct device *i2c_master)
{
	int rc;
	u8_t buf[8];

	rc = si7006_reg_read16(i2c_master, 0xfa0f, buf, sizeof(buf));
	printf("rc: %d\n", rc);
	if (rc < 0)
		return;

	printf("1 -> %x-%x-%x-%x-%x-%x-%x-%x\n",
		buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6], buf[7]);

	rc = si7006_reg_read16(i2c_master, 0xfcc9, buf, 6);
	printf("rc: %d\n", rc);
	if (rc < 0)
		return;

	printf("2 -> %x-%x-%x-%x-%x-%x\n",
		buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);

}

void main(void)
{
	// struct device *sensor_dev = device_get_binding("BME280");
	struct device *i2c_dev = device_get_binding("I2C_1");
	struct device *rs485_dev = device_get_binding("UART_1");
	struct device *gpioa = device_get_binding("GPIOA");

	modbus_ctx.dev = rs485_dev;
	modbus_ctx.gpio_dev = gpioa;

	int rc;

	printk("Hello World! %s\n", CONFIG_BOARD);
	printk("Starting BAT test for Happy Snail RH/T subproject\n");

	// if (sensor_dev == NULL) {
	// 	printf("could not get BME280 device\n");
	// 	return;
	// }

	if (i2c_dev == NULL) {
		printf("could not get I2C device\n");
		return;
	}

	if (gpioa == NULL) {
		printf("could not get GPIOA device\n");
		return;
	}

	if (rs485_dev == NULL) {
		printf("could not get RS485 device\n");
		return;
	}

	rc = gpio_pin_configure(gpioa, 5, GPIO_DIR_OUT);
	if (rc < 0) {
		printf("failed to configure GPIO pin\n");
	}

	// printf("sensor_dev %p name %s\n", sensor_dev, sensor_dev->config->name);

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
	struct modbus_data modbus_parsed = {0};

	/* Enable RS485 RX line and disable TX */
	gpio_pin_write(gpioa, 5, 0);

	si7006_print_sn(i2c_dev);

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
				struct sensor_value temp = {0};
				struct sensor_value humidity = {0};
				struct sensor_value press = {0};

				u8_t si_data[32];
				u32_t sample;

				rc = si7006_reg_read(i2c_dev, TTSi7006_REG_REL_HUM, si_data, 3);
				sample = ((u32_t)si_data[0] << 8) | si_data[1];
				printf("sample: %#x\n", sample);
				sample = (u32_t)12500 * sample / 65536 - 600;
				humidity.val1 = sample / 100;
				humidity.val2 = sample % 100;

				rc = si7006_reg_read(i2c_dev, TTSi7006_REG_TEMP_DUP, si_data, 3);
				sample = ((u32_t)si_data[0] << 8) | si_data[1];
				printf("sample: %#x\n", sample);
				sample = (u32_t)17572 * sample / 65536 - 4685;
				temp.val1 = sample / 100;
				temp.val2 = sample % 100;

				// sensor_sample_fetch(sensor_dev);
				// sensor_channel_get(sensor_dev, SENSOR_CHAN_AMBIENT_TEMP, &temp);
				// sensor_channel_get(sensor_dev, SENSOR_CHAN_PRESS, &press);
				// sensor_channel_get(sensor_dev, SENSOR_CHAN_HUMIDITY, &humidity);

				printf("temp: %d.%06d; press: %d.%06d; humidity: %d.%06d\n",
					temp.val1, temp.val2, press.val1, press.val2,
					humidity.val1, humidity.val2);

				bool retry = true;
				do {
					irq_disable(DT_USART_1_IRQ);
					if (modbus_ctx.tx_buf.sz == 0) {
						/* TODO: ugly */
						int n = snprintf(modbus_ctx.tx_buf.buf, sizeof(modbus_ctx.tx_buf.buf),
							":%02X%02X%02X%04X%04X%04X%04X%04X%04X",
							MODBUS_BAT_SLAVE_ADDRESS, MODBUS_FN_READ_HOLDING_REG,
							12, /* Total bytes to be transmitted */
							(s16_t)temp.val1, 	(s16_t)(temp.val2 / 10000), /* Convert 10^-6 fixed-point value to 10^-2 */
							(s16_t)press.val1,	(s16_t)(press.val2 / 10000), /* Convert 10^-6 fixed-point value to 10^-2 */
							(s16_t)humidity.val1,	(s16_t)(humidity.val2 / 10000) /* Convert 10^-6 fixed-point value to 10^-2 */
						);

						/* TODO: ugly */

						u8_t crc = modbus_lrc(modbus_ctx.tx_buf.buf + 1, n - 1);
						n += snprintf(modbus_ctx.tx_buf.buf + n, sizeof(modbus_ctx.tx_buf.buf) - n,
							"%02X\r\n", crc);
						modbus_ctx.tx_buf.sz = n;
						printf("> sending: %*s\n", modbus_ctx.tx_buf.sz, modbus_ctx.tx_buf.buf);
						retry = false;
					}

					irq_enable(DT_USART_1_IRQ);
					k_sleep(100);
				} while (retry);

				/* Enable RX line and disable TX */
				gpio_pin_write(gpioa, 5, 1);

				/* Rest of processing will occur in ISR routine */
				uart_irq_tx_enable(rs485_dev);

				retry = true;
				do {
					irq_disable(DT_USART_1_IRQ);
					retry = (modbus_ctx.tx_buf.sz != 0);
					irq_enable(DT_USART_1_IRQ);
					k_sleep(100);
				} while (retry);

				printf("response sent\n");
				/* Done with sending this response, try next one */
				modbus_parsed.complete = false;
			}

			modbus_safe_data.cnt -= read;
		}
	}

	return;
err:
	printf("failed to run BAT\n");
}
