---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/IOMonitor.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/IOMonitor.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[IOMonitor](/SignallingSystem-doc/mainsystem/Classes/classIOMonitor/)**  |




## Source code

```csharp
Public Class IOMonitor
    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        InputCard01()
        InputCard02()
        InputCard03()
        InputCard04()
        InputCard05()
        InputCard06()
        AnalogInputs()
        LeverDisplayStat()
    End Sub
    'Input Card 01
    Private Sub InputCard01()
        'Chip 1
        CBDigInputCard01Chip01Input01.Checked = DataReadInputsArray(1)
        CBDigInputCard01Chip01Input02.Checked = DataReadInputsArray(2)
        CBDigInputCard01Chip01Input03.Checked = DataReadInputsArray(3)
        CBDigInputCard01Chip01Input04.Checked = DataReadInputsArray(4)
        CBDigInputCard01Chip01Input05.Checked = DataReadInputsArray(5)
        CBDigInputCard01Chip01Input06.Checked = DataReadInputsArray(6)
        CBDigInputCard01Chip01Input07.Checked = DataReadInputsArray(7)
        CBDigInputCard01Chip01Input08.Checked = DataReadInputsArray(8)
        'Chip 2
        CBDigInputCard01Chip02Input01.Checked = DataReadInputsArray(9)
        CBDigInputCard01Chip02Input02.Checked = DataReadInputsArray(10)
        CBDigInputCard01Chip02Input03.Checked = DataReadInputsArray(11)
        CBDigInputCard01Chip02Input04.Checked = DataReadInputsArray(12)
        CBDigInputCard01Chip02Input05.Checked = DataReadInputsArray(13)
        CBDigInputCard01Chip02Input06.Checked = DataReadInputsArray(14)
        CBDigInputCard01Chip02Input07.Checked = DataReadInputsArray(15)
        CBDigInputCard01Chip02Input08.Checked = DataReadInputsArray(16)
        'Chip 3
        CBDigInputCard01Chip03Input01.Checked = DataReadInputsArray(17)
        CBDigInputCard01Chip03Input02.Checked = DataReadInputsArray(18)
        CBDigInputCard01Chip03Input03.Checked = DataReadInputsArray(19)
        CBDigInputCard01Chip03Input04.Checked = DataReadInputsArray(20)
        CBDigInputCard01Chip03Input05.Checked = DataReadInputsArray(21)
        CBDigInputCard01Chip03Input06.Checked = DataReadInputsArray(22)
        CBDigInputCard01Chip03Input07.Checked = DataReadInputsArray(23)
        CBDigInputCard01Chip03Input08.Checked = DataReadInputsArray(24)
        'Chip 4
        CBDigInputCard01Chip04Input01.Checked = DataReadInputsArray(25)
        CBDigInputCard01Chip04Input02.Checked = DataReadInputsArray(26)
        CBDigInputCard01Chip04Input03.Checked = DataReadInputsArray(27)
        CBDigInputCard01Chip04Input04.Checked = DataReadInputsArray(28)
        CBDigInputCard01Chip04Input05.Checked = DataReadInputsArray(29)
        CBDigInputCard01Chip04Input06.Checked = DataReadInputsArray(30)
        CBDigInputCard01Chip04Input07.Checked = DataReadInputsArray(31)
        CBDigInputCard01Chip04Input08.Checked = DataReadInputsArray(32)
    End Sub
    'Input Card 02
    Private Sub InputCard02()
        'Chip 1
        CBDigInputCard02Chip01Input01.Checked = DataReadInputsArray(33)
        CBDigInputCard02Chip01Input02.Checked = DataReadInputsArray(34)
        CBDigInputCard02Chip01Input03.Checked = DataReadInputsArray(35)
        CBDigInputCard02Chip01Input04.Checked = DataReadInputsArray(36)
        CBDigInputCard02Chip01Input05.Checked = DataReadInputsArray(37)
        CBDigInputCard02Chip01Input06.Checked = DataReadInputsArray(38)
        CBDigInputCard02Chip01Input07.Checked = DataReadInputsArray(39)
        CBDigInputCard02Chip01Input08.Checked = DataReadInputsArray(40)
        'Chip 2
        CBDigInputCard02Chip02Input01.Checked = DataReadInputsArray(41)
        CBDigInputCard02Chip02Input02.Checked = DataReadInputsArray(42)
        CBDigInputCard02Chip02Input03.Checked = DataReadInputsArray(43)
        CBDigInputCard02Chip02Input04.Checked = DataReadInputsArray(44)
        CBDigInputCard02Chip02Input05.Checked = DataReadInputsArray(45)
        CBDigInputCard02Chip02Input06.Checked = DataReadInputsArray(46)
        CBDigInputCard02Chip02Input07.Checked = DataReadInputsArray(47)
        CBDigInputCard02Chip02Input08.Checked = DataReadInputsArray(48)
        'Chip 3
        CBDigInputCard02Chip03Input01.Checked = DataReadInputsArray(49)
        CBDigInputCard02Chip03Input02.Checked = DataReadInputsArray(50)
        CBDigInputCard02Chip03Input03.Checked = DataReadInputsArray(51)
        CBDigInputCard02Chip03Input04.Checked = DataReadInputsArray(52)
        CBDigInputCard02Chip03Input05.Checked = DataReadInputsArray(53)
        CBDigInputCard02Chip03Input06.Checked = DataReadInputsArray(54)
        CBDigInputCard02Chip03Input07.Checked = DataReadInputsArray(55)
        CBDigInputCard02Chip03Input08.Checked = DataReadInputsArray(56)
        'Chip 4
        CBDigInputCard02Chip04Input01.Checked = DataReadInputsArray(57)
        CBDigInputCard02Chip04Input02.Checked = DataReadInputsArray(58)
        CBDigInputCard02Chip04Input03.Checked = DataReadInputsArray(59)
        CBDigInputCard02Chip04Input04.Checked = DataReadInputsArray(60)
        CBDigInputCard02Chip04Input05.Checked = DataReadInputsArray(61)
        CBDigInputCard02Chip04Input06.Checked = DataReadInputsArray(62)
        CBDigInputCard02Chip04Input07.Checked = DataReadInputsArray(63)
        CBDigInputCard02Chip04Input08.Checked = DataReadInputsArray(64)
    End Sub
    'Input Card 03
    Private Sub InputCard03()
        'Chip 1
        CBDigInputCard03Chip01Input01.Checked = DataReadInputsArray(65)
        CBDigInputCard03Chip01Input02.Checked = DataReadInputsArray(66)
        CBDigInputCard03Chip01Input03.Checked = DataReadInputsArray(67)
        CBDigInputCard03Chip01Input04.Checked = DataReadInputsArray(68)
        CBDigInputCard03Chip01Input05.Checked = DataReadInputsArray(69)
        CBDigInputCard03Chip01Input06.Checked = DataReadInputsArray(70)
        CBDigInputCard03Chip01Input07.Checked = DataReadInputsArray(71)
        CBDigInputCard03Chip01Input08.Checked = DataReadInputsArray(72)
        'Chip 2
        CBDigInputCard03Chip02Input01.Checked = DataReadInputsArray(73)
        CBDigInputCard03Chip02Input02.Checked = DataReadInputsArray(74)
        CBDigInputCard03Chip02Input03.Checked = DataReadInputsArray(75)
        CBDigInputCard03Chip02Input04.Checked = DataReadInputsArray(76)
        CBDigInputCard03Chip02Input05.Checked = DataReadInputsArray(77)
        CBDigInputCard03Chip02Input06.Checked = DataReadInputsArray(78)
        CBDigInputCard03Chip02Input07.Checked = DataReadInputsArray(79)
        CBDigInputCard03Chip02Input08.Checked = DataReadInputsArray(80)
        'Chip 3
        CBDigInputCard03Chip03Input01.Checked = DataReadInputsArray(81)
        CBDigInputCard03Chip03Input02.Checked = DataReadInputsArray(82)
        CBDigInputCard03Chip03Input03.Checked = DataReadInputsArray(83)
        CBDigInputCard03Chip03Input04.Checked = DataReadInputsArray(84)
        CBDigInputCard03Chip03Input05.Checked = DataReadInputsArray(85)
        CBDigInputCard03Chip03Input06.Checked = DataReadInputsArray(86)
        CBDigInputCard03Chip03Input07.Checked = DataReadInputsArray(87)
        CBDigInputCard03Chip03Input08.Checked = DataReadInputsArray(88)
        'Chip 4
        CBDigInputCard03Chip04Input01.Checked = DataReadInputsArray(89)
        CBDigInputCard03Chip04Input02.Checked = DataReadInputsArray(90)
        CBDigInputCard03Chip04Input03.Checked = DataReadInputsArray(91)
        CBDigInputCard03Chip04Input04.Checked = DataReadInputsArray(92)
        CBDigInputCard03Chip04Input05.Checked = DataReadInputsArray(93)
        CBDigInputCard03Chip04Input06.Checked = DataReadInputsArray(94)
        CBDigInputCard03Chip04Input07.Checked = DataReadInputsArray(95)
        CBDigInputCard03Chip04Input08.Checked = DataReadInputsArray(96)
    End Sub
    'Input Card 04
    Private Sub InputCard04()
        'Chip 1
        CBDigInputCard04Chip01Input01.Checked = DataReadInputsArray(97)
        CBDigInputCard04Chip01Input02.Checked = DataReadInputsArray(98)
        CBDigInputCard04Chip01Input03.Checked = DataReadInputsArray(99)
        CBDigInputCard04Chip01Input04.Checked = DataReadInputsArray(100)
        CBDigInputCard04Chip01Input05.Checked = DataReadInputsArray(101)
        CBDigInputCard04Chip01Input06.Checked = DataReadInputsArray(102)
        CBDigInputCard04Chip01Input07.Checked = DataReadInputsArray(103)
        CBDigInputCard04Chip01Input08.Checked = DataReadInputsArray(104)
        'Chip 2
        CBDigInputCard04Chip02Input01.Checked = DataReadInputsArray(105)
        CBDigInputCard04Chip02Input02.Checked = DataReadInputsArray(106)
        CBDigInputCard04Chip02Input03.Checked = DataReadInputsArray(107)
        CBDigInputCard04Chip02Input04.Checked = DataReadInputsArray(108)
        CBDigInputCard04Chip02Input05.Checked = DataReadInputsArray(109)
        CBDigInputCard04Chip02Input06.Checked = DataReadInputsArray(110)
        CBDigInputCard04Chip02Input07.Checked = DataReadInputsArray(111)
        CBDigInputCard04Chip02Input08.Checked = DataReadInputsArray(112)
        'Chip 3
        CBDigInputCard04Chip03Input01.Checked = DataReadInputsArray(113)
        CBDigInputCard04Chip03Input02.Checked = DataReadInputsArray(114)
        CBDigInputCard04Chip03Input03.Checked = DataReadInputsArray(115)
        CBDigInputCard04Chip03Input04.Checked = DataReadInputsArray(116)
        CBDigInputCard04Chip03Input05.Checked = DataReadInputsArray(117)
        CBDigInputCard04Chip03Input06.Checked = DataReadInputsArray(118)
        CBDigInputCard04Chip03Input07.Checked = DataReadInputsArray(119)
        CBDigInputCard04Chip03Input08.Checked = DataReadInputsArray(120)
        'Chip 4
        CBDigInputCard04Chip04Input01.Checked = DataReadInputsArray(121)
        CBDigInputCard04Chip04Input02.Checked = DataReadInputsArray(122)
        CBDigInputCard04Chip04Input03.Checked = DataReadInputsArray(123)
        CBDigInputCard04Chip04Input04.Checked = DataReadInputsArray(124)
        CBDigInputCard04Chip04Input05.Checked = DataReadInputsArray(125)
        CBDigInputCard04Chip04Input06.Checked = DataReadInputsArray(126)
        CBDigInputCard04Chip04Input07.Checked = DataReadInputsArray(127)
        CBDigInputCard04Chip04Input08.Checked = DataReadInputsArray(128)
    End Sub
    'Input Card 05
    Private Sub InputCard05()
        'Chip 1
        CBDigInputCard05Chip01Input01.Checked = DataReadInputsArray(129)
        CBDigInputCard05Chip01Input02.Checked = DataReadInputsArray(130)
        CBDigInputCard05Chip01Input03.Checked = DataReadInputsArray(131)
        CBDigInputCard05Chip01Input04.Checked = DataReadInputsArray(132)
        CBDigInputCard05Chip01Input05.Checked = DataReadInputsArray(133)
        CBDigInputCard05Chip01Input06.Checked = DataReadInputsArray(134)
        CBDigInputCard05Chip01Input07.Checked = DataReadInputsArray(135)
        CBDigInputCard05Chip01Input08.Checked = DataReadInputsArray(136)
        'Chip 2
        CBDigInputCard05Chip02Input01.Checked = DataReadInputsArray(137)
        CBDigInputCard05Chip02Input02.Checked = DataReadInputsArray(138)
        CBDigInputCard05Chip02Input03.Checked = DataReadInputsArray(139)
        CBDigInputCard05Chip02Input04.Checked = DataReadInputsArray(140)
        CBDigInputCard05Chip02Input05.Checked = DataReadInputsArray(141)
        CBDigInputCard05Chip02Input06.Checked = DataReadInputsArray(142)
        CBDigInputCard05Chip02Input07.Checked = DataReadInputsArray(143)
        CBDigInputCard05Chip02Input08.Checked = DataReadInputsArray(144)
        'Chip 3
        CBDigInputCard05Chip03Input01.Checked = DataReadInputsArray(145)
        CBDigInputCard05Chip03Input02.Checked = DataReadInputsArray(146)
        CBDigInputCard05Chip03Input03.Checked = DataReadInputsArray(147)
        CBDigInputCard05Chip03Input04.Checked = DataReadInputsArray(148)
        CBDigInputCard05Chip03Input05.Checked = DataReadInputsArray(149)
        CBDigInputCard05Chip03Input06.Checked = DataReadInputsArray(150)
        CBDigInputCard05Chip03Input07.Checked = DataReadInputsArray(151)
        CBDigInputCard05Chip03Input08.Checked = DataReadInputsArray(152)
        'Chip 4
        CBDigInputCard05Chip04Input01.Checked = DataReadInputsArray(153)
        CBDigInputCard05Chip04Input02.Checked = DataReadInputsArray(154)
        CBDigInputCard05Chip04Input03.Checked = DataReadInputsArray(155)
        CBDigInputCard05Chip04Input04.Checked = DataReadInputsArray(156)
        CBDigInputCard05Chip04Input05.Checked = DataReadInputsArray(157)
        CBDigInputCard05Chip04Input06.Checked = DataReadInputsArray(158)
        CBDigInputCard05Chip04Input07.Checked = DataReadInputsArray(159)
        CBDigInputCard05Chip04Input08.Checked = DataReadInputsArray(160)
    End Sub
    'Input Card 06
    Private Sub InputCard06()
        'Chip 1
        CBDigInputCard06Chip01Input01.Checked = DataReadInputsArray(161)
        CBDigInputCard06Chip01Input02.Checked = DataReadInputsArray(162)
        CBDigInputCard06Chip01Input03.Checked = DataReadInputsArray(163)
        CBDigInputCard06Chip01Input04.Checked = DataReadInputsArray(164)
        CBDigInputCard06Chip01Input05.Checked = DataReadInputsArray(165)
        CBDigInputCard06Chip01Input06.Checked = DataReadInputsArray(166)
        CBDigInputCard06Chip01Input07.Checked = DataReadInputsArray(167)
        CBDigInputCard06Chip01Input08.Checked = DataReadInputsArray(168)
        'Chip 2
        CBDigInputCard06Chip02Input01.Checked = DataReadInputsArray(169)
        CBDigInputCard06Chip02Input02.Checked = DataReadInputsArray(170)
        CBDigInputCard06Chip02Input03.Checked = DataReadInputsArray(171)
        CBDigInputCard06Chip02Input04.Checked = DataReadInputsArray(172)
        CBDigInputCard06Chip02Input05.Checked = DataReadInputsArray(173)
        CBDigInputCard06Chip02Input06.Checked = DataReadInputsArray(174)
        CBDigInputCard06Chip02Input07.Checked = DataReadInputsArray(175)
        CBDigInputCard06Chip02Input08.Checked = DataReadInputsArray(176)
        'Chip 3
        CBDigInputCard06Chip03Input01.Checked = DataReadInputsArray(177)
        CBDigInputCard06Chip03Input02.Checked = DataReadInputsArray(178)
        CBDigInputCard06Chip03Input03.Checked = DataReadInputsArray(179)
        CBDigInputCard06Chip03Input04.Checked = DataReadInputsArray(180)
        CBDigInputCard06Chip03Input05.Checked = DataReadInputsArray(181)
        CBDigInputCard06Chip03Input06.Checked = DataReadInputsArray(182)
        CBDigInputCard06Chip03Input07.Checked = DataReadInputsArray(183)
        CBDigInputCard06Chip03Input08.Checked = DataReadInputsArray(184)
        'Chip 4
        CBDigInputCard06Chip04Input01.Checked = DataReadInputsArray(185)
        CBDigInputCard06Chip04Input02.Checked = DataReadInputsArray(186)
        CBDigInputCard06Chip04Input03.Checked = DataReadInputsArray(187)
        CBDigInputCard06Chip04Input04.Checked = DataReadInputsArray(188)
        CBDigInputCard06Chip04Input05.Checked = DataReadInputsArray(189)
        CBDigInputCard06Chip04Input06.Checked = DataReadInputsArray(190)
        CBDigInputCard06Chip04Input07.Checked = DataReadInputsArray(191)
        CBDigInputCard06Chip04Input08.Checked = DataReadInputsArray(192)
    End Sub
    'Analog Inputs
    Private Sub AnalogInputs()
        AnalogValue1.Text = ("Input 01 - Section 'A'    : " & AnalogIOManager.ActualAnalogValue(1).ToString & "V")
        AnalogValue2.Text = ("Input 02 - Section 'B'    : " & AnalogIOManager.ActualAnalogValue(2).ToString & "V")
        AnalogValue3.Text = ("Input 03 - Section 'C'    : " & AnalogIOManager.ActualAnalogValue(3).ToString & "V")
        AnalogValue4.Text = ("Input 04 - Section 'D'    : " & AnalogIOManager.ActualAnalogValue(4).ToString & "V")
        AnalogValue5.Text = ("Input 05 - Section 'E'    : " & AnalogIOManager.ActualAnalogValue(5).ToString & "V")
        AnalogValue6.Text = ("Input 06 - Section 'F'    : " & AnalogIOManager.ActualAnalogValue(6).ToString & "V")
        AnalogValue7.Text = ("Input 07 - Section 'G'    : " & AnalogIOManager.ActualAnalogValue(7).ToString & "V")
        AnalogValue8.Text = ("Input 08 - Section 'H'    : " & AnalogIOManager.ActualAnalogValue(8).ToString & "V")
        AnalogValue9.Text = ("Input 09 - Section 'I'    : " & AnalogIOManager.ActualAnalogValue(9).ToString & "V")
        AnalogValue10.Text = ("Input 10 - Section 'J'    : " & AnalogIOManager.ActualAnalogValue(10).ToString & "V")
        AnalogValue11.Text = ("Input 11 - Section 'K'    : " & AnalogIOManager.ActualAnalogValue(11).ToString & "V")
        AnalogValue12.Text = ("Input 12 - Section 'L'    : " & AnalogIOManager.ActualAnalogValue(12).ToString & "V")
        AnalogValue13.Text = ("Input 13 - Section 'M'    : " & AnalogIOManager.ActualAnalogValue(13).ToString & "V")
        AnalogValue14.Text = ("Input 14 - Section 'N'    : " & AnalogIOManager.ActualAnalogValue(14).ToString & "V")
        AnalogValue15.Text = ("Input 15 - Section 'O'    : " & AnalogIOManager.ActualAnalogValue(15).ToString & "V")
        AnalogValue16.Text = ("Input 16 - Section 'P'    : " & AnalogIOManager.ActualAnalogValue(16).ToString & "V")
        AnalogValue17.Text = ("Input 17 - Section 'Q'    : " & AnalogIOManager.ActualAnalogValue(17).ToString & "V")
        AnalogValue18.Text = ("Input 18 - Section 'DE'   : " & AnalogIOManager.ActualAnalogValue(18).ToString & "V")
        AnalogValue19.Text = ("Input 19 - Section 'NO'   : " & AnalogIOManager.ActualAnalogValue(19).ToString & "V")
        AnalogValue20.Text = ("Input 20 - Section 'OP'   : " & AnalogIOManager.ActualAnalogValue(20).ToString & "V")
        AnalogValue21.Text = ("Input 21 - Section 'Q10'  : " & AnalogIOManager.ActualAnalogValue(21).ToString & "V")
        AnalogValue22.Text = ("Input 22 - Section 'A11'  : " & AnalogIOManager.ActualAnalogValue(22).ToString & "V")
        AnalogValue23.Text = ("Input 23 - Section 'F12'  : " & AnalogIOManager.ActualAnalogValue(23).ToString & "V")
        AnalogValue24.Text = ("Input 24 - Section 'F13'  : " & AnalogIOManager.ActualAnalogValue(24).ToString & "V")
        AnalogValue25.Text = ("Input 25 - Section 'NO14' : " & AnalogIOManager.ActualAnalogValue(25).ToString & "V")
        AnalogValue26.Text = ("Input 26 - Section 'C19'  : " & AnalogIOManager.ActualAnalogValue(26).ToString & "V")
        AnalogValue27.Text = ("Input 27 - Section 'CD'   : " & AnalogIOManager.ActualAnalogValue(27).ToString & "V")
        AnalogValue28.Text = ("Input 28 - Section 'R'    : " & AnalogIOManager.ActualAnalogValue(28).ToString & "V")
        AnalogValue29.Text = ("Input 29 - Not Used' : " & AnalogIOManager.ActualAnalogValue(29).ToString & "V")
        AnalogValue30.Text = ("Input 30 - Not Used' : " & AnalogIOManager.ActualAnalogValue(30).ToString & "V")
        AnalogValue31.Text = ("Input 31 - Not Used' : " & AnalogIOManager.ActualAnalogValue(31).ToString & "V")
        AnalogValue32.Text = ("Input 32 - Not Used' : " & AnalogIOManager.ActualAnalogValue(32).ToString & "V")
        AnalogValue33.Text = ("Input 33 - P5a Normal  : " & AnalogIOManager.ActualAnalogValue(33).ToString & "V")
        AnalogValue34.Text = ("Input 34 - P5a Reverse : " & AnalogIOManager.ActualAnalogValue(34).ToString & "V")
        AnalogValue35.Text = ("Input 35 - P5b Normal  : " & AnalogIOManager.ActualAnalogValue(35).ToString & "V")
        AnalogValue36.Text = ("Input 36 - P5b Reverse : " & AnalogIOManager.ActualAnalogValue(36).ToString & "V")
        AnalogValue37.Text = ("Input 37 - P6a Normal  : " & AnalogIOManager.ActualAnalogValue(37).ToString & "V")
        AnalogValue38.Text = ("Input 38 - P6a Reverse : " & AnalogIOManager.ActualAnalogValue(38).ToString & "V")
        AnalogValue39.Text = ("Input 39 - P6b Normal  : " & AnalogIOManager.ActualAnalogValue(39).ToString & "V")
        AnalogValue40.Text = ("Input 40 - P6b Reverse : " & AnalogIOManager.ActualAnalogValue(40).ToString & "V")
        AnalogValue41.Text = ("Input 41 - P10 Normal  : " & AnalogIOManager.ActualAnalogValue(41).ToString & "V")
        AnalogValue42.Text = ("Input 42 - P10 Reverse : " & AnalogIOManager.ActualAnalogValue(42).ToString & "V")
        AnalogValue43.Text = ("Input 43 - P11 Normal  : " & AnalogIOManager.ActualAnalogValue(43).ToString & "V")
        AnalogValue44.Text = ("Input 44 - P11 Reverse : " & AnalogIOManager.ActualAnalogValue(44).ToString & "V")
        AnalogValue45.Text = ("Input 45 - P12 Normal  : " & AnalogIOManager.ActualAnalogValue(45).ToString & "V")
        AnalogValue46.Text = ("Input 46 - P12 Reverse : " & AnalogIOManager.ActualAnalogValue(46).ToString & "V")
        AnalogValue47.Text = ("Input 47 - P13 Normal  : " & AnalogIOManager.ActualAnalogValue(47).ToString & "V")
        AnalogValue48.Text = ("Input 48 - P13 Reverse : " & AnalogIOManager.ActualAnalogValue(48).ToString & "V")
        AnalogValue49.Text = ("Input 49 - P14 Normal  : " & AnalogIOManager.ActualAnalogValue(49).ToString & "V")
        AnalogValue50.Text = ("Input 50 - P14 Reverse : " & AnalogIOManager.ActualAnalogValue(50).ToString & "V")
        AnalogValue51.Text = ("Input 51 - P19 Normal  : " & AnalogIOManager.ActualAnalogValue(51).ToString & "V")
        AnalogValue52.Text = ("Input 52 - P19 Reverse : " & AnalogIOManager.ActualAnalogValue(52).ToString & "V")
        AnalogValue53.Text = ("Input 53 - Not Used' : " & AnalogIOManager.ActualAnalogValue(53).ToString & "V")
        AnalogValue54.Text = ("Input 54 - Not Used' : " & AnalogIOManager.ActualAnalogValue(54).ToString & "V")
        AnalogValue55.Text = ("Input 55 - Section 'P5a' : " & AnalogIOManager.ActualAnalogValue(55).ToString & "V")
        AnalogValue56.Text = ("Input 56 - Section 'P5b' : " & AnalogIOManager.ActualAnalogValue(56).ToString & "V")
        AnalogValue57.Text = ("Input 57 - Section 'P6a' : " & AnalogIOManager.ActualAnalogValue(57).ToString & "V")
        AnalogValue58.Text = ("Input 58 - Section 'P6b' : " & AnalogIOManager.ActualAnalogValue(58).ToString & "V")
        AnalogValue59.Text = ("Input 59 - Section 'P10' : " & AnalogIOManager.ActualAnalogValue(59).ToString & "V")
        AnalogValue60.Text = ("Input 60 - Section 'P11' : " & AnalogIOManager.ActualAnalogValue(60).ToString & "V")
        AnalogValue61.Text = ("Input 61 - Section 'P12' : " & AnalogIOManager.ActualAnalogValue(61).ToString & "V")
        AnalogValue62.Text = ("Input 62 - Section 'P13' : " & AnalogIOManager.ActualAnalogValue(62).ToString & "V")
        AnalogValue63.Text = ("Input 63 - Section 'P14' : " & AnalogIOManager.ActualAnalogValue(63).ToString & "V")
        AnalogValue64.Text = ("Input 64 - Section 'P19' : " & AnalogIOManager.ActualAnalogValue(64).ToString & "V")
    End Sub
    'Lever Display
    Private Sub LeverDisplayStat()
        'Lever 1
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever1Top) > 0 Then PBLever1Top.BackColor = Color.White Else PBLever1Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever1Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever1Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever1Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever1Bottom) > 0 Then PBLever1bottom.BackColor = Color.White Else PBLever1bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever1Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever1Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever1Bottom)))
        'Lever 2
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever2Top) > 0 Then PBLever2Top.BackColor = Color.White Else PBLever2Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever2Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever2Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever2Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever2Bottom) > 0 Then PBLever2bottom.BackColor = Color.White Else PBLever2bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever2Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever2Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever2Bottom)))
        'Lever 3
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever3Top) > 0 Then PBLever3Top.BackColor = Color.White Else PBLever3Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever3Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever3Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever3Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever3Bottom) > 0 Then PBLever3bottom.BackColor = Color.White Else PBLever3bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever3Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever3Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever3Bottom)))
        'Lever 4
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever4Top) > 0 Then PBLever4Top.BackColor = Color.White Else PBLever4Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever4Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever4Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever4Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever4Bottom) > 0 Then PBLever4bottom.BackColor = Color.White Else PBLever4bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever4Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever4Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever4Bottom)))
        'Lever 5
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever5Top) > 0 Then PBLever5Top.BackColor = Color.White Else PBLever5Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever5Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever5Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever5Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever5Bottom) > 0 Then PBLever5bottom.BackColor = Color.White Else PBLever5bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever5Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever5Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever5Bottom)))
        'Lever 6
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever6Top) > 0 Then PBLever6Top.BackColor = Color.White Else PBLever6Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever6Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever6Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever6Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever6Bottom) > 0 Then PBLever6bottom.BackColor = Color.White Else PBLever6bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever6Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever6Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever6Bottom)))
        'Lever 7
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever7Top) > 0 Then PBLever7Top.BackColor = Color.White Else PBLever7Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever7Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever7Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever7Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever7Bottom) > 0 Then PBLever7bottom.BackColor = Color.White Else PBLever7bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever7Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever7Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever7Bottom)))
        'Lever 8
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever8Top) > 0 Then PBLever8Top.BackColor = Color.White Else PBLever8Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever8Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever8Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever8Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever8Bottom) > 0 Then PBLever8bottom.BackColor = Color.White Else PBLever8bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever8Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever8Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever8Bottom)))
        'Lever 9
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever9Top) > 0 Then PBLever9Top.BackColor = Color.White Else PBLever9Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever9Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever9Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever9Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever9Bottom) > 0 Then PBLever9bottom.BackColor = Color.White Else PBLever9bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever9Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever9Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever9Bottom)))
        'Lever 10
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever10Top) > 0 Then PBLever10Top.BackColor = Color.White Else PBLever10Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever10Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever10Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever10Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever10Bottom) > 0 Then PBLever10bottom.BackColor = Color.White Else PBLever10bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever10Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever10Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever10Bottom)))
        'Lever 11
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever11Top) > 0 Then PBLever11Top.BackColor = Color.White Else PBLever11Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever11Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever11Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever11Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever11Bottom) > 0 Then PBLever11bottom.BackColor = Color.White Else PBLever11bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever11Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever11Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever11Bottom)))
        'Lever 12
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever12Top) > 0 Then PBLever12Top.BackColor = Color.White Else PBLever12Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever12Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever12Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever12Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever12Bottom) > 0 Then PBLever12bottom.BackColor = Color.White Else PBLever12bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever12Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever12Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever12Bottom)))
        'Lever 13
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever13Top) > 0 Then PBLever13Top.BackColor = Color.White Else PBLever13Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever13Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever13Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever13Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever13Bottom) > 0 Then PBLever13bottom.BackColor = Color.White Else PBLever13bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever13Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever13Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever13Bottom)))
        'Lever 14
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever14Top) > 0 Then PBLever14Top.BackColor = Color.White Else PBLever14Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever14Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever14Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever14Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever14Bottom) > 0 Then PBLever14bottom.BackColor = Color.White Else PBLever14bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever14Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever14Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever14Bottom)))
        'Lever 15
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever15Top) > 0 Then PBLever15Top.BackColor = Color.White Else PBLever15Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever15Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever15Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever15Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever15Bottom) > 0 Then PBLever15bottom.BackColor = Color.White Else PBLever15bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever15Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever15Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever15Bottom)))
        'Lever 16
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever16Top) > 0 Then PBLever16Top.BackColor = Color.White Else PBLever16Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever16Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever16Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever16Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever16Bottom) > 0 Then PBLever16bottom.BackColor = Color.White Else PBLever16bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever16Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever16Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever16Bottom)))
        'Lever 17
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever17Top) > 0 Then PBLever17Top.BackColor = Color.White Else PBLever17Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever17Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever17Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever17Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever17Bottom) > 0 Then PBLever17bottom.BackColor = Color.White Else PBLever17bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever17Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever17Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever17Bottom)))
        'Lever 18
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever18Top) > 0 Then PBLever18Top.BackColor = Color.White Else PBLever18Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever18Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever18Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever18Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever18Bottom) > 0 Then PBLever18bottom.BackColor = Color.White Else PBLever18bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever18Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever18Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever18Bottom)))
        'Lever 19
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever19Top) > 0 Then PBLever19Top.BackColor = Color.White Else PBLever19Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever19Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever19Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever19Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever19Bottom) > 0 Then PBLever19bottom.BackColor = Color.White Else PBLever19bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever19Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever19Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever19Bottom)))
        'Lever 20
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever20Top) > 0 Then PBLever20Top.BackColor = Color.White Else PBLever20Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever20Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever20Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever20Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever20Bottom) > 0 Then PBLever20bottom.BackColor = Color.White Else PBLever20bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever20Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever20Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever20Bottom)))
        'Lever 21
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever21Top) > 0 Then PBLever21Top.BackColor = Color.White Else PBLever21Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever21Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever21Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever21Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever21Bottom) > 0 Then PBLever21bottom.BackColor = Color.White Else PBLever21bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever21Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever21Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever21Bottom)))
        'Lever 22
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever22Top) > 0 Then PBLever22Top.BackColor = Color.White Else PBLever22Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever22Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever22Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever22Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever22Bottom) > 0 Then PBLever22bottom.BackColor = Color.White Else PBLever22bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever22Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever22Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever22Bottom)))
        'Lever 23
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever23Top) > 0 Then PBLever23Top.BackColor = Color.White Else PBLever23Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever23Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever23Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever23Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever23Bottom) > 0 Then PBLever23bottom.BackColor = Color.White Else PBLever23bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever23Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever23Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever23Bottom)))
        'Lever 24
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever24Top) > 0 Then PBLever24Top.BackColor = Color.White Else PBLever24Top.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever24Top), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever24Top), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever24Top)))
        If SerialPixelLeds.pixelWhite(Definitions.LeverIndicatorNames.Lever24Bottom) > 0 Then PBLever24bottom.BackColor = Color.White Else PBLever24bottom.BackColor = ColorTranslator.FromOle(RGB(SerialPixelLeds.pixelRed(Definitions.LeverIndicatorNames.Lever24Bottom), SerialPixelLeds.pixelGreen(Definitions.LeverIndicatorNames.Lever24Bottom), SerialPixelLeds.pixelBlue(Definitions.LeverIndicatorNames.Lever24Bottom)))
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
