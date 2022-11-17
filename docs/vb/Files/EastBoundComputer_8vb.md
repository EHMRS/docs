---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/EastBoundComputer.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/EastBoundComputer.vb



## Namespaces

| Name           |
| -------------- |
| **[EHMR_Signalling_System::LogicStart](/SignallingSystem-doc/vb/Namespaces/namespaceEHMR__Signalling__System_1_1LogicStart/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[EastBoundComputer](/SignallingSystem-doc/vb/Classes/classEastBoundComputer/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/vb/Files/EastBoundComputer_8vb/#variable-digitaldeviceaddress)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Imports EHMR_Signalling_System.LogicStart
Public Class EastBoundComputer
    Shared ReadOnly Occupied As Boolean = False
    Shared ReadOnly Clear As Boolean = True
    Shared TrainApprochingP1SoundPlayed1 As Boolean 'Main Line
    Shared TrainApprochingP1SoundPlayed2 As Boolean 'P11
    Shared TrainApprochingP1SoundPlayed3 As Boolean 'P12
    Shared TrainApprochingP2SoundPlayed1 As Boolean
    Shared TrainDepartingP1SoundPlayed As Boolean
    Shared TrainDepartingP2SoundPlayed As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ1 As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ15 As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ21 As Boolean
    Shared P1CombinedClear As Boolean = False
    'Sounds
    Public Shared Sub Sounds()
        'Approaching P1
        If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Points.PointReturns(PointNames.P13) = PointInNormal And TrainApprochingP1SoundPlayed1 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied And TrainApprochingP1SoundPlayed1 = True Then
            TrainApprochingP1SoundPlayed1 = False
        End If
        'Approaching P2
        If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Points.PointReturns(PointNames.P13) = PointInReverse And TrainApprochingP2SoundPlayed1 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And TrainApprochingP2SoundPlayed1 = True Then
            TrainApprochingP2SoundPlayed1 = False
        End If
    End Sub
    'Computer logic
    Public Shared Sub Computer()
        If RuntimeConfig.config.P1Combine = True Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear Then
                P1CombinedClear = True
            Else
                P1CombinedClear = False
            End If
        Else
            P1CombinedClear = True
        End If
        AJ1ELogic()
        AJ2ELogic()
        AJ3ELogic()
        AJ4ELogic()
        AJ7ELogic()
        AJ8ELogic()
        AJ9ELogic()
        AJ16ELogic()
        AJ17ELogic()
        AJ18ELogic()
        AJ21ELogic()
        AJ3WLogic()
        AJ7WLogic()
        AJ8WLogic()
        AJ9WLogic()
        AJ15WLogic()
        AJ16WLogic()
        AJ17WLogic()
        AJ18WLogic()
        AJ22WLogic()
        S11Logic()
        S12Logic()
        S14Logic()
        S19Logic()
    End Sub
    'Main Signals
    'EB Signals
    Public Shared Sub AJ1ELogic()
        If Initializations.AJ1Initiated = True Then
            'Timer start for station
            If (TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied) And Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button1) = True Or Buttons.ButtonRequest(ButtonNames.Button17) = True Or Buttons.ButtonRequest(ButtonNames.Button23) = True Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button2) = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button3) = True Then 'HeadShunt
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EHeadShunt = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button4) = True Then 'Extension
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EExtention = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button5) = True Then 'EngineShed
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EEngineShed = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button6) = True Then 'FoxHole
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EFoxHole = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EInner = True And BlockSafeAJ1EtoAJ18E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockAJ21EtoAJ18E = 0 And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P5a) = PointInReverse And Points.PointReturns(PointNames.P5b) = PointInReverse And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button1) = False
                    Buttons.ButtonFlash(ButtonNames.Button17) = False
                    Buttons.ButtonFlash(ButtonNames.Button23) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            BackLockAJ1EtoAJ18E = GlobalConfig.config.timers.backlock
                            AJ18EInnerRequest = True
                        End If
                    End If
                    If TrainDepartingP1SoundPlayed = False Then
                        Sound.TrainDepartingP1()
                        TrainDepartingP1SoundPlayed = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    Buttons.ButtonFlash(ButtonNames.Button1) = True
                    Buttons.ButtonFlash(ButtonNames.Button17) = True
                    Buttons.ButtonFlash(ButtonNames.Button23) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
                'Outer Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EOuter = True And BlockSafeAJ1EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And (Points.PointReturns(PointNames.P6a) = PointInNormal Or (SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger)) And BackLockAJ2EtoAJ16E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P5a) = PointInNormal And PointReturns(PointNames.P6b) = PointInNormal And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button2) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            BackLockAJ1EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EOuterRequest = True
                        End If
                    End If
                    If TrainDepartingP1SoundPlayed = False Then
                        Sound.TrainDepartingP1()
                        TrainDepartingP1SoundPlayed = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    Buttons.ButtonFlash(ButtonNames.Button2) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
                'Head Shunt Route 3
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EHeadShunt = True And BlockSafeAJ1EtoSiding() = True And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P11) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button3) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtShunt
                            BackLockAJ1EtoSiding = GlobalConfig.config.timers.backlock
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ1 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ1 = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P11) = PointToReverse
                    Buttons.ButtonFlash(ButtonNames.Button3) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
                'Extension Route 4
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EExtention = True And BlockSafeAJ1EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And (Points.PointReturns(PointNames.P6a) = PointInNormal Or (SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger)) And BackLockAJ2EtoAJ16E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P5a) = PointInNormal And PointReturns(PointNames.P6b) = PointInNormal And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button4) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            BackLockAJ1EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EExtentionRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ1 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ1 = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    Buttons.ButtonFlash(ButtonNames.Button4) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
                'EngineShed Route 5
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EEngineShed = True And BlockSafeAJ1EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And (Points.PointReturns(PointNames.P6a) = PointInNormal Or (SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger)) And BackLockAJ2EtoAJ16E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P5a) = PointInNormal And PointReturns(PointNames.P6b) = PointInNormal And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button5) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            BackLockAJ1EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EEngineShedRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ1 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ1 = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    Buttons.ButtonFlash(ButtonNames.Button5) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
                'FoxHole Route 6
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EFoxHole = True And BlockSafeAJ1EtoAJ18E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockAJ21EtoAJ18E = 0 And BackLockS11Out = 0 Then
                If Points.PointReturns(PointNames.P5a) = PointInReverse And PointReturns(PointNames.P5b) = PointInReverse And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button6) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtClear
                            BackLockAJ1EtoAJ18E = GlobalConfig.config.timers.backlock
                            AJ18EFoxHoleRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ1 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ1 = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    Buttons.ButtonFlash(ButtonNames.Button6) = True
                    SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button1) = False
                Buttons.ButtonFlash(ButtonNames.Button2) = False
                Buttons.ButtonFlash(ButtonNames.Button3) = False
                Buttons.ButtonFlash(ButtonNames.Button4) = False
                Buttons.ButtonFlash(ButtonNames.Button5) = False
                Buttons.ButtonFlash(ButtonNames.Button6) = False
                Buttons.ButtonFlash(ButtonNames.Button17) = False
                Buttons.ButtonFlash(ButtonNames.Button23) = False
                SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
            End If
            If PointSectionUnoccupied(PointSectionNames.SectionP11) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP5a) = Occupied Then
                AJ1EReset = True
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = 0 Then AJ1EReset = True
            'Reset everything relating to signal
            If AJ1EReset = True Then
                TrainEnteringSidingSoundPlayedAJ1 = False
                TrainDepartingP1SoundPlayed = False
                Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled
                SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = TimerDisabled
                AJ1EInner = False
                AJ1EOuter = False
                AJ1EHeadShunt = False
                AJ1EExtention = False
                AJ1EEngineShed = False
                AJ1EFoxHole = False
                Buttons.ButtonRequest(ButtonNames.Button1) = False
                Buttons.ButtonRequest(ButtonNames.Button2) = False
                Buttons.ButtonRequest(ButtonNames.Button3) = False
                Buttons.ButtonRequest(ButtonNames.Button4) = False
                Buttons.ButtonRequest(ButtonNames.Button5) = False
                Buttons.ButtonRequest(ButtonNames.Button6) = False
                Buttons.ButtonRequest(ButtonNames.Button17) = False
                Buttons.ButtonRequest(ButtonNames.Button23) = False
                Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                AJ1EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ2ELogic()
        If Initializations.AJ2Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ2E) = TimerDisabled Then
                If AJ2EOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionO) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ2E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ2E) = AJ2EDelayValue
                    AJ2EOuter = True
                    AJ2EOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionP) = Occupied Then 'Out error
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ2E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ2E) = GlobalConfig.config.timers.sectionError
                    AJ2EOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ2E) = 0 And AJ2EOuter = True And BlockSafeAJ2EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger And (Points.PointReturns(PointNames.P11) = PointInReverse Or SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger) And TunnelSafe = True And BackLockAJ1EtoAJ16E = 0 And BackLockAJ1EtoAJ18E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockAJ21EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P10) = PointInNormal And Points.PointReturns(PointNames.P6a) = PointInReverse And PointReturns(PointNames.P6b) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtClear
                        BackLockAJ2EtoAJ16E = GlobalConfig.config.timers.backlock
                        If AJ16EEngineShed = True Then AJ16EReset = True
                        AJ16EOuterRequest = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P10) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP10) = Occupied Then
                    AJ2EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ2E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionP) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ2E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ2E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ2E) = 0 Then AJ2EReset = True
            'Reset everything relating to signal
            If AJ2EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ2E) = TimerDisabled
                AJ2EInner = False
                AJ2EFoxHole = False
                AJ2EOuter = False
                AJ2EEngineShed = False
                AJ2EExtention = False
                Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ2E) = SafeToClearValue
                AJ2EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ3ELogic()
        If Initializations.AJ3Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled Then
                If AJ3EOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ3E) = AJ3EDelayValue
                    AJ3EOuter = True
                    AJ3EOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ3E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.sectionError
                    AJ3EOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ3E) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ3E) = 0 And AJ3EOuter = True And BlockSafeAJ3EtoAJ4E() Then
                SignalSystemState(Definitions.SignalNames.AJ3E) = SignalAtClear
            Else
                SignalSystemState(Definitions.SignalNames.AJ3E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied Then
                    AJ3EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = 0 Then AJ3EReset = True
            'Reset everything relating to signal
            If AJ3EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled
                AJ3EOuter = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ3E) = SafeToClearValue
                AJ3EReset = False
            End If
            SignalSystemState(Definitions.SignalNames.AJ3W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ4ELogic()
        If Initializations.AJ4Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ4E) = TimerDisabled And SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Buttons.ButtonRequest(ButtonNames.Button26) = True Then 'platform 1 Manual
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ4E) = 2
                    AJ4EPlatform1 = True
                    Buttons.ButtonFlash(ButtonNames.Button26) = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Buttons.ButtonRequest(ButtonNames.Button27) = True Then 'platform 2 Manual
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ4E) = 2
                    AJ4EPlatform2 = True
                    Buttons.ButtonFlash(ButtonNames.Button27) = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Buttons.ButtonRequest(ButtonNames.Button25) = False Then 'platform 1 Auto
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.sectionError
                    AJ4EPlatform1 = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Occupied And Buttons.ButtonRequest(ButtonNames.Button25) = False Then 'platform 1
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ4E) = AJ4EDelayValue
                    AJ4EPlatform1 = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied And Buttons.ButtonRequest(ButtonNames.Button25) = False Then 'platform 1 Error
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.sectionError
                    AJ4EPlatform1 = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                End If
            End If
            'platform 1 Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ4E) = 0 And AJ4EPlatform1 = True And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger And P1CombinedClear = True And BlockSafeAJ4EtoAJ7E() = True And BackLockS12Out = 0 Then
                If Points.PointReturns(PointNames.P13) = PointInNormal And Points.PointReturns(PointNames.P12) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                        BackLockAJ4EtoAJ7E = GlobalConfig.config.timers.backlock
                        AJ7EOuterRequest = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P13) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P12) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger
                End If
                'platform 2 Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ4E) = 0 And AJ4EPlatform2 = True And BlockSafeAJ4EtoAJ21E() = True Then
                If Points.PointReturns(PointNames.P13) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtClear
                        BackLockAJ4EtoAJ21E = GlobalConfig.config.timers.backlock
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P13) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionF) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP13) = Occupied Then
                    AJ4EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ4E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ4E) = 0 Then AJ4EReset = True
            'Reset everything relating to signal
            If AJ4EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ4E) = TimerDisabled
                AJ4EPlatform1 = False
                AJ4EPlatform2 = False
                Buttons.ButtonRequest(ButtonNames.Button26) = False
                Buttons.ButtonRequest(ButtonNames.Button27) = False
                Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                Buttons.ButtonFlash(ButtonNames.Button26) = False
                Buttons.ButtonFlash(ButtonNames.Button27) = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ4E) = SafeToClearValue
                AJ4EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ7ELogic()
        If Initializations.AJ7Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled Then
                If AJ7EOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionE) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ7E) = AJ7EDelayValue
                    AJ7EOuter = True
                    AJ7EOuterRequest = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.sectionError
                    AJ7EOuter = True
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ7E) = 0 And AJ7EOuter = True And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And BlockSafeAJ7EtoAJ1E() Then
                SignalSystemState(Definitions.SignalNames.AJ7E) = SignalAtClear
            Else
                SignalSystemState(Definitions.SignalNames.AJ7E) = SignalAtDanger
            End If
            If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Then
                AJ7EReset = True
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = 0 Then AJ7EReset = True
            'Reset everything relating to signal
            If AJ7EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled
                AJ7EOuter = False
                AJ7EOuterRequest = False
                AJ7EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ8ELogic()
        If Initializations.AJ8Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled Then
                If AJ8EOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionB) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ8E) = AJ8EDelayValue
                    AJ8EOuter = True
                    AJ8EOuterRequest = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Occupied And Points.PointReturns(PointNames.P19) = PointInNormal Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.sectionError
                    AJ8EOuter = True
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ8E) = 0 And TunnelSafe = True And AJ8EOuter = True And AJ15WOuter = False And BlockSafeAJ8EtoAJ3E() = True Then
                SignalSystemState(Definitions.SignalNames.AJ8E) = SignalAtClear
                AJ3EOuterRequest = True
            Else
                SignalSystemState(Definitions.SignalNames.AJ8E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Occupied Then
                    AJ8EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = 0 Then AJ8EReset = True
            'Reset everything relating to signal
            If AJ8EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled
                AJ8EOuter = False
                AJ8EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ9ELogic()
        If Initializations.AJ9Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled Then
                If AJ9EInnerRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = SectionIsOccupied Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ9E) = AJ9EDelayValue
                    AJ9EInner = True
                    AJ9EInnerRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                ElseIf AJ9EFoxHoleRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = SectionIsOccupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.sectionError
                    AJ9EFoxHole = True
                    AJ9EFoxHoleRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionN) = Occupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.sectionError
                    AJ9EInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ9E) = 0 And AJ9EInner = True And BlockSafeAJ9EtoAJ17E() = True And BackLockS14Out = 0 Then
                If Points.PointReturns(PointNames.P14) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtClear
                        BackLockAJ9EtoAJ17E = GlobalConfig.config.timers.backlock
                        AJ17EInnerRequest = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P14) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger
                End If
                'foxhole Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ9E) = 0 And AJ9EFoxHole = True And BlockSafeAJ9EtoSiding() = True And BackLockS14Out = 0 Then
                If Points.PointReturns(PointNames.P14) = PointInReverse Then
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = 0 Then
                        Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                        SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtShunt
                        BackLockAJ9EtoSiding = GlobalConfig.config.timers.backlock
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P14) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP14) = Occupied Then
                    AJ9EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionN) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = 0 Then AJ9EReset = True
            'Reset everything relating to signal
            If AJ9EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled
                AJ9EInner = False
                AJ9EFoxHole = False
                Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ9E) = SafeToClearValue
                AJ9EReset = False
            End If
            SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ16ELogic()
        If Initializations.AJ16Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled Then
                If AJ16EOuterRequest = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    If PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInNormal Then
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ16EDelayValue
                    Else
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ18EDelayValue
                    End If
                    AJ16EOuter = True
                    AJ16EOuterRequest = False
                    AJ16EExtentionRequest = False
                    AJ16EEngineShedRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                ElseIf AJ16EExtentionRequest = True Then 'Extension
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    If PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInNormal Then
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ16EDelayValue
                    Else
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ18EDelayValue
                    End If
                    AJ16EExtention = True
                    AJ16EExtentionRequest = False
                    AJ16EOuterRequest = False
                    AJ16EEngineShedRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                ElseIf AJ16EEngineShedRequest = True Then 'EngineShed
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    If PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInNormal Then
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ16EDelayValue
                    Else
                        Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ18EDelayValue
                    End If
                    AJ16EEngineShed = True
                    AJ16EEngineShedRequest = False
                    AJ16EExtentionRequest = False
                    AJ16EOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.sectionError
                    AJ16EOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ16E) = 0 And AJ16EOuter = True And BlockSafeAJ16EtoAJ8E() = True And SignalOutputState(Definitions.SignalNames.S19) = SignalAtDanger And TunnelSafe = True And BackLockS19Out = 0 Then
                If Points.PointReturns(PointNames.P19) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtClear
                        BackLockAJ16EtoAJ8E = GlobalConfig.config.timers.backlock
                        AJ8EOuterRequest = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P19) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger
                End If
                'Extension Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ16E) = 0 And AJ16EExtention = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear Then
                SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger
                'EngineShed Route 3
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ16E) = 0 And AJ16EEngineShed = True And BlockSafeAJ16EtoSiding() = True And SignalOutputState(Definitions.SignalNames.S19) = SignalAtDanger And BackLockS19Out = 0 Then
                If Points.PointReturns(PointNames.P19) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ18E) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtShunt
                        BackLockAJ16EtoSiding = GlobalConfig.config.timers.backlock
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P19) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Occupied Then
                    AJ16EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = 0 Then AJ16EReset = True
            'Reset everything relating to signal
            If AJ16EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled
                AJ16EOuter = False
                AJ16EExtention = False
                AJ16EEngineShed = False
                Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                AJ16EOuterRequest = False
                AJ16EExtentionRequest = False
                AJ16EEngineShedRequest = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ16E) = SafeToClearValue
                AJ16EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ17ELogic()
        If Initializations.AJ17Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled Then
                If AJ17EInnerRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionN) = SectionIsOccupied Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ17E) = AJ17EDelayValue
                    AJ17EInner = True
                    AJ17EInnerRequest = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionO) = Occupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.sectionError
                    AJ17EInner = True
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ17E) = 0 And AJ17EInner = True And BlockSafeAJ17EtoAJ2E() = True And LineSide.CrossingSafe = True Then
                SignalSystemState(Definitions.SignalNames.AJ17E) = SignalAtClear
                AJ2EOuterRequest = True
            Else
                SignalSystemState(Definitions.SignalNames.AJ17E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionP) = Occupied Then
                    AJ17EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = 0 Then AJ17EReset = True
            'Reset everything relating to signal
            If AJ17EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled
                AJ17EInner = False
                AJ17EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ18ELogic()
        If Initializations.AJ18Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled Then
                If AJ18EInnerRequest = True Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = AJ18EDelayValue
                    AJ18EInner = True
                    AJ18EInnerRequest = False
                ElseIf AJ18EFoxHoleRequest = True Then 'FoxHole
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = AJ18EDelayValue
                    AJ18EFoxHole = True
                    AJ18EFoxHoleRequest = False
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionM) = Occupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.sectionError
                    AJ18EInner = True
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 0 And AJ18EInner = True And TrackSectionUnoccupied(TrackSectionNames.SectionN) = Clear Then
                SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtClear
                AJ9EInnerRequest = True
                'Outer FoxHole 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 0 And AJ18EFoxHole = True And BlockSafeAJ18EtoAJ9E() And SignalOutputState(Definitions.SignalNames.S14) = SignalAtDanger Then
                If SignalOutputState(Definitions.SignalNames.AJ9E) = SignalAtDanger Then
                    SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtCaution
                Else
                    SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtClear
                End If
                AJ9EFoxHoleRequest = True
            Else
                SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionN) = Occupied Then
                    AJ18EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionL) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = 0 Then AJ18EReset = True
            'Reset everything relating to signal
            If AJ18EReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled
                AJ18EInner = False
                AJ18EFoxHole = False
                AJ18EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ21ELogic()
        If Initializations.AJ21Initiated = True Then
            'Timer start
            If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Occupied And Signals.SignalTimer(Definitions.SignalNames.AJ21E) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button10) = True Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ21E) = AJ21EDelayValue
                    AJ21EInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button11) = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ21E) = AJ21EDelayValue
                    AJ21EOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button12) = True Then 'Extension
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ21E) = AJ21EDelayValue
                    AJ21EExtention = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button13) = True Then 'EngineShed
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ21E) = AJ21EDelayValue
                    AJ21EEngineShed = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button14) = True Then 'FoxHole
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ21E) = AJ21EDelayValue
                    AJ21EFoxHole = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ21E) = 0 And AJ21EInner = True And BlockSafeAJ21EtoAJ18E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And (SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger Or Points.PointReturns(PointNames.P5a) = PointInNormal Or Points.PointReturns(PointNames.P11) = PointInReverse) And BackLockAJ1EtoAJ18E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P6a) = PointInNormal And PointReturns(PointNames.P5b) = PointInNormal And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button10) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            BackLockAJ21EtoAJ18E = GlobalConfig.config.timers.backlock
                            AJ18EInnerRequest = True
                        End If
                    End If
                    If TrainDepartingP2SoundPlayed = False Then
                        Sound.TrainDepartingP2()
                        TrainDepartingP2SoundPlayed = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button10) = True
                End If
                'Outer Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ21E) = 0 And AJ21EOuter = True And AJ1EInner = False And BlockSafeAJ21EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger And BackLockAJ1EtoAJ18E = 0 And BackLockAJ1EtoAJ16E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P6a) = PointInReverse And PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button11) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            BackLockAJ21EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EOuterRequest = True
                        End If
                    End If
                    If TrainDepartingP2SoundPlayed = False Then
                        Sound.TrainDepartingP2()
                        TrainDepartingP2SoundPlayed = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button11) = True
                End If
                'Extension Route 3
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ21E) = 0 And AJ21EExtention = True And BlockSafeAJ21EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger And BackLockAJ1EtoAJ18E = 0 And BackLockAJ1EtoAJ16E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P6a) = PointInReverse And PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button12) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            BackLockAJ21EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EExtentionRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ21 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ21 = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button12) = True
                End If
                'EngineShed Route 4
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ21E) = 0 And AJ21EEngineShed = True And BlockSafeAJ21EtoAJ16E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger And BackLockAJ1EtoAJ18E = 0 And BackLockAJ1EtoAJ16E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P6a) = PointInReverse And PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button13) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            BackLockAJ21EtoAJ16E = GlobalConfig.config.timers.backlock
                            AJ16EEngineShedRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ21 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ21 = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button13) = True
                End If
                'FoxHole Route 5
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ21E) = 0 And AJ21EFoxHole = True And BlockSafeAJ21EtoAJ18E() = True And SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger And (SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger Or Points.PointReturns(PointNames.P5a) = PointInNormal) And BackLockAJ1EtoAJ18E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 Then
                If Points.PointReturns(PointNames.P6a) = PointInNormal And PointReturns(PointNames.P5b) = PointInNormal And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button14) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtClear
                            BackLockAJ21EtoAJ18E = GlobalConfig.config.timers.backlock
                            AJ18EFoxHoleRequest = True
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ21 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ21 = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button14) = True
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button10) = False
                Buttons.ButtonFlash(ButtonNames.Button11) = False
                Buttons.ButtonFlash(ButtonNames.Button12) = False
                Buttons.ButtonFlash(ButtonNames.Button13) = False
                Buttons.ButtonFlash(ButtonNames.Button14) = False
                SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Occupied Then
                    AJ21EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ21E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ21E) = 0 Then AJ21EReset = True
            'Reset everything relating to signal
            If AJ21EReset = True Then
                TrainEnteringSidingSoundPlayedAJ21 = False
                TrainDepartingP2SoundPlayed = False
                Signals.SignalTimer(Definitions.SignalNames.AJ21E) = TimerDisabled
                SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = TimerDisabled
                AJ21EInner = False
                AJ21EOuter = False
                AJ21EExtention = False
                AJ21EEngineShed = False
                AJ21EFoxHole = False
                AJ21EInnerRequest = False
                AJ21EOuterRequest = False
                AJ21EExtentionRequest = False
                AJ21EEngineShedRequest = False
                AJ21EFoxHoleRequest = False
                Buttons.ButtonRequest(ButtonNames.Button10) = False
                Buttons.ButtonRequest(ButtonNames.Button11) = False
                Buttons.ButtonRequest(ButtonNames.Button12) = False
                Buttons.ButtonRequest(ButtonNames.Button13) = False
                Buttons.ButtonRequest(ButtonNames.Button14) = False
                Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ21E) = SafeToClearValue
                AJ16EEngineShedRequest = False
                AJ16EOuterRequest = False
                AJ21EReset = False
            End If
        End If
    End Sub
    'WB Signals
    Public Shared Sub AJ3WLogic()
        If Initializations.AJ3Initiated = True Then
            If AJ15WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And SignalOutputState(Definitions.SignalNames.AJ8W) = SignalAtDanger Then
                SignalSystemState(Definitions.SignalNames.AJ3W) = SignalAtCaution
            Else
                SignalSystemState(Definitions.SignalNames.AJ3W) = SignalAtDanger 'Keep WB signal at signal at danger
            End If
        End If
    End Sub
    Public Shared Sub AJ7WLogic()
        If Initializations.AJ7Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ7W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ8WLogic()
        If Initializations.AJ8Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ9WLogic()
        If Initializations.AJ9Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ15WLogic()
        If Initializations.AJ15Initiated = True Then
            'Timer start
            If (TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied) And Signals.SignalTimer(Definitions.SignalNames.AJ15W) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button7) = True Then 'Tunnel
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ15W) = AJ15WDelayValue
                    AJ15WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button9) = True Then 'TurnTable
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ15W) = AJ15WDelayValue
                    AJ15WTurnTable = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                End If
            End If
            'Tunnel
            If Signals.SignalTimer(Definitions.SignalNames.AJ15W) = 0 And AJ15WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ22W) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ3E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ8W) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P12) = PointInNormal And Points.PointReturns(PointNames.P13) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtCaution
                            BackLockAJ15WtoSiding = GlobalConfig.config.timers.backlock
                            Buttons.ButtonFlash(ButtonNames.Button7) = False
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ15 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ15 = True
                        SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = AnnouncementDelay
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P12) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P13) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button7) = True
                End If
                'TurnTable
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ15W) = 0 And AJ15WTurnTable = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger And (SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Or Points.PointReturns(PointNames.P13) = PointInReverse) Then
                If Points.PointReturns(PointNames.P12) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtShunt
                            BackLockAJ15WtoAJ3W = GlobalConfig.config.timers.backlock
                            Buttons.ButtonFlash(ButtonNames.Button9) = False
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ15 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ15 = True
                        SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = AnnouncementDelay
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P12) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button9) = True
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP12) = Occupied Then
                    AJ15WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ15W) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = 0 Then AJ15WReset = True
            'Reset everything relating to signal
            If AJ15WReset = True Then
                TrainEnteringSidingSoundPlayedAJ15 = False
                Signals.SignalTimer(Definitions.SignalNames.AJ15W) = TimerDisabled
                AJ15WTurnTable = False
                AJ15WOuter = False
                Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                Buttons.ButtonRequest(ButtonNames.Button9) = False
                Buttons.ButtonRequest(ButtonNames.Button7) = False
                AJ15WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ16WLogic()
        If Initializations.AJ16Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ17WLogic()
        If Initializations.AJ17Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ17W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ18WLogic()
        If Initializations.AJ18Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ22WLogic()
        If Initializations.AJ21Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger
        End If
    End Sub
    'Shunt Signals
    Public Shared Sub S11Logic()
        If Initializations.S11Initiated = True Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button21) = True And AllowDeparting Then 'Outer
                S11Out = True
            End If
            'HeadShunt
            If S11Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger And BackLockAJ1EtoAJ16E = 0 And BackLockAJ1EtoAJ18E = 0 And BackLockAJ1EtoSiding = 0 Then
                If Points.PointReturns(PointNames.P11) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button21) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.S11) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S11) = SignalAtShunt
                        BackLockS11Out = GlobalConfig.config.timers.backlock
                    End If
                    If TrackSectionUnoccupied(TrackSectionNames.SectionA11) = False And TrainApprochingP1SoundPlayed2 = False Then
                        Sound.TrainApprochingP1()
                        TrainApprochingP1SoundPlayed2 = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.S11) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P11) = PointToReverse
                    Buttons.ButtonFlash(ButtonNames.Button21) = True
                    SignalSystemState(Definitions.SignalNames.S11) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.S11) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button21) = False
                SignalSystemState(Definitions.SignalNames.S11) = SignalAtDanger
            End If
            If TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Occupied Then
                S11Reset = True
            End If
            'Reset everything relating to signal
            If S11Reset = True Then
                S11Out = False
                Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                Buttons.ButtonRequest(ButtonNames.Button21) = False
                TrainApprochingP1SoundPlayed2 = False
                SignalSafeToClearTimer(Definitions.SignalNames.S11) = SafeToClearValue
                S11Reset = False
            End If
        End If
    End Sub
    Public Shared Sub S12Logic()
        If Initializations.S12Initiated = True Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button20) = True And AllowDeparting Then 'Outer
                S12Out = True
            End If
            'TurnTable
            If S12Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And (SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Or Points.PointReturns(PointNames.P13) = PointInReverse) And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtDanger And (PointReturns(PointNames.P13) = PointInReverse Or PointSectionUnoccupied(PointSectionNames.SectionP13) = True) And BackLockAJ4EtoAJ7E = 0 And BackLockAJ15WtoSiding = 0 Then
                If Points.PointReturns(PointNames.P12) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button20) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.S12) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S12) = SignalAtShunt
                        BackLockS12Out = GlobalConfig.config.timers.backlock
                    End If
                    If TrackSectionUnoccupied(TrackSectionNames.SectionF12) = False And TrainApprochingP1SoundPlayed3 = False Then
                        Sound.TrainApprochingP1()
                        TrainApprochingP1SoundPlayed3 = True
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.S12) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P12) = PointToReverse
                    Buttons.ButtonFlash(ButtonNames.Button20) = True
                    SignalSystemState(Definitions.SignalNames.S12) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.S12) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button20) = False
                SignalSystemState(Definitions.SignalNames.S12) = SignalAtDanger
            End If
            If TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Occupied Then
                S12Reset = True
            End If
            'Reset everything relating to signal
            If S12Reset = True Then
                S12Out = False
                Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                Buttons.ButtonRequest(ButtonNames.Button20) = False
                TrainApprochingP1SoundPlayed3 = False
                SignalSafeToClearTimer(Definitions.SignalNames.S12) = SafeToClearValue
                S12Reset = False
            End If
        End If
    End Sub
    Public Shared Sub S14Logic()
        If Initializations.S14Initiated = True Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button22) = True And AllowDeparting Then 'Outer
                S14Out = True
            End If
            'TurnTable
            If S14Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionN = Clear) And SignalOutputState(Definitions.SignalNames.AJ18E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ9E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And SignalOutputState(Definitions.SignalNames.AJ9W) = SignalAtDanger And BackLockAJ9EtoAJ17E = 0 And BackLockAJ9EtoSiding = 0 Then
                If Points.PointReturns(PointNames.P14) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.S11) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S14) = SignalAtShunt
                        BackLockS14Out = GlobalConfig.config.timers.backlock
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.S14) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P14) = PointToReverse
                    Buttons.ButtonFlash(ButtonNames.Button22) = True
                    SignalSystemState(Definitions.SignalNames.S14) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.S14) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button22) = False
                SignalSystemState(Definitions.SignalNames.S14) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = Occupied Then
                    S14Reset = True
                End If
            End If
            'Reset everything relating to signal
            If S14Reset = True Then
                S14Out = False
                Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                Buttons.ButtonRequest(ButtonNames.Button22) = False
                SignalSafeToClearTimer(Definitions.SignalNames.S14) = SafeToClearValue
                S14Reset = False
            End If
        End If
    End Sub
    Public Shared Sub S19Logic()
        If Initializations.S19Initiated = True Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button19) = True And AllowDeparting Then 'Outer
                S19Out = True
            End If
            'Engine shed
            If S19Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Clear And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And SignalOutputState(Definitions.SignalNames.AJ8W) = SignalAtDanger And BackLockAJ16EtoAJ8E = 0 And BackLockAJ16EtoSiding = 0 Then
                If Points.PointReturns(PointNames.P19) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.S19) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S19) = SignalAtShunt
                        BackLockS19Out = GlobalConfig.config.timers.backlock
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.S19) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P19) = PointToReverse
                    Buttons.ButtonFlash(ButtonNames.Button19) = True
                    SignalSystemState(Definitions.SignalNames.S19) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.S19) = SafeToClearValue
                Buttons.ButtonFlash(ButtonNames.Button19) = False
                SignalSystemState(Definitions.SignalNames.S19) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionC19) = Occupied Then
                    S19Reset = True
                End If
            End If
            'Reset everything relating to signal
            If S19Reset = True Then
                S19Out = False
                Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                Buttons.ButtonRequest(ButtonNames.Button19) = False
                SignalSafeToClearTimer(Definitions.SignalNames.S19) = SafeToClearValue
                S19Reset = False
            End If
        End If
    End Sub
    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
