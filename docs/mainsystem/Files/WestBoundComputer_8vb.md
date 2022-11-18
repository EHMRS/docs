---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/WestBoundComputer.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/WestBoundComputer.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[WestBoundComputer](/SignallingSystem-doc/mainsystem/Classes/classWestBoundComputer/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/mainsystem/Files/WestBoundComputer_8vb/#variable-digitaldeviceaddress)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Imports EHMR_Signalling_System.LogicStart
Public Class WestBoundComputer
    Shared ReadOnly Occupied As Boolean = False
    Shared ReadOnly Clear As Boolean = True

    Shared TrainApprochingP1SoundPlayed1 As Boolean
    Shared TrainApprochingP1SoundPlayed2 As Boolean
    Shared TrainApprochingP1SoundPlayed3 As Boolean
    Shared TrainApprochingP2SoundPlayed1 As Boolean
    Shared TrainApprochingP2SoundPlayed2 As Boolean
    Shared TrainDepartingP1SoundPlayedAJ15W As Boolean
    Shared TrainDepartingP2SoundPlayed As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ1 As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ15 As Boolean
    Shared TrainEnteringSidingSoundPlayedAJ21 As Boolean
    Shared P1CombinedClear As Boolean = False
    'Sounds
    Public Shared Sub Sounds()
        'Approaching P1 from Inner
        If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Occupied And Points.PointReturns(PointNames.P5a) = "Reverse" And PointReturns(PointNames.P5b) = "Reverse" And TrainApprochingP1SoundPlayed1 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrainApprochingP1SoundPlayed1 = True Then
            TrainApprochingP1SoundPlayed1 = False
            'Approaching P1 from Outer
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied And Points.PointReturns(PointNames.P5a) = "Normal" And PointReturns(PointNames.P6b) = "Normal" And TrainApprochingP1SoundPlayed2 = False Then
            Sound.TrainApprochingP1()
            TrainApprochingP1SoundPlayed2 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrainApprochingP1SoundPlayed2 = True Then
            TrainApprochingP1SoundPlayed2 = False
            'Approaching P2 from Inner
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Occupied And Points.PointReturns(PointNames.P6a) = "Normal" And Points.PointReturns(PointNames.P10) = "Reverse" And TrainApprochingP2SoundPlayed1 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed1 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrainApprochingP2SoundPlayed1 = True Then
            TrainApprochingP2SoundPlayed1 = False
            'Approaching P2 from Outer
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Occupied And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Occupied And Points.PointReturns(PointNames.P6a) = "Reverse" And Points.PointReturns(PointNames.P10) = "Reverse" And TrainApprochingP2SoundPlayed2 = False Then
            Sound.TrainApprochingP2()
            TrainApprochingP2SoundPlayed2 = True
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrainApprochingP2SoundPlayed2 = True Then
            TrainApprochingP2SoundPlayed2 = False
        End If
    End Sub
    'Computer logic
    Public Shared Sub Computer()
        If RuntimeConfig.config.P1Combine = True Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear Then
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
    Public Shared Sub AJ1ELogic()
        If Initializations.AJ1Initiated = True Then
            'Timer start for station
            If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied And Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button3) = True Then 'HeadShunt
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ1E) = AJ1EDelayValue
                    AJ1EHeadShunt = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                End If
            End If
            'Head Shunt Route 3
            If Signals.SignalTimer(Definitions.SignalNames.AJ1E) = 0 And AJ1EHeadShunt = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P11) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button3) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtShunt
                        End If
                    End If
                    If TrainEnteringSidingSoundPlayedAJ1 = False Then
                        Sound.TrainEnteringSiding()
                        TrainEnteringSidingSoundPlayedAJ1 = True
                        If RuntimeConfig.config.ArrivingP1SoundEnabled = True Then
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionA) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP11) = Occupied Then
                    AJ1EReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ1E) = 0 Then AJ1EReset = True
            'Reset everything relating to signal
            If AJ1EReset = True Then
                SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger
                TrainEnteringSidingSoundPlayedAJ1 = False
                Signals.SignalTimer(Definitions.SignalNames.AJ1E) = TimerDisabled
                SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E) = TimerDisabled
                AJ1EInner = False
                AJ1EOuter = False
                AJ1EHeadShunt = False
                AJ1EExtention = False
                AJ1EEngineShed = False
                AJ1EFoxHole = False
                Buttons.ButtonRequest(ButtonNames.Button3) = False
                Buttons.ButtonFlash(ButtonNames.Button1) = False
                Buttons.ButtonFlash(ButtonNames.Button2) = False
                Buttons.ButtonFlash(ButtonNames.Button3) = False
                Buttons.ButtonFlash(ButtonNames.Button4) = False
                Buttons.ButtonFlash(ButtonNames.Button5) = False
                Buttons.ButtonFlash(ButtonNames.Button6) = False
                Buttons.ButtonFlash(ButtonNames.Button17) = False
                Buttons.ButtonFlash(ButtonNames.Button23) = False
                Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ1E) = SafeToClearValue
                AJ1EReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ2ELogic()
        If Initializations.AJ2Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ3ELogic()
        If Initializations.AJ3Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ3E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ4ELogic()
        If Initializations.AJ4Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ7ELogic()
        If Initializations.AJ7Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ7E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ8ELogic()
        If Initializations.AJ8Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ8E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ9ELogic()
        If Initializations.AJ9Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ16ELogic()
        If Initializations.AJ16Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ17ELogic()
        If Initializations.AJ17Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ17E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ18ELogic()
        If Initializations.AJ18Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ18E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    Public Shared Sub AJ21ELogic()
        If Initializations.AJ21Initiated = True Then
            SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger 'Keep WB signal at signal at danger
        End If
    End Sub
    'WB Signals
    Public Shared Sub AJ3WLogic()
        If Initializations.AJ3Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled Then
                If AJ3WOuterRequest = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ3E) = AJ3WDelayValue
                    AJ3WOuter = True
                    AJ3WOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ3W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.sectionError
                    AJ3WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ3W) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ3E) = 0 And AJ3WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = Clear And TunnelSafe = True And LineSide.CrossingSafe = True Then
                SignalSystemState(Definitions.SignalNames.AJ3W) = SignalAtClear
                AJ8WOuterRequest = True
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ3W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ3W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Occupied Then
                    AJ3WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionE) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ3E) = 0 Then AJ3WReset = True
            'Reset everything relating to signal
            If AJ3WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ3E) = TimerDisabled
                AJ3WOuter = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ3W) = SafeToClearValue
                AJ3WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ7WLogic()
        If Initializations.AJ7Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled Then
                If AJ7WOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionN) = Occupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ7E) = AJ7WDelayValue
                    AJ7WOuter = True
                    AJ7WOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ7W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.sectionError
                    AJ7WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ7W) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ7E) = 0 And AJ7WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionG) = Clear And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger Then
                SignalSystemState(Definitions.SignalNames.AJ7W) = SignalAtClear
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ7W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ7W) = SignalAtDanger
            End If
            If TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied Then
                AJ7WReset = True
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionH) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ7E) = 0 Then AJ7WReset = True
            'Reset everything relating to signal
            If AJ7WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ7E) = TimerDisabled
                AJ7WOuter = False
                AJ7WOuterRequest = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ7W) = SafeToClearValue
                AJ7WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ8WLogic()
        If Initializations.AJ8Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled Then
                If AJ8WOuterRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionE) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ8E) = AJ8WDelayValue
                    AJ8WOuter = True
                    AJ8WOuterRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionD) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.sectionError
                    AJ8WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ8E) = 0 And AJ8WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = True And TrackSectionUnoccupied(TrackSectionNames.SectionCD) = True And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = Clear And SignalOutputState(Definitions.SignalNames.S19) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P19) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtClear
                    End If
                    AJ16WInnerRequest = True
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P19) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Occupied Then
                    AJ8WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ8E) = 0 Then AJ8WReset = True
            'Reset everything relating to signal
            If AJ8WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ8E) = TimerDisabled
                AJ8WOuter = False
                Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ8W) = SafeToClearValue
                AJ8WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ9WLogic()
        If Initializations.AJ9Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled Then
                If AJ9WInnerRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionP) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ9E) = AJ9WDelayValue
                    AJ9WInner = True
                    AJ9WInnerRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionO) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.sectionError
                    AJ9WInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = SafeToClearValue
                End If
            End If
            'Outer Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ9E) = 0 And AJ9WInner = True And TrackSectionUnoccupied(TrackSectionNames.SectionN) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And SignalOutputState(Definitions.SignalNames.S14) = SignalAtDanger And TrackSectionUnoccupied(TrackSectionNames.SectionNO14 = SectionIsClear) Then 'And tracksection(sectionnames.sectionNO14) = clear
                If Points.PointReturns(PointNames.P14) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtClear
                    End If
                    'AJ18W   NEED TO SET ROUTE HERE
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P14) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Occupied Then
                    AJ9WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionO) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.Sectionop) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ9E) = 0 Then AJ9WReset = True
            'Reset everything relating to signal
            If AJ9WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ9E) = TimerDisabled
                Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                AJ9WInner = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ9W) = SafeToClearValue
                AJ9WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ15WLogic()
        If Initializations.AJ15Initiated = True Then
            'Timer start
            If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = Occupied And Signals.SignalTimer(Definitions.SignalNames.AJ15W) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button7) = True Or Buttons.ButtonRequest(ButtonNames.Button17) = True Or Buttons.ButtonRequest(ButtonNames.Button23) = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ15W) = AJ15WDelayValue
                    AJ15WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button8) = True Then 'Extension
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ15W) = AJ15WDelayValue
                    AJ15WExtention = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button9) = True Then 'TurnTable
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ15W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ15W) = AJ15WDelayValue
                    AJ15WTurnTable = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                End If
            End If
            'Outer
            If Signals.SignalTimer(Definitions.SignalNames.AJ15W) = 0 And AJ15WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ22W) = SignalAtDanger And TunnelSafe = True Then
                If Points.PointReturns(PointNames.P12) = PointInNormal And Points.PointReturns(PointNames.P13) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtClear
                            AJ3WOuterRequest = True
                            Buttons.ButtonFlash(ButtonNames.Button7) = False
                        End If
                    End If
                    If TrainDepartingP1SoundPlayedAJ15W = False Then
                        Sound.TrainDepartingP1()
                        TrainDepartingP1SoundPlayedAJ15W = True
                        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P12) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P13) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button7) = True
                End If
                'Extention
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ15W) = 0 And AJ15WExtention = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ22W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P12) = PointInNormal And Points.PointReturns(PointNames.P13) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 0 Then
                            If SignalOutputState(Definitions.SignalNames.AJ3W) = SignalAtDanger Then
                                SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtCaution
                            Else
                                SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtClear
                            End If
                            AJ3WOuterRequest = True
                            Buttons.ButtonFlash(ButtonNames.Button8) = False
                        End If
                    End If
                    If TrainDepartingP1SoundPlayedAJ15W = False Then
                        Sound.TrainDepartingP1()
                        TrainDepartingP1SoundPlayedAJ15W = True
                        SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = AnnouncementDelay
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P12) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P13) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button8) = True
                End If
                'Turntable
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ15W) = 0 And AJ15WTurnTable = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And SignalOutputState(Definitions.SignalNames.S12) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P12) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtShunt
                            Buttons.ButtonFlash(ButtonNames.Button29) = False
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
                If TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Occupied Or TrackSectionUnoccupied(TrackSectionNames.SectionF) = Occupied Or PointSectionUnoccupied(PointSectionNames.SectionP12) = Occupied Then
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
                TrainDepartingP1SoundPlayedAJ15W = False
                Signals.SignalTimer(Definitions.SignalNames.AJ15W) = TimerDisabled
                AJ15WOuter = False
                AJ15WExtention = False
                AJ15WTurnTable = False
                Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ15W) = SafeToClearValue
                AJ15WReset = False
                Buttons.ButtonRequest(ButtonNames.Button7) = False
                Buttons.ButtonRequest(ButtonNames.Button8) = False
                Buttons.ButtonRequest(ButtonNames.Button9) = False
                Buttons.ButtonRequest(ButtonNames.Button17) = False
                Buttons.ButtonRequest(ButtonNames.Button23) = False
            End If
        End If
    End Sub
    Public Shared Sub AJ16WLogic()
        If Initializations.AJ16Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled Then
                If AJ16WInnerRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = SectionIsOccupied Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ16E) = AJ16WDelayValue
                    AJ16WInner = True
                    AJ16WInnerRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionC) = Occupied Then 'OuterError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ16E) = GlobalConfig.config.timers.sectionError
                    AJ16WInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = SafeToClearValue
                End If
            End If
            'Route 1 Inner
            If Signals.SignalTimer(Definitions.SignalNames.AJ16E) = 0 And AJ16WInner = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionP) = Clear And SignalOutputState(Definitions.SignalNames.AJ18W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P6a) = PointInReverse And PointReturns(PointNames.P6b) = PointInReverse And Points.PointReturns(PointNames.P10) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtClear
                    End If
                    AJ17WInnerRequest = True
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P6b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P10) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Occupied Then
                    AJ16WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionC) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = (GlobalConfig.config.timers.route \ 15)
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ16E) = 0 Then AJ16WReset = True
            'Reset everything relating to signal
            If AJ16WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ16E) = TimerDisabled
                AJ16WInner = False
                Points.PointRequestedOutputs(PointNames.P6b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ16W) = SafeToClearValue
                AJ16WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ17WLogic()
        If Initializations.AJ17Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled Then
                If AJ17WInnerRequest = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsOccupied Then 'Inner
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ17E) = AJ17WDelayValue
                    AJ17WInner = True
                    AJ17WInnerRequest = False
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ17W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionP) = Occupied Then 'InnerError
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.sectionError
                    AJ17WInner = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ17W) = SafeToClearValue
                End If
            End If
            'Inner Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ17E) = 0 And AJ17WInner = True And TrackSectionUnoccupied(TrackSectionNames.SectionO) = Clear And TrackSectionUnoccupied(TrackSectionNames.Sectionop) = Clear And LineSide.CrossingSafe = True Then
                SignalSystemState(Definitions.SignalNames.AJ17W) = SignalAtClear
                AJ9WInnerRequest = True
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ17W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ17W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.Sectionop) = Occupied Then
                    AJ17WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionP) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ17E) = 0 Then AJ17WReset = True
            'Reset everything relating to signal
            If AJ17WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ17E) = TimerDisabled
                AJ17WInner = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ17W) = SafeToClearValue
                AJ17WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ18WLogic()
        If Initializations.AJ18Initiated = True Then
            'Timer start
            If Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled And SignalOutputState(Definitions.SignalNames.AJ18W) = SignalAtDanger Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionN) = False And Buttons.ButtonRequest(ButtonNames.Button26) = True And Buttons.ButtonRequest(ButtonNames.Button25) = True Then 'platform 1 Manual
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 2
                    AJ18WPlatform1 = True
                    Buttons.ButtonFlash(ButtonNames.Button26) = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionN) = False And Buttons.ButtonRequest(ButtonNames.Button27) = True And Buttons.ButtonRequest(ButtonNames.Button25) = True Then 'platform 2 Manual
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 2
                    AJ18WPlatform2 = True
                    Buttons.ButtonFlash(ButtonNames.Button27) = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionO) = False And Buttons.ButtonRequest(ButtonNames.Button25) = False Then 'platform 1 auto
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = AJ18WDelayValue
                    AJ18WPlatform1 = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionN) = False And Buttons.ButtonRequest(ButtonNames.Button25) = False Then 'platform 1 Error
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.sectionError
                    AJ18WPlatform1 = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                End If
            End If
            'platform 1 Route 1
            If Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 0 And AJ18WPlatform1 = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionH) = Clear And SignalOutputState(Definitions.SignalNames.AJ16W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.S11) = SignalAtDanger And P1CombinedClear = True Then
                If Points.PointReturns(PointNames.P5a) = PointInReverse And PointReturns(PointNames.P5b) = PointInReverse And Points.PointReturns(PointNames.P11) = PointInNormal Then
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtClear
                    End If
                    AJ7WOuterRequest = True
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P5a) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToReverse
                    Points.PointRequestedOutputs(PointNames.P11) = PointToNormal
                    SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger
                End If
                'platform 2 Route 2
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ18E) = 0 And AJ18WPlatform2 = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And (TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear Or PointReturns(PointNames.P6b) = PointInNormal) And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionR) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionI) = Clear And SignalOutputState(Definitions.SignalNames.AJ16W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P6a) = PointInNormal And PointReturns(PointNames.P5b) = PointInNormal And Points.PointReturns(PointNames.P10) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                    Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = 0 Then
                        SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtClear
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P6a) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P5b) = PointToNormal
                    Points.PointRequestedOutputs(PointNames.P10) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Occupied Then
                    AJ18WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionN) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ18E) = 0 Then AJ18WReset = True
            'Reset everything relating to signal
            If AJ18WReset = True Then
                Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled
                AJ18WPlatform1 = False
                AJ18WPlatform2 = False
                Buttons.ButtonRequest(ButtonNames.Button26) = False
                Buttons.ButtonRequest(ButtonNames.Button27) = False
                Points.PointRequestedOutputs(PointNames.P5a) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P5b) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P10) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                Points.PointRequestedOutputs(PointNames.P6a) = PointToOFF
                Buttons.ButtonFlash(ButtonNames.Button26) = False
                Buttons.ButtonFlash(ButtonNames.Button27) = False
                SignalSafeToClearTimer(Definitions.SignalNames.AJ18W) = SafeToClearValue
                AJ18WReset = False
            End If
        End If
    End Sub
    Public Shared Sub AJ22WLogic()
        If Initializations.AJ22Initiated = True Then
            'Timer start
            If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Occupied And Signals.SignalTimer(Definitions.SignalNames.AJ22W) = TimerDisabled And AllowDeparting Then
                If Buttons.ButtonRequest(ButtonNames.Button15) = True Then 'Outer
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ22W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ22W) = AJ22WDelayValue
                    AJ22WOuter = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                ElseIf Buttons.ButtonRequest(ButtonNames.Button16) = True Then 'Extension
                    Signals.SignalTimeOut(Definitions.SignalNames.AJ22W) = GlobalConfig.config.timers.route
                    Signals.SignalTimer(Definitions.SignalNames.AJ22W) = AJ22WDelayValue
                    AJ22WExtention = True
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                End If
            End If
            'Outer
            If Signals.SignalTimer(Definitions.SignalNames.AJ22W) = 0 And AJ22WOuter = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And (SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtDanger Or SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtShunt) And TunnelSafe = True Then
                If Points.PointReturns(PointNames.P13) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtClear
                            AJ3WOuterRequest = True
                            Buttons.ButtonFlash(ButtonNames.Button15) = False
                        End If
                    End If
                    If TrainDepartingP2SoundPlayed = False Then
                        Sound.TrainDepartingP2()
                        TrainDepartingP2SoundPlayed = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P13) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button15) = True
                End If
                'Extention
            ElseIf Signals.SignalTimer(Definitions.SignalNames.AJ22W) = 0 And AJ22WExtention = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And TrackSectionUnoccupied(TrackSectionNames.SectionE) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionDE) = Clear And (SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtDanger Or SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtShunt) Then
                If Points.PointReturns(PointNames.P13) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = 0 Then
                        If SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = 0 Then
                            SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtClear
                            AJ3WOuterRequest = True
                            Buttons.ButtonFlash(ButtonNames.Button16) = False
                        End If
                    End If
                    If TrainDepartingP2SoundPlayed = False Then
                        Sound.TrainDepartingP2()
                        TrainDepartingP2SoundPlayed = True
                        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = AnnouncementDelay
                        Else
                            SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W) = 1
                        End If
                    End If
                Else
                    SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                    Points.PointRequestedOutputs(PointNames.P13) = PointToReverse
                    SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger
                    Buttons.ButtonFlash(ButtonNames.Button16) = True
                End If
            Else
                SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger
                If TrackSectionUnoccupied(TrackSectionNames.SectionF13) = Occupied Then
                    AJ22WReset = True
                End If
            End If
            'Signal Timeout
            If Not Signals.SignalTimer(Definitions.SignalNames.AJ22W) = TimerDisabled Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionI) = Occupied Then Signals.SignalTimeOut(Definitions.SignalNames.AJ22W) = GlobalConfig.config.timers.route
            Else
                Signals.SignalTimeOut(Definitions.SignalNames.AJ22W) = TimerDisabled
            End If
            If Signals.SignalTimeOut(Definitions.SignalNames.AJ22W) = 0 Then AJ22WReset = True
            'Reset everything relating to signal
            If AJ22WReset = True Then
                TrainDepartingP2SoundPlayed = False
                Signals.SignalTimer(Definitions.SignalNames.AJ22W) = TimerDisabled
                AJ22WOuter = False
                AJ22WExtention = False
                Points.PointRequestedOutputs(PointNames.P13) = PointToOFF
                SignalSafeToClearTimer(Definitions.SignalNames.AJ22W) = SafeToClearValue
                AJ22WReset = False
                Buttons.ButtonRequest(ButtonNames.Button15) = False
                Buttons.ButtonRequest(ButtonNames.Button16) = False
            End If
        End If
    End Sub
    'Shunt Signals
    Public Shared Sub S11Logic()
        If Initializations.S11Initiated = True Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button21) = True And AllowDeparting Then 'Outer
                S11Out = True
            End If
            Dim S11ClearInterlock As Boolean = False
            If Points.PointReturns(PointNames.P5a) = PointInNormal And PointReturns(PointNames.P6b) = PointInNormal Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionB) = Clear And SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger Then
                    S11ClearInterlock = True
                Else
                    S11ClearInterlock = False
                End If
            ElseIf Points.PointReturns(PointNames.P5a) = PointInReverse And PointReturns(PointNames.P5b) = PointInReverse Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger Then
                    S11ClearInterlock = True
                Else
                    S11ClearInterlock = False
                End If
            Else
                S11ClearInterlock = True
            End If
            'HeadShunt
            If S11Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionM) = Clear And S11ClearInterlock = True And SignalOutputState(Definitions.SignalNames.AJ1E) = SignalAtDanger And TrackSectionUnoccupied(TrackSectionNames.SectionA) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And TrackSectionUnoccupied(TrackSectionNames.SectionK) = Clear Then
                If Points.PointReturns(PointNames.P11) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P11) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button21) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.S11) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S11) = SignalAtShunt
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
                SignalSafeToClearTimer(Definitions.SignalNames.S11) = SafeToClearValue
                TrainApprochingP1SoundPlayed2 = False
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
            If S12Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = Clear And SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And SignalOutputState(Definitions.SignalNames.AJ15W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P12) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                    Buttons.ButtonFlash(ButtonNames.Button20) = False
                    If SignalSafeToClearTimer(Definitions.SignalNames.S12) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S12) = SignalAtShunt
                    End If
                    If TrackSectionUnoccupied(TrackSectionNames.SectionF12) = Occupied And TrainApprochingP1SoundPlayed3 = False Then
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
                SignalSystemState(Definitions.SignalNames.S12) = SignalAtDanger
                S12Out = False
                Points.PointRequestedOutputs(PointNames.P12) = PointToOFF
                Buttons.ButtonRequest(ButtonNames.Button20) = False
                SignalSafeToClearTimer(Definitions.SignalNames.S12) = SafeToClearValue
                TrainApprochingP1SoundPlayed3 = False
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
            If S14Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionN) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And SignalOutputState(Definitions.SignalNames.AJ18E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ9E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ9W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P14) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P14) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.S14) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S14) = SignalAtShunt
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
        If Initializations.S19Initiated = True And AllowDeparting Then
            'Timer start
            If Buttons.ButtonRequest(ButtonNames.Button19) = True Then 'Outer
                S19Out = True
            End If
            'Engine shed
            If S19Out = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = Clear And TrackSectionUnoccupied(TrackSectionNames.SectionCD) = Clear And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ8W) = SignalAtDanger Then
                If Points.PointReturns(PointNames.P19) = PointInReverse Then
                    Points.PointRequestedOutputs(PointNames.P19) = PointToOFF
                    If SignalSafeToClearTimer(Definitions.SignalNames.S19) = 0 Then
                        SignalSystemState(Definitions.SignalNames.S19) = SignalAtShunt
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

Updated on 2022-11-18 at 16:18:56 +0000
