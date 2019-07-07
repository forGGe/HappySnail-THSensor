EESchema Schematic File Version 4
LIBS:proto_II_kicad-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2050 1500 1100 650 
U 5D1E3AAF
F0 "BUCK" 50
F1 "buck_subpcb.sch" 50
F2 "EXT_VDC" I L 2050 1650 50 
F3 "EXT_GND" I L 2050 2050 50 
F4 "PWR_OUT" O R 3150 1650 50 
F5 "GND_OUT" O R 3150 2050 50 
$EndSheet
$Comp
L Device:Jumper_NC_Small JP?
U 1 1 5D1FB586
P 3550 1650
F 0 "JP?" H 3550 1862 50  0000 C CNN
F 1 "JP" H 3550 1771 50  0000 C CNN
F 2 "" H 3550 1650 50  0001 C CNN
F 3 "~" H 3550 1650 50  0001 C CNN
	1    3550 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP?
U 1 1 5D1FB9A7
P 3550 2050
F 0 "JP?" H 3550 2262 50  0000 C CNN
F 1 "JP" H 3550 2171 50  0000 C CNN
F 2 "" H 3550 2050 50  0001 C CNN
F 3 "~" H 3550 2050 50  0001 C CNN
	1    3550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1650 3450 1650
Wire Wire Line
	3150 2050 3450 2050
$EndSCHEMATC
