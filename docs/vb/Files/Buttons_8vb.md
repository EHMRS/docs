---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Buttons.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Buttons.vb



## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/vb/Files/Buttons_8vb/#variable-digitaldeviceaddress)**  |
| ReadOnly int | **[ButtonCount](/SignallingSystem-doc/vb/Files/Buttons_8vb/#variable-buttoncount)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```


### variable ButtonCount

```csharp
ReadOnly int ButtonCount = 40;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Module Buttons
    Public ReadOnly ButtonCount As Integer = 40
    Public ReadOnly buttonDescriptions() As String = {"Error",
     "EB Platform 1 - Inner", "EB Platform 1 - Outer", "EB Platform 1 - Headshunt", "EB Platform 1 - Extension", "EB Platform 1 - EngineShed", "EB Platform 1 - Foxhole",
     "WB Platform 1 - Tunnel", "WB Platform 1 - Extension", "WB Platform 1 - TurnTable",
     "EB Platform 2 - Inner", "EB Platform 2 - Outer", "EB Platform 3 - Outer", "EB Platform 2 - Extension", "EB Platform 2 - EngineShed", "EB Platform 2 - Foxhole",
     "WB Platform 2 - Tunnel", "WB Platform 2 - Extension",
     "Remote Platform 1 - TRTS",
     "Remote Platform 2 - TRTS",
     "Engine Shed - Request",
     "TurnTable - Request",
     "HeadShunt - Request",
     "FoxHole - Request",
     "Platform Controller - TRTS", "Platform Controller - Enable Manual", "NOT USED", "Platform Controller - P1 Approach", "Platform Controller - P2 Approach", "Platform Controller - AUX 1", "Platform Controller - AUX 2", "Platform Controller - AUX 3",
     "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED", "NOT USED"
    }
    Public ButtonIndicatorLight() As Boolean = {True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True}
    Public ButtonRequestError() As Integer = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10}
    Public ButtonHold() As Integer = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10}
    Public ButtonFlash() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public ButtonToggle() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public ButtonRequest() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

    Private ButtonIndicatorStates() As ButtonIndicatorState = New ButtonIndicatorState(ButtonCount) {}
    Private LastButtonIndicatorStates() As ButtonIndicatorState = New ButtonIndicatorState(ButtonCount) {}

    Private Class ButtonIndicatorState
        Public value As Boolean

        Public Shared Operator =(ByVal s1 As ButtonIndicatorState, ByVal s2 As ButtonIndicatorState) As Boolean
            If s1.value = s2.value Then
                Return True
            End If
            Return False
        End Operator
        Public Shared Operator <>(ByVal s1 As ButtonIndicatorState, ByVal s2 As ButtonIndicatorState) As Boolean
            If s1.value = s2.value Then
                Return False
            End If
            Return True
        End Operator
    End Class

    Public Sub initialise()
        For i As Integer = 0 To ButtonCount - 1
            ButtonIndicatorStates(i) = New ButtonIndicatorState()
            ButtonIndicatorStates(i).value = False
            LastButtonIndicatorStates(i) = New ButtonIndicatorState()
            LastButtonIndicatorStates(i).value = False
        Next
    End Sub

    Public Sub ButtonsLogic()
        ButtonErrors()
        If Initializations.ButtonsInitiated = True Then
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for East end of station panel platform 1
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(1 - 1)) = 1 And ButtonHold(ButtonNames.Button1) = 0 Then
                ButtonHold(ButtonNames.Button1) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button2) Or ButtonRequest(ButtonNames.Button3) Or ButtonRequest(ButtonNames.Button4) Or ButtonRequest(ButtonNames.Button5) Or ButtonRequest(ButtonNames.Button6) Then
                    'Button1 = False
                Else
                    ButtonToggle(ButtonNames.Button1) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button1) = True Then
                If ButtonRequest(ButtonNames.Button1) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button1) = False
                    Bell = BellRequestCouncil
                    AJ18EReset = True
                    BackLockAJ1EtoAJ18E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button1) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button1) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(2 - 1)) = 1 And ButtonHold(ButtonNames.Button2) = 0 Then
                ButtonHold(ButtonNames.Button2) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button1) Or ButtonRequest(ButtonNames.Button3) Or ButtonRequest(ButtonNames.Button4) Or ButtonRequest(ButtonNames.Button5) Or ButtonRequest(ButtonNames.Button6) Then
                    'Button2 = False
                Else
                    ButtonToggle(ButtonNames.Button2) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button2) = True Then
                If ButtonRequest(ButtonNames.Button2) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button2) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ1EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button2) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button2) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(3 - 1)) = 1 And ButtonHold(ButtonNames.Button3) = 0 Then
                ButtonHold(ButtonNames.Button3) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button1) Or ButtonRequest(ButtonNames.Button2) Or ButtonRequest(ButtonNames.Button4) Or ButtonRequest(ButtonNames.Button5) Or ButtonRequest(ButtonNames.Button6) Then
                    'Button3 = False
                Else
                    ButtonToggle(ButtonNames.Button3) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button3) = True Then
                If ButtonRequest(ButtonNames.Button3) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button3) = False
                    Bell = BellRequestCouncil
                    BackLockAJ1EtoSiding = SignalBackLockSignalCouncilViaButton
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Then ButtonRequest(ButtonNames.Button3) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button3) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(4 - 1)) = 1 And ButtonHold(ButtonNames.Button4) = 0 Then
                ButtonHold(ButtonNames.Button4) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button1) Or ButtonRequest(ButtonNames.Button2) Or ButtonRequest(ButtonNames.Button3) Or ButtonRequest(ButtonNames.Button5) Or ButtonRequest(ButtonNames.Button6) Then
                    'Button4 = False
                Else
                    ButtonToggle(ButtonNames.Button4) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button4) = True Then
                If ButtonRequest(ButtonNames.Button4) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button4) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ1EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    ' If (Device.SectionG = False Or Device.SectionH = False) And Device.EastBound = True Then Button4Request = True
                    Bell = BellRequestError
                End If
                ButtonToggle(ButtonNames.Button4) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(5 - 1)) = 1 And ButtonHold(ButtonNames.Button5) = 0 Then
                ButtonHold(ButtonNames.Button5) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button1) Or ButtonRequest(ButtonNames.Button2) Or ButtonRequest(ButtonNames.Button3) Or ButtonRequest(ButtonNames.Button4) Or ButtonRequest(ButtonNames.Button6) Then
                    'Button5 = False
                Else
                    ButtonToggle(ButtonNames.Button5) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button5) = True Then
                If ButtonRequest(ButtonNames.Button5) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button5) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ1EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button5) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button5) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(6 - 1)) = 1 And ButtonHold(ButtonNames.Button6) = 0 Then
                ButtonHold(ButtonNames.Button6) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button1) Or ButtonRequest(ButtonNames.Button2) Or ButtonRequest(ButtonNames.Button3) Or ButtonRequest(ButtonNames.Button4) Or ButtonRequest(ButtonNames.Button5) Then
                    'Button6 = False
                Else
                    ButtonToggle(ButtonNames.Button6) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button6) = True Then
                If ButtonRequest(ButtonNames.Button6) = True Then
                    LogicStart.AJ1EReset = True
                    ButtonRequest(ButtonNames.Button6) = False
                    Bell = BellRequestCouncil
                    AJ18EReset = True
                    BackLockAJ1EtoAJ18E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button6) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button6) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for West end of station panel platform 1
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(7 - 1)) = 1 And ButtonHold(ButtonNames.Button7) = 0 Then
                ButtonHold(ButtonNames.Button7) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button8) Or ButtonRequest(ButtonNames.Button9) Then
                    'Button7 = False
                Else
                    ButtonToggle(ButtonNames.Button7) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button7) = True Then
                If ButtonRequest(ButtonNames.Button7) = True Then
                    LogicStart.AJ15WReset = True
                    ButtonRequest(ButtonNames.Button7) = False
                    Bell = BellRequestCouncil
                    AJ3WReset = True
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False) Then ButtonRequest(ButtonNames.Button7) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button7) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(8 - 1)) = 1 And ButtonHold(ButtonNames.Button8) = 0 Then
                ButtonHold(ButtonNames.Button8) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button7) Or ButtonRequest(ButtonNames.Button9) Then
                    'Button8 = False
                Else
                    ButtonToggle(ButtonNames.Button8) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button8) = True Then
                If ButtonRequest(ButtonNames.Button8) = True Then
                    LogicStart.AJ15WReset = True
                    ButtonRequest(ButtonNames.Button8) = False
                    Bell = BellRequestCouncil
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                Else
                    'If (Device.SectionG = False Or Device.SectionH = False) And Device.westBound = True Then Button8Request = True
                    Bell = BellRequestError
                End If
                ButtonToggle(ButtonNames.Button8) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(9 - 1)) = 1 And ButtonHold(ButtonNames.Button9) = 0 Then
                ButtonHold(ButtonNames.Button9) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button7) Or ButtonRequest(ButtonNames.Button8) Then
                    'Button9 = False
                Else
                    ButtonToggle(ButtonNames.Button9) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button9) = True Then
                If ButtonRequest(ButtonNames.Button9) = True Then
                    LogicStart.AJ15WReset = True
                    ButtonRequest(ButtonNames.Button9) = False
                    Bell = BellRequestCouncil
                    BackLockAJ15WtoSiding = SignalBackLockSignalCouncilViaButton
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Then ButtonRequest(ButtonNames.Button9) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button9) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for East end of station panel Platform 2
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(10 - 1)) = 1 And ButtonHold(ButtonNames.Button10) = 0 Then
                ButtonHold(ButtonNames.Button10) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button11) Or ButtonRequest(ButtonNames.Button12) Or ButtonRequest(ButtonNames.Button13) Or ButtonRequest(ButtonNames.Button14) Then
                    'Button10 = False
                Else
                    ButtonToggle(ButtonNames.Button10) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button10) = True Then
                If ButtonRequest(ButtonNames.Button10) = True Then
                    LogicStart.AJ21EReset = True
                    ButtonRequest(ButtonNames.Button10) = False
                    Bell = BellRequestCouncil
                    AJ18EReset = True
                    BackLockAJ21EtoAJ18E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionI) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button10) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button10) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(11 - 1)) = 1 And ButtonHold(ButtonNames.Button11) = 0 Then
                ButtonHold(ButtonNames.Button11) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button10) Or ButtonRequest(ButtonNames.Button12) Or ButtonRequest(ButtonNames.Button13) Or ButtonRequest(ButtonNames.Button14) Then
                    'Button11 = False
                Else
                    ButtonToggle(ButtonNames.Button11) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button11) = True Then
                If ButtonRequest(ButtonNames.Button11) = True Then
                    LogicStart.AJ21EReset = True
                    ButtonRequest(ButtonNames.Button11) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ21EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionI) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button11) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button11) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(12 - 1)) = 1 And ButtonHold(ButtonNames.Button12) = 0 Then
                ButtonHold(ButtonNames.Button12) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button10) Or ButtonRequest(ButtonNames.Button11) Or ButtonRequest(ButtonNames.Button13) Or ButtonRequest(ButtonNames.Button14) Then
                    'Button12 = False
                Else
                    ButtonToggle(ButtonNames.Button12) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button12) = True Then
                If ButtonRequest(ButtonNames.Button12) = True Then
                    LogicStart.AJ21EReset = True
                    ButtonRequest(ButtonNames.Button12) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ21EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    ' If (Device.SectionI = False) And Device.eastBound = True Then Button12Request = True
                    Bell = BellRequestError
                End If
                ButtonToggle(ButtonNames.Button12) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(13 - 1)) = 1 And ButtonHold(ButtonNames.Button13) = 0 Then
                ButtonHold(ButtonNames.Button13) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button10) Or ButtonRequest(ButtonNames.Button11) Or ButtonRequest(ButtonNames.Button12) Or ButtonRequest(ButtonNames.Button14) Then
                    'Button13 = False
                Else
                    ButtonToggle(ButtonNames.Button13) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button13) = True Then
                If ButtonRequest(ButtonNames.Button13) = True Then
                    LogicStart.AJ21EReset = True
                    ButtonRequest(ButtonNames.Button13) = False
                    Bell = BellRequestCouncil
                    AJ16EReset = True
                    BackLockAJ21EtoAJ16E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionI) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button13) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button13) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(14 - 1)) = 1 And ButtonHold(ButtonNames.Button14) = 0 Then
                ButtonHold(ButtonNames.Button14) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button10) Or ButtonRequest(ButtonNames.Button11) Or ButtonRequest(ButtonNames.Button12) Or ButtonRequest(ButtonNames.Button13) Then
                    'Button14 = False
                Else
                    ButtonToggle(ButtonNames.Button14) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button14) = True Then
                If ButtonRequest(ButtonNames.Button14) = True Then
                    LogicStart.AJ21EReset = True
                    ButtonRequest(ButtonNames.Button14) = False
                    Bell = BellRequestCouncil
                    AJ18EReset = True
                    BackLockAJ21EtoAJ18E = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionI) = False) And EastBound = True Then ButtonRequest(ButtonNames.Button14) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button14) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for West end of station panel platform 2
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(15 - 1)) = 1 And ButtonHold(ButtonNames.Button15) = 0 Then
                ButtonHold(ButtonNames.Button15) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button16) Then
                    'Button15 = False
                Else
                    ButtonToggle(ButtonNames.Button15) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button15) = True Then
                If ButtonRequest(ButtonNames.Button15) = True Then
                    LogicStart.AJ22WReset = True
                    ButtonRequest(ButtonNames.Button15) = False
                    Bell = BellRequestCouncil
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                Else
                    If (TrackSectionUnoccupied(TrackSectionNames.SectionI) = False) And WestBound = True Then ButtonRequest(ButtonNames.Button15) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button15) = False
            End If
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(16 - 1)) = 1 And ButtonHold(ButtonNames.Button16) = 0 Then
                ButtonHold(ButtonNames.Button16) = ButtonDebounce
                If ButtonRequest(ButtonNames.Button15) Then
                    'Button16 = False
                Else
                    ButtonToggle(ButtonNames.Button16) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button16) = True Then
                If ButtonRequest(ButtonNames.Button16) = True Then
                    LogicStart.AJ22WReset = True
                    ButtonRequest(ButtonNames.Button16) = False
                    Bell = BellRequestCouncil
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                Else
                    'If (Device.SectionI = False) And Device.westBound = True Then Button16Request = True
                    Bell = BellRequestError
                End If
                ButtonToggle(ButtonNames.Button16) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons Remote platform 1
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(17 - 1)) = 1 And ButtonHold(ButtonNames.Button17) = 0 Then
                ButtonHold(ButtonNames.Button17) = ButtonDebounce
                ButtonToggle(ButtonNames.Button17) = True
            End If
            If ButtonToggle(ButtonNames.Button17) = True Then
                If ButtonRequest(ButtonNames.Button17) = True Then
                    LogicStart.AJ1EReset = True
                    LogicStart.AJ15WReset = True
                    ButtonRequest(ButtonNames.Button17) = False
                    Bell = BellRequestCouncil
                    BackLockAJ1EtoAJ16E = SignalBackLockSignalCouncilViaButton
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                    If AJ18EInner = True Then
                        AJ18EReset = True
                    End If
                    If AJ3WOuter = True Then
                        AJ3WReset = True
                    End If
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Then ButtonRequest(ButtonNames.Button17) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button17) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons Remote platform 2
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(18 - 1)) = 1 And ButtonHold(ButtonNames.Button18) = 0 Then
                ButtonHold(ButtonNames.Button18) = ButtonDebounce
                ButtonToggle(ButtonNames.Button18) = True
            End If
            If ButtonToggle(ButtonNames.Button18) = True Then
                If ButtonRequest(ButtonNames.Button18) = True Then
                    LogicStart.AJ21EReset = True
                    LogicStart.AJ22WReset = True
                    ButtonRequest(ButtonNames.Button18) = False
                    Bell = BellRequestCouncil
                Else
                    'If Device.SectionI = False Then Button18Request = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button18) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for Engine shed road
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(19 - 1)) = 1 And ButtonHold(ButtonNames.Button19) = 0 Then
                ButtonHold(ButtonNames.Button19) = ButtonDebounce
                ButtonToggle(ButtonNames.Button19) = True
            End If
            If ButtonToggle(ButtonNames.Button19) = True Then
                If ButtonRequest(ButtonNames.Button19) = True Then
                    LogicStart.S19Reset = True
                    ButtonRequest(ButtonNames.Button19) = False
                    Bell = BellRequestCouncil
                    BackLockS19Out = SignalBackLockSignalCouncilViaButton
                Else
                    ButtonRequest(ButtonNames.Button19) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button19) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for TurnTable road
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(20 - 1)) = 1 And ButtonHold(ButtonNames.Button20) = 0 Then
                ButtonHold(ButtonNames.Button20) = ButtonDebounce
                ButtonToggle(ButtonNames.Button20) = True
            End If
            If ButtonToggle(ButtonNames.Button20) = True Then
                If ButtonRequest(ButtonNames.Button20) = True Then
                    LogicStart.S12Reset = True
                    ButtonRequest(ButtonNames.Button20) = False
                    Bell = BellRequestCouncil
                    BackLockS12Out = SignalBackLockSignalCouncilViaButton
                Else
                    ButtonRequest(ButtonNames.Button20) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button20) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for HeadShunt road
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(21 - 1)) = 1 And ButtonHold(ButtonNames.Button21) = 0 Then
                ButtonHold(ButtonNames.Button21) = ButtonDebounce
                ButtonToggle(ButtonNames.Button21) = True
            End If
            If ButtonToggle(ButtonNames.Button21) = True Then
                If ButtonRequest(ButtonNames.Button21) = True Then
                    LogicStart.S11Reset = True
                    ButtonRequest(ButtonNames.Button21) = False
                    Bell = BellRequestCouncil
                    BackLockS11Out = SignalBackLockSignalCouncilViaButton
                Else
                    ButtonRequest(ButtonNames.Button21) = True '- -------------------------------------------------------------------------------------------------------------------
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button21) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for Foxhole road
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(22 - 1)) = 1 And ButtonHold(ButtonNames.Button22) = 0 Then
                ButtonHold(ButtonNames.Button22) = ButtonDebounce
                ButtonToggle(ButtonNames.Button22) = True
            End If
            If ButtonToggle(ButtonNames.Button22) = True Then
                If ButtonRequest(ButtonNames.Button22) = True Then
                    LogicStart.S14Reset = True
                    ButtonRequest(ButtonNames.Button22) = False
                    Bell = BellRequestCouncil
                    BackLockS14Out = SignalBackLockSignalCouncilViaButton
                Else
                    ButtonRequest(ButtonNames.Button22) = True
                    Bell = BellRequestShunt
                End If
                ButtonToggle(ButtonNames.Button22) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for middle of station panel platform 1
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(23 - 1)) = 1 And ButtonHold(ButtonNames.Button23) = 0 Then
                ButtonHold(ButtonNames.Button23) = ButtonDebounce
                ButtonToggle(ButtonNames.Button23) = True
            End If
            If ButtonToggle(ButtonNames.Button23) = True Then
                If ButtonRequest(ButtonNames.Button23) = True Then
                    LogicStart.AJ1EReset = True
                    LogicStart.AJ15WReset = True
                    ButtonRequest(ButtonNames.Button23) = False
                    Bell = BellRequestCouncil
                    BackLockAJ1EtoAJ16E = SignalBackLockSignalCouncilViaButton
                    BackLockAJ15WtoAJ3W = SignalBackLockSignalCouncilViaButton
                    If AJ18EInner = True Then
                        AJ18EReset = True
                    End If
                    If AJ3WOuter = True Then
                        AJ3WReset = True
                    End If
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Then ButtonRequest(ButtonNames.Button23) = True
                    Bell = BellRequestMainLine
                End If
                ButtonToggle(ButtonNames.Button23) = False
            End If
            'Call On Buttons
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(25 - 1)) = 1 And ButtonHold(ButtonNames.Button25) = 0 Then
                ButtonHold(ButtonNames.Button25) = ButtonDebounce
                ButtonToggle(ButtonNames.Button25) = True
            End If
            If ButtonToggle(ButtonNames.Button25) = True Then
                If ButtonRequest(ButtonNames.Button25) = True Then
                    ButtonRequest(ButtonNames.Button25) = False
                Else
                    ButtonRequest(ButtonNames.Button25) = True
                End If
                ButtonToggle(ButtonNames.Button25) = False
            End If
            If SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger And SignalOutputState(Definitions.SignalNames.AJ18W) = SignalAtDanger Then
                ButtonFlash(ButtonNames.Button25) = False
            Else
                ButtonFlash(ButtonNames.Button25) = True
            End If
            If EastBound = True Then
                If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(26 - 1)) = 1 And ButtonHold(ButtonNames.Button26) = 0 And (TrackSectionUnoccupied(TrackSectionNames.SectionE) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionDE) = False) Then
                    ButtonHold(ButtonNames.Button26) = ButtonDebounce
                    ButtonToggle(ButtonNames.Button26) = True
                End If
            ElseIf WestBound = True Then
                If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(26 - 1)) = 1 And ButtonHold(ButtonNames.Button26) = 0 And TrackSectionUnoccupied(TrackSectionNames.SectionN) = False Then
                    ButtonHold(ButtonNames.Button26) = ButtonDebounce
                    ButtonToggle(ButtonNames.Button26) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button26) = True Then
                If EastBound Then
                    If ButtonRequest(ButtonNames.Button26) = True Then
                        ButtonRequest(ButtonNames.Button26) = False
                        LogicStart.AJ4EPlatform1 = False
                        Signals.SignalTimer(Definitions.SignalNames.AJ4E) = TimerDisabled
                    ElseIf ButtonRequest(ButtonNames.Button25) = True Then
                        ButtonRequest(ButtonNames.Button26) = True
                    End If
                ElseIf WestBound Then
                    If ButtonRequest(ButtonNames.Button26) = True Then
                        ButtonRequest(ButtonNames.Button26) = False
                        LogicStart.AJ18WPlatform1 = False
                        Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled
                    ElseIf ButtonRequest(ButtonNames.Button25) = True Then
                        ButtonRequest(ButtonNames.Button26) = True
                    End If
                End If
                ButtonToggle(ButtonNames.Button26) = False
            End If
            If EastBound = True Then
                If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(27 - 1)) = 1 And ButtonHold(ButtonNames.Button27) = 0 And (TrackSectionUnoccupied(TrackSectionNames.SectionE) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionDE) = False) Then
                    ButtonHold(ButtonNames.Button27) = ButtonDebounce
                    ButtonToggle(ButtonNames.Button27) = True
                End If
            ElseIf WestBound = True Then
                If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(27 - 1)) = 1 And ButtonHold(ButtonNames.Button27) = 0 And TrackSectionUnoccupied(TrackSectionNames.SectionN) = False Then
                    ButtonHold(ButtonNames.Button27) = ButtonDebounce
                    ButtonToggle(ButtonNames.Button27) = True
                End If
            End If
            If ButtonToggle(ButtonNames.Button27) = True Then
                If EastBound Then
                    If ButtonRequest(ButtonNames.Button27) = True Then
                        ButtonRequest(ButtonNames.Button27) = False
                        LogicStart.AJ4EPlatform2 = False
                        Signals.SignalTimer(Definitions.SignalNames.AJ4E) = TimerDisabled
                    ElseIf ButtonRequest(ButtonNames.Button25) = True Then
                        ButtonRequest(ButtonNames.Button27) = True
                    End If
                ElseIf WestBound Then
                    If ButtonRequest(ButtonNames.Button27) = True Then
                        ButtonRequest(ButtonNames.Button27) = False
                        LogicStart.AJ18WPlatform2 = False
                        Signals.SignalTimer(Definitions.SignalNames.AJ18E) = TimerDisabled
                    ElseIf ButtonRequest(ButtonNames.Button25) = True Then
                        ButtonRequest(ButtonNames.Button27) = True
                    End If
                End If
                ButtonToggle(ButtonNames.Button27) = False
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'AUX Sounds
            'AUX 1
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(28 - 1)) = 1 And ButtonHold(ButtonNames.Button28) = 0 Then
                ButtonHold(ButtonNames.Button28) = ButtonDebounce
                ButtonToggle(ButtonNames.Button28) = True
            End If
            If ButtonToggle(ButtonNames.Button28) = True Then
                If ButtonRequest(ButtonNames.Button28) = True Then
                    ButtonRequest(ButtonNames.Button28) = False
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionI) = False Then
                        Sound.AUXSound1()
                        ButtonRequest(ButtonNames.Button28) = True
                    End If
                End If
                ButtonToggle(ButtonNames.Button28) = False
            End If
            'AUX 2
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(29 - 1)) = 1 And ButtonHold(ButtonNames.Button29) = 0 Then
                ButtonHold(ButtonNames.Button29) = ButtonDebounce
                ButtonToggle(ButtonNames.Button29) = True
            End If
            If ButtonToggle(ButtonNames.Button29) = True Then
                If ButtonRequest(ButtonNames.Button29) = True Then
                    ButtonRequest(ButtonNames.Button29) = False
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionI) = False Then
                        Sound.AUXSound2()
                        ButtonRequest(ButtonNames.Button29) = True
                    End If
                End If
                ButtonToggle(ButtonNames.Button29) = False
            End If
            'AUX 3
            If Serial.DataReadInputsArray(DigitalDeviceAddress.InputAddressButton(30 - 1)) = 1 And ButtonHold(ButtonNames.Button30) = 0 Then
                ButtonHold(ButtonNames.Button30) = ButtonDebounce
                ButtonToggle(ButtonNames.Button30) = True
            End If
            If ButtonToggle(ButtonNames.Button30) = True Then
                If ButtonRequest(ButtonNames.Button30) = True Then
                    ButtonRequest(ButtonNames.Button30) = False
                Else
                    If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionI) = False Then
                        Sound.AUXSound3()
                        ButtonRequest(ButtonNames.Button30) = True
                    End If
                End If
                ButtonToggle(ButtonNames.Button30) = False
            End If
        Else
            For i As Integer = 0 To ButtonCount - 1
                ButtonRequest(i) = False 'Clear all requests if buttons not initilized
            Next
        End If
    End Sub
    'Button Indicators
    Public Sub ButtonIndicators()
        If Points.TestMode = True Then
            For i As Integer = 0 To ButtonCount - 1
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(i)) = 1 'Illuminate all buttons
            Next
        Else
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for East end of station panel platform 1
            'Button 1
            If ButtonHold(ButtonNames.Button1) = 0 Then
                If EastBound = True Then
                    If (ButtonRequest(ButtonNames.Button1) = True Or ButtonRequest(ButtonNames.Button17) = True Or ButtonRequest(ButtonNames.Button23) = True) Then
                        If ButtonFlash(ButtonNames.Button1) = False And ButtonFlash(ButtonNames.Button17) = False Then
                            ButtonIndicatorLight(ButtonNames.Button1) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button1) = Not ButtonIndicatorLight(ButtonNames.Button1)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button1) = 0
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button1) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button1) = 1
            End If
            'Button 2
            If ButtonHold(ButtonNames.Button2) = 0 Then
                If ButtonRequest(ButtonNames.Button2) = True Then
                    If ButtonFlash(ButtonNames.Button2) = False Then
                        ButtonIndicatorLight(ButtonNames.Button2) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button2) = Not ButtonIndicatorLight(ButtonNames.Button2)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button2) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button2) = 1
            End If
            'Button 3
            If ButtonHold(ButtonNames.Button3) = 0 Then
                If ButtonRequest(ButtonNames.Button3) = True Then
                    If ButtonFlash(ButtonNames.Button3) = False Then
                        ButtonIndicatorLight(ButtonNames.Button3) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button3) = Not ButtonIndicatorLight(ButtonNames.Button3)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button3) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button3) = 1
            End If
            'Button 4
            If ButtonHold(ButtonNames.Button4) = 0 Then
                If ButtonRequest(ButtonNames.Button4) = True Then
                    If ButtonFlash(ButtonNames.Button4) = False Then
                        ButtonIndicatorLight(ButtonNames.Button4) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button4) = Not ButtonIndicatorLight(ButtonNames.Button4)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button4) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button4) = 1
            End If
            'Button 5
            If ButtonHold(ButtonNames.Button5) = 0 Then
                If ButtonRequest(ButtonNames.Button5) = True Then
                    If ButtonFlash(ButtonNames.Button5) = False Then
                        ButtonIndicatorLight(ButtonNames.Button5) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button5) = Not ButtonIndicatorLight(ButtonNames.Button5)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button5) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button5) = 1
            End If
            'Button 6
            If ButtonHold(ButtonNames.Button6) = 0 Then
                If ButtonRequest(ButtonNames.Button6) = True Then
                    If ButtonFlash(ButtonNames.Button6) = False Then
                        ButtonIndicatorLight(ButtonNames.Button6) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button6) = Not ButtonIndicatorLight(ButtonNames.Button6)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button6) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button6) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for West end of station panel platform 1
            'Button 7
            If ButtonHold(ButtonNames.Button7) = 0 Then
                If WestBound = True Then
                    If (ButtonRequest(ButtonNames.Button7) = True Or ButtonRequest(ButtonNames.Button17) = True Or ButtonRequest(ButtonNames.Button23) = True) Then
                        If ButtonFlash(ButtonNames.Button7) = False And ButtonFlash(ButtonNames.Button17) = False Then
                            ButtonIndicatorLight(ButtonNames.Button7) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button7) = Not ButtonIndicatorLight(ButtonNames.Button7)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button7) = 0
                    End If
                ElseIf EastBound = True Then
                    If (ButtonRequest(ButtonNames.Button7) = True) Then
                        If ButtonFlash(ButtonNames.Button7) = False And ButtonFlash(ButtonNames.Button17) = False Then
                            ButtonIndicatorLight(ButtonNames.Button7) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button7) = Not ButtonIndicatorLight(ButtonNames.Button7)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button7) = 0
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button7) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button7) = 1
            End If
            'Button 8
            If ButtonHold(ButtonNames.Button8) = 0 Then
                If ButtonRequest(ButtonNames.Button8) = True Then
                    If ButtonFlash(ButtonNames.Button8) = False Then
                        ButtonIndicatorLight(ButtonNames.Button8) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button8) = Not ButtonIndicatorLight(ButtonNames.Button8)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button8) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button8) = 1
            End If
            'Button 9
            If ButtonHold(ButtonNames.Button9) = 0 Then
                If ButtonRequest(ButtonNames.Button9) = True Then
                    If ButtonFlash(ButtonNames.Button9) = False Then
                        ButtonIndicatorLight(ButtonNames.Button9) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button9) = Not ButtonIndicatorLight(ButtonNames.Button9)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button9) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button9) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for East end of station panel Platform 2
            'Button 10
            If ButtonHold(ButtonNames.Button10) = 0 Then
                If ButtonRequest(ButtonNames.Button10) = True Then
                    If ButtonFlash(ButtonNames.Button10) = False Then
                        ButtonIndicatorLight(ButtonNames.Button10) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button10) = Not ButtonIndicatorLight(ButtonNames.Button10)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button10) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button10) = 1
            End If
            'Button 11
            If ButtonHold(ButtonNames.Button11) = 0 Then
                If ButtonRequest(ButtonNames.Button11) = True Then
                    If ButtonFlash(ButtonNames.Button11) = False Then
                        ButtonIndicatorLight(ButtonNames.Button11) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button11) = Not ButtonIndicatorLight(ButtonNames.Button11)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button11) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button11) = 1
            End If
            'Button 12
            If ButtonHold(ButtonNames.Button12) = 0 Then
                If ButtonRequest(ButtonNames.Button12) = True Then
                    If ButtonFlash(ButtonNames.Button12) = False Then
                        ButtonIndicatorLight(ButtonNames.Button12) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button12) = Not ButtonIndicatorLight(ButtonNames.Button12)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button12) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button12) = 1
            End If
            'Button 13
            If ButtonHold(ButtonNames.Button13) = 0 Then
                If ButtonRequest(ButtonNames.Button13) = True Then
                    If ButtonFlash(ButtonNames.Button13) = False Then
                        ButtonIndicatorLight(ButtonNames.Button13) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button13) = Not ButtonIndicatorLight(ButtonNames.Button13)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button13) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button13) = 1
            End If
            'Button 14
            If ButtonHold(ButtonNames.Button14) = 0 Then
                If ButtonRequest(ButtonNames.Button14) = True Then
                    If ButtonFlash(ButtonNames.Button14) = False Then
                        ButtonIndicatorLight(ButtonNames.Button14) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button14) = Not ButtonIndicatorLight(ButtonNames.Button14)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button14) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button14) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for West end of station panel platform 2
            'Button 15
            If ButtonHold(ButtonNames.Button15) = 0 Then
                If ButtonRequest(ButtonNames.Button15) = True Then
                    If ButtonFlash(ButtonNames.Button15) = False Then
                        ButtonIndicatorLight(ButtonNames.Button15) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button15) = Not ButtonIndicatorLight(ButtonNames.Button15)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button15) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button15) = 1
            End If
            'Button 16
            If ButtonHold(ButtonNames.Button16) = 0 Then
                If ButtonRequest(ButtonNames.Button16) = True Then
                    If ButtonFlash(ButtonNames.Button16) = False Then
                        ButtonIndicatorLight(ButtonNames.Button16) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button16) = Not ButtonIndicatorLight(ButtonNames.Button16)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button16) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button16) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for middle of station panel platform 1
            If ButtonHold(ButtonNames.Button17) = 0 Then
                If EastBound = True Then
                    If (ButtonRequest(ButtonNames.Button1) = True Or ButtonRequest(ButtonNames.Button17) = True Or ButtonRequest(ButtonNames.Button23) = True) Then
                        If ButtonFlash(ButtonNames.Button1) = False And ButtonFlash(ButtonNames.Button17) = False Then
                            ButtonIndicatorLight(ButtonNames.Button17) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button17) = Not ButtonIndicatorLight(ButtonNames.Button17)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button17) = 0
                    End If
                ElseIf WestBound = True Then
                    If (ButtonRequest(ButtonNames.Button7) = True Or ButtonRequest(ButtonNames.Button17) = True Or ButtonRequest(ButtonNames.Button23) = True) Then
                        If ButtonFlash(ButtonNames.Button7) = False And ButtonFlash(ButtonNames.Button17) = False Then
                            ButtonIndicatorLight(ButtonNames.Button17) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button17) = Not ButtonIndicatorLight(ButtonNames.Button17)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button17) = 0
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button17) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button17) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for middle of station panel platform 2
            'Button 18
            If ButtonHold(ButtonNames.Button18) = 0 Then
                If EastBound = True Then
                    If ButtonRequest(ButtonNames.Button18) = True Then
                        ButtonIndicatorLight(ButtonNames.Button10) = 1
                        ButtonRequest(ButtonNames.Button18) = False
                    End If
                    ButtonIndicatorLight(ButtonNames.Button18) = ButtonIndicatorLight(ButtonNames.Button10)
                ElseIf WestBound = True Then
                    If ButtonRequest(ButtonNames.Button18) = True Then
                        ButtonIndicatorLight(ButtonNames.Button15) = 1
                        ButtonRequest(ButtonNames.Button18) = False
                    End If
                    ButtonIndicatorLight(ButtonNames.Button18) = ButtonIndicatorLight(ButtonNames.Button15)
                Else

                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button18) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for Engine shed road
            'Button 19
            If ButtonHold(ButtonNames.Button19) = 0 Then
                If ButtonRequest(ButtonNames.Button19) = True Then
                    If ButtonFlash(ButtonNames.Button19) = False Then
                        ButtonIndicatorLight(ButtonNames.Button19) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button19) = Not ButtonIndicatorLight(ButtonNames.Button19)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button19) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button19) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for TurnTable road
            'Button 20
            If ButtonHold(ButtonNames.Button20) = 0 Then
                If ButtonRequest(ButtonNames.Button20) = True Then
                    If ButtonFlash(ButtonNames.Button20) = False Then
                        ButtonIndicatorLight(ButtonNames.Button20) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button20) = Not ButtonIndicatorLight(ButtonNames.Button20)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button20) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button20) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for HeadShunt road
            'Button 21
            If ButtonHold(ButtonNames.Button21) = 0 Then
                If ButtonRequest(ButtonNames.Button21) = True Then
                    If ButtonFlash(ButtonNames.Button21) = False Then
                        ButtonIndicatorLight(ButtonNames.Button21) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button21) = Not ButtonIndicatorLight(ButtonNames.Button21)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button21) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button21) = 1
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for Foxhole road
            'Button 22
            If ButtonHold(ButtonNames.Button22) = 0 Then
                If ButtonRequest(ButtonNames.Button22) = True Then
                    If ButtonFlash(ButtonNames.Button22) = False Then
                        ButtonIndicatorLight(ButtonNames.Button22) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button22) = Not ButtonIndicatorLight(ButtonNames.Button22)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button22) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button22) = 1
            End If
            'Not used yet
            ButtonIndicatorLight(ButtonNames.Button24) = 0
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Buttons for middle of station panel platform 1
            If ButtonHold(ButtonNames.Button23) = 0 Then
                If EastBound = True Then
                    If ButtonRequest(ButtonNames.Button1) = True Or ButtonRequest(ButtonNames.Button17) = True Or ButtonRequest(ButtonNames.Button23) = True Then
                        If ButtonFlash(ButtonNames.Button1) = False And ButtonFlash(ButtonNames.Button23) = False Then
                            ButtonIndicatorLight(ButtonNames.Button23) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button23) = Not ButtonIndicatorLight(ButtonNames.Button23)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button23) = 0
                    End If
                ElseIf WestBound = True Then
                    If (ButtonRequest(ButtonNames.Button7) = True Or ButtonRequest(ButtonNames.Button23) = True Or ButtonRequest(ButtonNames.Button17) = True) Then
                        If ButtonFlash(ButtonNames.Button7) = False And ButtonFlash(ButtonNames.Button23) = False Then
                            ButtonIndicatorLight(ButtonNames.Button23) = 1
                        Else
                            ButtonIndicatorLight(ButtonNames.Button23) = Not ButtonIndicatorLight(ButtonNames.Button23)
                        End If
                    Else
                        ButtonIndicatorLight(ButtonNames.Button23) = 0
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button23) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button23) = 1
            End If
            'Buttons for Calling On
            'Button 25
            If ButtonHold(ButtonNames.Button25) = 0 Then
                If ButtonRequest(ButtonNames.Button25) = True Then
                    If ButtonFlash(ButtonNames.Button25) = False Then
                        ButtonIndicatorLight(ButtonNames.Button25) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button25) = Not ButtonIndicatorLight(ButtonNames.Button25)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button25) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button25) = 1
            End If
            'Button 26 and 27
            If EastBound Then
                If (TrackSectionUnoccupied(TrackSectionNames.SectionE) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionDE) = False) And (TrackSectionUnoccupied(TrackSectionNames.SectionF) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = True) And ButtonRequest(ButtonNames.Button25) = True Then
                    If ButtonRequest(ButtonNames.Button26) = True Then
                        ButtonIndicatorLight(ButtonNames.Button26) = 1
                        ButtonIndicatorLight(ButtonNames.Button27) = 0
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                    ElseIf ButtonRequest(ButtonNames.Button27) = True Then
                        ButtonIndicatorLight(ButtonNames.Button27) = 1
                        ButtonIndicatorLight(ButtonNames.Button26) = 0
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                    Else
                        ButtonIndicatorLight(ButtonNames.Button26) = Not ButtonIndicatorLight(ButtonNames.Button26)
                        ButtonIndicatorLight(ButtonNames.Button27) = Not ButtonIndicatorLight(ButtonNames.Button27)
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 1
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button26) = 0
                    ButtonIndicatorLight(ButtonNames.Button27) = 0
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                End If
            ElseIf WestBound Then
                If (TrackSectionUnoccupied(TrackSectionNames.SectionN) = False) And (TrackSectionUnoccupied(TrackSectionNames.SectionM) = True) And ButtonRequest(ButtonNames.Button25) = True Then
                    If ButtonRequest(ButtonNames.Button26) = True Then
                        ButtonIndicatorLight(ButtonNames.Button26) = 1
                        ButtonIndicatorLight(ButtonNames.Button27) = 0
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                    ElseIf ButtonRequest(ButtonNames.Button27) = True Then
                        ButtonIndicatorLight(ButtonNames.Button27) = 1
                        ButtonIndicatorLight(ButtonNames.Button26) = 0
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                    Else
                        ButtonIndicatorLight(ButtonNames.Button26) = Not ButtonIndicatorLight(ButtonNames.Button26)
                        ButtonIndicatorLight(ButtonNames.Button27) = Not ButtonIndicatorLight(ButtonNames.Button27)
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 1
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button26) = 0
                    ButtonIndicatorLight(ButtonNames.Button27) = 0
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCallInBuzzer) = 0
                End If
            End If
            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'AUX Sounds
            'Button 28
            If ButtonHold(ButtonNames.Button28) = 0 Then
                If ButtonRequest(ButtonNames.Button28) = True Then
                    If ButtonFlash(ButtonNames.Button28) = False Then
                        ButtonIndicatorLight(ButtonNames.Button28) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button28) = Not ButtonIndicatorLight(ButtonNames.Button28)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button28) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button28) = 1
            End If
            'Button 29
            If ButtonHold(ButtonNames.Button29) = 0 Then
                If ButtonRequest(ButtonNames.Button29) = True Then
                    If ButtonFlash(ButtonNames.Button29) = False Then
                        ButtonIndicatorLight(ButtonNames.Button29) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button29) = Not ButtonIndicatorLight(ButtonNames.Button29)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button29) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button29) = 1
            End If
            'Button 30
            If ButtonHold(ButtonNames.Button30) = 0 Then
                If ButtonRequest(ButtonNames.Button30) = True Then
                    If ButtonFlash(ButtonNames.Button30) = False Then
                        ButtonIndicatorLight(ButtonNames.Button30) = 1
                    Else
                        ButtonIndicatorLight(ButtonNames.Button30) = Not ButtonIndicatorLight(ButtonNames.Button30)
                    End If
                Else
                    ButtonIndicatorLight(ButtonNames.Button30) = 0
                End If
            Else
                ButtonIndicatorLight(ButtonNames.Button30) = 1
            End If

            '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            'Not Used
            ButtonIndicatorLight(ButtonNames.Button31) = 0
            ButtonIndicatorLight(ButtonNames.Button32) = 0


            For i As Integer = 0 To ButtonCount - 1
                If RuntimeConfig.config.ButtonIndicatorState(i) = "System" Then
                    If ButtonIndicatorLight(i) = 0 Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(i)) = 0
                        ButtonIndicatorStates(i).value = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(i)) = 1
                        ButtonIndicatorStates(i).value = True
                    End If
                ElseIf RuntimeConfig.config.ButtonIndicatorState(i) = "Off" Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(i)) = 0
                    ButtonIndicatorStates(i).value = False
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(i)) = 1
                    ButtonIndicatorStates(i).value = True
                End If

                If ButtonIndicatorStates(i) = LastButtonIndicatorStates(i) Then
                    Continue For
                End If
                Dim json As String

                json = Newtonsoft.Json.JsonConvert.SerializeObject(ButtonIndicatorStates(i))
                SignallingMqtt.Client.sendOutputState("buttons/" + Convert.ToString(i + 1), json)
                LastButtonIndicatorStates(i).value = ButtonIndicatorStates(i).value
            Next
        End If
    End Sub
    'Button Error Detection
    Public Sub ButtonErrors()
        For i As Integer = 0 To ButtonCount - 1
            If ButtonRequest(i) = False Then ButtonRequestError(i) = ButttonFaultTime
            If ButtonRequestError(i) = 0 Then
                Errors.NewError("Button Request " & i + 1 & " taking too long")
            Else
                Errors.RemoveError("Button Request " & i + 1 & " taking too long")
            End If
        Next
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
        For i As Integer = 0 To ButtonCount - 1
            If Not ButtonHold(i) = 0 Then ButtonHold(i) -= 1
            If Not ButtonRequestError(i) = 0 Then ButtonRequestError(i) -= 1
        Next
        'Prevent countdown reaching zero
        ButtonRequestError(25 - 1) = 5
    End Sub

    ''' <summary>
    ''' Update the button output override state to turn on or off the halo
    ''' </summary>
    ''' <param name="button"></param>
    ''' <param name="state"></param>
    Public Sub updateButtonOutputOverride(ByVal button As Integer, ByVal state As Definitions.ButtonOutputState)
        If button > ButtonCount - 1 Or button = 0 Then
            Return
        End If
        Dim buttonIndex As Integer = button - 1

        If state = Definitions.ButtonOutputState.IndicatorOn Then
            RuntimeConfig.config.ButtonIndicatorState(buttonIndex) = "On"
        ElseIf state = Definitions.ButtonOutputState.IndicatorOff Then
            RuntimeConfig.config.ButtonIndicatorState(buttonIndex) = "Off"
        ElseIf state = Definitions.ButtonOutputState.System Then
            RuntimeConfig.config.ButtonIndicatorState(buttonIndex) = "System"
        End If
    End Sub

    Public Sub updateButtonEnabled(ByVal button As Integer, ByVal state As Boolean)
        If button > ButtonCount - 1 Or button = 0 Then
            Return
        End If
        Dim buttonIndex As Integer = button - 1

        If state Then
            RuntimeConfig.config.ButtonEnabled(buttonIndex) = "True"
        Else
            RuntimeConfig.config.ButtonEnabled(buttonIndex) = "False"
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
