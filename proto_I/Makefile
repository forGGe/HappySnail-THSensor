all: make_bat

prepare:
	arduino-cli core update-index
	arduino-cli core install stm32duino:STM32F1

make_bat:
	arduino-cli compile -v -b stm32duino:STM32F1:genericSTM32F103C ./bat

flash_bat:
	st-flash --reset write ./bat/bat.stm32duino.STM32F1.genericSTM32F103C.bin  0x8000000


