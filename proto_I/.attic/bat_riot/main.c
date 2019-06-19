/*
 * Copyright (C) 2014 Freie Universität Berlin
 *
 * This file is subject to the terms and conditions of the GNU Lesser
 * General Public License v2.1. See the file LICENSE in the top level
 * directory for more details.
 */

/**
 * @ingroup     examples
 * @{
 *
 * @file
 * @brief       Hello World application
 *
 * @author      Kaspar Schleiser <kaspar@schleiser.de>
 * @author      Ludwig Knüpfer <ludwig.knuepfer@fu-berlin.de>
 *
 * @}
 */

#include <stdio.h>
#include <string.h>
#include <bmx280.h>
#include <periph/i2c.h>
#include <periph/uart.h>

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
    uint16_t address;
    uint16_t function;
};

/**
 * \return Number of bytes processed.
 * \retval 0 Parsing already complete.
 */
static size_t modbus_process_data(struct modbus_frame *buf, struct modbus_data *out, const uint8_t *new_data, size_t new_data_sz)
{
    assert(buf != NULL);
    assert(out != NULL);
    assert(new_data != NULL);

    printf("buf state: %d %d\n", buf->cnt, buf->state);

    size_t bytes_processed = 0;
    for (; bytes_processed < new_data_sz; ++bytes_processed) {
        uint8_t data_byte = new_data[bytes_processed];

        printf("data: %#x, %c\n", data_byte, data_byte);

        /* Check that buffer is in valid state */
        if (buf->cnt == sizeof(buf->data) - 1) {
            printf("overflow detected\n");
            buf->cnt = 0;
            buf->state = MODBUS_EMPTY;
            continue;
        }

        /* Detect frame start, if detected - should re-init parser at any state */
        if (data_byte == ':') {
            printf("frame start detected\n");
            buf->state = MODBUS_WAIT_CR;
            buf->cnt = 0;
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
                /* Parsing complete */
                buf->cnt = 0;
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
    return bytes_processed - 1;
}


struct uart_isr_data
{
    uint8_t data[256];
    uint8_t cnt;
    kernel_pid_t wakeup_thread;
};

static void uart_rx_cb(void *arg, uint8_t data)
{
    struct uart_isr_data *isr_data = arg;
    isr_data->data[isr_data->cnt++] = data;
    // thread_wakeup(isr_data->wakeup_thread);
}

int main(void)
{
    printf("You are running RIOT on a(n) %s board.\n", RIOT_BOARD);
    printf("This board features a(n) %s MCU.\n", RIOT_MCU);

    const i2c_t bme280_i2c = 0;
    /* Note that 1st UART is reserved - it is used for stdio */
    const uart_t rs485_uart = 0;
    int rc;

    struct uart_isr_data isr_data = {0};
    struct uart_isr_data safe_data = {0};
    struct modbus_frame frame = {0};

    int16_t temp;
    uint16_t press;
    uint16_t humid;

    printf("getting PID of current process\n");

    isr_data.wakeup_thread = thread_getpid();

    printf("initializing UART for RS485/Modbus\n");

    rc = uart_init(rs485_uart, 9600, uart_rx_cb, &isr_data);

    printf("uart init status: %d\n", rc);

    if (rc != UART_OK) {
        goto done;
    }

    printf("uart configure status: %d\n", rc);

    rc = uart_mode(rs485_uart, UART_DATA_BITS_8, UART_PARITY_NONE, UART_STOP_BITS_1);

    if (rc != UART_OK) {
        goto done;
    }

    printf("initializing i2c\n");

    i2c_init(bme280_i2c);

    printf("initializing sensor\n");

    bmx280_t bme280;
    bmx280_params_t bme280_params = {
        .i2c_dev                = bme280_i2c,
        .i2c_addr               = 0x76,
        .t_sb                   = BMX280_SB_20,
        .filter                 = BMX280_FILTER_OFF,
        .spi3w_en               = false,
        .run_mode               = BMX280_MODE_FORCED,
        .temp_oversample        = BMX280_OSRS_X8,
        .press_oversample       = BMX280_OSRS_X8,
        .humid_oversample       = BMX280_OSRS_X8,
    };

    rc = bmx280_init(&bme280, &bme280_params);

    printf("sensor status: %d\n", rc);

    if (rc != BMX280_OK) {
        goto done;
    }

    temp = bmx280_read_temperature(&bme280);
    press = bmx280_read_pressure(&bme280);
    humid = bme280_read_humidity(&bme280);

    printf("sensor temp: %d, humid: %d, press: %d\n", temp, humid, press);

    uart_write(rs485_uart, (const uint8_t*)"TEST", sizeof("TEST"));

    while (1) {
        // thread_sleep();

        /* Copying data from the interrupt handler */

        irq_disable();
        if (isr_data.cnt > 0) {
            memcpy(&safe_data, &isr_data, sizeof(safe_data));
            isr_data.cnt = 0;
        } else {
            irq_enable();
            continue;
        }
        irq_enable();

        printf("recv count: %d\n", safe_data.cnt);
        for (size_t i = 0; i < safe_data.cnt; ++i) {
            printf(">> %c\n", safe_data.data[i]);
        }

        /* Wait for any data */
        if (safe_data.cnt == 0) {
            printf("spurious wakeup: no data from rs485\n");
            continue;
        }

        struct modbus_data out;

        rc = modbus_process_data(&frame, &out, safe_data.data, safe_data.cnt);
        printf("parsed data count: %d\n", rc);

        safe_data.cnt = 0;
    }

done:
    return 0;
}
