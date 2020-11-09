EESchema Schematic File Version 4
EELAYER 30 0
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
L stargazer-backplane:ADAFRUIT_FEATHER U1
U 2 1 5F8B49F7
P 1650 1600
F 0 "U1" H 1550 2300 60  0000 L CNN
F 1 "ADAFRUIT_FEATHER" H 1550 850 60  0000 L CNN
F 2 "Modules:ADAFRUIT_FEATHER" H 1800 1400 60  0000 C CNN
F 3 "" H 1800 1400 60  0000 C CNN
	2    1650 1600
	1    0    0    -1  
$EndComp
$Comp
L stargazer-backplane:ADAFRUIT_FEATHER U1
U 1 1 5F8B512D
P 2250 1750
F 0 "U1" H 2150 2600 60  0000 L CNN
F 1 "ADAFRUIT_FEATHER" H 2428 1697 60  0001 L CNN
F 2 "Modules:ADAFRUIT_FEATHER" H 2400 1550 60  0000 C CNN
F 3 "" H 2400 1550 60  0000 C CNN
	1    2250 1750
	-1   0    0    -1  
$EndComp
$Comp
L Interface_Expansion:PCF8574 U6
U 1 1 5F8BB276
P 3350 5800
F 0 "U6" H 3350 6681 50  0000 C CNN
F 1 "PCF8574" H 3350 6590 50  0000 C CNN
F 2 "stargazer-stalk:SOIC127P1032X265-16N" H 3350 5800 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 3350 5800 50  0001 C CNN
	1    3350 5800
	1    0    0    -1  
$EndComp
$Comp
L stargazer-backplane:card-header J3
U 1 1 5F8BC735
P 9800 850
F 0 "J3" H 10578 -1699 50  0000 L CNN
F 1 "card-header" H 10578 -1790 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x40_P2.54mm_Horizontal" H 10250 850 50  0001 C CNN
F 3 "" H 10250 850 50  0001 C CNN
	1    9800 850 
	1    0    0    -1  
$EndComp
Text Label 3850 5400 0    50   ~ 0
CARD1-GO
Text Label 3850 5500 0    50   ~ 0
CARD2-GO
Text Label 3850 5600 0    50   ~ 0
CARD3-GO
Text Label 3850 5700 0    50   ~ 0
CARD4-GO
Text Label 3850 5800 0    50   ~ 0
CARD5-GO
Text Label 3850 5900 0    50   ~ 0
CARD6-GO
Text Label 3850 6000 0    50   ~ 0
CARD7-GO
Text Label 3850 6100 0    50   ~ 0
CARD8-GO
Text Label 9800 1000 2    50   ~ 0
CARD1-GO
Text Label 9800 1100 2    50   ~ 0
CARD2-GO
Text Label 9800 1200 2    50   ~ 0
CARD3-GO
Text Label 9800 1300 2    50   ~ 0
CARD4-GO
Text Label 9800 1400 2    50   ~ 0
CARD5-GO
Text Label 9800 1500 2    50   ~ 0
CARD6-GO
Text Label 9800 1600 2    50   ~ 0
CARD7-GO
Text Label 9800 1700 2    50   ~ 0
CARD8-GO
Text Label 9800 1900 2    50   ~ 0
MOSI
Text Label 9800 2000 2    50   ~ 0
SCK
Text Label 9800 2100 2    50   ~ 0
A5
NoConn ~ 9800 2400
NoConn ~ 9800 2500
NoConn ~ 9800 2600
NoConn ~ 9800 2700
$Comp
L stargazer-backplane:jumper J1
U 1 1 5F8C6ED4
P 8550 2950
F 0 "J1" H 8692 3115 50  0000 C CNN
F 1 "jumper" H 8692 3024 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8750 3000 50  0001 C CNN
F 3 "" H 8750 3000 50  0001 C CNN
	1    8550 2950
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 5F8C8901
P 8650 2800
F 0 "#PWR0101" H 8650 2650 50  0001 C CNN
F 1 "+3V3" H 8665 2973 50  0000 C CNN
F 2 "" H 8650 2800 50  0001 C CNN
F 3 "" H 8650 2800 50  0001 C CNN
	1    8650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3150 9800 3150
Wire Wire Line
	8550 3050 8650 3050
Wire Wire Line
	8650 3050 8650 2800
$Comp
L power:+5V #PWR0102
U 1 1 5F8C8D66
P 9000 2800
F 0 "#PWR0102" H 9000 2650 50  0001 C CNN
F 1 "+5V" H 9015 2973 50  0000 C CNN
F 2 "" H 9000 2800 50  0001 C CNN
F 3 "" H 9000 2800 50  0001 C CNN
	1    9000 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5F8C9086
P 9000 3350
F 0 "#PWR0103" H 9000 3100 50  0001 C CNN
F 1 "GND" H 9005 3177 50  0000 C CNN
F 2 "" H 9000 3350 50  0001 C CNN
F 3 "" H 9000 3350 50  0001 C CNN
	1    9000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3050 9000 3050
Wire Wire Line
	9000 3050 9000 2800
Wire Wire Line
	9800 2950 9150 2950
Wire Wire Line
	9150 2950 9150 3350
Wire Wire Line
	9150 3350 9000 3350
Text Label 9800 3250 2    50   ~ 0
RST
NoConn ~ 9800 3450
NoConn ~ 9800 3550
NoConn ~ 9800 3700
NoConn ~ 9800 3800
NoConn ~ 9800 3950
NoConn ~ 9800 4050
NoConn ~ 9800 4200
NoConn ~ 9800 4300
NoConn ~ 9800 4450
NoConn ~ 9800 4550
NoConn ~ 9800 4700
NoConn ~ 9800 4800
NoConn ~ 9800 5550
NoConn ~ 9800 5650
$Comp
L stargazer-backplane:card-programming-header-arb J2
U 1 1 5F8CB4F2
P 8550 5700
F 0 "J2" H 8817 5865 50  0000 C CNN
F 1 "card-programming-header-arb" H 8817 5774 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8900 5750 50  0001 C CNN
F 3 "" H 8900 5750 50  0001 C CNN
	1    8550 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8650 5800 9800 5800
Wire Wire Line
	8650 5900 9800 5900
Text Label 1400 850  2    50   ~ 0
RST
Text Label 1400 1050 2    50   ~ 0
AREF
$Comp
L power:+3V3 #PWR0107
U 1 1 5F8EB91B
P 800 950
F 0 "#PWR0107" H 800 800 50  0001 C CNN
F 1 "+3V3" H 815 1123 50  0000 C CNN
F 2 "" H 800 950 50  0001 C CNN
F 3 "" H 800 950 50  0001 C CNN
	1    800  950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F8EB921
P 800 1150
F 0 "#PWR0108" H 800 900 50  0001 C CNN
F 1 "GND" H 805 977 50  0000 C CNN
F 2 "" H 800 1150 50  0001 C CNN
F 3 "" H 800 1150 50  0001 C CNN
	1    800  1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  950  1400 950 
Wire Wire Line
	800  1150 1400 1150
Text Label 1400 1850 2    50   ~ 0
SCK
Text Label 1400 1950 2    50   ~ 0
MOSI
Text Label 1400 2050 2    50   ~ 0
MISO
Text Label 1400 2150 2    50   ~ 0
D0
Text Label 1400 2250 2    50   ~ 0
D1
Text Label 1400 2350 2    50   ~ 0
DIO1
Text Label 1400 1250 2    50   ~ 0
A0
Text Label 1400 1350 2    50   ~ 0
A1
Text Label 1400 1450 2    50   ~ 0
A2
Text Label 1400 1550 2    50   ~ 0
A3
Text Label 1400 1650 2    50   ~ 0
A4
Text Label 1400 1750 2    50   ~ 0
A5
Text Label 2500 1200 0    50   ~ 0
VBAT
Text Label 2500 1300 0    50   ~ 0
EN
Text Label 2500 1500 0    50   ~ 0
D13
Text Label 2500 1600 0    50   ~ 0
D12
Text Label 2500 1700 0    50   ~ 0
D11
Text Label 2500 1800 0    50   ~ 0
D10
Text Label 2500 1900 0    50   ~ 0
D9
Text Label 2500 2000 0    50   ~ 0
D6
Text Label 2500 2100 0    50   ~ 0
D5
Text Label 2500 2200 0    50   ~ 0
D3-SCL
Text Label 2500 2300 0    50   ~ 0
D2-SDA
$Comp
L power:+5V #PWR0109
U 1 1 5F8F5259
P 2950 1400
F 0 "#PWR0109" H 2950 1250 50  0001 C CNN
F 1 "+5V" H 2965 1573 50  0000 C CNN
F 2 "" H 2950 1400 50  0001 C CNN
F 3 "" H 2950 1400 50  0001 C CNN
	1    2950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1400 2950 1400
$Comp
L Jumper:Jumper_3_Bridged12 JP4
U 1 1 5F904DEA
P 1500 5650
F 0 "JP4" V 1400 5900 50  0000 C CNN
F 1 "Jumper_3_Bridged12" V 1600 6100 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1500 5650 50  0001 C CNN
F 3 "~" H 1500 5650 50  0001 C CNN
	1    1500 5650
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP2
U 1 1 5F9053DB
P 900 5750
F 0 "JP2" V 800 6000 50  0000 C CNN
F 1 "Jumper_3_Bridged12" V 1000 6200 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 900 5750 50  0001 C CNN
F 3 "~" H 900 5750 50  0001 C CNN
	1    900  5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5F90589F
P 650 6000
F 0 "#PWR0110" H 650 5750 50  0001 C CNN
F 1 "GND" H 655 5827 50  0000 C CNN
F 2 "" H 650 6000 50  0001 C CNN
F 3 "" H 650 6000 50  0001 C CNN
	1    650  6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5650 1250 6000
Wire Wire Line
	1250 6000 650  6000
Wire Wire Line
	650  5750 650  6000
Connection ~ 650  6000
$Comp
L power:+3V3 #PWR0111
U 1 1 5F907165
P 1750 4650
F 0 "#PWR0111" H 1750 4500 50  0001 C CNN
F 1 "+3V3" H 1765 4823 50  0000 C CNN
F 2 "" H 1750 4650 50  0001 C CNN
F 3 "" H 1750 4650 50  0001 C CNN
	1    1750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4650 1750 5650
Wire Wire Line
	1750 4650 1150 4650
Wire Wire Line
	1150 4650 1150 5750
Connection ~ 1750 4650
Wire Wire Line
	900  5900 2850 5900
Wire Wire Line
	1500 5800 2850 5800
Text Label 2850 5400 2    50   ~ 0
D3-SCL
Text Label 2850 5500 2    50   ~ 0
D2-SDA
$Comp
L power:GND #PWR0112
U 1 1 5F90BC7A
P 3350 6500
F 0 "#PWR0112" H 3350 6250 50  0001 C CNN
F 1 "GND" H 3355 6327 50  0000 C CNN
F 2 "" H 3350 6500 50  0001 C CNN
F 3 "" H 3350 6500 50  0001 C CNN
	1    3350 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0113
U 1 1 5F90BEFD
P 3350 5100
F 0 "#PWR0113" H 3350 4950 50  0001 C CNN
F 1 "+3V3" H 3365 5273 50  0000 C CNN
F 2 "" H 3350 5100 50  0001 C CNN
F 3 "" H 3350 5100 50  0001 C CNN
	1    3350 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0114
U 1 1 5F90D556
P 4550 5600
F 0 "#PWR0114" H 4550 5450 50  0001 C CNN
F 1 "+3V3" H 4565 5773 50  0000 C CNN
F 2 "" H 4550 5600 50  0001 C CNN
F 3 "" H 4550 5600 50  0001 C CNN
	1    4550 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F90D8C9
P 4550 5900
F 0 "#PWR0115" H 4550 5650 50  0001 C CNN
F 1 "GND" H 4555 5727 50  0000 C CNN
F 2 "" H 4550 5900 50  0001 C CNN
F 3 "" H 4550 5900 50  0001 C CNN
	1    4550 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5700 2150 5700
Wire Wire Line
	2150 5700 2150 6000
Wire Wire Line
	2150 6000 1250 6000
Connection ~ 1250 6000
$Comp
L Interface_Expansion:PCF8574 U5
U 1 1 5F927564
P 3350 3950
F 0 "U5" H 3350 4831 50  0000 C CNN
F 1 "PCF8574" H 3350 4740 50  0000 C CNN
F 2 "stargazer-stalk:SOIC127P1032X265-16N" H 3350 3950 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 3350 3950 50  0001 C CNN
	1    3350 3950
	1    0    0    -1  
$EndComp
Text Label 3850 3650 0    50   ~ 0
CARD2-ACT
Text Label 3850 3750 0    50   ~ 0
CARD3-ACT
Text Label 3850 3850 0    50   ~ 0
CARD4-ACT
Text Label 3850 3950 0    50   ~ 0
CARD5-ACT
Text Label 3850 4050 0    50   ~ 0
CARD6-ACT
Text Label 3850 4150 0    50   ~ 0
CARD7-ACT
Text Label 3850 4250 0    50   ~ 0
CARD8-ACT
$Comp
L Jumper:Jumper_3_Bridged12 JP3
U 1 1 5F927572
P 1500 3800
F 0 "JP3" V 1400 4050 50  0000 C CNN
F 1 "Jumper_3_Bridged12" V 1600 4250 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1500 3800 50  0001 C CNN
F 3 "~" H 1500 3800 50  0001 C CNN
	1    1500 3800
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5F927578
P 900 3900
F 0 "JP1" V 800 4150 50  0000 C CNN
F 1 "Jumper_3_Bridged12" V 1000 4350 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 900 3900 50  0001 C CNN
F 3 "~" H 900 3900 50  0001 C CNN
	1    900  3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5F92757E
P 650 4150
F 0 "#PWR0116" H 650 3900 50  0001 C CNN
F 1 "GND" H 655 3977 50  0000 C CNN
F 2 "" H 650 4150 50  0001 C CNN
F 3 "" H 650 4150 50  0001 C CNN
	1    650  4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3800 1250 4150
Wire Wire Line
	1250 4150 650  4150
Wire Wire Line
	650  3900 650  4150
Connection ~ 650  4150
$Comp
L power:+3V3 #PWR0117
U 1 1 5F927588
P 1750 2800
F 0 "#PWR0117" H 1750 2650 50  0001 C CNN
F 1 "+3V3" H 1765 2973 50  0000 C CNN
F 2 "" H 1750 2800 50  0001 C CNN
F 3 "" H 1750 2800 50  0001 C CNN
	1    1750 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2800 1750 3800
Wire Wire Line
	1750 2800 1150 2800
Wire Wire Line
	1150 2800 1150 3900
Connection ~ 1750 2800
Wire Wire Line
	900  4050 2850 4050
Wire Wire Line
	1500 3950 2850 3950
Text Label 2850 3550 2    50   ~ 0
D3-SCL
Text Label 2850 3650 2    50   ~ 0
D2-SDA
$Comp
L power:GND #PWR0118
U 1 1 5F927596
P 3350 4650
F 0 "#PWR0118" H 3350 4400 50  0001 C CNN
F 1 "GND" H 3355 4477 50  0000 C CNN
F 2 "" H 3350 4650 50  0001 C CNN
F 3 "" H 3350 4650 50  0001 C CNN
	1    3350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0119
U 1 1 5F92759C
P 3350 3250
F 0 "#PWR0119" H 3350 3100 50  0001 C CNN
F 1 "+3V3" H 3365 3423 50  0000 C CNN
F 2 "" H 3350 3250 50  0001 C CNN
F 3 "" H 3350 3250 50  0001 C CNN
	1    3350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F9275A2
P 4550 3900
F 0 "C1" H 4665 3946 50  0000 L CNN
F 1 "100nF" H 4665 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4588 3750 50  0001 C CNN
F 3 "~" H 4550 3900 50  0001 C CNN
	1    4550 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0120
U 1 1 5F9275A8
P 4550 3750
F 0 "#PWR0120" H 4550 3600 50  0001 C CNN
F 1 "+3V3" H 4565 3923 50  0000 C CNN
F 2 "" H 4550 3750 50  0001 C CNN
F 3 "" H 4550 3750 50  0001 C CNN
	1    4550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5F9275AE
P 4550 4050
F 0 "#PWR0121" H 4550 3800 50  0001 C CNN
F 1 "GND" H 4555 3877 50  0000 C CNN
F 2 "" H 4550 4050 50  0001 C CNN
F 3 "" H 4550 4050 50  0001 C CNN
	1    4550 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3850 2150 3850
Wire Wire Line
	2150 3850 2150 2800
Wire Wire Line
	2150 2800 1750 2800
Text Label 3850 3550 0    50   ~ 0
CARD1-ACT
$Comp
L LED:WS2812B D1
U 1 1 5F953C5F
P 1250 7100
F 0 "D1" H 1350 7350 50  0000 L CNN
F 1 "WS2812B" H 1300 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1300 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1350 6725 50  0001 L TNN
	1    1250 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4000 5300 4150
Text Label 7800 4750 3    50   ~ 0
CARD8-ACT
Text Label 7450 4750 3    50   ~ 0
CARD7-ACT
Text Label 7100 4750 3    50   ~ 0
CARD6-ACT
Text Label 6750 4750 3    50   ~ 0
CARD5-ACT
Text Label 6350 4750 3    50   ~ 0
CARD4-ACT
Text Label 6000 4750 3    50   ~ 0
CARD3-ACT
Text Label 5650 4750 3    50   ~ 0
CARD2-ACT
Text Label 5300 4750 3    50   ~ 0
CARD1-ACT
$Comp
L power:+3V3 #PWR0122
U 1 1 5F93B0A0
P 5300 4000
F 0 "#PWR0122" H 5300 3850 50  0001 C CNN
F 1 "+3V3" H 5315 4173 50  0000 C CNN
F 2 "" H 5300 4000 50  0001 C CNN
F 3 "" H 5300 4000 50  0001 C CNN
	1    5300 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F935D25
P 5300 4300
F 0 "R1" H 5370 4346 50  0000 L CNN
F 1 "R" H 5370 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5230 4300 50  0001 C CNN
F 3 "~" H 5300 4300 50  0001 C CNN
	1    5300 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D8
U 1 1 5F92BD39
P 5300 4600
F 0 "D8" V 5339 4482 50  0000 R CNN
F 1 "LED" V 5248 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 5300 4600 50  0001 C CNN
F 3 "~" H 5300 4600 50  0001 C CNN
	1    5300 4600
	0    -1   -1   0   
$EndComp
$Comp
L LED:WS2812B D2
U 1 1 5F98A5B7
P 1850 7100
F 0 "D2" H 1950 7350 50  0000 L CNN
F 1 "WS2812B" H 1900 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1900 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1950 6725 50  0001 L TNN
	1    1850 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 5F98B766
P 2450 7100
F 0 "D3" H 2550 7350 50  0000 L CNN
F 1 "WS2812B" H 2500 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2500 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2550 6725 50  0001 L TNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D4
U 1 1 5F98C6BB
P 3050 7100
F 0 "D4" H 3150 7350 50  0000 L CNN
F 1 "WS2812B" H 3100 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3100 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3150 6725 50  0001 L TNN
	1    3050 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D5
U 1 1 5F98FF70
P 3650 7100
F 0 "D5" H 3750 7350 50  0000 L CNN
F 1 "WS2812B" H 3700 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3700 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3750 6725 50  0001 L TNN
	1    3650 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D6
U 1 1 5F98FF76
P 4250 7100
F 0 "D6" H 4350 7350 50  0000 L CNN
F 1 "WS2812B" H 4300 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4300 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4350 6725 50  0001 L TNN
	1    4250 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D7
U 1 1 5F98FF7C
P 4850 7100
F 0 "D7" H 4950 7350 50  0000 L CNN
F 1 "WS2812B" H 4900 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4900 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4950 6725 50  0001 L TNN
	1    4850 7100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D9
U 1 1 5F98FF82
P 5450 7100
F 0 "D9" H 5550 7350 50  0000 L CNN
F 1 "WS2812B" H 5500 6850 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5500 6800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5550 6725 50  0001 L TNN
	1    5450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5F9988F1
P 5200 6100
F 0 "C3" H 5250 6200 50  0000 L CNN
F 1 "100nF" H 5250 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5238 5950 50  0001 C CNN
F 3 "~" H 5200 6100 50  0001 C CNN
	1    5200 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5F9B0D59
P 1250 6700
F 0 "#PWR0123" H 1250 6550 50  0001 C CNN
F 1 "+5V" H 1265 6873 50  0000 C CNN
F 2 "" H 1250 6700 50  0001 C CNN
F 3 "" H 1250 6700 50  0001 C CNN
	1    1250 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 5F9B6A8B
P 5200 5850
F 0 "#PWR0124" H 5200 5700 50  0001 C CNN
F 1 "+5V" H 5215 6023 50  0000 C CNN
F 2 "" H 5200 5850 50  0001 C CNN
F 3 "" H 5200 5850 50  0001 C CNN
	1    5200 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5F9B7999
P 5200 6350
F 0 "#PWR0125" H 5200 6100 50  0001 C CNN
F 1 "GND" H 5205 6177 50  0000 C CNN
F 2 "" H 5200 6350 50  0001 C CNN
F 3 "" H 5200 6350 50  0001 C CNN
	1    5200 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5F9BC3FB
P 1250 7500
F 0 "#PWR0126" H 1250 7250 50  0001 C CNN
F 1 "GND" H 1255 7327 50  0000 C CNN
F 2 "" H 1250 7500 50  0001 C CNN
F 3 "" H 1250 7500 50  0001 C CNN
	1    1250 7500
	1    0    0    -1  
$EndComp
Text Label 950  7100 2    50   ~ 0
NEO-ACT
Wire Wire Line
	5200 5850 5200 5950
Wire Wire Line
	5200 6350 5200 6250
Wire Wire Line
	1250 6700 1250 6800
Wire Wire Line
	1250 6800 1850 6800
Connection ~ 1250 6800
Connection ~ 1850 6800
Wire Wire Line
	1850 6800 2450 6800
Connection ~ 2450 6800
Wire Wire Line
	2450 6800 3050 6800
Connection ~ 3050 6800
Wire Wire Line
	3050 6800 3650 6800
Connection ~ 3650 6800
Wire Wire Line
	3650 6800 4250 6800
Connection ~ 4250 6800
Wire Wire Line
	4250 6800 4850 6800
Connection ~ 4850 6800
Wire Wire Line
	4850 6800 5450 6800
Wire Wire Line
	1250 7400 1850 7400
Connection ~ 1850 7400
Wire Wire Line
	1850 7400 2450 7400
Connection ~ 2450 7400
Wire Wire Line
	2450 7400 3050 7400
Connection ~ 3050 7400
Wire Wire Line
	3050 7400 3650 7400
Connection ~ 3650 7400
Wire Wire Line
	3650 7400 4250 7400
Connection ~ 4250 7400
Wire Wire Line
	4250 7400 4850 7400
Connection ~ 4850 7400
Wire Wire Line
	4850 7400 5450 7400
Wire Wire Line
	1250 7500 1250 7400
Connection ~ 1250 7400
$Comp
L LED:WS2812B D14
U 1 1 5F9F52B7
P 6600 3200
F 0 "D14" H 6700 3450 50  0000 L CNN
F 1 "WS2812B" H 6650 2950 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6650 2900 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6700 2825 50  0001 L TNN
	1    6600 3200
	1    0    0    -1  
$EndComp
Text Label 6900 3200 0    50   ~ 0
NEO-ACT
$Comp
L Device:D D13
U 1 1 5F9F9CBD
P 6600 2750
F 0 "D13" V 6646 2670 50  0000 R CNN
F 1 "D" V 6555 2670 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 6600 2750 50  0001 C CNN
F 3 "~" H 6600 2750 50  0001 C CNN
	1    6600 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 5F9FAF6B
P 6600 2600
F 0 "#PWR0127" H 6600 2450 50  0001 C CNN
F 1 "+5V" H 6615 2773 50  0000 C CNN
F 2 "" H 6600 2600 50  0001 C CNN
F 3 "" H 6600 2600 50  0001 C CNN
	1    6600 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5F9FBAF2
P 6600 3500
F 0 "#PWR0128" H 6600 3250 50  0001 C CNN
F 1 "GND" H 6605 3327 50  0000 C CNN
F 2 "" H 6600 3500 50  0001 C CNN
F 3 "" H 6600 3500 50  0001 C CNN
	1    6600 3500
	1    0    0    -1  
$EndComp
Text Notes 5950 4000 0    50   ~ 0
Status LED used as a sacrificial\nLED for level shifting 3.3->4.3->5.0v\nWon't be as bright as the other 8
$Comp
L Device:R R9
U 1 1 5FA6ABA6
P 8050 1950
F 0 "R9" V 7843 1950 50  0000 C CNN
F 1 "R" V 7934 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7980 1950 50  0001 C CNN
F 3 "~" H 8050 1950 50  0001 C CNN
	1    8050 1950
	0    1    1    0   
$EndComp
Text Label 7900 1950 2    50   ~ 0
MISO
Text Label 8200 1950 0    50   ~ 0
MISO-BUFFER
Text Label 9800 2200 2    50   ~ 0
MISO-BUFFER
$Comp
L Device:R R2
U 1 1 5FAA2FE5
P 5650 4300
F 0 "R2" H 5720 4346 50  0000 L CNN
F 1 "R" H 5720 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5580 4300 50  0001 C CNN
F 3 "~" H 5650 4300 50  0001 C CNN
	1    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FAA50C9
P 6000 4300
F 0 "R3" H 6070 4346 50  0000 L CNN
F 1 "R" H 6070 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 4300 50  0001 C CNN
F 3 "~" H 6000 4300 50  0001 C CNN
	1    6000 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5FAA7289
P 6350 4300
F 0 "R4" H 6420 4346 50  0000 L CNN
F 1 "R" H 6420 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6280 4300 50  0001 C CNN
F 3 "~" H 6350 4300 50  0001 C CNN
	1    6350 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FAA9323
P 6750 4300
F 0 "R5" H 6820 4346 50  0000 L CNN
F 1 "R" H 6820 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6680 4300 50  0001 C CNN
F 3 "~" H 6750 4300 50  0001 C CNN
	1    6750 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FAAB7D6
P 7100 4300
F 0 "R6" H 7170 4346 50  0000 L CNN
F 1 "R" H 7170 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7030 4300 50  0001 C CNN
F 3 "~" H 7100 4300 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FAAD77A
P 7450 4300
F 0 "R7" H 7520 4346 50  0000 L CNN
F 1 "R" H 7520 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7380 4300 50  0001 C CNN
F 3 "~" H 7450 4300 50  0001 C CNN
	1    7450 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5FAAF842
P 7800 4300
F 0 "R8" H 7870 4346 50  0000 L CNN
F 1 "R" H 7870 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7730 4300 50  0001 C CNN
F 3 "~" H 7800 4300 50  0001 C CNN
	1    7800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4150 5650 4150
Connection ~ 5300 4150
Connection ~ 5650 4150
Wire Wire Line
	5650 4150 6000 4150
Connection ~ 6000 4150
Wire Wire Line
	6000 4150 6350 4150
Connection ~ 6350 4150
Wire Wire Line
	6350 4150 6750 4150
Connection ~ 6750 4150
Wire Wire Line
	6750 4150 7100 4150
Connection ~ 7100 4150
Wire Wire Line
	7100 4150 7450 4150
Connection ~ 7450 4150
Wire Wire Line
	7450 4150 7800 4150
$Comp
L Device:LED D10
U 1 1 5FABB8A9
P 5650 4600
F 0 "D10" V 5689 4482 50  0000 R CNN
F 1 "LED" V 5598 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 5650 4600 50  0001 C CNN
F 3 "~" H 5650 4600 50  0001 C CNN
	1    5650 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D11
U 1 1 5FABDEFE
P 6000 4600
F 0 "D11" V 6039 4482 50  0000 R CNN
F 1 "LED" V 5948 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6000 4600 50  0001 C CNN
F 3 "~" H 6000 4600 50  0001 C CNN
	1    6000 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D12
U 1 1 5FAC0590
P 6350 4600
F 0 "D12" V 6389 4482 50  0000 R CNN
F 1 "LED" V 6298 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6350 4600 50  0001 C CNN
F 3 "~" H 6350 4600 50  0001 C CNN
	1    6350 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D15
U 1 1 5FAC4E79
P 6750 4600
F 0 "D15" V 6789 4482 50  0000 R CNN
F 1 "LED" V 6698 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6750 4600 50  0001 C CNN
F 3 "~" H 6750 4600 50  0001 C CNN
	1    6750 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D16
U 1 1 5FAC4E7F
P 7100 4600
F 0 "D16" V 7139 4482 50  0000 R CNN
F 1 "LED" V 7048 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 7100 4600 50  0001 C CNN
F 3 "~" H 7100 4600 50  0001 C CNN
	1    7100 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D17
U 1 1 5FAC4E85
P 7450 4600
F 0 "D17" V 7489 4482 50  0000 R CNN
F 1 "LED" V 7398 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 7450 4600 50  0001 C CNN
F 3 "~" H 7450 4600 50  0001 C CNN
	1    7450 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D18
U 1 1 5FAC4E8B
P 7800 4600
F 0 "D18" V 7839 4482 50  0000 R CNN
F 1 "LED" V 7748 4482 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 7800 4600 50  0001 C CNN
F 3 "~" H 7800 4600 50  0001 C CNN
	1    7800 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C10
U 1 1 5FAD092F
P 7350 6100
F 0 "C10" H 7400 6200 50  0000 L CNN
F 1 "100nF" H 7400 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7388 5950 50  0001 C CNN
F 3 "~" H 7350 6100 50  0001 C CNN
	1    7350 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5FAD25E2
P 5500 6100
F 0 "C4" H 5550 6200 50  0000 L CNN
F 1 "100nF" H 5550 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5538 5950 50  0001 C CNN
F 3 "~" H 5500 6100 50  0001 C CNN
	1    5500 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5FAD410E
P 5800 6100
F 0 "C5" H 5850 6200 50  0000 L CNN
F 1 "100nF" H 5850 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5838 5950 50  0001 C CNN
F 3 "~" H 5800 6100 50  0001 C CNN
	1    5800 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5FAD5B6F
P 6100 6100
F 0 "C6" H 6150 6200 50  0000 L CNN
F 1 "100nF" H 6150 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6138 5950 50  0001 C CNN
F 3 "~" H 6100 6100 50  0001 C CNN
	1    6100 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5FAD7573
P 6400 6100
F 0 "C7" H 6450 6200 50  0000 L CNN
F 1 "100nF" H 6450 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6438 5950 50  0001 C CNN
F 3 "~" H 6400 6100 50  0001 C CNN
	1    6400 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5FAD9187
P 6700 6100
F 0 "C8" H 6750 6200 50  0000 L CNN
F 1 "100nF" H 6750 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6738 5950 50  0001 C CNN
F 3 "~" H 6700 6100 50  0001 C CNN
	1    6700 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5FADAE45
P 7050 6100
F 0 "C9" H 7100 6200 50  0000 L CNN
F 1 "100nF" H 7100 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7088 5950 50  0001 C CNN
F 3 "~" H 7050 6100 50  0001 C CNN
	1    7050 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FADD92B
P 4550 5750
F 0 "C2" H 4600 5850 50  0000 L CNN
F 1 "100nF" H 4600 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4588 5600 50  0001 C CNN
F 3 "~" H 4550 5750 50  0001 C CNN
	1    4550 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5950 5500 5950
Connection ~ 5200 5950
Connection ~ 5500 5950
Wire Wire Line
	5500 5950 5800 5950
Connection ~ 5800 5950
Wire Wire Line
	5800 5950 6100 5950
Connection ~ 6100 5950
Wire Wire Line
	6100 5950 6400 5950
Connection ~ 6400 5950
Wire Wire Line
	6400 5950 6700 5950
Connection ~ 6700 5950
Wire Wire Line
	6700 5950 7050 5950
Connection ~ 7050 5950
Wire Wire Line
	7050 5950 7350 5950
Wire Wire Line
	5200 6250 5500 6250
Connection ~ 5200 6250
Connection ~ 5500 6250
Wire Wire Line
	5500 6250 5800 6250
Connection ~ 5800 6250
Wire Wire Line
	5800 6250 6100 6250
Connection ~ 6100 6250
Wire Wire Line
	6100 6250 6400 6250
Connection ~ 6400 6250
Wire Wire Line
	6400 6250 6700 6250
Connection ~ 6700 6250
Wire Wire Line
	6700 6250 7050 6250
Connection ~ 7050 6250
Wire Wire Line
	7050 6250 7350 6250
$Comp
L Device:C C11
U 1 1 5F8FF338
P 7350 3200
F 0 "C11" H 7400 3300 50  0000 L CNN
F 1 "100nF" H 7400 3100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7388 3050 50  0001 C CNN
F 3 "~" H 7350 3200 50  0001 C CNN
	1    7350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2900 7350 2900
Wire Wire Line
	7350 2900 7350 3050
Connection ~ 6600 2900
Wire Wire Line
	6600 3500 7350 3500
Wire Wire Line
	7350 3500 7350 3350
Connection ~ 6600 3500
$Comp
L Device:R R10
U 1 1 5F95B683
P 4850 3000
F 0 "R10" H 4920 3046 50  0000 L CNN
F 1 "4.7K" H 4920 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4780 3000 50  0001 C CNN
F 3 "~" H 4850 3000 50  0001 C CNN
	1    4850 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5F966FF3
P 5150 3000
F 0 "R11" H 5220 3046 50  0000 L CNN
F 1 "4.7K" H 5220 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5080 3000 50  0001 C CNN
F 3 "~" H 5150 3000 50  0001 C CNN
	1    5150 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0129
U 1 1 5F969A03
P 5000 2800
F 0 "#PWR0129" H 5000 2650 50  0001 C CNN
F 1 "+3.3V" H 5015 2973 50  0000 C CNN
F 2 "" H 5000 2800 50  0001 C CNN
F 3 "" H 5000 2800 50  0001 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2850 5000 2850
Wire Wire Line
	5000 2850 5000 2800
Wire Wire Line
	5150 2850 5000 2850
Connection ~ 5000 2850
Text Label 4850 3150 3    50   ~ 0
D3-SCL
Text Label 5150 3150 3    50   ~ 0
D2-SDA
$Comp
L stargazer-stalk:pmod-interface-type-2a-qspi U2
U 1 1 5FA32A7B
P 4450 1850
F 0 "U2" H 4450 2365 50  0000 C CNN
F 1 "pmod-interface-type-2a-qspi" H 4450 2274 50  0000 C CNN
F 2 "stargazer-stalk:pmod-double" H 4450 2250 50  0001 C CNN
F 3 "" H 4450 2250 50  0001 C CNN
	1    4450 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FA3A1FA
P 4450 2350
F 0 "#PWR0104" H 4450 2100 50  0001 C CNN
F 1 "GND" H 4455 2177 50  0000 C CNN
F 2 "" H 4450 2350 50  0001 C CNN
F 3 "" H 4450 2350 50  0001 C CNN
	1    4450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2000 3950 2000
Wire Wire Line
	3950 2000 3950 2350
Wire Wire Line
	3950 2350 4450 2350
Wire Wire Line
	4850 2000 4950 2000
Wire Wire Line
	4950 2000 4950 2350
Wire Wire Line
	4950 2350 4450 2350
Connection ~ 4450 2350
$Comp
L power:+3V3 #PWR0105
U 1 1 5FA46AC3
P 5150 2100
F 0 "#PWR0105" H 5150 1950 50  0001 C CNN
F 1 "+3V3" H 5165 2273 50  0000 C CNN
F 2 "" H 5150 2100 50  0001 C CNN
F 3 "" H 5150 2100 50  0001 C CNN
	1    5150 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0106
U 1 1 5FA47DA0
P 3750 2100
F 0 "#PWR0106" H 3750 1950 50  0001 C CNN
F 1 "+3V3" H 3765 2273 50  0000 C CNN
F 2 "" H 3750 2100 50  0001 C CNN
F 3 "" H 3750 2100 50  0001 C CNN
	1    3750 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2100 4050 2100
Wire Wire Line
	4850 2100 5150 2100
Text Label 6050 1000 2    50   ~ 0
QSPI-CS
Text Label 6050 1500 2    50   ~ 0
QSPI-SCK
Text Label 6050 1400 2    50   ~ 0
QSPI-SIO3
Text Label 6050 1300 2    50   ~ 0
QSPI-SIO2
Text Label 4050 1900 2    50   ~ 0
QSPI-SCK
Text Label 4050 1800 2    50   ~ 0
QSPI-SIO1
Text Label 4050 1700 2    50   ~ 0
QSPI-SIO0
Text Label 4050 1600 2    50   ~ 0
QSPI-CS
Text Label 4850 1700 0    50   ~ 0
QSPI-SIO3
Text Label 4850 1600 0    50   ~ 0
QSPI-SIO2
NoConn ~ 4850 1800
NoConn ~ 2850 4350
NoConn ~ 2850 6200
Text Label 4850 1900 0    50   ~ 0
QSPI-SCK
$Comp
L power:GND #PWR0130
U 1 1 5FBA7B6E
P 4400 1000
F 0 "#PWR0130" H 4400 750 50  0001 C CNN
F 1 "GND" H 4405 827 50  0000 C CNN
F 2 "" H 4400 1000 50  0001 C CNN
F 3 "" H 4400 1000 50  0001 C CNN
	1    4400 1000
	1    0    0    -1  
$EndComp
Text Label 4400 900  0    50   ~ 0
EN
Text Label 6300 1000 0    50   ~ 0
D10
Text Label 6300 1200 0    50   ~ 0
D6
Text Label 6300 1100 0    50   ~ 0
D9
Text Label 6050 1200 2    50   ~ 0
QSPI-SIO1
Text Label 6050 1100 2    50   ~ 0
QSPI-SIO0
Text Label 6300 1500 0    50   ~ 0
A2
Text Label 6300 1400 0    50   ~ 0
A3
Text Label 6300 1300 0    50   ~ 0
A4
Wire Wire Line
	6050 1000 6300 1000
Wire Wire Line
	6050 1100 6300 1100
Wire Wire Line
	6050 1200 6300 1200
Wire Wire Line
	6050 1300 6300 1300
Wire Wire Line
	6050 1400 6300 1400
Wire Wire Line
	6050 1500 6300 1500
Text Label 6300 3200 2    50   ~ 0
D13
Text Label 9800 5100 2    50   ~ 0
A0
Text Label 9800 5000 2    50   ~ 0
A1
Text Label 9800 5250 2    50   ~ 0
D11
Text Label 9800 5350 2    50   ~ 0
D12
$Comp
L stargazer-backplane:jumper J4
U 1 1 5FCA9178
P 4400 800
F 0 "J4" H 4542 965 50  0000 C CNN
F 1 "jumper" H 4542 874 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4600 850 50  0001 C CNN
F 3 "" H 4600 850 50  0001 C CNN
	1    4400 800 
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5FCCD22E
P 6150 2000
F 0 "C12" H 6265 2046 50  0000 L CNN
F 1 "10uF" H 6265 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6188 1850 50  0001 C CNN
F 3 "~" H 6150 2000 50  0001 C CNN
	1    6150 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5FCCF543
P 6450 2000
F 0 "C13" H 6565 2046 50  0000 L CNN
F 1 "10uF" H 6565 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6488 1850 50  0001 C CNN
F 3 "~" H 6450 2000 50  0001 C CNN
	1    6450 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5FCD2832
P 6750 2000
F 0 "C14" H 6865 2046 50  0000 L CNN
F 1 "10uF" H 6865 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6788 1850 50  0001 C CNN
F 3 "~" H 6750 2000 50  0001 C CNN
	1    6750 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5FCD5C2E
P 7050 2000
F 0 "C15" H 7165 2046 50  0000 L CNN
F 1 "10uF" H 7165 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 7088 1850 50  0001 C CNN
F 3 "~" H 7050 2000 50  0001 C CNN
	1    7050 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5FCE2C90
P 6150 2250
F 0 "#PWR0131" H 6150 2000 50  0001 C CNN
F 1 "GND" H 6155 2077 50  0000 C CNN
F 2 "" H 6150 2250 50  0001 C CNN
F 3 "" H 6150 2250 50  0001 C CNN
	1    6150 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0132
U 1 1 5FCE3CD2
P 7050 1750
F 0 "#PWR0132" H 7050 1600 50  0001 C CNN
F 1 "+3V3" H 7065 1923 50  0000 C CNN
F 2 "" H 7050 1750 50  0001 C CNN
F 3 "" H 7050 1750 50  0001 C CNN
	1    7050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1850 6450 1850
Connection ~ 6450 1850
Wire Wire Line
	6450 1850 6750 1850
Connection ~ 6750 1850
Wire Wire Line
	6750 1850 7050 1850
Wire Wire Line
	7050 1750 7050 1850
Connection ~ 7050 1850
Wire Wire Line
	7050 2150 6750 2150
Connection ~ 6450 2150
Wire Wire Line
	6450 2150 6150 2150
Connection ~ 6750 2150
Wire Wire Line
	6750 2150 6450 2150
Wire Wire Line
	6150 2150 6150 2250
Connection ~ 6150 2150
$Comp
L Device:C C16
U 1 1 5FD349FD
P 7650 6100
F 0 "C16" H 7765 6146 50  0000 L CNN
F 1 "10uF" H 7765 6055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 7688 5950 50  0001 C CNN
F 3 "~" H 7650 6100 50  0001 C CNN
	1    7650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 5950 7650 5950
Connection ~ 7350 5950
Wire Wire Line
	7350 6250 7650 6250
Connection ~ 7350 6250
$EndSCHEMATC