# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13.1)

# Tweak some DTS parts for purpose of the application
set(DTC_OVERLAY_FILE "${CMAKE_CURRENT_LIST_DIR}/prj.overlay")

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(hello_world)

target_sources(app PRIVATE src/main.c)
