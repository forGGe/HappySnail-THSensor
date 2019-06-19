# name of your application
APPLICATION = bat

# If no BOARD is found in the environment, use this default:
BOARD ?= native

# This has to be the absolute path to the RIOT base directory:
RIOTBASE ?= $(CURDIR)/../..

# Comment this out to disable code in RIOT that does safety checking
# which is not needed in a production environment but helps in the
# development process:
DEVELHELP ?= 1

# Change this to 0 show compiler invocation lines by default:
QUIET ?= 1

# Enable BME280
USEMODULE += bme280

# When using I2C, specify the default I2C device to use,
# and the BME280's address (see datasheet).
# The values below are the defaults:
CFLAGS += -DBMX280_PARAM_I2C_DEV=I2C_DEV\(0\)
CFLAGS += -DBMX280_PARAM_I2C_ADDR=0x77

# Enable uart_mod() function
FEATURES_REQUIRED += periph_uart_modecfg

include $(RIOTBASE)/Makefile.include
