EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Happy Snail ModBus sensor, main board"
Date ""
Rev "0"
Comp "Max Lab"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6875 4200 6875 4400
Connection ~ 8075 4000
Wire Wire Line
	4475 4150 4225 4150
Connection ~ 7125 3100
Connection ~ 6175 3100
Wire Wire Line
	6875 4400 6675 4400
Wire Wire Line
	7775 3100 8075 3100
Wire Wire Line
	4275 3850 3975 3850
Connection ~ 3975 3550
Wire Wire Line
	4625 3450 4625 3350
$Comp
L Device:L_Core_Ferrite_Small L1
U 1 1 5D60A13C
P 7425 3100
F 0 "L1" V 7630 3100 50  0000 C CNN
F 1 "47u" V 7539 3100 50  0000 C CNN
F 2 "Project:SWRB1205S" H 7425 3100 50  0001 C CNN
F 3 "~" H 7425 3100 50  0001 C CNN
F 4 "SWRB1205S-470MT" H 7425 3100 50  0001 C CNN "MPN"
F 5 "" H 7425 3100 50  0001 C CNN "MFR"
F 6 "" H 7425 3100 50  0001 C CNN "Config"
	1    7425 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3025 3800 3025 3850
Connection ~ 8075 3100
Wire Wire Line
	3325 3800 3325 3850
Connection ~ 7125 3550
Wire Wire Line
	6675 3750 6875 3750
$Comp
L Device:R_Small_US R20
U 1 1 5D60A13D
P 6475 4250
F 0 "R20" H 6543 4296 50  0000 L CNN
F 1 "10K" H 6543 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6475 4250 50  0001 C CNN
F 3 "~" H 6475 4250 50  0001 C CNN
F 4 "RC0603JR-1010KL" H 6475 4250 50  0001 C CNN "MPN"
F 5 "YAGEO" H 6475 4250 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 6475 4250 50  0001 C CNN "Config"
	1    6475 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3975 3800 3975 3850
$Comp
L Device:C_Small C21
U 1 1 5D60A13E
P 8075 3550
F 0 "C21" H 8167 3596 50  0000 L CNN
F 1 "47u" H 8167 3505 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.7" H 8075 3550 50  0001 C CNN
F 3 "~" H 8075 3550 50  0001 C CNN
F 4 "EZV470M16RC" H 8075 3550 50  0001 C CNN "MPN"
F 5 "Hitano" H 8075 3550 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 8075 3550 50  0001 C CNN "Config"
	1    8075 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3625 3550 3975 3550
Wire Wire Line
	6675 3650 6675 3750
$Comp
L power:GND #PWR?
U 1 1 5D60A13F
P 7775 4050
AR Path="/5D60A13F" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3AAF/5D60A13F" Ref="#PWR?"  Part="1" 
AR Path="/5D609B1D/5D60A13F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7775 3800 50  0001 C CNN
F 1 "GND" H 7780 3877 50  0000 C CNN
F 2 "" H 7775 4050 50  0001 C CNN
F 3 "" H 7775 4050 50  0001 C CNN
	1    7775 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 5D60A140
P 8375 3550
F 0 "C22" H 8467 3596 50  0000 L CNN
F 1 "47u" H 8467 3505 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.7" H 8375 3550 50  0001 C CNN
F 3 "~" H 8375 3550 50  0001 C CNN
F 4 "EZV470M16RC" H 8375 3550 50  0001 C CNN "MPN"
F 5 "Hitano" H 8375 3550 50  0001 C CNN "MFR"
	1    8375 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4075 9975 4075
Connection ~ 3975 3850
Wire Wire Line
	3975 3850 3975 3900
Wire Wire Line
	7775 3550 7775 3650
Wire Wire Line
	6875 3750 6875 4000
Connection ~ 7775 3550
Wire Wire Line
	6075 3650 6675 3650
Wire Wire Line
	6175 4800 6175 3750
Wire Wire Line
	8075 3100 8075 3450
Wire Wire Line
	3975 4150 3975 4100
Connection ~ 7775 4000
Wire Wire Line
	3025 3850 3325 3850
Wire Wire Line
	3975 3550 4875 3550
Wire Wire Line
	9450 4075 9450 3975
Wire Wire Line
	4225 4150 3975 4150
$Comp
L Project:TPS54331 U2
U 1 1 5D60A142
P 5475 3600
F 0 "U2" H 5475 4015 50  0000 C CNN
F 1 "TPS54331" H 5475 3924 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5475 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps54331.pdf" H 5575 3750 50  0001 C CNN
F 4 "TPS54331" H 5475 3600 50  0001 C CNN "MPN"
F 5 "Texas Instruments" H 5475 3600 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 5475 3600 50  0001 C CNN "Config"
	1    5475 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9975 3600 9975 3525
Wire Wire Line
	6175 4800 7525 4800
Wire Wire Line
	7125 3100 7325 3100
Wire Wire Line
	6475 4400 6475 4350
Wire Wire Line
	4225 4150 4225 4200
Wire Wire Line
	7125 3250 7125 3100
Wire Wire Line
	4625 3450 4875 3450
Wire Wire Line
	3325 3550 3325 3600
Wire Wire Line
	3325 3550 3625 3550
Wire Wire Line
	4275 3650 4875 3650
Wire Wire Line
	3325 3850 3625 3850
Wire Wire Line
	7775 3850 7775 4000
$Comp
L power:GND #PWR?
U 1 1 5D60A143
P 3325 3900
F 0 "#PWR?" H 3325 3650 50  0001 C CNN
F 1 "GND" H 3330 3727 50  0000 C CNN
F 2 "" H 3325 3900 50  0001 C CNN
F 3 "" H 3325 3900 50  0001 C CNN
	1    3325 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6675 4400 6475 4400
$Comp
L Device:C_Small C19
U 1 1 5D60A144
P 6475 3950
F 0 "C19" H 6567 3996 50  0000 L CNN
F 1 "10n" H 6567 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6475 3950 50  0001 C CNN
F 3 "~" H 6475 3950 50  0001 C CNN
F 4 "1206B103K500NT" H 6475 3950 50  0001 C CNN "MPN"
F 5 "" H 6475 3950 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 6475 3950 50  0001 C CNN "Config"
F 7 "C1846" H 6475 3950 50  0001 C CNN "JLCPCB"
	1    6475 3950
	1    0    0    -1  
$EndComp
Connection ~ 3325 3850
$Comp
L Device:C_Small C15
U 1 1 5D60A145
P 3325 3700
F 0 "C15" H 3417 3746 50  0000 L CNN
F 1 "10u" H 3417 3655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.7" H 3325 3700 50  0001 C CNN
F 3 "~" H 3325 3700 50  0001 C CNN
F 4 "EZV100M50RC" H 3325 3700 50  0001 C CNN "MPN"
F 5 "Hitano" H 3325 3700 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 3325 3700 50  0001 C CNN "Config"
	1    3325 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 5D60A146
P 4475 4000
F 0 "C17" H 4567 4046 50  0000 L CNN
F 1 "10n" H 4567 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4475 4000 50  0001 C CNN
F 3 "~" H 4475 4000 50  0001 C CNN
F 4 "1206B103K500NT" H 4475 4000 50  0001 C CNN "MPN"
F 5 "" H 4475 4000 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 4475 4000 50  0001 C CNN "Config"
F 7 "C1846" H 4475 4000 50  0001 C CNN "JLCPCB"
	1    4475 4000
	1    0    0    -1  
$EndComp
Connection ~ 3325 3550
Wire Wire Line
	3975 3550 3975 3600
$Comp
L Device:C_Small C20
U 1 1 5D60A147
P 6875 4100
F 0 "C20" H 6967 4146 50  0000 L CNN
F 1 "10p" H 6967 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6875 4100 50  0001 C CNN
F 3 "~" H 6875 4100 50  0001 C CNN
F 4 "CL10C100JB8NNNC" H 6875 4100 50  0001 C CNN "MPN"
F 5 "Samsung" H 6875 4100 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 6875 4100 50  0001 C CNN "Config"
F 7 "C1634" H 6875 4100 50  0001 C CNN "JLCPCB"
	1    6875 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R18
U 1 1 5D60A148
P 3975 3700
F 0 "R18" H 4043 3746 50  0000 L CNN
F 1 "220K" H 4043 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3975 3700 50  0001 C CNN
F 3 "~" H 3975 3700 50  0001 C CNN
F 4 "RC1206FR-07220KL" H 3975 3700 50  0001 C CNN "MPN"
F 5 "YAGEO" H 3975 3700 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 3975 3700 50  0001 C CNN "Config"
	1    3975 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 5D60A149
P 9975 3700
F 0 "C24" H 10067 3746 50  0000 L CNN
F 1 "1u" H 10067 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9975 3700 50  0001 C CNN
F 3 "~" H 9975 3700 50  0001 C CNN
F 4 "CL31B105KBHNNNE" V 9875 3700 50  0001 C CNN "MPN"
F 5 "" H 9975 3700 50  0001 C CNN "MFR"
F 6 "C1848" H 9975 3700 50  0001 C CNN "JLCPCB"
	1    9975 3700
	1    0    0    -1  
$EndComp
Connection ~ 3025 3550
Connection ~ 4225 4150
$Comp
L Device:R_Small_US R19
U 1 1 5D60A14A
P 3975 4000
F 0 "R19" H 4043 4046 50  0000 L CNN
F 1 "47K" H 4043 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3975 4000 50  0001 C CNN
F 3 "~" H 3975 4000 50  0001 C CNN
F 4 "RC1206FR-0747KL" H 3975 4000 50  0001 C CNN "MPN"
F 5 "YAGEO" H 3975 4000 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 3975 4000 50  0001 C CNN "Config"
	1    3975 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7775 4000 8075 4000
Wire Wire Line
	8075 4000 8375 4000
Connection ~ 6675 3750
Connection ~ 9450 4075
Wire Wire Line
	4625 3150 4625 3100
Connection ~ 7775 3100
Wire Wire Line
	7775 4000 7775 4050
Connection ~ 6675 4400
Wire Wire Line
	6675 4400 6675 4450
$Comp
L power:GND #PWR?
U 1 1 5D60A14C
P 4225 4200
F 0 "#PWR?" H 4225 3950 50  0001 C CNN
F 1 "GND" H 4230 4027 50  0000 C CNN
F 2 "" H 4225 4200 50  0001 C CNN
F 3 "" H 4225 4200 50  0001 C CNN
	1    4225 4200
	1    0    0    -1  
$EndComp
Connection ~ 3625 3550
Wire Wire Line
	6075 3750 6175 3750
$Comp
L Device:R_Small_US R21
U 1 1 5D60A14E
P 7775 3350
F 0 "R21" H 7843 3396 50  0000 L CNN
F 1 "10K" H 7843 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7775 3350 50  0001 C CNN
F 3 "~" H 7775 3350 50  0001 C CNN
F 4 "RC0603JR-1010KL" H 7775 3350 50  0001 C CNN "MPN"
F 5 "YAGEO" H 7775 3350 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 7775 3350 50  0001 C CNN "Config"
	1    7775 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5D60A14F
P 4625 3250
F 0 "C18" H 4717 3296 50  0000 L CNN
F 1 "100n" H 4717 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4625 3250 50  0001 C CNN
F 3 "~" H 4625 3250 50  0001 C CNN
F 4 "CC0603KRX7R9BB104" H 4625 3250 50  0001 C CNN "MPN"
F 5 "" H 4625 3250 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 4625 3250 50  0001 C CNN "Config"
F 7 "C14663" H 4625 3250 50  0001 C CNN "JLCPCB"
	1    4625 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3025 3550 3025 3600
Wire Wire Line
	6175 3100 7125 3100
Wire Wire Line
	4625 3100 6175 3100
$Comp
L Device:C_Small C14
U 1 1 5D60A150
P 3025 3700
F 0 "C14" H 3117 3746 50  0000 L CNN
F 1 "10u" H 3117 3655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.7" H 3025 3700 50  0001 C CNN
F 3 "~" H 3025 3700 50  0001 C CNN
F 4 "EZV100M50RC" V 2925 3700 50  0001 C CNN "MPN"
F 5 "Hitano" H 3025 3700 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 3025 3700 50  0001 C CNN "Config"
	1    3025 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_Small D6
U 1 1 5D60A151
P 7125 3350
F 0 "D6" V 7075 3150 50  0000 L CNN
F 1 "700mV " V 7075 3400 50  0000 L CNN
F 2 "Diode_SMD:D_SMA-SMB_Universal_Handsoldering" V 7125 3350 50  0001 C CNN
F 3 "~" V 7125 3350 50  0001 C CNN
F 4 "3A" V 7175 3450 50  0000 C CNN "Current rating"
F 5 "SS26-E3/52T" V 7175 3025 50  0001 C CNN "MPN"
F 6 "Vishay" H 7125 3350 50  0001 C CNN "MFR"
F 7 "-noiso_5v" H 7125 3350 50  0001 C CNN "Config"
	1    7125 3350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D60A152
P 9450 4075
AR Path="/5D60A152" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3AAF/5D60A152" Ref="#PWR?"  Part="1" 
AR Path="/5D609B1D/5D60A152" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9450 3825 50  0001 C CNN
F 1 "GND" H 9455 3902 50  0000 C CNN
F 2 "" H 9450 4075 50  0001 C CNN
F 3 "" H 9450 4075 50  0001 C CNN
	1    9450 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	8375 3650 8375 4000
Wire Wire Line
	8075 3650 8075 4000
Wire Wire Line
	6075 3550 7125 3550
Wire Wire Line
	6175 3450 6175 3100
Connection ~ 9975 3525
Wire Wire Line
	9975 3475 9975 3525
Wire Wire Line
	3025 3500 3025 3550
Wire Wire Line
	4475 3750 4475 3900
Text Notes 2475 5175 0    50   ~ 0
- SS capacitor picked to have common value, which results in 4 ms slow start.\n- Divider for EN pin picked to match common\nresistor values. It results in Vstart ~~ 7V, Vend ~~ 7.65\n- Vsense with given resistor divider (12K/2K2) will result in Vout ~~ 5.2V. \n   10K/2K2 can achieve 4.43V\n   TODO: pick values for 5V\n- Inductor ~~22uH (higher is better for ripple, smaller - for AC current), I peak ~~ 1.2A\n- Compensation network values chosen based on TI's DC-DC design tool. TODO: re-validate freq. compensation
Text Label 6575 3100 0    50   ~ 0
PH
Wire Wire Line
	3325 3850 3325 3900
$Comp
L power:GND #PWR?
U 1 1 5D60A153
P 7125 3650
F 0 "#PWR?" H 7125 3400 50  0001 C CNN
F 1 "GND" H 7130 3477 50  0000 C CNN
F 2 "" H 7125 3650 50  0001 C CNN
F 3 "" H 7125 3650 50  0001 C CNN
	1    7125 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7525 3550 7775 3550
Wire Wire Line
	7125 3550 7125 3450
Wire Wire Line
	6475 3750 6675 3750
Wire Wire Line
	7525 4800 7525 3550
Wire Wire Line
	7775 3100 7775 3250
Wire Wire Line
	6475 3850 6475 3750
Wire Wire Line
	7125 3550 7125 3650
Wire Wire Line
	6475 4050 6475 4150
Wire Wire Line
	7775 3450 7775 3550
Wire Wire Line
	4475 4100 4475 4150
Wire Wire Line
	3325 3550 3025 3550
Wire Wire Line
	4275 3650 4275 3850
$Comp
L Project:XC6206P332MR U3
U 1 1 5D60A154
P 9450 3525
F 0 "U3" H 9450 3840 50  0000 C CNN
F 1 "XC6206P332MR" H 9450 3749 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9500 3975 50  0001 C CNN
F 3 "" H 9450 3775 50  0001 C CNN
F 4 "XC6206P332MR" H 9450 3525 50  0001 C CNN "MPN"
F 5 "Torex" H 9450 3525 50  0001 C CNN "MFR"
	1    9450 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	9975 3800 9975 4075
Wire Wire Line
	7525 3100 7775 3100
Wire Wire Line
	6075 3450 6175 3450
$Comp
L Device:C_Small C23
U 1 1 5D60A155
P 8900 3700
F 0 "C23" H 8992 3746 50  0000 L CNN
F 1 "1u" H 8992 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8900 3700 50  0001 C CNN
F 3 "~" H 8900 3700 50  0001 C CNN
F 4 "CL31B105KBHNNNE" V 8800 3700 50  0001 C CNN "MPN"
F 5 "" H 8900 3700 50  0001 C CNN "MFR"
F 6 "C1848" H 8900 3700 50  0001 C CNN "JLCPCB"
	1    8900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4475 3750 4875 3750
$Comp
L power:GND #PWR?
U 1 1 5D60A156
P 6675 4450
F 0 "#PWR?" H 6675 4200 50  0001 C CNN
F 1 "GND" H 6680 4277 50  0000 C CNN
F 2 "" H 6675 4450 50  0001 C CNN
F 3 "" H 6675 4450 50  0001 C CNN
	1    6675 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3525 9975 3525
$Comp
L Device:R_Small_US R22
U 1 1 5D60A157
P 7775 3750
F 0 "R22" H 7843 3796 50  0000 L CNN
F 1 "2K2" H 7843 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7775 3750 50  0001 C CNN
F 3 "~" H 7775 3750 50  0001 C CNN
F 4 "RS-03K2201FT" H 7775 3750 50  0001 C CNN "MPN"
F 5 "FENGHUA" H 7775 3750 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 7775 3750 50  0001 C CNN "Config"
	1    7775 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4075 9450 4075
Wire Wire Line
	8900 3800 8900 4075
$Comp
L power:+3.3V #PWR?
U 1 1 5D60A158
P 9975 3475
F 0 "#PWR?" H 9975 3325 50  0001 C CNN
F 1 "+3.3V" H 9990 3648 50  0000 C CNN
F 2 "" H 9975 3475 50  0001 C CNN
F 3 "" H 9975 3475 50  0001 C CNN
	1    9975 3475
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D60A159
P 3025 3500
F 0 "#FLG?" H 3025 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 3025 3673 50  0000 C CNN
F 2 "" H 3025 3500 50  0001 C CNN
F 3 "~" H 3025 3500 50  0001 C CNN
	1    3025 3500
	1    0    0    -1  
$EndComp
Text HLabel 10275 3525 2    50   Input ~ 0
3.3V
Wire Wire Line
	10275 3525 9975 3525
Text HLabel 8900 3075 1    50   Input ~ 0
5V
Text HLabel 2925 3550 0    50   Input ~ 0
Vin
Wire Wire Line
	2925 3550 3025 3550
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D62B0B0
P 8375 3025
F 0 "#FLG?" H 8375 3100 50  0001 C CNN
F 1 "PWR_FLAG" H 8375 3198 50  0000 C CNN
F 2 "" H 8375 3025 50  0001 C CNN
F 3 "~" H 8375 3025 50  0001 C CNN
	1    8375 3025
	1    0    0    -1  
$EndComp
Connection ~ 8375 3100
Wire Wire Line
	8375 3025 8375 3100
Wire Wire Line
	8075 3100 8375 3100
Wire Wire Line
	8375 3100 8650 3100
Connection ~ 8650 3100
Wire Wire Line
	8375 3100 8375 3450
Wire Wire Line
	8900 3600 8900 3525
$Comp
L power:+5V #PWR?
U 1 1 5D60A14D
P 8650 3025
F 0 "#PWR?" H 8650 2875 50  0001 C CNN
F 1 "+5V" H 8665 3198 50  0000 C CNN
F 2 "" H 8650 3025 50  0001 C CNN
F 3 "" H 8650 3025 50  0001 C CNN
	1    8650 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3025 8650 3100
Wire Wire Line
	8650 3100 8900 3100
Wire Wire Line
	8900 3100 8900 3075
Connection ~ 8900 3100
Wire Wire Line
	8900 3525 9050 3525
Wire Wire Line
	8900 3100 8900 3525
Connection ~ 8900 3525
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5DE77780
P 3625 3900
F 0 "#FLG?" H 3625 3975 50  0001 C CNN
F 1 "PWR_FLAG" H 3625 4073 50  0000 C CNN
F 2 "" H 3625 3900 50  0001 C CNN
F 3 "~" H 3625 3900 50  0001 C CNN
	1    3625 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3625 3850 3625 3900
Connection ~ 3625 3850
Wire Wire Line
	3625 3600 3625 3550
Wire Wire Line
	3625 3850 3625 3800
$Comp
L Device:C_Small C16
U 1 1 5D60A14B
P 3625 3700
F 0 "C16" H 3717 3746 50  0000 L CNN
F 1 "10n" H 3717 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3625 3700 50  0001 C CNN
F 3 "~" H 3625 3700 50  0001 C CNN
F 4 "1206B103K500NT" H 3625 3700 50  0001 C CNN "MPN"
F 5 "" H 3625 3700 50  0001 C CNN "MFR"
F 6 "-noiso_5v" H 3625 3700 50  0001 C CNN "Config"
F 7 "C1846" H 3625 3700 50  0001 C CNN "JLCPCB"
	1    3625 3700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
