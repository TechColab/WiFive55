EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 8268 5827
encoding utf-8
Sheet 1 1
Title "WiFive55"
Date "2021-04-02"
Rev "0.10"
Comp "(c)2021 Phill Rogers @ TechColab.co.je"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5EE6EDC3
P 1200 2300
F 0 "J3" H 1150 2700 50  0000 L CNN
F 1 "Breadboard" V 1300 2100 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 1200 2300 50  0001 C CNN
F 3 "~" H 1200 2300 50  0001 C CNN
	1    1200 2300
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C2
U 1 1 5EE9DD45
P 1550 1550
F 0 "C2" H 1550 1650 50  0000 L CNN
F 1 "10" H 1550 1450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 1588 1400 50  0001 C CNN
F 3 "~" H 1550 1550 50  0001 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EE6D90D
P 1850 1750
F 0 "#PWR0102" H 1850 1500 50  0001 C CNN
F 1 "GND" H 1650 1750 50  0000 C CNN
F 2 "" H 1850 1750 50  0001 C CNN
F 3 "" H 1850 1750 50  0001 C CNN
	1    1850 1750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5EE6A809
P 4650 900
F 0 "H1" V 4650 700 50  0000 L CNN
F 1 "MountingHole" V 4800 700 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 4650 900 50  0001 C CNN
F 3 "~" H 4650 900 50  0001 C CNN
	1    4650 900 
	0    -1   -1   0   
$EndComp
Text Label 1450 2600 0    50   ~ 0
GND
Text Label 1450 2200 0    50   ~ 0
VCC
Text Label 1450 1900 0    50   ~ 0
GPIO1
Text Label 1450 2300 0    50   ~ 0
RX
Text Label 1450 2100 0    50   ~ 0
!RESET
$Comp
L Device:R R1
U 1 1 5EE72B4F
P 4400 1500
F 0 "R1" V 4400 1500 50  0000 L CNN
F 1 "51k" H 4250 1300 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4330 1500 50  0001 C CNN
F 3 "~" H 4400 1500 50  0001 C CNN
	1    4400 1500
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 5EE70776
P 2900 1500
F 0 "SW6" H 3000 1600 50  0000 C CNN
F 1 "RST" H 2800 1600 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2900 1700 50  0001 C CNN
F 3 "~" H 2900 1700 50  0001 C CNN
	1    2900 1500
	0    -1   -1   0   
$EndComp
$Comp
L power:+VDC #PWR0101
U 1 1 5FF7FD49
P 1400 800
F 0 "#PWR0101" H 1400 700 50  0001 C CNN
F 1 "+VDC" H 1350 1050 50  0000 C CNN
F 2 "" H 1400 800 50  0001 C CNN
F 3 "" H 1400 800 50  0001 C CNN
	1    1400 800 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5FF4F85F
P 4600 2550
F 0 "J2" V 4600 2300 50  0000 L CNN
F 1 "Switched Output" V 4700 2150 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 4600 2550 50  0001 C CNN
F 3 "~" H 4600 2550 50  0001 C CNN
	1    4600 2550
	0    1    1    0   
$EndComp
Text Label 1450 2400 0    50   ~ 0
!TRIGGER
Text Label 1450 2500 0    50   ~ 0
GPIO2
Text Label 1450 2000 0    50   ~ 0
ENABLE
$Comp
L Graphic:SYM_Arrow_Small #SYM1
U 1 1 60108806
P 2800 4450
F 0 "#SYM1" H 2800 4510 50  0001 C CNN
F 1 "SYM_Arrow_Small" H 2810 4400 50  0001 C CNN
F 2 "" H 2800 4450 50  0001 C CNN
F 3 "~" H 2800 4450 50  0001 C CNN
	1    2800 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 2600 2350 2950
Wire Wire Line
	1400 2600 2150 2600
Text Notes 3600 4450 0    50   ~ 0
GPIO0 !PROG/!BTN\nGPIO1 TX/!LED\nGPIO2 !OUTPUT\nGPIO3 RX
Wire Wire Line
	2450 2500 2450 2950
Wire Wire Line
	1400 2500 2450 2500
$Comp
L Device:D_Schottky_Small_ALT D3
U 1 1 601128FB
P 2550 2750
F 0 "D3" V 2600 2900 50  0000 C CNN
F 1 "1N5817 Schottky" V 2600 2200 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P2.54mm_Vertical_AnodeUp" V 2550 2750 50  0001 C CNN
F 3 "~" V 2550 2750 50  0001 C CNN
	1    2550 2750
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_Small_ALT D4
U 1 1 601136C9
P 2650 2650
F 0 "D4" V 2600 2750 50  0000 C CNN
F 1 "1N5817 Schottky" V 2700 2000 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P2.54mm_Vertical_AnodeUp" V 2650 2650 50  0001 C CNN
F 3 "~" V 2650 2650 50  0001 C CNN
	1    2650 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 2200 2900 4900
Wire Wire Line
	2900 4900 2650 4900
Wire Wire Line
	2650 4900 2650 4850
Wire Wire Line
	3000 2100 3000 5000
Wire Wire Line
	3000 5000 2550 5000
Wire Wire Line
	2550 4850 2550 5000
Wire Wire Line
	3100 2000 3100 5100
Wire Wire Line
	3100 5100 2450 5100
Wire Wire Line
	2450 5100 2450 4850
Wire Wire Line
	3200 1900 3200 5200
Wire Wire Line
	3200 5200 2350 5200
Wire Wire Line
	2350 5200 2350 4850
Wire Wire Line
	1400 1900 3200 1900
$Comp
L Connector_Generic:Conn_01x08 J4
U 1 1 60121331
P 900 2300
F 0 "J4" H 850 2700 50  0000 L CNN
F 1 "Grounds" V 1000 2150 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 900 2300 50  0001 C CNN
F 3 "~" H 900 2300 50  0001 C CNN
	1    900  2300
	1    0    0    1   
$EndComp
Wire Wire Line
	650  1900 700  1900
Wire Wire Line
	700  2000 650  2000
Wire Wire Line
	650  2000 650  1900
Wire Wire Line
	700  2100 650  2100
Wire Wire Line
	650  2100 650  2000
Connection ~ 650  2000
Wire Wire Line
	700  2200 650  2200
Wire Wire Line
	650  2200 650  2100
Connection ~ 650  2100
Wire Wire Line
	700  2300 650  2300
Wire Wire Line
	650  2300 650  2200
Connection ~ 650  2200
Wire Wire Line
	700  2400 650  2400
Wire Wire Line
	650  2400 650  2300
Connection ~ 650  2300
Wire Wire Line
	700  2500 650  2500
Wire Wire Line
	650  2500 650  2400
Connection ~ 650  2400
Wire Wire Line
	700  2600 650  2600
Wire Wire Line
	650  2600 650  2500
Connection ~ 650  2500
Wire Wire Line
	700  2600 700  2750
Wire Wire Line
	700  2750 1400 2750
Wire Wire Line
	1400 2750 1400 2600
Connection ~ 700  2600
Wire Wire Line
	1400 2200 2250 2200
Wire Wire Line
	1850 1700 1850 1100
Connection ~ 1850 1700
$Comp
L Device:R R6
U 1 1 6014AD69
P 3000 950
F 0 "R6" V 3000 850 50  0000 L CNN
F 1 "10k" H 3050 1000 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2930 950 50  0001 C CNN
F 3 "~" H 3000 950 50  0001 C CNN
	1    3000 950 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 601530B7
P 3200 1500
F 0 "SW3" H 3300 1600 50  0000 C CNN
F 1 "PRG" H 3100 1600 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 3200 1700 50  0001 C CNN
F 3 "~" H 3200 1700 50  0001 C CNN
	1    3200 1500
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 601530BD
P 3300 950
F 0 "R3" V 3300 850 50  0000 L CNN
F 1 "10k" H 3350 1000 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3230 950 50  0001 C CNN
F 3 "~" H 3300 950 50  0001 C CNN
	1    3300 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2100 2900 2100
Wire Wire Line
	1850 1700 2000 1700
Wire Wire Line
	2150 2600 2150 1700
Connection ~ 2150 1700
$Comp
L Device:R R5
U 1 1 601A7DCA
P 4250 1100
F 0 "R5" V 4250 1100 50  0000 L CNN
F 1 "8k2" H 4050 1000 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4180 1100 50  0001 C CNN
F 3 "~" H 4250 1100 50  0001 C CNN
	1    4250 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C1
U 1 1 601AA421
P 4250 1500
F 0 "C1" H 4050 1500 50  0000 L CNN
F 1 "4.7" H 4100 1400 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 4288 1350 50  0001 C CNN
F 3 "~" H 4250 1500 50  0001 C CNN
	1    4250 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 601AC2B6
P 3700 1500
F 0 "R2" V 3700 1500 50  0000 L CNN
F 1 "10k" H 3500 1450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3630 1500 50  0001 C CNN
F 3 "~" H 3700 1500 50  0001 C CNN
	1    3700 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4250 1650 4250 1700
Connection ~ 2450 2500
Connection ~ 4250 1700
$Comp
L Jumper:SolderJumper_3_Bridged12 JP2
U 1 1 60206189
P 4550 1450
F 0 "JP2" V 4650 1300 50  0000 L CNN
F 1 "RC_bypass" V 4750 1050 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4550 1450 50  0001 C CNN
F 3 "~" H 4550 1450 50  0001 C CNN
	1    4550 1450
	0    -1   1    0   
$EndComp
Wire Wire Line
	4550 1250 4400 1250
Wire Wire Line
	1850 1700 1850 1750
Wire Wire Line
	4400 1650 4400 1700
Wire Wire Line
	4400 1700 4250 1700
Wire Wire Line
	4400 1350 4400 1250
Connection ~ 4400 1250
Wire Wire Line
	4400 1250 4250 1250
Wire Wire Line
	1400 2300 2650 2300
Wire Wire Line
	2550 2400 2550 2650
Wire Wire Line
	3400 2400 2550 2400
Connection ~ 2550 2400
Text Label 4700 2300 1    50   ~ 0
NC
Text Label 4600 2300 1    50   ~ 0
COM
Text Label 4500 2300 1    50   ~ 0
NO
Wire Wire Line
	1650 4100 1650 4050
Text Label 1000 3650 2    50   ~ 0
VIN
Wire Wire Line
	1000 3650 1050 3650
Wire Wire Line
	1650 3800 1650 3650
$Comp
L Mechanical:MountingHole H2
U 1 1 605643E9
P 3500 4000
F 0 "H2" V 3500 3800 50  0000 L CNN
F 1 "MountingHole" V 3650 3700 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3500 4000 50  0001 C CNN
F 3 "~" H 3500 4000 50  0001 C CNN
	1    3500 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 2300 3600 2300
Wire Wire Line
	3600 2300 3600 2550
Connection ~ 2650 2300
Wire Wire Line
	2650 2950 3600 2950
Wire Wire Line
	2650 2550 2650 2300
Wire Wire Line
	3400 2550 3400 2400
Wire Wire Line
	3400 2850 3300 2850
Wire Wire Line
	2650 2750 2650 2950
Wire Wire Line
	3600 2850 3600 2950
$Comp
L Device:R R7
U 1 1 601142AF
P 2700 950
F 0 "R7" V 2700 950 50  0000 L CNN
F 1 "10k" H 2500 900 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2630 950 50  0001 C CNN
F 3 "~" H 2700 950 50  0001 C CNN
	1    2700 950 
	-1   0    0    1   
$EndComp
Text Label 900  3250 2    50   ~ 0
!OUT
Text Label 900  3050 2    50   ~ 0
VIN
Text Label 900  3150 2    50   ~ 0
NC
Text Label 900  2950 2    50   ~ 0
COM
Text Label 900  3350 2    50   ~ 0
NO
Wire Wire Line
	900  3250 950  3250
Wire Wire Line
	900  3050 950  3050
$Comp
L Device:R R8
U 1 1 60134136
P 3400 1500
F 0 "R8" V 3400 1500 50  0000 L CNN
F 1 "470" H 3200 1450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3330 1500 50  0001 C CNN
F 3 "~" H 3400 1500 50  0001 C CNN
	1    3400 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small_ALT D5
U 1 1 6013413C
P 3400 1150
F 0 "D5" V 3300 1250 50  0000 R CNN
F 1 "LED" V 3400 1350 50  0000 R CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" V 3400 1150 50  0001 C CNN
F 3 "~" V 3400 1150 50  0001 C CNN
	1    3400 1150
	0    1    -1   0   
$EndComp
Connection ~ 4250 1250
Wire Wire Line
	4250 950  4250 900 
Wire Wire Line
	4250 900  4150 900 
Wire Wire Line
	4150 900  4150 1250
Wire Wire Line
	4000 850  4000 800 
Wire Wire Line
	3700 1050 3700 1350
Wire Wire Line
	4250 1250 4250 1350
Wire Wire Line
	2450 2500 3700 2500
$Comp
L Jumper:SolderJumper_3_Open JP8
U 1 1 6041DB7A
P 3400 1900
F 0 "JP8" H 3500 1800 50  0000 C CNN
F 1 "S/-" H 3400 2000 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm_NumberLabels" H 3400 1900 50  0001 C CNN
F 3 "~" H 3400 1900 50  0001 C CNN
	1    3400 1900
	-1   0    0    1   
$EndComp
$Comp
L Relay_SolidState:S102S02 U4
U 1 1 60125C24
P 1250 3150
F 0 "U4" H 1200 3250 50  0000 C CNN
F 1 "S102S02" V 1600 3150 50  0000 C CNN
F 2 "Package_SIP:SIP4_Sharp-SSR_P7.62mm_Straight" H 1050 2950 50  0001 L CIN
F 3 "http://www.sharp-world.com/products/device/lineup/data/pdf/datasheet/s102s02_e.pdf" H 1250 3150 50  0001 L CNN
	1    1250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3350 1550 3250
Wire Wire Line
	3400 2400 3800 2400
Connection ~ 3400 2400
Connection ~ 3200 1900
Wire Wire Line
	3400 1750 3400 1650
Wire Wire Line
	3400 800  3300 800 
Wire Wire Line
	3400 800  3400 1050
$Comp
L Jumper:SolderJumper_3_Open JP1
U 1 1 601DDCF2
P 4750 1800
F 0 "JP1" H 4650 1650 50  0000 C CNN
F 1 "H/L" H 4900 1850 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm_NumberLabels" H 4750 1800 50  0001 C CNN
F 3 "~" H 4750 1800 50  0001 C CNN
	1    4750 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1650 3700 1800
Wire Wire Line
	4550 1650 4550 1800
Connection ~ 3700 1800
Wire Wire Line
	3700 1800 3700 2500
Wire Wire Line
	3600 2000 3600 1900
Wire Wire Line
	3800 1900 3800 2400
Wire Wire Line
	4000 800  3400 800 
Connection ~ 3400 800 
$Comp
L Device:C C5
U 1 1 6051E38C
P 2150 1550
F 0 "C5" H 2150 1650 50  0000 L CNN
F 1 "0.1" H 2000 1450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 2188 1400 50  0001 C CNN
F 3 "~" H 2150 1550 50  0001 C CNN
	1    2150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 800  2150 1250
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 6058CDF5
P 1750 1250
F 0 "JP5" H 1700 1150 50  0000 L CNN
F 1 "Reg?" H 1600 1350 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 1750 1250 50  0001 C CNN
F 3 "~" H 1750 1250 50  0001 C CNN
	1    1750 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1250 1550 1400
Wire Wire Line
	1550 1250 1600 1250
Wire Wire Line
	2150 1250 2150 1400
Connection ~ 2150 1250
Wire Wire Line
	1900 1250 2000 1250
Wire Wire Line
	1550 1700 1850 1700
Wire Wire Line
	1550 600  1550 800 
Wire Wire Line
	2250 2200 2250 800 
$Comp
L power:+3.3V #PWR0103
U 1 1 601ABC69
P 2550 800
F 0 "#PWR0103" H 2550 650 50  0001 C CNN
F 1 "+3.3V" H 2700 850 50  0000 C CNN
F 2 "" H 2550 800 50  0001 C CNN
F 3 "" H 2550 800 50  0001 C CNN
	1    2550 800 
	1    0    0    -1  
$EndComp
Connection ~ 3000 800 
Connection ~ 2900 1700
Wire Wire Line
	2900 1300 2950 1300
Wire Wire Line
	3000 1400 3000 2100
Connection ~ 3000 2100
$Comp
L Jumper:SolderJumper_2_Bridged JP7
U 1 1 60366F44
P 2700 1250
F 0 "JP7" V 2700 1050 50  0000 L CNN
F 1 "Ena" H 2500 1200 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 2700 1250 50  0001 C CNN
F 3 "~" H 2700 1250 50  0001 C CNN
	1    2700 1250
	0    1    1    0   
$EndComp
Connection ~ 3300 800 
Wire Wire Line
	3000 800  3300 800 
$Comp
L Jumper:SolderJumper_2_Bridged JP9
U 1 1 603E23F2
P 3300 1250
F 0 "JP9" V 3300 1050 50  0000 L CNN
F 1 "Prg" H 3100 1200 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 3300 1250 50  0001 C CNN
F 3 "~" H 3300 1250 50  0001 C CNN
	1    3300 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1400 3300 2200
Wire Wire Line
	2900 1700 3200 1700
Connection ~ 3200 1700
Wire Wire Line
	3200 1700 4250 1700
Wire Wire Line
	3200 1300 3250 1300
Wire Wire Line
	3250 1300 3250 1400
Wire Wire Line
	3250 1400 3300 1400
Connection ~ 3300 1400
Wire Wire Line
	2950 1300 2950 1400
Wire Wire Line
	2950 1400 3000 1400
Connection ~ 3000 1400
$Comp
L Device:CP C3
U 1 1 60478731
P 2000 1400
F 0 "C3" H 2000 1500 50  0000 L CNN
F 1 "10" H 1900 1300 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 2038 1250 50  0001 C CNN
F 3 "~" H 2000 1400 50  0001 C CNN
	1    2000 1400
	1    0    0    -1  
$EndComp
Connection ~ 2000 1250
Wire Wire Line
	2000 1250 2150 1250
Wire Wire Line
	2150 800  2250 800 
Wire Wire Line
	2000 1550 2000 1700
Connection ~ 2000 1700
Wire Wire Line
	2000 1700 2150 1700
Wire Wire Line
	3400 1250 3400 1350
Wire Wire Line
	1200 3800 1650 3800
Wire Wire Line
	1200 3750 1200 3800
Wire Wire Line
	1000 3750 1200 3750
Text Label 1000 3750 2    50   ~ 0
!OUT
Wire Wire Line
	1250 4100 1650 4100
Wire Wire Line
	1250 4050 1250 4100
Wire Wire Line
	1000 4050 1250 4050
Wire Wire Line
	1000 4150 1050 4150
Wire Wire Line
	1000 3950 1050 3950
Text Label 1000 4150 2    50   ~ 0
NO
Text Label 1000 4050 2    50   ~ 0
COM
Text Label 1000 3950 2    50   ~ 0
NC
$Comp
L Relay:FINDER-36.11 K1
U 1 1 602D0786
P 1350 3850
F 0 "K1" V 1000 4150 50  0000 L CNN
F 1 "FINDER-36.11" H 1100 3500 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Finder_36.11" H 2620 3820 50  0001 C CNN
F 3 "https://gfinder.findernet.com/public/attachments/36/EN/S36EN.pdf" H 1350 3850 50  0001 C CNN
	1    1350 3850
	0    -1   1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 606F7F49
P 2900 1900
F 0 "C4" H 2900 2000 50  0000 L CNN
F 1 "0.1" H 2750 2000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 2938 1750 50  0001 C CNN
F 3 "~" H 2900 1900 50  0001 C CNN
	1    2900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2050 2900 2100
Connection ~ 2900 2100
Wire Wire Line
	2900 2100 3000 2100
Wire Wire Line
	2900 1750 2900 1700
Wire Wire Line
	4000 1250 4150 1250
Wire Wire Line
	1550 3350 900  3350
$Comp
L Driver_FET:TLP250 U5
U 1 1 601E68E9
P 1550 4850
F 0 "U5" H 1450 5150 50  0000 C CNN
F 1 "TLP250" H 1700 5300 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1550 4450 50  0001 C CIN
F 3 "http://toshiba.semicon-storage.com/info/docget.jsp?did=16821&prodName=TLP250" H 1460 4855 50  0001 L CNN
	1    1550 4850
	1    0    0    -1  
$EndComp
Text Label 850  5150 2    50   ~ 0
!OUT
Text Label 850  4450 2    50   ~ 0
VIN
Wire Wire Line
	1250 4950 1150 4950
Wire Wire Line
	1150 4950 1150 5150
Wire Wire Line
	1950 4950 1950 4900
Connection ~ 1550 800 
Connection ~ 1550 1250
Wire Wire Line
	1400 800  1550 800 
Wire Wire Line
	1550 1250 1550 800 
$Comp
L Regulator_Linear:AMS1117CD-3.3 U2
U 1 1 5EE8F9D0
P 1850 800
F 0 "U2" H 1850 850 50  0000 C CNN
F 1 "3.3Vdc 1A reg" H 1850 950 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 1850 600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001826D.pdf" H 1850 800 50  0001 C CNN
	1    1850 800 
	1    0    0    -1  
$EndComp
Connection ~ 2150 800 
$Comp
L ESP8266:ESP-01v090 U1
U 1 1 601BEB4F
P 2500 3900
F 0 "U1" V 2600 4000 50  0000 R CNN
F 1 "ESP-01v090" V 2500 4150 50  0000 R CNN
F 2 "" H 2500 3900 50  0001 C CNN
F 3 "http://l0l.org.uk/2014/12/esp8266-modules-hardware-guide-gotta-catch-em-all/" H 2500 3900 50  0001 C CNN
	1    2500 3900
	0    -1   -1   0   
$EndComp
Connection ~ 2650 2950
Connection ~ 1400 2600
$Comp
L Jumper:SolderJumper_2_Bridged JP6
U 1 1 6038B8FD
P 3000 1250
F 0 "JP6" V 3000 1000 50  0000 L CNN
F 1 "Rst" H 2800 1200 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 3000 1250 50  0001 C CNN
F 3 "~" H 3000 1250 50  0001 C CNN
	1    3000 1250
	0    1    1    0   
$EndComp
NoConn ~ 1250 4750
$Comp
L Transistor_BJT:BC557 Q5
U 1 1 601C6427
P 3900 1050
F 0 "Q5" H 3700 1000 50  0000 L CNN
F 1 "BC557" H 3700 900 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4100 975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC557.pdf" H 3900 1050 50  0001 L CNN
	1    3900 1050
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 2350 4700 2300
Wire Wire Line
	4600 2300 4600 2350
Wire Wire Line
	4500 2350 4500 2300
Connection ~ 4550 1800
Wire Wire Line
	3700 1800 4550 1800
Wire Wire Line
	4750 2000 4750 1950
Wire Wire Line
	3600 2000 4750 2000
Wire Wire Line
	1950 4450 1950 4550
Text Label 850  5250 2    50   ~ 0
GND
Wire Wire Line
	850  5150 1150 5150
Wire Wire Line
	1150 4900 1950 4900
Wire Wire Line
	1550 3050 1550 2950
Wire Wire Line
	1550 2950 900  2950
Text Label 850  4850 2    50   ~ 0
OUT
Wire Wire Line
	850  4850 1150 4850
Wire Wire Line
	1150 4850 1150 4900
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 601D4333
P 3400 2700
F 0 "JP3" H 3350 2800 50  0000 L CNN
F 1 "Schottky bypass" H 3700 2700 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3400 2700 50  0001 C CNN
F 3 "~" H 3400 2700 50  0001 C CNN
	1    3400 2700
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 601E89C9
P 3600 2700
F 0 "JP4" H 3550 2800 50  0000 L CNN
F 1 "Schottky bypass" H 3900 2700 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 2700 50  0001 C CNN
F 3 "~" H 3600 2700 50  0001 C CNN
	1    3600 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 2850 2550 2850
Connection ~ 3300 2850
Wire Wire Line
	2550 2850 2550 2950
Connection ~ 2550 2850
Text Label 3700 2950 0    50   ~ 0
GPIO3
Text Label 3400 2200 0    50   ~ 0
GPIO0
Wire Wire Line
	3700 2950 3600 2950
Connection ~ 3600 2950
Wire Wire Line
	3400 2200 3300 2200
Connection ~ 3300 2200
Wire Wire Line
	3300 2200 3300 2850
$Comp
L Mechanical:Fiducial FID1
U 1 1 602F32F9
P 700 650
F 0 "FID1" H 785 696 50  0000 L CNN
F 1 "Fiducial" H 785 605 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 700 650 50  0001 C CNN
F 3 "~" H 700 650 50  0001 C CNN
	1    700  650 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 602F4333
P 700 850
F 0 "FID2" H 785 896 50  0000 L CNN
F 1 "Fiducial" H 785 805 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 700 850 50  0001 C CNN
F 3 "~" H 700 850 50  0001 C CNN
	1    700  850 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID3
U 1 1 602FDECD
P 700 1050
F 0 "FID3" H 785 1096 50  0000 L CNN
F 1 "Fiducial" H 785 1005 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 700 1050 50  0001 C CNN
F 3 "~" H 700 1050 50  0001 C CNN
	1    700  1050
	1    0    0    -1  
$EndComp
Connection ~ 1150 5150
Wire Wire Line
	1950 5150 1950 5250
Wire Wire Line
	950  4450 950  4550
Wire Wire Line
	950  4550 1150 4550
Wire Wire Line
	850  4450 950  4450
Connection ~ 950  4450
$Comp
L Device:Jumper_NO_Small JP10
U 1 1 60428059
P 1050 4450
F 0 "JP10" H 1200 4500 50  0000 C CNN
F 1 "Vin" H 950 4500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 4450 50  0001 C CNN
F 3 "~" H 1050 4450 50  0001 C CNN
	1    1050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4450 1950 4450
$Comp
L Device:Jumper_NO_Small JP11
U 1 1 60683B46
P 1050 5250
F 0 "JP11" H 1200 5300 50  0000 C CNN
F 1 "GND" H 950 5300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 5250 50  0001 C CNN
F 3 "~" H 1050 5250 50  0001 C CNN
	1    1050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  5250 950  5250
Wire Wire Line
	1150 5250 1950 5250
$Comp
L Jumper:SolderJumper_2_Open JP12
U 1 1 606C1A06
P 2000 4650
F 0 "JP12" H 2150 4600 50  0000 L CNN
F 1 "6-pin" H 1600 4650 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2000 4650 50  0001 C CNN
F 3 "~" H 2000 4650 50  0001 C CNN
	1    2000 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 4450 2000 4450
Wire Wire Line
	2000 4450 2000 4500
Connection ~ 1950 4450
Wire Wire Line
	1950 4750 1950 4800
Wire Wire Line
	1950 4800 2000 4800
$Comp
L Transistor_FET:IRF540N Q2
U 1 1 6030DBBA
P 1000 1550
F 0 "Q2" H 850 1650 50  0000 L CNN
F 1 "IRF540N" H 650 1450 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1250 1475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 1000 1550 50  0001 L CNN
	1    1000 1550
	1    0    0    -1  
$EndComp
Text Label 800  1550 2    50   ~ 0
!OUT
Text Label 800  1750 2    50   ~ 0
GND
Wire Wire Line
	800  1750 1100 1750
Text Label 800  1350 2    50   ~ 0
OUT
Wire Wire Line
	800  1350 1100 1350
$Comp
L Connector:TestPoint TP1
U 1 1 603F93B0
P 4150 2500
F 0 "TP1" V 4150 2750 50  0000 C CNN
F 1 "VIN+" V 4050 2650 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_1x2mm" H 4350 2500 50  0001 C CNN
F 3 "~" H 4350 2500 50  0001 C CNN
	1    4150 2500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 603FA50E
P 4150 2200
F 0 "TP2" V 4150 2450 50  0000 C CNN
F 1 "!OUT-" V 4250 2350 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_1x2mm" H 4350 2200 50  0001 C CNN
F 3 "~" H 4350 2200 50  0001 C CNN
	1    4150 2200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 60486948
P 4150 2300
F 0 "TP4" V 4150 2550 50  0000 C CNN
F 1 "!OUT-" V 4350 2450 50  0000 C CNN
F 2 "MountingHole:MountingHole_4mm_Pad_Via" H 4350 2300 50  0001 C CNN
F 3 "~" H 4350 2300 50  0001 C CNN
	1    4150 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 2300 4150 2200
Connection ~ 4150 2200
$Comp
L Connector:TestPoint TP3
U 1 1 6049B0DE
P 4150 2400
F 0 "TP3" V 4150 2650 50  0000 C CNN
F 1 "VIN+" V 3950 2550 50  0000 C CNN
F 2 "MountingHole:MountingHole_4mm_Pad_Via" H 4350 2400 50  0001 C CNN
F 3 "~" H 4350 2400 50  0001 C CNN
	1    4150 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 2500 4150 2400
Text Notes 4150 3900 0    50   ~ 0
SoFar:\n+ RC filtering on GPIO2 prevents glitch on boot/reset\n+ ESP-01 S or notS with LED jumper to suit\n+ OptoIsolator option: 555-like push/pull 1A 15Vdc\n+ MOSFET option: low-side sink 2A 60Vdc\n+ Mechanical relay option: 3A, 250Vac or 30Vdc\n+ Inline SSR option: 3A, 250Vac\n+ High power SSR direct mount option: 3-32Vdc\n+ Button for local trigger & programming\n+ Header GPIO for control\n+ Header serial for control &/ logging\n+ Inputs tolerate 3.3V - 15V\n+ 1-Wire bus on GPIO if JP3 & JP9 closed
Text Notes 4050 2400 0    50   ~ 0
FOTEK
Wire Wire Line
	4150 2500 4300 2500
Connection ~ 4150 2500
Wire Wire Line
	5100 1700 5100 1650
Wire Wire Line
	5000 1700 5100 1700
Wire Wire Line
	5000 1700 5000 2350
Wire Wire Line
	5100 1900 5100 2350
Wire Wire Line
	5300 1200 5300 1300
$Comp
L Device:R R9
U 1 1 6033336D
P 5300 1450
F 0 "R9" V 5300 1350 50  0000 L CNN
F 1 "*" H 5300 1600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5230 1450 50  0001 C CNN
F 3 "~" H 5300 1450 50  0001 C CNN
	1    5300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2300 5200 2350
$Comp
L Transistor_FET:BS170 Q1
U 1 1 601C6E5D
P 5000 1450
F 0 "Q1" H 4850 1550 50  0000 L CNN
F 1 "BS170" H 4850 1650 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 5200 1375 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 5000 1450 50  0001 L CNN
	1    5000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 600  5400 600 
Wire Wire Line
	5100 1200 5300 1200
Wire Wire Line
	3800 1900 5100 1900
Wire Wire Line
	4400 1700 5000 1700
Wire Wire Line
	5100 1200 5100 1250
Connection ~ 5100 1200
Wire Wire Line
	5100 1050 5100 1200
Text Label 5400 2300 1    50   ~ 0
VIN
Wire Wire Line
	5100 600  5100 850 
$Comp
L Device:D_Small_ALT D9
U 1 1 6024E752
P 5100 950
F 0 "D9" V 5000 950 50  0000 L CNN
F 1 "1N4148" H 4800 850 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P2.54mm_Vertical_AnodeUp" V 5100 950 50  0001 C CNN
F 3 "~" V 5100 950 50  0001 C CNN
	1    5100 950 
	0    1    1    0   
$EndComp
Text Label 5300 2300 1    50   ~ 0
!OUT
Text Label 5200 2300 1    50   ~ 0
OUT
Text Label 5100 2300 1    50   ~ 0
!TRIGGER
Text Label 5000 2300 1    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_01x05 J5
U 1 1 5FF8B9D1
P 5200 2550
F 0 "J5" V 5200 2800 50  0000 L CNN
F 1 "555-esque" V 5300 2300 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Horizontal" H 5200 2550 50  0001 C CNN
F 3 "~" H 5200 2550 50  0001 C CNN
	1    5200 2550
	0    -1   1    0   
$EndComp
Connection ~ 4400 1700
Connection ~ 5000 1700
Wire Wire Line
	4950 1800 5300 1800
Connection ~ 5300 2050
Wire Wire Line
	5300 2050 5300 2350
Wire Wire Line
	5400 2100 5400 2350
Wire Wire Line
	5300 1800 5300 2050
Wire Wire Line
	5300 1600 5300 1800
Connection ~ 5300 1800
Wire Wire Line
	4150 2200 4150 2050
Wire Wire Line
	4150 2050 5300 2050
Wire Wire Line
	4300 2100 4300 2500
Wire Wire Line
	4300 2100 5400 2100
Wire Wire Line
	5400 600  5400 2100
Connection ~ 5400 2100
$Comp
L Device:R R4
U 1 1 6043335B
P 4700 1300
F 0 "R4" V 4700 1200 50  0000 L CNN
F 1 "200" H 4650 1500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4630 1300 50  0001 C CNN
F 3 "~" H 4700 1300 50  0001 C CNN
	1    4700 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1150 4800 1150
Wire Wire Line
	4800 1150 4800 1450
Connection ~ 2700 800 
Wire Wire Line
	2700 800  3000 800 
Connection ~ 2700 2000
Wire Wire Line
	2700 2000 3100 2000
Wire Wire Line
	1400 2000 2700 2000
Wire Wire Line
	2550 800  2700 800 
Connection ~ 2150 2600
Wire Wire Line
	2150 2600 2350 2600
Connection ~ 2250 2200
Wire Wire Line
	2250 2200 2900 2200
Wire Wire Line
	1550 600  5100 600 
Connection ~ 5100 600 
Connection ~ 2550 800 
Connection ~ 2250 800 
Wire Wire Line
	2700 1400 2700 2000
Wire Wire Line
	2150 1700 2900 1700
Wire Wire Line
	2250 800  2550 800 
Wire Wire Line
	1400 2400 2550 2400
$EndSCHEMATC
