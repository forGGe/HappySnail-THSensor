#ifndef MODBUS_ASCII_H_
#define MODBUS_ASCII_H_

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <zephyr/types.h>
#include <sys/ring_buffer.h>

enum modbus_state
{
	MODBUS_STATE_WAIT_START,
	MODBUS_STATE_INCOMPLETE,
	MODBUS_STATE_COMPLETE,
};

enum modbus_op
{
	MODBUS_OP_READ_INPUTS			= 1,
	MODBUS_OP_READ_COILS			= 2,
	MODBUS_OP_READ_HOLDING_REGS		= 3,
	MODBUS_OP_READ_INPUT_REGS		= 4,
	MODBUS_OP_WRITE_COIL			= 5,
	MODBUS_OP_WRITE_HOLDING_REG		= 6,
	MODBUS_OP_WRITE_COILS			= 15,
	MODBUS_OP_WRITE_HOLDING_REGS		= 16,
};

struct modbus_ctx
{
	struct ring_buf 	*data;
	enum modbus_state	state;
	u16_t			addr;
};

typedef int (*modbus_handle_read_inputs)(void *ctx, u16_t addr, u16_t cnt, u8_t *resp_buf, size_t sz);
typedef int (*modbus_handle_read_coils)(void *ctx, u16_t addr, u16_t cnt, u8_t *resp_buf, size_t sz);
typedef int (*modbus_handle_read_holding_regs)(void *ctx, u16_t addr, u16_t cnt, u16_t *resp_buf, size_t sz);
typedef int (*modbus_handle_read_input_regs)(void *ctx, u16_t addr, u16_t cnt, u16_t *resp_buf, size_t sz);
typedef int (*modbus_handle_write_coil)(void *ctx, u16_t addr, bool value);
typedef int (*modbus_handle_write_holding_reg)(void *ctx, u16_t addr, bool value);
typedef int (*modbus_handle_write_coils)(void *ctx, u8_t *coils, u16_t cnt);
typedef int (*modbus_handle_write_holding_regs)(void *ctx, u16_t *regs, u16_t cnt);

struct modbus_processor
{
	enum modbus_op		op;
	u16_t 			obj_addr;
	u16_t			obj_cnt;
	union
	{
		modbus_handle_read_inputs 		read_inputs;
		modbus_handle_read_coils 		read_coils;
		modbus_handle_read_holding_regs 	read_holding_regs;
		modbus_handle_read_input_regs 		read_input_regs;
		modbus_handle_write_coil 		write_coil;
		modbus_handle_write_holding_reg 	write_holding_reg;
		modbus_handle_write_coils 		write_coils;
		modbus_handle_write_holding_regs 	write_holding_regs;
	} obj_handler;
};

#define MODBUS_DATA_FOLLOWS		2
#define MODBUS_NEED_MORE		1
#define MODBUS_OK			0
#define MODBUS_ERR			-1
#define MODBUS_ERR_FRAME		-2
#define MODBUS_ERR_CRC			-3
#define MODBUS_ERR_FULL			-4
#define MODBUS_ERR_OP			-5
#define MODBUS_ERR_NOMEM		-6

int modbus_init(struct modbus_ctx *ctx, u16_t addr, struct ring_buf *buf);
int modbus_feed_byte(struct modbus_ctx *ctx, u8_t byte);
int modbus_try_process(struct modbus_ctx *ctx, struct modbus_processor *proc, size_t proc_sz, u32_t *proc_buf, size_t buf_sz);

#endif /* MODBUS_ASCII_H_ */
