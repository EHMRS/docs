---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/WestBoundManual.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/WestBoundManual.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[WestBoundManual](/SignallingSystem-doc/vb/Classes/classWestBoundManual/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/vb/Files/WestBoundManual_8vb/#variable-digitaldeviceaddress)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress

Public Class WestBoundManual
    Const Occupied As Boolean = False
    Const Clear As Boolean = True
    Shared TrainApprochingP1SoundPlayed1 As Boolean
    Shared TrainApprochingP1SoundPlayed2 As Boolean
    Shared TrainApprochingP1SoundPlayed3 As Boolean
    Shared TrainApprochingP2SoundPlayed1 As Boolean
    Shared TrainApprochingP2SoundPlayed2 As Boolean
    Shared TrainDepartingP1SoundPlayed As Boolean
    Shared TrainDepartingP2SoundPlayed As Boolean
    Shared AJ15AllowDispatch As Boolean
    Public Shared Sub Manual()
        'Sounds
        'Approching P1 from Inner
        If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Occupied And Points.PointReturns(PointNames.P5a) = "Reverse" And PointReturns(PointNames.P5b) = "Reverse" And TrainApprochingP1SoundPlayed1 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrainApprochingP1SoundPlayed1 = True Then
            TrainApprochingP1SoundPlayed1 = False

            'Approching P1 from Outer
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied And Points.PointReturns(PointNames.P5a) = "Normal" And PointReturns(PointNames.P6b) = "Normal" And TrainApprochingP1SoundPlayed2 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed2 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrainApprochingP1SoundPlayed2 = True Then
            TrainApprochingP1SoundPlayed2 = False

            'Approching P1 from Headshunt
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Occupied And Points.PointReturns(PointNames.P11) = "Reverse" And TrainApprochingP1SoundPlayed3 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed3 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrainApprochingP1SoundPlayed3 = True Then
            TrainApprochingP1SoundPlayed3 = False

            'Approching P2 from Inner
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Occupied And Points.PointReturns(PointNames.P6a) = "Normal" And Points.PointReturns(PointNames.P10) = "Reverse" And TrainApprochingP2SoundPlayed1 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrainApprochingP2SoundPlayed1 = True Then
            TrainApprochingP2SoundPlayed1 = False

            'Approching P2 from Outer
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Occupied And Points.PointReturns(PointNames.P6a) = "Reverse" And Points.PointReturns(PointNames.P10) = "Reverse" And TrainApprochingP2SoundPlayed2 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed2 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrainApprochingP2SoundPlayed2 = True Then
            TrainApprochingP2SoundPlayed2 = False
        End If
        'Lever 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ1Initiated = True Then
            If Lever(LeverNames.Lever1) = "Normal" Then
                LeverLock(LeverNames.Lever1) = True
                SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
            ElseIf Lever(LeverNames.Lever1) = "Reverse" Then
                LeverLock(LeverNames.Lever1) = False
                SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
            Else
                LeverLock(LeverNames.Lever1) = True
                SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
            End If
        End If
        'Lever 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ2Initiated = True Then
            If Lever(LeverNames.Lever2) = "Normal" Then
                LeverLock(LeverNames.Lever2) = True
                SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
            ElseIf Lever(LeverNames.Lever2) = "Reverse" Then
                LeverLock(LeverNames.Lever2) = False
                SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
            Else
                LeverLock(LeverNames.Lever2) = True
                SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
            End If
        End If
        'Lever 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ3Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger"
            If Lever(LeverNames.Lever3) = "Normal" And TunnelSafe = True And LineSide.CrossingSafe = True Then
                LeverLock(LeverNames.Lever3) = False
                SignalSystemState(Definitions.SignalNames.AJ3W) = "Danger"
                LeverRestroke(LeverNames.Lever3) = True
            ElseIf Lever(LeverNames.Lever3) = "Reverse" Then
                LeverLock(LeverNames.Lever3) = False
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TunnelSafe = True And LineSide.CrossingSafe = True Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever3) = False Then
                        If LeverRestroke(LeverNames.Lever3) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ3W) = "Clear"
                            LeverRestroke(LeverNames.Lever3) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ3W) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ3W) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever3) = True
                SignalSystemState(Definitions.SignalNames.AJ3W) = "Danger"
            End If
        End If
        'Lever 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ4Initiated = True Then
            If Lever(LeverNames.Lever4) = "Normal" Then
                LeverLock(LeverNames.Lever4) = True
                SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
            ElseIf Lever(LeverNames.Lever4) = "Reverse" Then
                LeverLock(LeverNames.Lever4) = False
                SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
            Else
                LeverLock(LeverNames.Lever4) = True
                SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
            End If
        End If
        'Lever 5~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point5Initiated = True Then
            If Lever(LeverNames.Lever5) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And
                     Lever(LeverNames.Lever6) = "Normal" And
                     Lever(LeverNames.Lever16) = "Normal" And Lever(LeverNames.Lever18) = "Normal" _
                Then
                    LeverLock(LeverNames.Lever5) = False
                Else
                    LeverLock(LeverNames.Lever5) = True
                End If
                Points.PointRequestedOutputs(PointNames.P5a) = "Normal"
                Points.PointRequestedOutputs(PointNames.P5b) = "Normal"
            ElseIf Lever(LeverNames.Lever5) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And
                     TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And Lever(LeverNames.Lever18) = "Normal" _
                Then
                    LeverLock(LeverNames.Lever5) = False
                Else
                    LeverLock(LeverNames.Lever5) = True
                End If
                Points.PointRequestedOutputs(PointNames.P5a) = "Reverse"
                Points.PointRequestedOutputs(PointNames.P5b) = "Reverse"
            Else
                LeverLock(LeverNames.Lever5) = True
                Points.PointRequestedOutputs(PointNames.P5a) = "OFF"
                Points.PointRequestedOutputs(PointNames.P5b) = "OFF"
            End If
        End If
        'Lever 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point6Initiated = True Then
            If Lever(LeverNames.Lever6) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And
                     Lever(LeverNames.Lever5) = "Normal" And Lever(LeverNames.Lever16) = "Normal" And Lever(LeverNames.Lever18) = "Normal" Then
                    LeverLock(LeverNames.Lever6) = False
                Else
                    LeverLock(LeverNames.Lever6) = True
                End If
                Points.PointRequestedOutputs(PointNames.P6a) = "Normal"
                Points.PointRequestedOutputs(PointNames.P6b) = "Normal"
            ElseIf Lever(LeverNames.Lever6) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And Lever(LeverNames.Lever16) = "Normal" And
                     TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And Lever(LeverNames.Lever5) = "Normal" _
                Then
                    LeverLock(LeverNames.Lever6) = False
                Else
                    LeverLock(LeverNames.Lever6) = True
                End If
                Points.PointRequestedOutputs(PointNames.P6a) = "Reverse"
                Points.PointRequestedOutputs(PointNames.P6b) = "Reverse"
            Else
                LeverLock(LeverNames.Lever6) = True
                Points.PointRequestedOutputs(PointNames.P6a) = "OFF"
                Points.PointRequestedOutputs(PointNames.P6b) = "OFF"
            End If
        End If
        'Lever 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ7Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ7E) = "Danger"
            If Lever(LeverNames.Lever7) = "Normal" Then
                SignalSystemState(Definitions.SignalNames.AJ7W) = "Danger"
                LeverLock(LeverNames.Lever7) = False
                LeverRestroke(LeverNames.Lever7) = True
            ElseIf Lever(LeverNames.Lever7) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever7) = False Then
                        If LeverRestroke(LeverNames.Lever7) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ7W) = "Clear"
                            LeverRestroke(LeverNames.Lever7) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ7W) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ7W) = "Danger"
                End If
                LeverLock(LeverNames.Lever7) = False
            Else
                LeverLock(LeverNames.Lever7) = True
                SignalSystemState(Definitions.SignalNames.AJ7W) = "Danger"
            End If
        End If
        'Lever 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ8Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ8E) = "Danger"
            If Lever(LeverNames.Lever8) = "Normal" Then
                If Points.PointReturns(PointNames.P19) = "Normal" And Lever(LeverNames.Lever19) = "Normal" Then
                    LeverLock(LeverNames.Lever8) = False
                Else
                    LeverLock(LeverNames.Lever8) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ8W) = "Danger"
                LeverRestroke(LeverNames.Lever8) = True
            ElseIf Lever(LeverNames.Lever8) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Clear And Points.PointReturns(PointNames.P19) = "Normal" And Lever(LeverNames.Lever19) = "Normal" Then
                    LeverLock(LeverNames.Lever8) = False
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever8) = False Then
                        If LeverRestroke(LeverNames.Lever8) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ8W) = "Clear"
                            LeverRestroke(LeverNames.Lever8) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ8W) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ8W) = "Danger"
                    LeverLock(LeverNames.Lever8) = True
                End If
            Else
                LeverLock(LeverNames.Lever8) = True
                SignalSystemState(Definitions.SignalNames.AJ8W) = "Danger"
            End If
        End If
        'Lever 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ9Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ9E) = "Danger"
            If Lever(LeverNames.Lever9) = "Normal" Then
                If Points.PointReturns(PointNames.P14) = "Normal" And Lever(LeverNames.Lever14) = "Normal" Then
                    LeverLock(LeverNames.Lever9) = False
                Else
                    LeverLock(LeverNames.Lever9) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ9W) = "Danger"
                LeverRestroke(LeverNames.Lever9) = True
            ElseIf Lever(LeverNames.Lever9) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = SectionIsClear Then
                    LeverLock(LeverNames.Lever9) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionN) = Clear And Points.PointReturns(PointNames.P14) = "Normal" And Lever(LeverNames.Lever14) = "Normal" Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever9) = False Then
                            If LeverRestroke(LeverNames.Lever9) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ9W) = "Clear"
                                LeverLock(LeverNames.Lever9) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ9W) = "Clear"
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ9W) = "Danger"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ9W) = "Danger"
                    LeverLock(LeverNames.Lever9) = True
                End If
            Else
                SignalSystemState(Definitions.SignalNames.AJ9W) = "Danger"
                LeverLock(LeverNames.Lever9) = True
            End If
        End If
        'Lever 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point10Initiated = True Then
            If Lever(LeverNames.Lever10) = "Normal" Then
                If Points.PointReturns(PointNames.P6a) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And
                     TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And Lever(LeverNames.Lever18) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                Then
                    LeverLock(LeverNames.Lever10) = False
                ElseIf Points.PointReturns(PointNames.P6a) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And
                     TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And Lever(LeverNames.Lever16) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                Then
                    LeverLock(LeverNames.Lever10) = False
                Else
                    LeverLock(LeverNames.Lever10) = True
                End If
                Points.PointRequestedOutputs(PointNames.P10) = "Normal"
            ElseIf Lever(LeverNames.Lever10) = "Reverse" Then
                If Points.PointReturns(PointNames.P6a) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And
                     TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And Lever(LeverNames.Lever18) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear _
                Then
                    LeverLock(LeverNames.Lever10) = False
                ElseIf Points.PointReturns(PointNames.P6a) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And Lever(LeverNames.Lever16) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear _
                Then
                    LeverLock(LeverNames.Lever10) = False
                Else
                    LeverLock(LeverNames.Lever10) = True
                End If
                Points.PointRequestedOutputs(PointNames.P10) = "Reverse"
            Else
                LeverLock(LeverNames.Lever10) = True
                Points.PointRequestedOutputs(PointNames.P10) = "OFF"
            End If
        End If
        'Lever 11~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point11Initiated = True Then
            If Lever(LeverNames.Lever11) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And Points.PointReturns(PointNames.P5a) = "Normal" And Lever(LeverNames.Lever16) = "Normal" Then
                    LeverLock(LeverNames.Lever11) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And Points.PointReturns(PointNames.P5a) = "Reverse" And Lever(LeverNames.Lever18) = "Normal" Then
                Else
                    LeverLock(LeverNames.Lever11) = True
                End If
                Points.PointRequestedOutputs(PointNames.P11) = "Normal"
            ElseIf Lever(LeverNames.Lever11) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear Then
                    LeverLock(LeverNames.Lever11) = False
                Else
                    LeverLock(LeverNames.Lever11) = True
                End If
                Points.PointRequestedOutputs(PointNames.P11) = "Reverse"
            Else
                LeverLock(LeverNames.Lever11) = True
                Points.PointRequestedOutputs(PointNames.P11) = "OFF"
            End If
        End If
        'Lever 12~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point12Initiated = True Then
            If Lever(LeverNames.Lever12) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever15) = "Normal" Then
                    LeverLock(LeverNames.Lever12) = False
                Else
                    LeverLock(LeverNames.Lever12) = True
                End If
                Points.PointRequestedOutputs(PointNames.P12) = "Normal"
            ElseIf Lever(LeverNames.Lever12) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear Then
                    LeverLock(LeverNames.Lever12) = False
                Else
                    LeverLock(LeverNames.Lever12) = True
                End If
                Points.PointRequestedOutputs(PointNames.P12) = "Reverse"
            Else
                LeverLock(LeverNames.Lever12) = True
                Points.PointRequestedOutputs(PointNames.P12) = "OFF"
            End If
        End If
        'Lever 13~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point13Initiated = True Then
            If Lever(LeverNames.Lever13) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever15) = "Normal" Then
                    LeverLock(LeverNames.Lever13) = False
                Else
                    LeverLock(LeverNames.Lever13) = True
                End If
                Points.PointRequestedOutputs(PointNames.P13) = "Normal"
            ElseIf Lever(LeverNames.Lever13) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever22) = "Normal" Then
                    LeverLock(LeverNames.Lever13) = False
                Else
                    LeverLock(LeverNames.Lever13) = True
                End If
                Points.PointRequestedOutputs(PointNames.P13) = "Reverse"
            Else
                LeverLock(LeverNames.Lever13) = True
                Points.PointRequestedOutputs(PointNames.P13) = "OFF"
            End If
        End If
        'Lever 14~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point14Initiated = True Then
            If Lever(LeverNames.Lever14) = "Normal" Then
                If Lever(LeverNames.Lever9) = "Normal" Then
                    LeverLock(LeverNames.Lever14) = False
                Else
                    LeverLock(LeverNames.Lever14) = True
                End If
                Points.PointRequestedOutputs(PointNames.P14) = "Normal"
            ElseIf Lever(LeverNames.Lever14) = "Reverse" Then
                LeverLock(LeverNames.Lever14) = False
                Points.PointRequestedOutputs(PointNames.P14) = "Reverse"
            Else
                LeverLock(LeverNames.Lever14) = True
                Points.PointRequestedOutputs(PointNames.P14) = "OFF"
            End If
        End If
        'Lever 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger" Then
            If RequireButtonInputToClearSignal = True Then
                If Buttons.ButtonRequest(ButtonNames.Button7) = True Or Buttons.ButtonRequest(ButtonNames.Button8) = True Or Buttons.ButtonRequest(ButtonNames.Button9) = True Or Buttons.ButtonRequest(ButtonNames.Button17) = True Or Buttons.ButtonRequest(ButtonNames.Button23) = True _
                    Or Buttons.ButtonRequest(ButtonNames.Button20) = True Then
                    AJ15AllowDispatch = True
                Else
                    AJ15AllowDispatch = False
                End If
            Else
                AJ15AllowDispatch = True
            End If
        End If
        If Initializations.AJ15Initiated = True Then
            If Lever(LeverNames.Lever15) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And ((Points.PointReturns(PointNames.P12) = "Normal" And Lever(LeverNames.Lever12) = "Normal") Or (Points.PointReturns(PointNames.P12) = "Reverse" And Lever(LeverNames.Lever12) = "Reverse")) And Points.PointReturns(PointNames.P13) = "Normal" And TunnelSafe = True And Lever(LeverNames.Lever13) = "Normal" Then
                    LeverLock(LeverNames.Lever15) = False
                Else
                    LeverLock(LeverNames.Lever15) = True
                End If
                TrainDepartingP1SoundPlayed = False
                SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger"
                SignalSystemState(Definitions.SignalNames.S12) = "Danger"
                LeverRestroke(LeverNames.Lever15) = True
            ElseIf Lever(LeverNames.Lever15) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear Then
                    LeverLock(LeverNames.Lever15) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And Points.PointReturns(PointNames.P12) = "Normal" And Lever(LeverNames.Lever12) = "Normal" And Points.PointReturns(PointNames.P13) = "Normal" And Lever(LeverNames.Lever13) = "Normal" And TunnelSafe = True And AJ15AllowDispatch = True Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever15) = False Then
                            If LeverRestroke(LeverNames.Lever15) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ15W) = "Clear"
                                LeverRestroke(LeverNames.Lever15) = False
                                If TrainDepartingP1SoundPlayed = False Then
                                    Sound.TrainDepartingP1()
                                    TrainDepartingP1SoundPlayed = True
                                End If
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ15W) = "Clear"
                            If TrainDepartingP1SoundPlayed = False Then
                                Sound.TrainDepartingP1()
                                TrainDepartingP1SoundPlayed = True
                            End If
                        End If
                    ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Points.PointReturns(PointNames.P12) = "Reverse" And Lever(LeverNames.Lever12) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear Then
                        SignalSystemState(Definitions.SignalNames.AJ15W) = "Shunt"
                        SignalSystemState(Definitions.SignalNames.S12) = "Shunt"
                        Buttons.ButtonRequest(ButtonNames.Button7) = False
                        Buttons.ButtonRequest(ButtonNames.Button8) = False
                        Buttons.ButtonRequest(ButtonNames.Button9) = False
                        Buttons.ButtonRequest(ButtonNames.Button20) = False
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger"
                        SignalSystemState(Definitions.SignalNames.S12) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever15) = True
                    SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger"
                    SignalSystemState(Definitions.SignalNames.S12) = "Danger"
                    TrainDepartingP1SoundPlayed = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear Then
                        Buttons.ButtonRequest(ButtonNames.Button7) = False
                        Buttons.ButtonRequest(ButtonNames.Button8) = False
                        Buttons.ButtonRequest(ButtonNames.Button9) = False
                        Buttons.ButtonRequest(ButtonNames.Button23) = False
                        Buttons.ButtonRequest(ButtonNames.Button17) = False
                        Buttons.ButtonRequest(ButtonNames.Button7) = False
                        Buttons.ButtonRequest(ButtonNames.Button20) = False
                    End If
                End If
            Else
                LeverLock(LeverNames.Lever15) = True
                SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger"
                SignalSystemState(Definitions.SignalNames.S12) = "Danger"
            End If
        End If
        'Lever 16~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ16Initiated = True Then
            If Lever(LeverNames.Lever16) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And Points.PointReturns(PointNames.P5a) = "Normal" And Lever(LeverNames.Lever5) = "Normal" _
                And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointReturns(PointNames.P6b) = "Normal" _
                And Lever(LeverNames.Lever6) = "Normal" Then
                    LeverLock(LeverNames.Lever16) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And PointReturns(PointNames.P6b) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And Points.PointReturns(PointNames.P6a) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And ((Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse") _
                Or (Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal")) And Lever(LeverNames.Lever18) = "Normal" Then
                    LeverLock(LeverNames.Lever16) = False
                Else
                    LeverLock(LeverNames.Lever16) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
                LeverRestroke(LeverNames.Lever16) = True
            ElseIf Lever(LeverNames.Lever16) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And Points.PointReturns(PointNames.P5a) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointReturns(PointNames.P6b) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" Then
                    LeverLock(LeverNames.Lever16) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever16) = False Then
                            If LeverRestroke(LeverNames.Lever16) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                                LeverRestroke(LeverNames.Lever16) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
                    End If
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And PointReturns(PointNames.P6b) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And Points.PointReturns(PointNames.P6a) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And ((Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal") Or (Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse")) Then
                    LeverLock(LeverNames.Lever16) = False
                    If Points.PointReturns(PointNames.P10) = "Reverse" Then
                        If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear Then
                            If RuntimeConfig.config.LeverRestroke(LeverNames.Lever16) = False Then
                                If LeverRestroke(LeverNames.Lever16) = True Then
                                    SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                                    LeverRestroke(LeverNames.Lever16) = False
                                End If
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
                        End If
                    Else
                        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionP) = Clear Then
                            If RuntimeConfig.config.LeverRestroke(LeverNames.Lever16) = False Then
                                If LeverRestroke(LeverNames.Lever16) = True Then
                                    SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                                    LeverRestroke(LeverNames.Lever16) = False
                                End If
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear"
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
                        End If
                    End If
                Else
                    LeverLock(LeverNames.Lever16) = True
                    SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever16) = True
                SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger"
            End If
        End If
        'Lever 17~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ17Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ17E) = "Danger"
            If Lever(LeverNames.Lever17) = "Normal" And LineSide.CrossingSafe = True Then
                LeverLock(LeverNames.Lever17) = False
                SignalSystemState(Definitions.SignalNames.AJ17W) = "Danger"
                LeverRestroke(LeverNames.Lever17) = True
            ElseIf Lever(LeverNames.Lever17) = "Reverse" Then
                LeverLock(LeverNames.Lever17) = False
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And TrackSectionUnoccupied(TrackSectionNames.Sectionop) = Clear And LineSide.CrossingSafe = True Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever17) = False Then
                        If LeverRestroke(LeverNames.Lever17) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ17W) = "Clear"
                            LeverRestroke(LeverNames.Lever17) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ17W) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ17W) = "Danger"
                End If
            Else
                SignalSystemState(Definitions.SignalNames.AJ17W) = "Danger"
                LeverLock(LeverNames.Lever17) = True
            End If
        End If
        'Lever 18~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ18Initiated = True Then
            If Lever(LeverNames.Lever18) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And
                TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And Points.PointReturns(PointNames.P6a) = "Normal" And Lever(LeverNames.Lever6) = "Normal" _
                And ((Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse") Or (Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal")) Then
                    LeverLock(LeverNames.Lever18) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And PointReturns(PointNames.P5b) = "Reverse" And Points.PointReturns(PointNames.P5a) = "Reverse" _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And
                 Lever(LeverNames.Lever5) = "Reverse" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And Lever(LeverNames.Lever16) = "Normal" Then
                    LeverLock(LeverNames.Lever18) = False
                Else
                    LeverLock(LeverNames.Lever18) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger"
                LeverRestroke(LeverNames.Lever18) = True
            ElseIf Lever(LeverNames.Lever18) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And Points.PointReturns(PointNames.P6a) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And (Points.PointReturns(PointNames.P10) = "Normal" Or Points.PointReturns(PointNames.P10) = "Reverse") Then
                    LeverLock(LeverNames.Lever18) = False
                    If Points.PointReturns(PointNames.P10) = "Reverse" Then
                        If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear Then
                            If RuntimeConfig.config.LeverRestroke(LeverNames.Lever18) = False Then
                                If LeverRestroke(LeverNames.Lever18) = True Then
                                    SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                                    LeverRestroke(LeverNames.Lever18) = False
                                End If
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger"
                        End If
                    Else
                        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionP) = Clear Then
                            If RuntimeConfig.config.LeverRestroke(LeverNames.Lever18) = False Then
                                If LeverRestroke(LeverNames.Lever18) = True Then
                                    SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                                    LeverRestroke(LeverNames.Lever18) = False
                                End If
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger"
                        End If
                    End If
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And PointReturns(PointNames.P5b) = "Reverse" And Lever(LeverNames.Lever5) = "Reverse" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And Points.PointReturns(PointNames.P5a) = "Reverse" Then
                    LeverLock(LeverNames.Lever18) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever18) = False Then
                            If LeverRestroke(LeverNames.Lever18) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                                LeverRestroke(LeverNames.Lever18) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear"
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever18) = True
                    SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger"
                End If
            End If
        End If
        'Lever 19~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point19Initiated = True Then
            If Lever(LeverNames.Lever19) = "Normal" Then
                If Lever(LeverNames.Lever8) = "Normal" Then
                    LeverLock(LeverNames.Lever19) = False
                Else
                    LeverLock(LeverNames.Lever19) = True
                End If
                Points.PointRequestedOutputs(PointNames.P19) = "Normal"
            ElseIf Lever(LeverNames.Lever19) = "Reverse" Then
                LeverLock(LeverNames.Lever19) = False
                Points.PointRequestedOutputs(PointNames.P19) = "Reverse"
            Else
                LeverLock(LeverNames.Lever19) = True
                Points.PointRequestedOutputs(PointNames.P19) = "OFF"
            End If
        End If
        'Lever 20~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        LeverLock(LeverNames.Lever20) = True
        'Lever 21~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        LeverLock(LeverNames.Lever21) = True
        SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
        'Lever 22~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ22Initiated = True Then
            If Lever(LeverNames.Lever22) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Points.PointReturns(PointNames.P13) = "Reverse" And TunnelSafe = True And
                    Lever(LeverNames.Lever13) = "Reverse" Then
                    LeverLock(LeverNames.Lever22) = False
                Else
                    LeverLock(LeverNames.Lever22) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
                LeverRestroke(LeverNames.Lever22) = True
            ElseIf Lever(LeverNames.Lever22) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear Then
                    LeverLock(LeverNames.Lever22) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And Points.PointReturns(PointNames.P13) = "Reverse" And Lever(LeverNames.Lever13) = "Reverse" And TunnelSafe = True Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever22) = False Then
                            If LeverRestroke(LeverNames.Lever22) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ22W) = "Clear"
                                LeverRestroke(LeverNames.Lever22) = False
                                If TrainDepartingP2SoundPlayed = False Then
                                    Sound.TrainDepartingP2()
                                    TrainDepartingP2SoundPlayed = True
                                End If
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ22W) = "Clear"
                            If TrainDepartingP2SoundPlayed = False Then
                                Sound.TrainDepartingP1()
                                TrainDepartingP2SoundPlayed = True
                            End If
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever22) = True
                    SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
                    TrainDepartingP2SoundPlayed = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear Then
                        Buttons.ButtonRequest(ButtonNames.Button15) = False
                        Buttons.ButtonRequest(ButtonNames.Button16) = False
                    End If
                End If
            Else
                LeverLock(LeverNames.Lever22) = True
                SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
            End If
        End If
    End Sub
    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-18 at 12:39:05 +0000
