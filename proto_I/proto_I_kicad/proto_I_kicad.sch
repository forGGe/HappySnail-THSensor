EESchema Schematic File Version 4
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
	7000 4700 6900 4700
Wire Wire Line
	6900 4700 6900 5450
Wire Wire Line
	6900 5450 8000 5450
Wire Wire Line
	3700 5300 3700 5450
Wire Wire Line
	3700 5450 6150 5450
Connection ~ 6900 5450
Wire Wire Line
	4300 3050 6150 3050
Wire Wire Line
	6150 3050 6150 3150
Connection ~ 6150 5450
Wire Wire Line
	6150 5450 6900 5450
Wire Wire Line
	4300 3150 6150 3150
Connection ~ 6150 3150
Wire Wire Line
	6150 3150 6150 5450
Wire Wire Line
	2800 4850 2650 4850
Wire Wire Line
	2650 4850 2650 5450
Wire Wire Line
	2650 5450 3700 5450
Connection ~ 3700 5450
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
P 6900 5600
F 0 "#PWR?" H 6900 5350 50  0001 C CNN
F 1 "GND" H 6905 5427 50  0000 C CNN
F 2 "" H 6900 5600 50  0001 C CNN
F 3 "" H 6900 5600 50  0001 C CNN
	1    6900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5450 6900 5600
Wire Wire Line
	7000 4400 6900 4400
Wire Wire Line
	6900 4400 6900 2500
Wire Wire Line
	7850 3250 8000 3250
Wire Wire Line
	8000 3250 8000 2500
Wire Wire Line
	2800 4750 2650 4750
Connection ~ 6900 2500
Wire Wire Line
	6900 2500 8000 2500
$Comp
L power:+5V #PWR?
U 1 1 5D06A941
P 6900 2400
F 0 "#PWR?" H 6900 2250 50  0001 C CNN
F 1 "+5V" H 6915 2573 50  0000 C CNN
F 2 "" H 6900 2400 50  0001 C CNN
F 3 "" H 6900 2400 50  0001 C CNN
	1    6900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2500 6900 2400
Wire Wire Line
	7050 3350 5350 3350
Wire Wire Line
	5350 3350 5350 3650
Wire Wire Line
	5350 3650 4300 3650
Wire Wire Line
	7050 3450 6700 3450
Wire Wire Line
	6700 3450 6700 3750
Wire Wire Line
	6700 3750 4300 3750
Wire Wire Line
	4300 3450 5250 3450
Wire Wire Line
	5250 3450 5250 3250
Wire Wire Line
	5250 3250 7050 3250
Wire Wire Line
	4300 3550 7050 3550
Text Notes 8250 2500 0    50   ~ 0
UART-RS458 adapter is based on MAX485, and requried >5V operation voltage.\n\nFor convinience, UART-RS232 is also powered from 5V\n\nRS232 module requires RX-to-RX and TX-to-TX connection when interfacing with MCU. \nThis is how real module works.\n\nOutput voltage of RS485 UART converter is 3.5V, so 5V tolerant pins are required on MCU\nto interface with it.\n\nInput voltage of RS485 UART converter in compliant with 3.3V logic.\n\nPin config:\n - PB10/PB11 - UART3 TX/UART3 RX - 5V Tolerant\n - PA9/PA10 - UART1 TX/UART1 RX - 5V Tolerant \n
Wire Wire Line
	7000 4500 6600 4500
Wire Wire Line
	6600 4600 7000 4600
Text Label 2300 3550 0    50   ~ 0
TERM_TX
Wire Wire Line
	2800 3550 2300 3550
Text Label 6600 4600 0    50   ~ 0
TERM_TX
Text Label 6600 4500 0    50   ~ 0
TERM_RX
Text Label 2300 3650 0    50   ~ 0
TERM_RX
Wire Wire Line
	2800 3650 2300 3650
Wire Wire Line
	2650 4750 2650 2500
Wire Wire Line
	2550 3950 2550 4450
Wire Wire Line
	2800 3950 2550 3950
$Comp
L Sensor:BME280 U?
U 1 1 5D09E0F0
P 5550 4700
F 0 "U?" H 5150 4250 50  0000 C CNN
F 1 "BME280" H 5150 4150 50  0000 C CNN
F 2 "Package_LGA:Bosch_LGA-8_2.5x2.5mm_P0.65mm_ClockwisePinNumbering" H 5550 4500 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME280_DS001-11.pdf" H 5550 4500 50  0001 C CNN
	1    5550 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2350 4950 2350 4800
Wire Wire Line
	2350 4950 2800 4950
$Comp
L power:+3.3V #PWR?
U 1 1 5D0D8B31
P 2350 4800
F 0 "#PWR?" H 2350 4650 50  0001 C CNN
F 1 "+3.3V" H 2365 4973 50  0000 C CNN
F 2 "" H 2350 4800 50  0001 C CNN
F 3 "" H 2350 4800 50  0001 C CNN
	1    2350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2500 6900 2500
$Comp
L Project:STM32_BluePill U?
U 1 1 5D05CADE
P 3550 3900
F 0 "U?" H 3550 5065 50  0000 C CNN
F 1 "STM32_BluePill" H 3550 4974 50  0000 C CNN
F 2 "" H 3550 4400 50  0001 C CNN
F 3 "https://wiki.stm32duino.com/index.php?title=Blue_Pill" H 3550 4400 50  0001 C CNN
	1    3550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3850 4600 3850
Wire Wire Line
	4800 4400 4950 4400
Wire Wire Line
	4950 4600 4700 4600
Wire Wire Line
	4700 4600 4700 4050
Wire Wire Line
	4700 4050 4300 4050
Wire Wire Line
	4950 4800 4600 4800
Wire Wire Line
	4600 4800 4600 3850
Wire Wire Line
	4800 4400 4800 3950
Wire Wire Line
	4800 3950 4300 3950
Wire Wire Line
	4950 5000 4450 5000
Wire Wire Line
	4450 5000 4450 4150
Wire Wire Line
	4450 4150 4300 4150
$EndSCHEMATC
