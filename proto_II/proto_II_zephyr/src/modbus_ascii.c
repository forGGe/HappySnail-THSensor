#include "modbus_ascii.h"

#include <assert.h>
#include <ctype.h>

int modbus_init(struct modbus_ctx *ctx, u16_t addr, struct ring_buf *buf)
{
        assert(ctx != NULL);
        assert(addr != 0);
        assert(buf != NULL);

        ctx->addr = addr;
        ctx->data = buf;

        return MODBUS_OK;
}

int modbus_feed_byte(struct modbus_ctx *ctx, u8_t byte)
{
        assert(ctx != NULL);
        assert(ctx->data != NULL);

        if (!isxdigit(byte) && byte != '\r' && byte != '\n' && byte != ':') {
                return MODBUS_ERR;
        }

        if (ring_buf_put(ctx->data, &byte, 1) != 1) {
                return MODBUS_ERR_FULL;
        }

        return MODBUS_OK;
}
