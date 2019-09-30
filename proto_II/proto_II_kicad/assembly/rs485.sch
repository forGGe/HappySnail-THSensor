EESchema Schematic File Version 4
LIBS:proto_II_assembly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7725 5000 6975 5000
Wire Wire Line
	7225 2550 7425 2550
Wire Wire Line
	7975 2550 7725 2550
$Comp
L power:+5V #PWR015
U 1 1 5D61C716
P 4250 4125
F 0 "#PWR015" H 4250 3975 50  0001 C CNN
F 1 "+5V" H 4265 4298 50  0000 C CNN
F 2 "" H 4250 4125 50  0001 C CNN
F 3 "" H 4250 4125 50  0001 C CNN
	1    4250 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8825 2450 9225 2450
Wire Wire Line
	6275 5000 6275 5100
$Comp
L Device:R_Small_US R3
U 1 1 5D61C717
P 8825 2950
F 0 "R3" H 8725 2900 50  0000 C CNN
F 1 "2K2" H 8725 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8825 2950 50  0001 C CNN
F 3 "~" H 8825 2950 50  0001 C CNN
F 4 "RS-03K2201FT" H 8825 2950 50  0001 C CNN "Component"
	1    8825 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6975 5000 6975 5050
$Comp
L Device:D_TVS_x2_AAC D1
U 1 1 5D61C718
P 9825 2600
F 0 "D1" H 9850 2500 50  0000 L CNN
F 1 "SM712" H 9725 2700 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9675 2600 50  0001 C CNN
F 3 "~" H 9675 2600 50  0001 C CNN
F 4 "SM712" H 9825 2600 50  0001 C CNN "Component"
	1    9825 2600
	0    -1   1    0   
$EndComp
$Comp
L power:GNDD #PWR013
U 1 1 5D61C719
P 4600 3675
F 0 "#PWR013" H 4600 3425 50  0001 C CNN
F 1 "GNDD" H 4604 3520 50  0000 C CNN
F 2 "" H 4600 3675 50  0001 C CNN
F 3 "" H 4600 3675 50  0001 C CNN
	1    4600 3675
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR012
U 1 1 5D61C71A
P 4250 3675
F 0 "#PWR012" H 4250 3425 50  0001 C CNN
F 1 "GNDD" H 4254 3520 50  0000 C CNN
F 2 "" H 4250 3675 50  0001 C CNN
F 3 "" H 4250 3675 50  0001 C CNN
	1    4250 3675
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR021
U 1 1 5D61C71B
P 6975 5350
F 0 "#PWR021" H 6975 5100 50  0001 C CNN
F 1 "GNDD" H 6979 5195 50  0000 C CNN
F 2 "" H 6975 5350 50  0001 C CNN
F 3 "" H 6975 5350 50  0001 C CNN
	1    6975 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4225 4250 4275
Wire Wire Line
	7725 2550 7725 5000
Wire Wire Line
	6975 4050 6975 4150
Wire Wire Line
	7825 2650 7825 3800
Wire Wire Line
	7825 3800 6975 3800
$Comp
L power:+5VD #PWR011
U 1 1 5D61C71C
P 6975 3500
F 0 "#PWR011" H 6975 3350 50  0001 C CNN
F 1 "+5VD" H 6990 3673 50  0000 C CNN
F 2 "" H 6975 3500 50  0001 C CNN
F 3 "" H 6975 3500 50  0001 C CNN
	1    6975 3500
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:ST485EBDR U3
U 1 1 5D61C71D
P 8375 2550
F 0 "U3" H 8625 3050 50  0000 C CNN
F 1 "ST485EBDR" H 8625 2950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8375 1650 50  0001 C CNN
F 3 "http://www.st.com/resource/en/datasheet/st485eb.pdf" H 8375 2600 50  0001 C CNN
F 4 "ST485BDR" H 8375 2550 50  0001 C CNN "Component"
	1    8375 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6325 5000 6275 5000
$Comp
L power:GND #PWR017
U 1 1 5D61C71E
P 4250 4575
F 0 "#PWR017" H 4250 4325 50  0001 C CNN
F 1 "GND" H 4255 4402 50  0000 C CNN
F 2 "" H 4250 4575 50  0001 C CNN
F 3 "" H 4250 4575 50  0001 C CNN
	1    4250 4575
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5D61C71F
P 4600 4375
F 0 "C5" H 4692 4421 50  0000 L CNN
F 1 "1u" H 4692 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4600 4375 50  0001 C CNN
F 3 "~" H 4600 4375 50  0001 C CNN
F 4 "Noname 1206 Capacitor 1uF" H 4600 4375 50  0001 C CNN "Component"
	1    4600 4375
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 5D61C720
P 9400 2850
F 0 "JP1" V 9446 2802 50  0000 R CNN
F 1 "JP" V 9355 2802 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9400 2850 50  0001 C CNN
F 3 "~" H 9400 2850 50  0001 C CNN
F 4 "1x02 Pin Header" H 9400 2850 50  0001 C CNN "Component"
	1    9400 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6975 3600 6975 3500
Wire Wire Line
	6925 4800 6975 4800
Wire Wire Line
	9975 2600 10025 2600
Wire Wire Line
	6975 5250 6975 5350
$Comp
L power:+5VD #PWR010
U 1 1 5D61C721
P 4250 3275
F 0 "#PWR010" H 4250 3125 50  0001 C CNN
F 1 "+5VD" H 4265 3448 50  0000 C CNN
F 2 "" H 4250 3275 50  0001 C CNN
F 3 "" H 4250 3275 50  0001 C CNN
	1    4250 3275
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 2750 7325 2750
Wire Wire Line
	9225 2450 9225 2250
Wire Wire Line
	7425 2550 7425 2450
Wire Wire Line
	4250 4125 4250 4225
Wire Wire Line
	10025 2600 10025 3150
Wire Wire Line
	4600 3575 4600 3675
Wire Wire Line
	6275 3800 6275 3900
Wire Wire Line
	4600 4575 4600 4475
Wire Wire Line
	4600 4225 4600 4275
Wire Wire Line
	6925 3800 6975 3800
Wire Wire Line
	4250 4475 4250 4575
$Comp
L Device:R_Small_US R6
U 1 1 5D61C723
P 6025 4800
F 0 "R6" V 5820 4800 50  0000 C CNN
F 1 "2K2" V 5911 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6025 4800 50  0001 C CNN
F 3 "~" H 6025 4800 50  0001 C CNN
F 4 "RS-03K2201FT" H 6025 4800 50  0001 C CNN "Component"
	1    6025 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	8375 3050 8375 3150
Wire Wire Line
	8925 2000 8925 2100
Wire Wire Line
	4250 3575 4250 3675
$Comp
L Device:C_Small C2
U 1 1 5D61C724
P 4250 3475
F 0 "C2" H 4342 3521 50  0000 L CNN
F 1 "100n" H 4342 3430 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4250 3475 50  0001 C CNN
F 3 "~" H 4250 3475 50  0001 C CNN
F 4 "Noname 1206 Capacitor 100nF	" H 4250 3475 50  0001 C CNN "Component"
	1    4250 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	5925 2750 5925 2850
Wire Wire Line
	6925 5000 6975 5000
Wire Wire Line
	7225 2650 7425 2650
$Comp
L power:GNDD #PWR09
U 1 1 5D61C725
P 10025 3150
F 0 "#PWR09" H 10025 2900 50  0001 C CNN
F 1 "GNDD" H 10029 2995 50  0000 C CNN
F 2 "" H 10025 3150 50  0001 C CNN
F 3 "" H 10025 3150 50  0001 C CNN
	1    10025 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7425 2650 7425 2750
Connection ~ 10025 2600
Wire Wire Line
	9400 2450 9400 2500
Wire Wire Line
	8925 2750 9225 2750
Wire Wire Line
	7425 2450 7975 2450
Connection ~ 6975 5000
Wire Wire Line
	6925 3600 6975 3600
Text Notes 4450 4125 0    50   ~ 0
Bypass close to isolator
Wire Wire Line
	8925 2300 8925 2750
Connection ~ 8825 2450
$Comp
L power:GND #PWR020
U 1 1 5D61C727
P 6275 5100
F 0 "#PWR020" H 6275 4850 50  0001 C CNN
F 1 "GND" H 6280 4927 50  0000 C CNN
F 2 "" H 6275 5100 50  0001 C CNN
F 3 "" H 6275 5100 50  0001 C CNN
	1    6275 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 4800 6975 4700
$Comp
L power:+5VD #PWR01
U 1 1 5D61C728
P 8375 2000
F 0 "#PWR01" H 8375 1850 50  0001 C CNN
F 1 "+5VD" H 8390 2173 50  0000 C CNN
F 2 "" H 8375 2000 50  0001 C CNN
F 3 "" H 8375 2000 50  0001 C CNN
	1    8375 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR04
U 1 1 5D61C729
P 7325 2350
F 0 "#PWR04" H 7325 2200 50  0001 C CNN
F 1 "+5VD" H 7340 2523 50  0000 C CNN
F 2 "" H 7325 2350 50  0001 C CNN
F 3 "" H 7325 2350 50  0001 C CNN
	1    7325 2350
	1    0    0    -1  
$EndComp
$Comp
L Project:EL357N-G U4
U 1 1 5D61C72A
P 6625 3700
F 0 "U4" H 6625 4025 50  0000 C CNN
F 1 "EL357N-G" H 6625 3934 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6700 3500 50  0001 C CNN
F 3 "http://www.everlight.com/file/ProductFile/EL357N-G.pdf" H 6625 3900 50  0001 C CNN
F 4 "EL357N-G" H 6625 3700 50  0001 C CNN "Component"
	1    6625 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 5D61C72B
P 6975 3950
F 0 "R5" H 6875 3900 50  0000 C CNN
F 1 "10K" H 6875 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6975 3950 50  0001 C CNN
F 3 "~" H 6975 3950 50  0001 C CNN
F 4 "RC0603JR-1010KL" H 6975 3950 50  0001 C CNN "Component"
	1    6975 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7975 2650 7825 2650
Wire Wire Line
	6975 3800 6975 3850
$Comp
L Device:R_Small_US R7
U 1 1 5D61C72C
P 6975 5150
F 0 "R7" H 6875 5100 50  0000 C CNN
F 1 "10K" H 6875 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6975 5150 50  0001 C CNN
F 3 "~" H 6975 5150 50  0001 C CNN
F 4 "RC0603JR-1010KL" H 6975 5150 50  0001 C CNN "Component"
	1    6975 5150
	-1   0    0    1   
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 5D61C72D
P 8825 3150
F 0 "#PWR08" H 8825 2900 50  0001 C CNN
F 1 "GNDD" H 8829 2995 50  0000 C CNN
F 2 "" H 8825 3150 50  0001 C CNN
F 3 "" H 8825 3150 50  0001 C CNN
	1    8825 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5D61C72E
P 5925 2850
F 0 "#PWR05" H 5925 2600 50  0001 C CNN
F 1 "GND" H 6075 2800 50  0000 C CNN
F 2 "" H 5925 2850 50  0001 C CNN
F 3 "" H 5925 2850 50  0001 C CNN
	1    5925 2850
	1    0    0    -1  
$EndComp
Connection ~ 4250 3325
Wire Wire Line
	4250 3325 4250 3375
Wire Wire Line
	9400 2700 9400 2750
$Comp
L Project:EL357N-G U5
U 1 1 5D61C72F
P 6625 4900
F 0 "U5" H 6625 5225 50  0000 C CNN
F 1 "EL357N-G" H 6625 5134 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6700 4700 50  0001 C CNN
F 3 "http://www.everlight.com/file/ProductFile/EL357N-G.pdf" H 6625 5100 50  0001 C CNN
F 4 "EL357N-G" H 6625 4900 50  0001 C CNN "Component"
	1    6625 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR02
U 1 1 5D61C730
P 8925 2000
F 0 "#PWR02" H 8925 1850 50  0001 C CNN
F 1 "+5VD" H 8940 2173 50  0000 C CNN
F 2 "" H 8925 2000 50  0001 C CNN
F 3 "" H 8925 2000 50  0001 C CNN
	1    8925 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5D61C731
P 4600 4575
F 0 "#PWR018" H 4600 4325 50  0001 C CNN
F 1 "GND" H 4605 4402 50  0000 C CNN
F 2 "" H 4600 4575 50  0001 C CNN
F 3 "" H 4600 4575 50  0001 C CNN
	1    4600 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR06
U 1 1 5D61C732
P 7325 2850
F 0 "#PWR06" H 7325 2600 50  0001 C CNN
F 1 "GNDD" H 7329 2695 50  0000 C CNN
F 2 "" H 7325 2850 50  0001 C CNN
F 3 "" H 7325 2850 50  0001 C CNN
	1    7325 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8375 2000 8375 2150
Wire Wire Line
	7225 2450 7325 2450
Wire Wire Line
	8825 2450 8825 2850
Wire Wire Line
	6125 3600 6325 3600
Wire Wire Line
	8825 2450 8775 2450
Wire Wire Line
	7325 2750 7325 2850
$Comp
L Device:C_Small C3
U 1 1 5D61C733
P 4600 3475
F 0 "C3" H 4692 3521 50  0000 L CNN
F 1 "1u" H 4692 3430 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4600 3475 50  0001 C CNN
F 3 "~" H 4600 3475 50  0001 C CNN
F 4 "Noname 1206 Capacitor 1uF" H 4600 3475 50  0001 C CNN "Component"
	1    4600 3475
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR019
U 1 1 5D61C734
P 6975 4700
F 0 "#PWR019" H 6975 4550 50  0001 C CNN
F 1 "+5VD" H 6990 4873 50  0000 C CNN
F 2 "" H 6975 4700 50  0001 C CNN
F 3 "" H 6975 4700 50  0001 C CNN
	1    6975 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4225 4600 4225
$Comp
L Device:R_Small_US R2
U 1 1 5D61C736
P 9400 2350
F 0 "R2" H 9300 2300 50  0000 C CNN
F 1 "120" H 9275 2375 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9400 2350 50  0001 C CNN
F 3 "~" H 9400 2350 50  0001 C CNN
F 4 "Noname 0603 Resistor 120R" H 9400 2350 50  0001 C CNN "Component"
	1    9400 2350
	-1   0    0    1   
$EndComp
Connection ~ 4250 4225
Wire Wire Line
	5925 2750 6025 2750
$Comp
L power:GND #PWR014
U 1 1 5D61C737
P 6275 3900
F 0 "#PWR014" H 6275 3650 50  0001 C CNN
F 1 "GND" H 6280 3727 50  0000 C CNN
F 2 "" H 6275 3900 50  0001 C CNN
F 3 "" H 6275 3900 50  0001 C CNN
	1    6275 3900
	1    0    0    -1  
$EndComp
$Comp
L Project:ADUM5241 U2
U 1 1 5D61C738
P 6625 2550
F 0 "U2" H 6625 2915 50  0000 C CNN
F 1 "ADUM5241" H 6625 2824 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6675 2150 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADUM5240_5241_5242.pdf" H 6625 2550 50  0001 C CNN
F 4 "ADUM5241ARZ" H 6625 2550 50  0001 C CNN "Component"
	1    6625 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 2750 8925 2750
Wire Wire Line
	7425 2750 7975 2750
Connection ~ 6975 3800
$Comp
L Device:C_Small C4
U 1 1 5D61C739
P 4250 4375
F 0 "C4" H 4342 4421 50  0000 L CNN
F 1 "100n" H 4342 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4250 4375 50  0001 C CNN
F 3 "~" H 4250 4375 50  0001 C CNN
F 4 "Noname 1206 Capacitor 100nF	" H 4250 4375 50  0001 C CNN "Component"
	1    4250 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6325 3800 6275 3800
Wire Wire Line
	6325 4800 6125 4800
Wire Wire Line
	4600 3325 4600 3375
$Comp
L power:GNDD #PWR07
U 1 1 5D61C73A
P 8375 3150
F 0 "#PWR07" H 8375 2900 50  0001 C CNN
F 1 "GNDD" H 8379 2995 50  0000 C CNN
F 2 "" H 8375 3150 50  0001 C CNN
F 3 "" H 8375 3150 50  0001 C CNN
	1    8375 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR016
U 1 1 5D61C73B
P 6975 4150
F 0 "#PWR016" H 6975 3900 50  0001 C CNN
F 1 "GNDD" H 6979 3995 50  0000 C CNN
F 2 "" H 6975 4150 50  0001 C CNN
F 3 "" H 6975 4150 50  0001 C CNN
	1    6975 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9225 2950 9400 2950
Wire Wire Line
	7325 2450 7325 2350
Wire Wire Line
	8825 3050 8825 3150
Wire Wire Line
	4250 3325 4600 3325
Wire Wire Line
	4250 3275 4250 3325
$Comp
L Device:C_Small C1
U 1 1 5D61C73C
P 9400 2600
F 0 "C1" H 9492 2646 50  0000 L CNN
F 1 "10n" H 9492 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9400 2600 50  0001 C CNN
F 3 "~" H 9400 2600 50  0001 C CNN
F 4 "CL31B103KBCNNNC" H 9400 2600 50  0001 C CNN "Component"
	1    9400 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 5D61C73D
P 8925 2200
F 0 "R1" H 8825 2150 50  0000 C CNN
F 1 "2K2" H 8825 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8925 2200 50  0001 C CNN
F 3 "~" H 8925 2200 50  0001 C CNN
F 4 "RS-03K2201FT" H 8925 2200 50  0001 C CNN "Component"
	1    8925 2200
	-1   0    0    1   
$EndComp
Connection ~ 8925 2750
Wire Wire Line
	9225 2750 9225 2950
$Comp
L Device:R_Small_US R4
U 1 1 5D61C73E
P 6025 3600
F 0 "R4" V 5820 3600 50  0000 C CNN
F 1 "2K2" V 5911 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6025 3600 50  0001 C CNN
F 3 "~" H 6025 3600 50  0001 C CNN
F 4 "RS-03K2201FT" H 6025 3600 50  0001 C CNN "Component"
	1    6025 3600
	0    1    1    0   
$EndComp
Text Notes 4450 3225 0    50   ~ 0
Bypass close to isolator
Text HLabel 5575 2550 0    50   Output ~ 0
RO
Wire Wire Line
	5575 2550 6025 2550
$Comp
L power:+5V #PWR03
U 1 1 5D61C726
P 5550 2350
F 0 "#PWR03" H 5550 2200 50  0001 C CNN
F 1 "+5V" H 5565 2523 50  0000 C CNN
F 2 "" H 5550 2350 50  0001 C CNN
F 3 "" H 5550 2350 50  0001 C CNN
	1    5550 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2350 5550 2450
Text HLabel 5575 2650 0    50   Input ~ 0
DI
Wire Wire Line
	5550 2450 6025 2450
Wire Wire Line
	6025 2650 5575 2650
Text HLabel 5575 3600 0    50   Input ~ 0
DE
Text HLabel 5575 4800 0    50   Input ~ 0
~RE
Wire Wire Line
	5575 4800 5925 4800
Wire Wire Line
	5575 3600 5925 3600
Text HLabel 10250 2250 2    50   BiDi ~ 0
RS485_A
Wire Wire Line
	9225 2250 9400 2250
Wire Wire Line
	10225 2800 10225 2950
Text HLabel 10250 2800 2    50   BiDi ~ 0
RS485_B
Wire Wire Line
	10225 2800 10250 2800
Text HLabel 10250 2600 2    50   Input ~ 0
GND_ISO
Wire Wire Line
	10025 2600 10250 2600
Connection ~ 9825 2250
Wire Wire Line
	9825 2250 10250 2250
Connection ~ 9825 2950
Wire Wire Line
	9825 2950 10225 2950
Connection ~ 9400 2950
Wire Wire Line
	9400 2950 9825 2950
Connection ~ 9400 2250
Wire Wire Line
	9400 2250 9825 2250
$EndSCHEMATC
