.PHONY: all clean bat

MKFILE_PATH 			:= $(abspath $(MAKEFILE_LIST))
MKFILE_DIR 			:= $(dir $(MKFILE_PATH))
BAT_PATH 			:= $(MKFILE_DIR)/bat_zephyr
ZEPHYR_BASE			?= zephyr
WEST_BASE			?= ~/.local/bin

export ZEPHYR_TOOLCHAIN_VARIANT 	= gnuarmemb
export GNUARMEMB_TOOLCHAIN_PATH 	= /usr
export PATH				:= $(WEST_BASE):$(PATH)

$(info ZEPHYR_TOOLCHAIN_VARIANT  =$(ZEPHYR_TOOLCHAIN_VARIANT))
$(info GNUARMEMB_TOOLCHAIN_PATH  =$(GNUARMEMB_TOOLCHAIN_PATH))
$(info ZEPHYR_BASE               =$(ZEPHYR_BASE))

all: bat

bat:
	. $(ZEPHYR_BASE)/zephyr-env.sh
	$(WEST_BASE)/west -v build -b stm32_min_dev_blue -d $(BAT_PATH)/build $(BAT_PATH)/

bat_flash: bat
	st-info --probe
	echo "Now you may release RESET button"
	sleep 1
	st-flash --reset write $(BAT_PATH)/build/zephyr/zephyr.bin 0x8000000

bat_config:
	. $(ZEPHYR_BASE)/zephyr-env.sh
	ninja -C $(BAT_PATH)/build menuconfig

unlock_flash:
	openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c "init; reset halt; stm32f1x unlock 0; stm32f1x mass_erase 0; reset halt; exit;"

clean:
	$(WEST_BASE)/west build -b stm32_min_dev_blue -t pristine -d $(BAT_PATH)/build $(BAT_PATH)/
