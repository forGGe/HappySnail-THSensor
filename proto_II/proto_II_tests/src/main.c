/*
 * Copyright (c) 2016 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ztest.h>
#include "modbus_ascii.h"

/**
 * @brief Test Asserts
 *
 * This test verifies various assert macros provided by ztest.
 *
 */
static void test_assert(void)
{
	zassert_true(1, "1 was false");
	zassert_false(0, "0 was true");
	zassert_is_null(NULL, "NULL was not NULL");
	zassert_not_null("foo", "\"foo\" was NULL");
	zassert_equal(1, 1, "1 was not equal to 1");
	zassert_equal_ptr(NULL, NULL, "NULL was not equal to NULL");
}

RING_BUF_ITEM_DECLARE_POW2(test_ringbuf, 8);

static void test_init(void)
{
	int rc;
	struct modbus_ctx ctx;
	rc = modbus_init(&ctx, 42, &test_ringbuf);
	zassert_equal(rc, MODBUS_OK, "init modbus fail");
}

static void test_feed_byte(void)
{
	int rc;
	struct modbus_ctx ctx;
	rc = modbus_init(&ctx, 42, &test_ringbuf);
	zassert_equal(rc, MODBUS_OK, "init modbus fail");

	rc = modbus_feed_byte(&ctx, 245);
	zassert_equal(rc, MODBUS_ERR, "invalid data test fail");

	rc = modbus_feed_byte(&ctx, 'A');
	zassert_equal(rc, MODBUS_OK, "valid data test fail");

	rc = modbus_feed_byte(&ctx, 'Z');
	zassert_equal(rc, MODBUS_ERR, "invalid data test fail");

	rc = modbus_feed_byte(&ctx, '8');
	zassert_equal(rc, MODBUS_OK, "valid data test fail");

	rc = modbus_feed_byte(&ctx, ':');
	zassert_equal(rc, MODBUS_OK, "valid data test fail");

	rc = modbus_feed_byte(&ctx, '\r');
	zassert_equal(rc, MODBUS_OK, "valid data test fail");

	rc = modbus_feed_byte(&ctx, '\n');
	zassert_equal(rc, MODBUS_OK, "valid data test fail");
}

static void test_process_no_data(void)
{
	int rc;
	const char msg[] = "abcdef00101010abcd";

	ring_buf_reset(&test_ringbuf);
	ring_buf_put(&test_ringbuf, msg, sizeof(msg));

	struct modbus_ctx ctx;
	rc = modbus_init(&ctx, 42, &test_ringbuf);
	zassert_equal(rc, MODBUS_OK, "init modbus fail");


}

void test_main(void)
{
	ztest_test_suite(framework_tests,
		ztest_unit_test(test_assert),
		ztest_unit_test(test_init),
		ztest_unit_test(test_feed_byte),
		ztest_unit_test(test_process_no_data)
	);

	ztest_run_test_suite(framework_tests);
}
