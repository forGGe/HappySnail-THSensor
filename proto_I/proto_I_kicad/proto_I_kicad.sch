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
$Comp
L Project:UART_RS485_Adapter U?
U 1 1 5D05D761
P 5650 3400
F 0 "U?" H 5650 3815 50  0000 C CNN
F 1 "UART_RS485_Adapter" H 5650 3724 50  0000 C CNN
F 2 "" H 5650 3400 50  0001 C CNN
F 3 "" H 5650 3400 50  0001 C CNN
	1    5650 3400
	1    0    0    -1  
$EndComp
$Comp
L Project:UART_RS232_Adapter U?
U 1 1 5D05E421
P 5650 4550
F 0 "U?" H 5650 5215 50  0000 C CNN
F 1 "UART_RS232_Adapter" H 5650 5124 50  0000 C CNN
F 2 "" H 5650 4900 50  0001 C CNN
F 3 "" H 5650 4900 50  0001 C CNN
	1    5650 4550
	1    0    0    -1  
$EndComp
$Comp
L Project:USB_RS232_Adapter U?
U 1 1 5D05ED58
P 7150 4550
F 0 "U?" H 7067 3885 50  0000 C CNN
F 1 "USB_RS232_Adapter" H 7067 3976 50  0000 C CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "" H 7200 4550 50  0001 C CNN
	1    7150 4550
	1    0    0    1   
$EndComp
$Comp
L Project:USB_RS485_Adapter U?
U 1 1 5D060061
P 7200 3400
F 0 "U?" H 7092 3085 50  0000 C CNN
F 1 "USB_RS485_Adapter" H 7092 3176 50  0000 C CNN
F 2 "" H 7200 3400 50  0001 C CNN
F 3 "" H 7200 3400 50  0001 C CNN
	1    7200 3400
	1    0    0    1   
$EndComp
Wire Wire Line
	6050 3550 6200 3550
Wire Wire Line
	5200 4700 5100 4700
Wire Wire Line
	5100 4700 5100 5450
Wire Wire Line
	5100 5450 6200 5450
Wire Wire Line
	3700 5300 3700 5450
Wire Wire Line
	3700 5450 4600 5450
Connection ~ 5100 5450
Wire Wire Line
	4300 3050 4600 3050
Wire Wire Line
	4600 3050 4600 3150
Connection ~ 4600 5450
Wire Wire Line
	4600 5450 5100 5450
Wire Wire Line
	4300 3150 4600 3150
Connection ~ 4600 3150
Wire Wire Line
	4600 3150 4600 5450
Wire Wire Line
	2800 4850 2650 4850
Wire Wire Line
	2650 4850 2650 5450
Wire Wire Line
	2650 5450 3700 5450
Connection ~ 3700 5450
Wire Wire Line
	6100 4550 6200 4550
Wire Wire Line
	6200 4550 6200 5450
Wire Wire Line
	6600 4550 6800 4550
Connection ~ 6200 5450
Wire Wire Line
	6600 5450 6600 4550
Wire Wire Line
	6200 5450 6600 5450
Wire Wire Line
	6200 4550 6200 3550
Connection ~ 6200 4550
Wire Wire Line
	6050 3350 6800 3350
Wire Wire Line
	6050 3450 6800 3450
Wire Wire Line
	6100 4150 6800 4150
Wire Wire Line
	6100 4250 6800 4250
Wire Wire Line
	6100 4350 6800 4350
Wire Wire Line
	6100 4450 6800 4450
Wire Wire Line
	6100 4650 6800 4650
Wire Wire Line
	6100 4750 6800 4750
Wire Wire Line
	6100 4850 6800 4850
Wire Wire Line
	6100 4950 6800 4950
$Comp
L power:GND #PWR?
U 1 1 5D067DA9
P 5100 5600
F 0 "#PWR?" H 5100 5350 50  0001 C CNN
F 1 "GND" H 5105 5427 50  0000 C CNN
F 2 "" H 5100 5600 50  0001 C CNN
F 3 "" H 5100 5600 50  0001 C CNN
	1    5100 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5450 5100 5600
Wire Wire Line
	5200 4400 5100 4400
Wire Wire Line
	5100 4400 5100 2500
Wire Wire Line
	6050 3250 6200 3250
Wire Wire Line
	6200 3250 6200 2500
Wire Wire Line
	2800 4750 2650 4750
Wire Wire Line
	2650 4750 2650 2500
Wire Wire Line
	2650 2500 5100 2500
Connection ~ 5100 2500
Wire Wire Line
	5100 2500 6200 2500
$Comp
L power:+5V #PWR?
U 1 1 5D06A941
P 5100 2400
F 0 "#PWR?" H 5100 2250 50  0001 C CNN
F 1 "+5V" H 5115 2573 50  0000 C CNN
F 2 "" H 5100 2400 50  0001 C CNN
F 3 "" H 5100 2400 50  0001 C CNN
	1    5100 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2500 5100 2400
Wire Wire Line
	5250 3350 4800 3350
Wire Wire Line
	4800 3350 4800 3650
Wire Wire Line
	4800 3650 4300 3650
Wire Wire Line
	5250 3450 4900 3450
Wire Wire Line
	4900 3450 4900 3750
Wire Wire Line
	4900 3750 4300 3750
Wire Wire Line
	4300 3450 4700 3450
Wire Wire Line
	4700 3450 4700 3250
Wire Wire Line
	4700 3250 5250 3250
Wire Wire Line
	4300 3550 5250 3550
Text Notes 7000 2500 0    50   ~ 0
UART-RS458 adapter is based on MAX485, and requried >5V operation voltage.\n\nFor convinience, UART-RS232 is also powered from 5V\n\nRS232 module requires RX-to-RX and TX-to-TX connection when interfacing with MCU. \nThis is how real module works.\n\nOutput voltage of RS485 UART converter is 3.5V, so 5V tolerant pins are required on MCU\nto interface with it.\n\nInput voltage of RS485 UART converter in compliant with 3.3V logic.\n\nPin config:\n - PB10/PB11 - UART3 TX/UART3 RX - 5V Tolerant\n - PA9/PA10 - UART1 TX/UART1 RX - 5V Tolerant \n
Wire Wire Line
	5200 4500 4800 4500
Wire Wire Line
	4800 4600 5200 4600
Text Label 2300 3550 0    50   ~ 0
TERM_TX
Wire Wire Line
	2800 3550 2300 3550
Text Label 4800 4600 0    50   ~ 0
TERM_TX
Text Label 4800 4500 0    50   ~ 0
TERM_RX
Text Label 2300 3650 0    50   ~ 0
TERM_RX
Wire Wire Line
	2800 3650 2300 3650
$EndSCHEMATC
