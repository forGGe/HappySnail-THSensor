.PHONY: all clean bat

all: bat

prepare:
	arduino-cli core update-index
	arduino-cli core install stm32duino:STM32F1

bat:
	echo "sadasd"
	mkdir -p ./bat/build
	arduino-cli compile -v -b stm32duino:STM32F1:genericSTM32F103C:cpu_speed=speed_72mhz,opt=osstd,upload_method=STLinkMethod ./bat
	mv -v ./bat/*.bin ./bat/*.elf ./bat/build

flash_bat: bat
	st-flash erase
	st-flash write ./bat/build/bat.stm32duino.STM32F1.genericSTM32F103C.bin 0x8000000

clean:
	rm ./bat/build/*