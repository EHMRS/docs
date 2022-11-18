---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/EastBoundManual.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/EastBoundManual.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[EastBoundManual](/SignallingSystem-doc/vb/Classes/classEastBoundManual/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/vb/Files/EastBoundManual_8vb/#variable-digitaldeviceaddress)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Public Class EastBoundManual
    Shared ReadOnly Occupied As Boolean = False
    Shared ReadOnly Clear As Boolean = True
    Shared TrainApprochingP1SoundPlayed1 As Boolean
    Shared TrainApprochingP1SoundPlayed2 As Boolean
    Shared TrainApprochingP2SoundPlayed1 As Boolean
    Shared TrainDepartingP1SoundPlayed As Boolean
    Shared TrainDepartingP2SoundPlayed As Boolean
    Shared AJ1AllowDispatch As Boolean
    Public Shared Sub Manual()
        'Sounds
        'Approching P1
        If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Points.PointReturns(PointNames.P13) = "Normal" And TrainApprochingP1SoundPlayed1 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrainApprochingP1SoundPlayed1 = True Then
            TrainApprochingP1SoundPlayed1 = False
            'Approching P1 from Turntable
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Occupied And Points.PointReturns(PointNames.P12) = "Reverse" And TrainApprochingP1SoundPlayed2 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed2 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrainApprochingP1SoundPlayed2 = True Then
            TrainApprochingP1SoundPlayed2 = False
            'Approching P2
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Points.PointReturns(PointNames.P13) = "Reverse" And TrainApprochingP2SoundPlayed1 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And TrainApprochingP2SoundPlayed1 = True Then
            TrainApprochingP2SoundPlayed1 = False
        End If
        'Lever 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger" Then
            If RequireButtonInputToClearSignal = True Then
                If Buttons.ButtonRequest(ButtonNames.Button1) = True Or Buttons.ButtonRequest(ButtonNames.Button2) = True Or Buttons.ButtonRequest(ButtonNames.Button3) = True Or Buttons.ButtonRequest(ButtonNames.Button4) = True Or Buttons.ButtonRequest(ButtonNames.Button5) = True _
                    Or Buttons.ButtonRequest(ButtonNames.Button6) = True Or Buttons.ButtonRequest(ButtonNames.Button17) = True Or Buttons.ButtonRequest(ButtonNames.Button23) = True Or Buttons.ButtonRequest(ButtonNames.Button21) = True Then
                    AJ1AllowDispatch = True
                Else
                    AJ1AllowDispatch = False
                End If
            Else
                AJ1AllowDispatch = True
            End If
        End If
        If Initializations.AJ1Initiated = True Then
            If Lever(LeverNames.Lever1) = "Normal" Then
                TrainDepartingP1SoundPlayed = False
                If Points.PointReturns(PointNames.P5a) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And PointReturns(PointNames.P6b) = "Normal" _
                And Lever(LeverNames.Lever6) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                ElseIf Lever(LeverNames.Lever2) = "Normal" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And Points.PointReturns(PointNames.P5a) = "Reverse" And Lever(LeverNames.Lever5) = "Reverse" And PointReturns(PointNames.P5b) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                ElseIf Points.PointReturns(PointNames.P11) = "Reverse" And Lever(LeverNames.Lever11) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                Else
                    LeverLock(LeverNames.Lever1) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                LeverRestroke(LeverNames.Lever1) = True
            ElseIf Lever(LeverNames.Lever1) = "Reverse" Then
                'Route AJ1 to AJ16
                If Points.PointReturns(PointNames.P5a) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And PointReturns(PointNames.P6b) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And AJ1AllowDispatch = True Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever1) = False Then
                            If LeverRestroke(LeverNames.Lever1) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                                SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                                LeverRestroke(LeverNames.Lever1) = False
                                If TrainDepartingP1SoundPlayed = False Then
                                    Sound.TrainDepartingP1()
                                    TrainDepartingP1SoundPlayed = True
                                    Buttons.ButtonRequest(ButtonNames.Button1) = False
                                    Buttons.ButtonRequest(ButtonNames.Button2) = False
                                    Buttons.ButtonRequest(ButtonNames.Button3) = False
                                    Buttons.ButtonRequest(ButtonNames.Button4) = False
                                    Buttons.ButtonRequest(ButtonNames.Button5) = False
                                    Buttons.ButtonRequest(ButtonNames.Button6) = False
                                    Buttons.ButtonRequest(ButtonNames.Button17) = False
                                    Buttons.ButtonRequest(ButtonNames.Button23) = False
                                End If
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                            If TrainDepartingP1SoundPlayed = False Then
                                Sound.TrainDepartingP1()
                                TrainDepartingP1SoundPlayed = True
                                Buttons.ButtonRequest(ButtonNames.Button1) = False
                                Buttons.ButtonRequest(ButtonNames.Button2) = False
                                Buttons.ButtonRequest(ButtonNames.Button3) = False
                                Buttons.ButtonRequest(ButtonNames.Button4) = False
                                Buttons.ButtonRequest(ButtonNames.Button5) = False
                                Buttons.ButtonRequest(ButtonNames.Button6) = False
                                Buttons.ButtonRequest(ButtonNames.Button17) = False
                                Buttons.ButtonRequest(ButtonNames.Button23) = False
                            End If
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                        SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                        TrainDepartingP1SoundPlayed = False
                    End If
                    'Route AJ1 to AJ18
                ElseIf Points.PointReturns(PointNames.P5a) = "Reverse" And PointReturns(PointNames.P5b) = "Reverse" And Lever(LeverNames.Lever5) = "Reverse" And Points.PointReturns(PointNames.P11) = "Normal" And Lever(LeverNames.Lever11) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear _
                    And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And AJ1AllowDispatch = True Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever1) = False Then
                            If LeverRestroke(LeverNames.Lever1) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                                SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                                If TrainDepartingP1SoundPlayed = False Then
                                    Sound.TrainDepartingP1()
                                    TrainDepartingP1SoundPlayed = True
                                    Buttons.ButtonRequest(ButtonNames.Button1) = False
                                    Buttons.ButtonRequest(ButtonNames.Button2) = False
                                    Buttons.ButtonRequest(ButtonNames.Button3) = False
                                    Buttons.ButtonRequest(ButtonNames.Button4) = False
                                    Buttons.ButtonRequest(ButtonNames.Button5) = False
                                    Buttons.ButtonRequest(ButtonNames.Button6) = False
                                    Buttons.ButtonRequest(ButtonNames.Button17) = False
                                    Buttons.ButtonRequest(ButtonNames.Button23) = False
                                End If
                                LeverRestroke(LeverNames.Lever1) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                            If TrainDepartingP1SoundPlayed = False Then
                                Sound.TrainDepartingP1()
                                TrainDepartingP1SoundPlayed = True
                                Buttons.ButtonRequest(ButtonNames.Button1) = False
                                Buttons.ButtonRequest(ButtonNames.Button2) = False
                                Buttons.ButtonRequest(ButtonNames.Button3) = False
                                Buttons.ButtonRequest(ButtonNames.Button4) = False
                                Buttons.ButtonRequest(ButtonNames.Button5) = False
                                Buttons.ButtonRequest(ButtonNames.Button6) = False
                                Buttons.ButtonRequest(ButtonNames.Button17) = False
                                Buttons.ButtonRequest(ButtonNames.Button23) = False
                            End If
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                        SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                        TrainDepartingP1SoundPlayed = False
                    End If
                    'Route AJ1 to Headshunt
                ElseIf Points.PointReturns(PointNames.P11) = "Reverse" And Lever(LeverNames.Lever11) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear Then
                    LeverLock(LeverNames.Lever1) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And AJ1AllowDispatch = True Then
                        SignalSystemState(Definitions.SignalNames.AJ1E) = "Shunt"
                        SignalSystemState(Definitions.SignalNames.S11) = "Shunt"
                        Buttons.ButtonRequest(ButtonNames.Button21) = False
                        Buttons.ButtonRequest(ButtonNames.Button3) = False
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                        SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever1) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                    SignalSystemState(Definitions.SignalNames.S11) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever1) = True
                SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S11) = "Danger"
            End If
        End If
        'Lever 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ2Initiated = True Then
            If Lever(LeverNames.Lever2) = "Normal" Then
                If Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal" And Points.PointReturns(PointNames.P6a) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                    And Lever(LeverNames.Lever21) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear _
                Then
                    LeverLock(LeverNames.Lever2) = False
                ElseIf Lever(LeverNames.Lever1) = "Normal" And Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal" And Points.PointReturns(PointNames.P6a) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" _
                And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
                And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear _
                Then
                    LeverLock(LeverNames.Lever2) = False
                Else
                    LeverLock(LeverNames.Lever2) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
                LeverRestroke(LeverNames.Lever2) = True
            ElseIf Lever(LeverNames.Lever2) = "Reverse" Then
                'Route AJ2 to AJ16
                If Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal" And Points.PointReturns(PointNames.P6a) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
                And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear _
                Then
                    LeverLock(LeverNames.Lever2) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever2) = False Then
                            If LeverRestroke(LeverNames.Lever2) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtClear
                                LeverRestroke(LeverNames.Lever2) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtClear
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
                    End If
                    'Route AJ2 to AJ18
                ElseIf Points.PointReturns(PointNames.P10) = "Normal" And Lever(LeverNames.Lever10) = "Normal" And Points.PointReturns(PointNames.P6a) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
                And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear _
                Then
                    LeverLock(LeverNames.Lever2) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever2) = False Then
                            If LeverRestroke(LeverNames.Lever2) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtClear
                                LeverRestroke(LeverNames.Lever2) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtClear
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever2) = True
                    SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever2) = True
                SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger"
            End If
        End If
        'Lever 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ3Initiated = True Then
            If Lever(LeverNames.Lever3) = "Normal" Then
                LeverLock(LeverNames.Lever3) = False
                SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger"
                LeverRestroke(LeverNames.Lever3) = True
            ElseIf Lever(LeverNames.Lever3) = "Reverse" Then
                LeverLock(LeverNames.Lever3) = False
                'Route AJ3 to AJ4
                If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever3) = False Then
                        If LeverRestroke(LeverNames.Lever3) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ3E) = SignalAtClear
                            LeverRestroke(LeverNames.Lever3) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ3E) = SignalAtClear
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever3) = True
                SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger"
            End If
        End If
        'Lever 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ4Initiated = True Then
            If Lever(LeverNames.Lever4) = "Normal" Then
                If Points.PointReturns(PointNames.P13) = "Reverse" And Lever(LeverNames.Lever13) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear Then
                    LeverLock(LeverNames.Lever4) = False
                ElseIf Points.PointReturns(PointNames.P13) = "Normal" And Lever(LeverNames.Lever13) = "Normal" And Points.PointReturns(PointNames.P12) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And Lever(LeverNames.Lever15) = "Normal" And Lever(LeverNames.Lever12) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear _
                Then
                    LeverLock(LeverNames.Lever4) = False
                Else
                    LeverLock(LeverNames.Lever4) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
                LeverRestroke(LeverNames.Lever4) = True
            ElseIf Lever(LeverNames.Lever4) = "Reverse" Then
                'Route AJ4 to AJ21
                If Points.PointReturns(PointNames.P13) = "Reverse" And Lever(LeverNames.Lever13) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear Then
                    LeverLock(LeverNames.Lever4) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever4) = False Then
                            If LeverRestroke(LeverNames.Lever4) = True Then
                                If Buttons.ButtonRequest(ButtonNames.Button2) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                    Errors.NewError("AJ4E - No route selected by platform staff")
                                ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = True And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                    Errors.NewError("AJ4E - Different route selected by platform staff")
                                ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = True Then
                                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                    Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                    Errors.RemoveError("AJ4E - No route selected by platform staff")
                                Else
                                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                    Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                    Errors.RemoveError("AJ4E - No route selected by platform staff")
                                End If
                                LeverRestroke(LeverNames.Lever4) = False
                            End If
                        Else
                            If Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                Errors.NewError("AJ4E - No route selected by platform staff")
                            ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = True And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                Errors.NewError("AJ4E - Different route selected by platform staff")
                            ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                Errors.RemoveError("AJ4E - No route selected by platform staff")
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                Errors.RemoveError("AJ4E - No route selected by platform staff")
                            End If
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
                        Buttons.ButtonRequest(ButtonNames.Button27) = False
                    End If
                    'Route AJ4 to AJ7
                ElseIf Points.PointReturns(PointNames.P13) = "Normal" And Lever(LeverNames.Lever13) = "Normal" And Points.PointReturns(PointNames.P12) = "Normal" And Lever(LeverNames.Lever12) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And Lever(LeverNames.Lever15) = "Normal" _
                Then
                    LeverLock(LeverNames.Lever4) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever4) = False Then
                            If LeverRestroke(LeverNames.Lever4) = True Then
                                If Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                    Errors.NewError("AJ4E - No route selected by platform staff")
                                ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = True Then
                                    Errors.NewError("AJ4E - Different route selected by platform staff")
                                ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = True And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                    Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                    Errors.RemoveError("AJ4E - No route selected by platform staff")
                                Else
                                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                    Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                    Errors.RemoveError("AJ4E - No route selected by platform staff")
                                End If
                                LeverRestroke(LeverNames.Lever4) = False
                            End If
                        Else
                            If Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                Errors.NewError("AJ4E - No route selected by platform staff")
                            ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = False And Buttons.ButtonRequest(ButtonNames.Button27) = True Then
                                Errors.NewError("AJ4E - Different route selected by platform staff")
                            ElseIf Buttons.ButtonRequest(ButtonNames.Button25) = True And Buttons.ButtonRequest(ButtonNames.Button26) = True And Buttons.ButtonRequest(ButtonNames.Button27) = False Then
                                SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                Errors.RemoveError("AJ4E - No route selected by platform staff")
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                                Errors.RemoveError("AJ4E - Different route selected by platform staff")
                                Errors.RemoveError("AJ4E - No route selected by platform staff")
                            End If
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
                        Buttons.ButtonRequest(ButtonNames.Button26) = False
                    End If
                Else
                    LeverLock(LeverNames.Lever4) = True
                    SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever4) = True
                SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger"
            End If
        End If
        'Lever 5~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point5Initiated = True Then
            If Lever(LeverNames.Lever5) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear _
                    And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = SectionIsClear And Lever(LeverNames.Lever6) = "Normal" And Lever(LeverNames.Lever1) = "Normal" _
                    And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" _
                Then
                    LeverLock(LeverNames.Lever5) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = SectionIsClear And
                 Lever(LeverNames.Lever6) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear _
                Then
                    LeverLock(LeverNames.Lever5) = False
                Else
                    LeverLock(LeverNames.Lever5) = True
                End If
                Points.PointRequestedOutputs(PointNames.P5a) = "Normal"
                Points.PointRequestedOutputs(PointNames.P5b) = "Normal"
            ElseIf Lever(LeverNames.Lever5) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And
                 Lever(LeverNames.Lever6) = "Normal" And Lever(LeverNames.Lever1) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear _
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And
                    Lever(LeverNames.Lever5) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever1) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
                Then
                    LeverLock(LeverNames.Lever6) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And
                Lever(LeverNames.Lever5) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
            Then
                    LeverLock(LeverNames.Lever6) = False
                Else
                    LeverLock(LeverNames.Lever6) = True
                End If
                Points.PointRequestedOutputs(PointNames.P6a) = "Normal"
                Points.PointRequestedOutputs(PointNames.P6b) = "Normal"
            ElseIf Lever(LeverNames.Lever6) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And
                    Lever(LeverNames.Lever5) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever1) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
            Then
                    LeverLock(LeverNames.Lever6) = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And
            Lever(LeverNames.Lever5) = "Normal" And Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear _
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
            If Lever(LeverNames.Lever7) = "Normal" And SignalSystemState(Definitions.SignalNames.S11) = "Danger" Then
                LeverLock(LeverNames.Lever7) = False
                SignalSystemState(Definitions.SignalNames.AJ7E) = "Danger"
                LeverRestroke(LeverNames.Lever7) = True
            ElseIf Lever(LeverNames.Lever7) = "Reverse" Then
                LeverLock(LeverNames.Lever7) = False
                'Route AJ7 to AJ1
                If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever7) = False Then
                        If LeverRestroke(LeverNames.Lever7) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ7E) = "Clear"
                            LeverRestroke(LeverNames.Lever7) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ7E) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ7E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever7) = True
                SignalSystemState(Definitions.SignalNames.AJ7E) = "Danger"
            End If
        End If
        'Lever 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ8Initiated = True Then
            If Lever(LeverNames.Lever8) = "Normal" Then
                If Lever(LeverNames.Lever22) = "Normal" And Lever(LeverNames.Lever15) = "Normal" Or Points.PointReturns(PointNames.P12) = "Normal" And TunnelSafe = True And LineSide.CrossingSafe = True Then
                    LeverLock(LeverNames.Lever8) = False
                Else
                    LeverLock(LeverNames.Lever8) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ8E) = "Danger"
                LeverRestroke(LeverNames.Lever8) = True
            ElseIf Lever(LeverNames.Lever8) = "Reverse" Then
                LeverLock(LeverNames.Lever8) = False
                'Route AJ8 to 
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And TunnelSafe = True And LineSide.CrossingSafe = True Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever8) = False Then
                        If LeverRestroke(LeverNames.Lever8) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ8E) = "Clear"
                            LeverRestroke(LeverNames.Lever8) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ8E) = "Clear"
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ8E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever8) = True
                SignalSystemState(Definitions.SignalNames.AJ8E) = "Danger"
            End If
        End If
        'Lever 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ9Initiated = True Then
            If Lever(LeverNames.Lever9) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = Clear Then
                LeverLock(LeverNames.Lever9) = False
                SignalSystemState(Definitions.SignalNames.AJ9E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S14) = "Danger"
                LeverRestroke(LeverNames.Lever9) = True
            ElseIf Lever(LeverNames.Lever9) = "Reverse" Then
                LeverLock(LeverNames.Lever9) = False
                'Route AJ9 to AJ17
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And Points.PointReturns(PointNames.P14) = "Normal" And Lever(LeverNames.Lever14) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP14) = Clear Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever9) = False Then
                        If LeverRestroke(LeverNames.Lever9) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ9E) = "Clear"
                            LeverRestroke(LeverNames.Lever9) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ9E) = "Clear"
                    End If
                    'Route AJ9 to FoxHole
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = Clear And Points.PointReturns(PointNames.P14) = "Reverse" And Lever(LeverNames.Lever14) = "Reverse" And PointSectionUnoccupied(PointSectionNames.SectionP14) = Clear Then
                    SignalSystemState(Definitions.SignalNames.AJ9E) = "Shunt"
                    SignalSystemState(Definitions.SignalNames.S14) = "Shunt"
                    Buttons.ButtonRequest(ButtonNames.Button22) = False
                Else
                    SignalSystemState(Definitions.SignalNames.AJ9E) = "Danger"
                    SignalSystemState(Definitions.SignalNames.S14) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever9) = True
                SignalSystemState(Definitions.SignalNames.AJ9E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S14) = "Danger"
            End If
        End If
        'Lever 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point10Initiated = True Then
            If Lever(LeverNames.Lever10) = "Normal" Then
                If Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear Then
                    LeverLock(LeverNames.Lever10) = False
                Else
                    LeverLock(LeverNames.Lever10) = True
                End If
                Points.PointRequestedOutputs(PointNames.P10) = "Normal"
            ElseIf Lever(LeverNames.Lever10) = "Reverse" Then
                If Lever(LeverNames.Lever2) = "Normal" And Lever(LeverNames.Lever21) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear Then
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And Lever(LeverNames.Lever1) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear Then
                    LeverLock(LeverNames.Lever11) = False
                Else
                    LeverLock(LeverNames.Lever11) = True
                End If
                Points.PointRequestedOutputs(PointNames.P11) = "Normal"
            ElseIf Lever(LeverNames.Lever11) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And Lever(LeverNames.Lever1) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear Then
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever4) = "Normal" And Lever(LeverNames.Lever15) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear Then
                    LeverLock(LeverNames.Lever12) = False
                Else
                    LeverLock(LeverNames.Lever12) = True
                End If
                Points.PointRequestedOutputs(PointNames.P12) = "Normal"
            ElseIf Lever(LeverNames.Lever12) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever4) = "Normal" And Lever(LeverNames.Lever15) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear Then
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever4) = "Normal" And Lever(LeverNames.Lever15) = "Normal" And Lever(LeverNames.Lever22) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear Then
                    LeverLock(LeverNames.Lever13) = False
                Else
                    LeverLock(LeverNames.Lever13) = True
                End If
                Points.PointRequestedOutputs(PointNames.P13) = "Normal"
            ElseIf Lever(LeverNames.Lever13) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Lever(LeverNames.Lever15) = "Normal" And Lever(LeverNames.Lever22) = "Normal" And Lever(LeverNames.Lever4) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear Then
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And Lever(LeverNames.Lever9) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP14) = Clear Then
                    LeverLock(LeverNames.Lever14) = False
                Else
                    LeverLock(LeverNames.Lever14) = True
                End If
                Points.PointRequestedOutputs(PointNames.P14) = "Normal"
            ElseIf Lever(LeverNames.Lever14) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And Lever(LeverNames.Lever9) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP14) = Clear Then
                    LeverLock(LeverNames.Lever14) = False
                Else
                    LeverLock(LeverNames.Lever14) = True
                End If
                Points.PointRequestedOutputs(PointNames.P14) = "Reverse"
            Else
                LeverLock(LeverNames.Lever14) = True
                Points.PointRequestedOutputs(PointNames.P14) = "OFF"
            End If
        End If
        'Lever 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ15Initiated = True Then
            If Lever(LeverNames.Lever15) = "Normal" Then
                If Lever(LeverNames.Lever8) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And Points.PointReturns(PointNames.P13) = "Normal" _
                     And Lever(LeverNames.Lever13) = "Normal" And Points.PointReturns(PointNames.P12) = "Normal" And Lever(LeverNames.Lever12) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear _
                Then
                    LeverLock(LeverNames.Lever15) = False
                ElseIf Points.PointReturns(PointNames.P12) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And Lever(LeverNames.Lever12) = "Reverse" Then
                    LeverLock(LeverNames.Lever15) = False
                Else
                    LeverLock(LeverNames.Lever15) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger"
                SignalSystemState(Definitions.SignalNames.S12) = "Danger"
                LeverRestroke(LeverNames.Lever15) = True
            ElseIf Lever(LeverNames.Lever15) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear Then
                    LeverLock(LeverNames.Lever15) = False
                Else
                    LeverLock(LeverNames.Lever15) = True
                End If
                If Lever(LeverNames.Lever8) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Points.PointReturns(PointNames.P13) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear _
                    And Lever(LeverNames.Lever13) = "Normal" And Points.PointReturns(PointNames.P12) = "Normal" And Lever(LeverNames.Lever12) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear _
                    Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever15) = False Then
                        If LeverRestroke(LeverNames.Lever15) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ15W) = "Clear"
                            LeverRestroke(LeverNames.Lever15) = False
                            Buttons.ButtonRequest(ButtonNames.Button7) = False
                            Buttons.ButtonRequest(ButtonNames.Button8) = False
                            Buttons.ButtonRequest(ButtonNames.Button9) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ15W) = "Shunt"
                        SignalSystemState(Definitions.SignalNames.S12) = "Danger"
                        Buttons.ButtonRequest(ButtonNames.Button7) = False
                        Buttons.ButtonRequest(ButtonNames.Button8) = False
                        Buttons.ButtonRequest(ButtonNames.Button9) = False
                    End If
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And Points.PointReturns(PointNames.P12) = "Reverse" And Lever(LeverNames.Lever12) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = Clear Then
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
            End If
        End If
        'Lever 16~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ16Initiated = True Then
            If Lever(LeverNames.Lever16) = "Normal" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP19) = Clear And ((Points.PointReturns(PointNames.P19) = "Normal" And Lever(LeverNames.Lever19) = "Normal" And TunnelSafe = True) Or (Points.PointReturns(PointNames.P19) = "Reverse" And Lever(LeverNames.Lever19) = "Reverse")) Then
                    LeverLock(LeverNames.Lever16) = False
                Else
                    LeverLock(LeverNames.Lever16) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ16E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S19) = "Danger"
                LeverRestroke(LeverNames.Lever16) = True
            ElseIf Lever(LeverNames.Lever16) = "Reverse" Then
                'Route AJ16 to AJ8
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And Points.PointReturns(PointNames.P19) = "Normal" And Lever(LeverNames.Lever19) = "Normal" And TunnelSafe = True And PointSectionUnoccupied(PointSectionNames.SectionP19) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = Clear Then
                    LeverLock(LeverNames.Lever16) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever16) = False Then
                            If LeverRestroke(LeverNames.Lever16) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ16E) = "Clear"
                                LeverRestroke(LeverNames.Lever16) = False
                            End If
                        Else
                            SignalSystemState(Definitions.SignalNames.AJ16E) = "Clear"
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ16E) = "Danger"
                    End If
                    'Route AJ16 to EngineShed
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And Points.PointReturns(PointNames.P19) = "Reverse" And Lever(LeverNames.Lever19) = "Reverse" And PointSectionUnoccupied(PointSectionNames.SectionP19) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Clear Then
                        LeverLock(LeverNames.Lever16) = False
                        SignalSystemState(Definitions.SignalNames.AJ16E) = "Shunt"
                        SignalSystemState(Definitions.SignalNames.S19) = "Shunt"
                        Buttons.ButtonRequest(ButtonNames.Button19) = False
                    Else
                        LeverLock(LeverNames.Lever16) = True
                    SignalSystemState(Definitions.SignalNames.AJ16E) = "Danger"
                    SignalSystemState(Definitions.SignalNames.S19) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever16) = True
                SignalSystemState(Definitions.SignalNames.AJ16E) = "Danger"
                SignalSystemState(Definitions.SignalNames.S19) = "Danger"
            End If
        End If
        'Lever 17~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ17Initiated = True Then
            If Lever(LeverNames.Lever17) = "Normal" And LineSide.CrossingSafe = True Then
                LeverLock(LeverNames.Lever17) = False
                SignalSystemState(Definitions.SignalNames.AJ17E) = "Danger"
                LeverRestroke(LeverNames.Lever17) = True
            ElseIf Lever(LeverNames.Lever17) = "Reverse" Then
                LeverLock(LeverNames.Lever17) = False
                'Route AJ17 to AJ2
                If TrackSectionUnoccupied(TrackSectionNames.SectionP) = Clear And TrackSectionUnoccupied(TrackSectionNames.Sectionop) = Clear And LineSide.CrossingSafe = True Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever17) = False Then
                        If LeverRestroke(LeverNames.Lever17) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ17E) = SignalAtClear
                            LeverRestroke(LeverNames.Lever17) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ17E) = SignalAtClear
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ17E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever17) = True
                SignalSystemState(Definitions.SignalNames.AJ17E) = "Danger"
            End If
        End If
        'Lever 18~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ18Initiated = True Then
            If Lever(LeverNames.Lever18) = "Normal" Then
                LeverLock(LeverNames.Lever18) = False
                SignalSystemState(Definitions.SignalNames.AJ18E) = "Danger"
                LeverRestroke(LeverNames.Lever18) = True
            ElseIf Lever(LeverNames.Lever18) = "Reverse" Then
                LeverLock(LeverNames.Lever18) = False
                'Route AJ18 to AJ9
                If TrackSectionUnoccupied(TrackSectionNames.SectionN) = Clear Then
                    If RuntimeConfig.config.LeverRestroke(LeverNames.Lever18) = False Then
                        If LeverRestroke(LeverNames.Lever18) = True Then
                            SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtClear
                            LeverRestroke(LeverNames.Lever18) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtClear
                    End If
                Else
                    SignalSystemState(Definitions.SignalNames.AJ18E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever18) = True
                SignalSystemState(Definitions.SignalNames.AJ18E) = "Danger"
            End If
        End If
        'Lever 19~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.Point19Initiated = True Then
            If Lever(LeverNames.Lever19) = LeverInNormal Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = SectionIsClear And Lever(LeverNames.Lever16) = LeverInNormal And PointSectionUnoccupied(PointSectionNames.SectionP19) = Clear Then
                    LeverLock(LeverNames.Lever19) = False
                Else
                    LeverLock(LeverNames.Lever19) = True
                End If
                Points.PointRequestedOutputs(PointNames.P19) = PointToNormal
            ElseIf Lever(LeverNames.Lever19) = LeverInReverse Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = SectionIsClear And Lever(LeverNames.Lever16) = LeverInNormal And TunnelSafe = True And PointSectionUnoccupied(PointSectionNames.SectionP19) = Clear Then
                    LeverLock(LeverNames.Lever19) = False
                Else
                    LeverLock(LeverNames.Lever19) = True
                End If
                Points.PointRequestedOutputs(PointNames.P19) = PointToReverse
            Else
                LeverLock(LeverNames.Lever19) = True
                Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
            End If
        End If
        'Lever 20~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        LeverLock(LeverNames.Lever20) = True
        'Lever 21~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ21Initiated = True Then
            If Lever(LeverNames.Lever21) = "Normal" Then
                TrainDepartingP2SoundPlayed = False
                If Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse" And Points.PointReturns(PointNames.P6a) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And Lever(LeverNames.Lever2) = "Normal" And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear _
                And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear Then
                    LeverLock(LeverNames.Lever21) = False
                ElseIf Lever(LeverNames.Lever1) = "Normal" And Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse" And Points.PointReturns(PointNames.P6a) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" _
                And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And Lever(LeverNames.Lever2) = "Normal" _
                And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear _
                Then
                    LeverLock(LeverNames.Lever21) = False
                Else
                    LeverLock(LeverNames.Lever21) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
                LeverRestroke(LeverNames.Lever21) = True
            ElseIf Lever(LeverNames.Lever21) = "Reverse" Then
                'Route AJ21 to AJ18
                If Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse" And Points.PointReturns(PointNames.P6a) = "Normal" And Lever(LeverNames.Lever6) = "Normal" And PointReturns(PointNames.P5b) = "Normal" And Lever(LeverNames.Lever5) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP6a) = Clear _
                And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear _
                Then
                    LeverLock(LeverNames.Lever21) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever21) = False Then
                            If LeverRestroke(LeverNames.Lever21) = True Then
                                If TrainDepartingP2SoundPlayed = False Then
                                    Sound.TrainDepartingP2()
                                    TrainDepartingP2SoundPlayed = True
                                End If
                                SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                                LeverRestroke(LeverNames.Lever21) = False
                                Buttons.ButtonRequest(ButtonNames.Button10) = False
                                Buttons.ButtonRequest(ButtonNames.Button11) = False
                                Buttons.ButtonRequest(ButtonNames.Button12) = False
                                Buttons.ButtonRequest(ButtonNames.Button13) = False
                                Buttons.ButtonRequest(ButtonNames.Button14) = False
                            End If
                        Else
                            If TrainDepartingP2SoundPlayed = False Then
                                Sound.TrainDepartingP2()
                                TrainDepartingP2SoundPlayed = True
                            End If
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            Buttons.ButtonRequest(ButtonNames.Button10) = False
                            Buttons.ButtonRequest(ButtonNames.Button11) = False
                            Buttons.ButtonRequest(ButtonNames.Button12) = False
                            Buttons.ButtonRequest(ButtonNames.Button13) = False
                            Buttons.ButtonRequest(ButtonNames.Button14) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
                    End If
                    'Route AJ21 to AJ16
                ElseIf Points.PointReturns(PointNames.P10) = "Reverse" And Lever(LeverNames.Lever10) = "Reverse" And Points.PointReturns(PointNames.P6a) = "Reverse" And Lever(LeverNames.Lever6) = "Reverse" And PointReturns(PointNames.P6b) = "Reverse" And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear _
                And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And (Lever(LeverNames.Lever1) = "Normal" _
                And Points.PointReturns(PointNames.P11) = "Normal") And PointSectionUnoccupied(PointSectionNames.SectionP10) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5b) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = Clear Then
                    LeverLock(LeverNames.Lever21) = False
                    If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear Then
                        If RuntimeConfig.config.LeverRestroke(LeverNames.Lever21) = False Then
                            If LeverRestroke(LeverNames.Lever21) = True Then
                                SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                                If TrainDepartingP2SoundPlayed = False Then
                                    Sound.TrainDepartingP2()
                                    TrainDepartingP2SoundPlayed = True
                                End If
                                LeverRestroke(LeverNames.Lever21) = False
                                Buttons.ButtonRequest(ButtonNames.Button10) = False
                                Buttons.ButtonRequest(ButtonNames.Button11) = False
                                Buttons.ButtonRequest(ButtonNames.Button12) = False
                                Buttons.ButtonRequest(ButtonNames.Button13) = False
                                Buttons.ButtonRequest(ButtonNames.Button14) = False
                            End If
                        Else
                            If TrainDepartingP2SoundPlayed = False Then
                                Sound.TrainDepartingP2()
                                TrainDepartingP2SoundPlayed = True
                            End If
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            Buttons.ButtonRequest(ButtonNames.Button10) = False
                            Buttons.ButtonRequest(ButtonNames.Button11) = False
                            Buttons.ButtonRequest(ButtonNames.Button12) = False
                            Buttons.ButtonRequest(ButtonNames.Button13) = False
                            Buttons.ButtonRequest(ButtonNames.Button14) = False
                        End If
                    Else
                        SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
                    End If
                Else
                    LeverLock(LeverNames.Lever21) = True
                    SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
                End If
            Else
                LeverLock(LeverNames.Lever21) = True
                SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger"
            End If
        End If
        'Lever 22~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        If Initializations.AJ22Initiated = True Then
            If Lever(LeverNames.Lever22) = "Normal" Then
                If Lever(LeverNames.Lever8) = "Normal" And Lever(LeverNames.Lever4) = "Normal" And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And Points.PointReturns(PointNames.P13) = "Reverse" _
                      And Lever(LeverNames.Lever13) = "Reverse" And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear Then
                    LeverLock(LeverNames.Lever22) = False
                Else
                    LeverLock(LeverNames.Lever22) = True
                End If
                SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
            ElseIf Lever(LeverNames.Lever22) = "Reverse" Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear Then
                    LeverLock(LeverNames.Lever22) = False
                Else
                    LeverLock(LeverNames.Lever22) = True
                End If
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And Points.PointReturns(PointNames.P13) = "Reverse" And Lever(LeverNames.Lever13) = "Reverse" And Lever(LeverNames.Lever4) = "Normal" _
                      And PointSectionUnoccupied(PointSectionNames.SectionP13) = Clear Then
                    SignalSystemState(Definitions.SignalNames.AJ22W) = "Clear"
                Else
                    SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
                End If
            Else
                SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger"
                LeverLock(LeverNames.Lever22) = True
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
