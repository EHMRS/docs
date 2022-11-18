---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/SPADDetection.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/SPADDetection.vb



## Types

|                | Name           |
| -------------- | -------------- |
| enum class| **[SPADSignalNames](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#enum-spadsignalnames)** { AJ1E = 0, AJ2E = 1, AJ3E = 2, AJ4E = 3, AJ7E = 4, AJ8E = 5, AJ9E = 6, AJ16E = 7, AJ17E = 8, AJ18E = 9, AJ21E = 10, AJ3W = 11, AJ7W = 12, AJ8W = 13, AJ9W = 14, AJ15W = 15, AJ16W = 16, AJ17W = 17, AJ18W = 18, AJ22W = 19, S11 = 20, S12 = 21, S14 = 22, S19 = 23} |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LogicStart](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#function-logicstart)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-digitaldeviceaddress)**  |
| Module | **[SPADDetection](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-spaddetection)**  |
| string[] | **[SignalNamesForSPADMessage](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-signalnamesforspadmessage)**  |
| bool[] | **[SignalClearLatch](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-signalclearlatch)**  |
| bool[] | **[SignalLockOut](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-signallockout)**  |
| bool[] | **[SignalReverseLatch](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-signalreverselatch)**  |
| bool[] | **[SignalSPADAlert](/SignallingSystem-doc/mainsystem/Files/SPADDetection_8vb/#variable-signalspadalert)**  |

## Types Documentation

### enum SPADSignalNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| AJ1E | 0|   |
| AJ2E | 1|   |
| AJ3E | 2|   |
| AJ4E | 3|   |
| AJ7E | 4|   |
| AJ8E | 5|   |
| AJ9E | 6|   |
| AJ16E | 7|   |
| AJ17E | 8|   |
| AJ18E | 9|   |
| AJ21E | 10|   |
| AJ3W | 11|   |
| AJ7W | 12|   |
| AJ8W | 13|   |
| AJ9W | 14|   |
| AJ15W | 15|   |
| AJ16W | 16|   |
| AJ17W | 17|   |
| AJ18W | 18|   |
| AJ22W | 19|   |
| S11 | 20|   |
| S12 | 21|   |
| S14 | 22|   |
| S19 | 23|   |





## Functions Documentation

### function LogicStart

```csharp
void LogicStart()
```



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```


### variable SPADDetection

```csharp
Module SPADDetection;
```


### variable SignalNamesForSPADMessage

```csharp
string[] SignalNamesForSPADMessage = {"AJ1E", "AJ2E", "AJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E", "AJ3W ", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W", "S11", "S12", "S14", "S19"};
```


### variable SignalClearLatch

```csharp
bool[] SignalClearLatch = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```


### variable SignalLockOut

```csharp
bool[] SignalLockOut = {True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True};
```


### variable SignalReverseLatch

```csharp
bool[] SignalReverseLatch = {True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True};
```


### variable SignalSPADAlert

```csharp
bool[] SignalSPADAlert = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Public Module SPADDetection
    Enum SPADSignalNames
        AJ1E = 0
        AJ2E = 1
        AJ3E = 2
        AJ4E = 3
        AJ7E = 4
        AJ8E = 5
        AJ9E = 6
        AJ16E = 7
        AJ17E = 8
        AJ18E = 9
        AJ21E = 10
        AJ3W = 11
        AJ7W = 12
        AJ8W = 13
        AJ9W = 14
        AJ15W = 15
        AJ16W = 16
        AJ17W = 17
        AJ18W = 18
        AJ22W = 19
        S11 = 20
        S12 = 21
        S14 = 22
        S19 = 23
    End Enum
    Public SignalNamesForSPADMessage() As String = {"AJ1E", "AJ2E", "AJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E", "AJ3W ", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W", "S11", "S12", "S14", "S19"}
    Public SignalClearLatch() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public SignalLockOut() As Boolean = {True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True}
    Public SignalReverseLatch() As Boolean = {True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True}
    Public SignalSPADAlert() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public Sub LogicStart()
        '                                                     Signal   |   Signal   |   Section Before   |   Section After
        CheckIfSPAD(SPADSignalNames.AJ1E, Definitions.SignalNames.AJ1E, TrackSectionUnoccupied(TrackSectionNames.SectionH), PointSectionUnoccupied(PointNames.P11))
        If EastBound Then
            CheckIfSPAD(SPADSignalNames.AJ2E, Definitions.SignalNames.AJ2E, TrackSectionUnoccupied(TrackSectionNames.SectionP), TrackSectionUnoccupied(TrackSectionNames.SectionQ))
            CheckIfSPAD(SPADSignalNames.AJ3E, Definitions.SignalNames.AJ3E, TrackSectionUnoccupied(TrackSectionNames.SectionDE), TrackSectionUnoccupied(TrackSectionNames.SectionE))
            CheckIfSPAD(SPADSignalNames.AJ4E, Definitions.SignalNames.AJ4E, TrackSectionUnoccupied(TrackSectionNames.SectionE), PointSectionUnoccupied(PointNames.P13))
        End If
        CheckIfSPAD(SPADSignalNames.AJ7E, Definitions.SignalNames.AJ7E, TrackSectionUnoccupied(TrackSectionNames.SectionG), TrackSectionUnoccupied(TrackSectionNames.SectionH))
        CheckIfSPAD(SPADSignalNames.AJ8E, Definitions.SignalNames.AJ8E, TrackSectionUnoccupied(TrackSectionNames.SectionCD), TrackSectionUnoccupied(TrackSectionNames.SectionD))
        CheckIfSPAD(SPADSignalNames.AJ9E, Definitions.SignalNames.AJ9E, TrackSectionUnoccupied(TrackSectionNames.SectionN), PointSectionUnoccupied(PointNames.P14))
        CheckIfSPAD(SPADSignalNames.AJ16E, Definitions.SignalNames.AJ16E, TrackSectionUnoccupied(TrackSectionNames.SectionB), TrackSectionUnoccupied(TrackSectionNames.SectionC))
        CheckIfSPAD(SPADSignalNames.AJ17E, Definitions.SignalNames.AJ17E, TrackSectionUnoccupied(TrackSectionNames.SectionO), TrackSectionUnoccupied(TrackSectionNames.SectionOP))
        CheckIfSPAD(SPADSignalNames.AJ18E, Definitions.SignalNames.AJ18E, TrackSectionUnoccupied(TrackSectionNames.SectionM), TrackSectionUnoccupied(TrackSectionNames.SectionN))
        CheckIfSPAD(SPADSignalNames.AJ21E, Definitions.SignalNames.AJ21E, TrackSectionUnoccupied(TrackSectionNames.SectionI), TrackSectionUnoccupied(TrackSectionNames.SectionQ10))
        CheckIfSPAD(SPADSignalNames.AJ3W, Definitions.SignalNames.AJ3W, TrackSectionUnoccupied(TrackSectionNames.SectionDE), TrackSectionUnoccupied(TrackSectionNames.SectionD))
        CheckIfSPAD(SPADSignalNames.AJ7W, Definitions.SignalNames.AJ7W, TrackSectionUnoccupied(TrackSectionNames.SectionH), TrackSectionUnoccupied(TrackSectionNames.SectionG))
        CheckIfSPAD(SPADSignalNames.AJ8W, Definitions.SignalNames.AJ8W, TrackSectionUnoccupied(TrackSectionNames.SectionD), TrackSectionUnoccupied(TrackSectionNames.SectionCD))
        CheckIfSPAD(SPADSignalNames.AJ9W, Definitions.SignalNames.AJ9W, TrackSectionUnoccupied(TrackSectionNames.SectionO), TrackSectionUnoccupied(TrackSectionNames.SectionNO))
        If WestBound Or (Points.PointReturns(PointNames.P12) = PointInReverse) Then
            CheckIfSPAD(SPADSignalNames.AJ15W, Definitions.SignalNames.AJ15W, TrackSectionUnoccupied(TrackSectionNames.SectionG), PointSectionUnoccupied(PointNames.P12))
        End If
        CheckIfSPAD(SPADSignalNames.AJ16W, Definitions.SignalNames.AJ16W, TrackSectionUnoccupied(TrackSectionNames.SectionC), TrackSectionUnoccupied(TrackSectionNames.SectionB))
        CheckIfSPAD(SPADSignalNames.AJ17W, Definitions.SignalNames.AJ17W, TrackSectionUnoccupied(TrackSectionNames.SectionP), TrackSectionUnoccupied(TrackSectionNames.SectionOP))
        CheckIfSPAD(SPADSignalNames.AJ18W, Definitions.SignalNames.AJ18W, TrackSectionUnoccupied(TrackSectionNames.SectionN), TrackSectionUnoccupied(TrackSectionNames.SectionM))
        CheckIfSPAD(SPADSignalNames.AJ22W, Definitions.SignalNames.AJ22W, TrackSectionUnoccupied(TrackSectionNames.SectionI), TrackSectionUnoccupied(TrackSectionNames.SectionF13))
        CheckIfSPAD(SPADSignalNames.S11, Definitions.SignalNames.S11, TrackSectionUnoccupied(TrackSectionNames.SectionA11), PointSectionUnoccupied(PointNames.P11))
        CheckIfSPAD(SPADSignalNames.S12, Definitions.SignalNames.S12, TrackSectionUnoccupied(TrackSectionNames.SectionF12), PointSectionUnoccupied(PointNames.P12))
        CheckIfSPAD(SPADSignalNames.S14, Definitions.SignalNames.S14, TrackSectionUnoccupied(TrackSectionNames.SectionNO14), PointSectionUnoccupied(PointNames.P14))
        CheckIfSPAD(SPADSignalNames.S19, Definitions.SignalNames.S19, TrackSectionUnoccupied(TrackSectionNames.SectionC19), PointSectionUnoccupied(PointNames.P19))
    End Sub
    Private Sub CheckIfSPAD(Signal As Integer, SignalState As Integer, SectionBefore As Boolean, SectionAfter As Boolean)
        'Stops SPAD detection if train reverse into  tracksection(sectionnames.section
        If SectionAfter = False And SectionBefore = True Then
            SignalReverseLatch(Signal) = True
        End If
        If SignalReverseLatch(Signal) = True And SectionAfter = True And SectionBefore = True Then
            SignalReverseLatch(Signal) = False
            SignalSPADAlert(Signal) = False
        End If
        'Reset following SPAD
        If SectionAfter = True And SectionBefore = True Then
            SignalSPADAlert(Signal) = False
        End If
        'Main SPAD code
        If SignalLockOut(Signal) = False And SignalReverseLatch(Signal) = False Then
            'Sets signal latch i.e. to say its safe to pass
            If Not SignalOutputState(SignalState) = SignalAtDanger Then
                SignalClearLatch(Signal) = True
            End If
            'detects train passing signal
            If SectionAfter = False And SectionBefore = False Then
                'sees if train was safe to pass signal
                If SignalClearLatch(Signal) = False And SignalSPADAlert(Signal) = False Then
                    SignalSPADAlert(Signal) = True
                    TelegramMessageSender.sendMessage(ChatGroups.SPADsGroup, "SPAD Detected " & SignalNamesForSPADMessage(Signal) & " at " & DateTime.Now.ToString("HH:mm:ss"))
                End If
                'locks out code no matter if train was safe to pass or not to prevent spamming and reduce false triggers
                SignalLockOut(Signal) = True
                SignalClearLatch(Signal) = False
            End If
            'detects if the signal gets returned to danger before train was able to pass
            If SignalOutputState(Definitions.SignalNames.AJ7E) = SignalAtDanger Then
                SignalClearLatch(Signal) = False
            End If
            'Waits until the  tracksection(sectionnames.sections are clear to remove the lockout code which was used earlier to prevent spamming
        ElseIf SectionAfter = True And SectionBefore = True Then
            SignalLockOut(Signal) = False
            SignalClearLatch(Signal) = False
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
