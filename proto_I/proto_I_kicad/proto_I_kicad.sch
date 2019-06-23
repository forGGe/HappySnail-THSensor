EESchema Schematic File Version 4
LIBS:proto_I_kicad-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Project:UART_RS485_Adapter U?
U 1 1 5D05D761
P 7450 3400
F 0 "U?" H 7450 3815 50  0000 C CNN
F 1 "UART_RS485_Adapter" H 7450 3724 50  0000 C CNN
F 2 "" H 7450 3400 50  0001 C CNN
F 3 "" H 7450 3400 50  0001 C CNN
	1    7450 3400
	1    0    0    -1  
$EndComp
$Comp
L Project:UART_RS232_Adapter U?
U 1 1 5D05E421
P 7450 4550
F 0 "U?" H 7450 5215 50  0000 C CNN
F 1 "UART_RS232_Adapter" H 7450 5124 50  0000 C CNN
F 2 "" H 7450 4900 50  0001 C CNN
F 3 "" H 7450 4900 50  0001 C CNN
	1    7450 4550
	1    0    0    -1  
$EndComp
$Comp
L Project:USB_RS232_Adapter U?
U 1 1 5D05ED58
P 8950 4550
F 0 "U?" H 8867 3885 50  0000 C CNN
F 1 "USB_RS232_Adapter" H 8867 3976 50  0000 C CNN
F 2 "" H 9000 4550 50  0001 C CNN
F 3 "" H 9000 4550 50  0001 C CNN
	1    8950 4550
	1    0    0    1   
$EndComp
$Comp
L Project:USB_RS485_Adapter U?
U 1 1 5D060061
P 9000 3400
F 0 "U?" H 8892 3085 50  0000 C CNN
F 1 "USB_RS485_Adapter" H 8892 3176 50  0000 C CNN
F 2 "" H 9000 3400 50  0001 C CNN
F 3 "" H 9000 3400 50  0001 C CNN
	1    9000 3400
	1    0    0    1   
$EndComp
Wire Wire Line
	7850 3550 8000 3550
Wire Wire Line
	6450 5450 8000 5450
Wire Wire Line
	4850 5300 4850 5450
Wire Wire Line
	4850 5450 5650 5450
Connection ~ 6450 5450
Wire Wire Line
	5450 3050 5650 3050
Wire Wire Line
	5650 3050 5650 3150
Connection ~ 5650 5450
Wire Wire Line
	5650 5450 6450 5450
Wire Wire Line
	5450 3150 5650 3150
Connection ~ 5650 3150
Wire Wire Line
	3950 4850 3800 4850
Wire Wire Line
	3800 4850 3800 5450
Wire Wire Line
	3800 5450 4850 5450
Connection ~ 4850 5450
Wire Wire Line
	7900 4550 8000 4550
Wire Wire Line
	8000 4550 8000 5450
Wire Wire Line
	8400 4550 8600 4550
Connection ~ 8000 5450
Wire Wire Line
	8400 5450 8400 4550
Wire Wire Line
	8000 5450 8400 5450
Wire Wire Line
	8000 4550 8000 3550
Connection ~ 8000 4550
Wire Wire Line
	7850 3350 8600 3350
Wire Wire Line
	7850 3450 8600 3450
Wire Wire Line
	7900 4150 8600 4150
Wire Wire Line
	7900 4250 8600 4250
Wire Wire Line
	7900 4350 8600 4350
Wire Wire Line
	7900 4450 8600 4450
Wire Wire Line
	7900 4650 8600 4650
Wire Wire Line
	7900 4750 8600 4750
Wire Wire Line
	7900 4850 8600 4850
Wire Wire Line
	7900 4950 8600 4950
$Comp
L power:GND #PWR?
U 1 1 5D067DA9
P 6450 5600
F 0 "#PWR?" H 6450 5350 50  0001 C CNN
F 1 "GND" H 6455 5427 50  0000 C CNN
F 2 "" H 6450 5600 50  0001 C CNN
F 3 "" H 6450 5600 50  0001 C CNN
	1    6450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5450 6450 5600
Wire Wire Line
	7850 3250 8000 3250
Wire Wire Line
	8000 3250 8000 2500
Wire Wire Line
	3950 4750 3800 4750
Connection ~ 6450 2500
Wire Wire Line
	6450 2500 8000 2500
$Comp
L power:+5V #PWR?
U 1 1 5D06A941
P 6450 2400
F 0 "#PWR?" H 6450 2250 50  0001 C CNN
F 1 "+5V" H 6465 2573 50  0000 C CNN
F 2 "" H 6450 2400 50  0001 C CNN
F 3 "" H 6450 2400 50  0001 C CNN
	1    6450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2500 6450 2400
Text Notes 7250 2150 0    50   ~ 0
UART-RS458 adapter is based on MAX485, and requried >5V operation voltage.\n\nRS232 module requires RX-to-RX and TX-to-TX connection when interfacing with MCU. \nThis is how real module works.\n\nOutput voltage of RS485 UART converter is 3.5V, so 5V tolerant pins are required on MCU\nto interface with it. RS232 converter is using 3V power rail, can be connected to 3.3V-tolerant pins\n\nInput voltage of RS485 UART converter in compliant with 3.3V logic.\n\nPin config:\n - PA9/PA10 - UART1 TX/UART1 RX - 5V Tolerant\n - PA2/PA3 - UART2 TX/UART2 RX \n - PB6/PB7 - I2C1 SCL/I2C1 SDA
Wire Wire Line
	3950 3550 3350 3550
Text Label 3350 3650 0    50   ~ 0
RS485_RX
Wire Wire Line
	3950 3650 3350 3650
Wire Wire Line
	3800 4750 3800 2500
Wire Wire Line
	3500 4950 3500 4800
Wire Wire Line
	3500 4950 3950 4950
$Comp
L power:+3.3V #PWR?
U 1 1 5D0D8B31
P 3500 4800
F 0 "#PWR?" H 3500 4650 50  0001 C CNN
F 1 "+3.3V" H 3515 4973 50  0000 C CNN
F 2 "" H 3500 4800 50  0001 C CNN
F 3 "" H 3500 4800 50  0001 C CNN
	1    3500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2500 6450 2500
$Comp
L Project:STM32_BluePill U?
U 1 1 5D05CADE
P 4700 3900
F 0 "U?" H 4700 5065 50  0000 C CNN
F 1 "STM32_BluePill" H 4700 4974 50  0000 C CNN
F 2 "" H 4700 4400 50  0001 C CNN
F 3 "https://wiki.stm32duino.com/index.php?title=Blue_Pill" H 4700 4400 50  0001 C CNN
	1    4700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4550 3700 4450
Wire Wire Line
	3700 4450 3950 4450
Connection ~ 3800 5450
Wire Wire Line
	3300 4150 3300 5450
Connection ~ 3300 5450
Wire Wire Line
	3300 5450 3800 5450
$Comp
L power:+3.3V #PWR?
U 1 1 5D114029
P 2200 3700
F 0 "#PWR?" H 2200 3550 50  0001 C CNN
F 1 "+3.3V" H 2215 3873 50  0000 C CNN
F 2 "" H 2200 3700 50  0001 C CNN
F 3 "" H 2200 3700 50  0001 C CNN
	1    2200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3700 2200 3750
Wire Wire Line
	2200 3750 2400 3750
Connection ~ 2200 3750
Wire Wire Line
	2200 5450 3300 5450
Wire Wire Line
	2400 5200 2200 5200
Connection ~ 2200 5200
Wire Wire Line
	2200 5200 2200 5450
Wire Wire Line
	2400 3750 2400 3850
Wire Wire Line
	2400 5050 2400 5200
Wire Wire Line
	2200 3750 2200 3850
Wire Wire Line
	2900 4150 3300 4150
Wire Wire Line
	3950 4350 2900 4350
Wire Wire Line
	2900 4550 3700 4550
Wire Wire Line
	2200 5050 2200 5200
$Comp
L Sensor:BME280 U?
U 1 1 5D09E0F0
P 2300 4450
F 0 "U?" H 1900 4000 50  0000 C CNN
F 1 "BME280" H 1900 3900 50  0000 C CNN
F 2 "Package_LGA:Bosch_LGA-8_2.5x2.5mm_P0.65mm_ClockwisePinNumbering" H 2300 4250 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME280_DS001-11.pdf" H 2300 4250 50  0001 C CNN
	1    2300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3750 3050 3750
Wire Wire Line
	3050 3750 3050 4750
Wire Wire Line
	3050 4750 2900 4750
Connection ~ 2400 3750
Text Label 3350 3550 0    50   ~ 0
RS485_TX
Text Label 6600 3550 0    50   ~ 0
RS485_TX
Wire Wire Line
	6600 3550 7050 3550
Text Label 6600 3250 0    50   ~ 0
RS485_RX
Wire Wire Line
	5450 4050 6200 4050
Wire Wire Line
	6200 4050 6200 3450
Wire Wire Line
	5650 3150 5650 5450
Wire Wire Line
	6450 4700 6450 5450
Wire Wire Line
	7000 4700 6450 4700
Wire Wire Line
	5450 4250 6200 4250
Wire Wire Line
	6200 4250 6200 4500
Wire Wire Line
	6200 4500 7000 4500
Wire Wire Line
	5450 4350 6100 4350
Wire Wire Line
	6100 4350 6100 4600
Wire Wire Line
	6100 4600 7000 4600
$Comp
L power:+3.3V #PWR?
U 1 1 5D16AB3A
P 6900 4300
F 0 "#PWR?" H 6900 4150 50  0001 C CNN
F 1 "+3.3V" H 6915 4473 50  0000 C CNN
F 2 "" H 6900 4300 50  0001 C CNN
F 3 "" H 6900 4300 50  0001 C CNN
	1    6900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4300 6900 4400
Wire Wire Line
	6900 4400 7000 4400
Wire Wire Line
	6600 3250 7050 3250
Wire Wire Line
	7050 3450 6900 3450
Wire Wire Line
	7050 3350 6900 3350
Wire Wire Line
	6900 3350 6900 3450
Connection ~ 6900 3450
Wire Wire Line
	6900 3450 6200 3450
$EndSCHEMATC
