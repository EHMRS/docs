---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Signals.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Signals.vb



## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/vb/Files/Signals_8vb/#variable-digitaldeviceaddress)**  |
| int | **[SignalCount](/SignallingSystem-doc/vb/Files/Signals_8vb/#variable-signalcount)**  |



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```


### variable SignalCount

```csharp
int SignalCount = 25;
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Module Signals
    Public SignalCount As Integer = 25
    Public ReadOnly SignalDisplayNames() As String = {"AJ1E", "AJ2E", "AJ3E", "RAJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E",
        "AJ3W", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W", "S11", "S12", "S14", "S19"}
    Public ReadOnly SignalInternalNames() As String = {"AJ1E", "AJ2E", "AJ3E", "RAJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E",
        "AJ3W", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W", "S11", "S12", "S14", "S19"}
    Public SignalSystemState(SignalCount) As String
    Public SignalOutputState(SignalCount) As String
    Public SignalTimerAnnouncementDelay(SignalCount) As Integer
    Public SignalTimer(SignalCount) As Integer
    Public SignalTimeOut(SignalCount) As Integer
    Public SignalSafeToClearTimer(SignalCount) As Integer

    Private SignalOutputs() As SignalOutput = New SignalOutput(SignalCount) {}
    Private LastSignalOutputs() As SignalOutput = New SignalOutput(SignalCount) {}

    Private Class SignalOutput
        Public danger As Boolean
        Public caution As Boolean
        Public clear As Boolean
        Public route_1 As Boolean
        Public route_2 As Boolean
        Public shunt As Boolean

        Public Shared Operator =(ByVal s1 As SignalOutput, ByVal s2 As SignalOutput) As Boolean
            If s1.danger = s2.danger And s1.caution = s2.caution And s1.clear = s2.clear And s1.route_1 = s2.route_1 And s1.route_2 = s2.route_2 And s1.shunt = s2.shunt Then
                Return True
            End If
            Return False
        End Operator
        Public Shared Operator <>(ByVal s1 As SignalOutput, ByVal s2 As SignalOutput) As Boolean
            If s1.danger = s2.danger And s1.caution = s2.caution And s1.clear = s2.clear And s1.route_1 = s2.route_1 And s1.route_2 = s2.route_2 And s1.shunt = s2.shunt Then
                Return False
            End If
            Return True
        End Operator
    End Class

    Private Sub updateSignalOutput(ByVal signalIndex As Integer, ByVal output As SignalOutput)
        If LastSignalOutputs(signalIndex) = output Then
            ' This is the same as last time - do nothing
            Return
        End If
        Dim json As String

        json = Newtonsoft.Json.JsonConvert.SerializeObject(output)
        SignallingMqtt.Client.sendOutputState("signals/" + SignalInternalNames(signalIndex), json)
        LastSignalOutputs(signalIndex).danger = output.danger
        LastSignalOutputs(signalIndex).caution = output.caution
        LastSignalOutputs(signalIndex).clear = output.clear
        LastSignalOutputs(signalIndex).route_1 = output.route_1
        LastSignalOutputs(signalIndex).route_2 = output.route_2
        LastSignalOutputs(signalIndex).shunt = output.shunt
    End Sub

    Public Sub updateSignalOverride(ByVal signal As String, ByVal state As Definitions.SignalOutputStates)
        ' Get signal based on name
        Dim signalIndex As Integer = Array.IndexOf(SignalInternalNames, signal)

        ' Check that the signal actually exists in our system.
        If signalIndex = -1 Then
            ' This signal does not exist
            Return
        End If

        If state = Definitions.SignalOutputStates.Danger Then
            RuntimeConfig.config.SignalState(signalIndex) = Definitions.SignalAtDanger
        ElseIf state = Definitions.SignalOutputStates.Caution Then
            RuntimeConfig.config.SignalState(signalIndex) = Definitions.SignalAtCaution
        ElseIf state = Definitions.SignalOutputStates.Clear Then
            RuntimeConfig.config.SignalState(signalIndex) = Definitions.SignalAtClear
        ElseIf state = Definitions.SignalOutputStates.Shunt Then
            RuntimeConfig.config.SignalState(signalIndex) = Definitions.SignalAtShunt
        ElseIf state = Definitions.SignalOutputStates.Bypass Then
            RuntimeConfig.config.SignalState(signalIndex) = Definitions.SignalAtBypass
        ElseIf state = Definitions.SignalOutputStates.System Then
            RuntimeConfig.config.SignalState(signalIndex) = "System"
        End If
    End Sub
    Public Sub initialise()
        For i As Integer = 0 To SignalCount
            SignalSystemState(i) = Definitions.SignalAtDanger
            SignalOutputState(i) = Definitions.SignalAtDanger
            SignalTimer(i) = StaticValues.TimerDisabled
            SignalTimeOut(i) = StaticValues.TimerDisabled
            SignalTimerAnnouncementDelay(i) = StaticValues.TimerDisabled
            SignalSafeToClearTimer(i) = 2
            DigitalDeviceAddress.SignalOutputAddressClear(i) = -1
            DigitalDeviceAddress.SignalOutputAddressCaution(i) = -1
            DigitalDeviceAddress.SignalOutputAddressDanger(i) = -1
            DigitalDeviceAddress.SignalOutputAddressRoute1(i) = -1
            DigitalDeviceAddress.SignalOutputAddressRoute2(i) = -1
            DigitalDeviceAddress.SignalOutputAddressShunt(i) = -1
            SignalOutputs(i) = New SignalOutput()
            SignalOutputs(i).danger = False
            SignalOutputs(i).caution = False
            SignalOutputs(i).clear = False
            SignalOutputs(i).route_1 = False
            SignalOutputs(i).route_2 = False
            SignalOutputs(i).shunt = False
            LastSignalOutputs(i) = New SignalOutput()
            LastSignalOutputs(i).danger = False
            LastSignalOutputs(i).caution = False
            LastSignalOutputs(i).clear = False
            LastSignalOutputs(i).route_1 = False
            LastSignalOutputs(i).route_2 = False
            LastSignalOutputs(i).shunt = False
        Next
        initialiseAddresses()
    End Sub
    Public Sub Signals()
        'AUX
        If (SignalAspectPower = True And EastBound = True) Or Points.TestMode = True Then
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressAJ16WLimitOfShunt) = 1
        Else
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressAJ16WLimitOfShunt) = 0
        End If
        'AJ1E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ1E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ1E) = "Clear" Then
                If (Points.PointReturns(PointNames.P5a) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtDanger) Or (Points.PointReturns(PointNames.P5a) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtShunt) Or (Points.PointReturns(PointNames.P5a) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ18E) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ1E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                    End If
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 1
                    SignalOutputState(Definitions.SignalNames.AJ1E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ1E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                    End If
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 1
                    SignalOutputState(Definitions.SignalNames.AJ1E) = "Clear"
                End If
            ElseIf SignalSystemState(Definitions.SignalNames.AJ1E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ1E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ1E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                End If
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                End If
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ1E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ1E).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEBOFFIndicator) = 0
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ1E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E))
            End If
        End If
        'AJ2E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = True
                SignalOutputState(Definitions.SignalNames.AJ2E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ2E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ2E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ2E) = "Clear" Then
                If (Points.PointReturns(PointNames.P6a) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ18E) = SignalAtDanger) Or (Points.PointReturns(PointNames.P6a) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtShunt) Or (Points.PointReturns(PointNames.P6a) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ2E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                    If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ2E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ2E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                    If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ2E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ2E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ2E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ2E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ2E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ2E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ2E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ2E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E))
            End If
        End If
        'AJ3E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ3E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ3E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ3E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ3E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ3E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ3E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ3E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ3E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ3E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ3E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E))
            End If
        End If
        'RAJ3E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.RAJ3E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.RAJ3E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ4E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 1
                    SignalOutputs(Definitions.SignalNames.RAJ3E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                    SignalOutputState(Definitions.SignalNames.RAJ3E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 1
                    SignalOutputs(Definitions.SignalNames.RAJ3E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                    SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                    SignalOutputState(Definitions.SignalNames.RAJ3E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ3E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = True
                SignalOutputState(Definitions.SignalNames.RAJ3E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                SignalOutputState(Definitions.SignalNames.RAJ3E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 1
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                SignalOutputState(Definitions.SignalNames.RAJ3E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E)) = 0
                SignalOutputs(Definitions.SignalNames.RAJ3E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E))
            End If
        End If
        'AJ4E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = True
                SignalOutputState(Definitions.SignalNames.AJ4E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ4E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ4E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ4E) = "Clear" Then
                If (Points.PointReturns(PointNames.P13) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ7E) = SignalAtDanger) Or (Points.PointReturns(PointNames.P13) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ21E) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ4E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                    If Points.PointReturns(PointNames.P13) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ4E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ4E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                    If Points.PointReturns(PointNames.P13) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ4E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ4E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ4E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ4E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                If Points.PointReturns(PointNames.P13) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ4E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                If Points.PointReturns(PointNames.P13) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ4E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ4E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ4E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E))
            End If
        End If
        'AJ7E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ7E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ7E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ7E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ7E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ7E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ7E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ7E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E))
            End If
        End If
        'AJ8E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ8E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ8E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ3E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ8E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ8E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ8E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ8E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ8E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ8E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ8E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ8E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ8E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E))
            End If
        End If
        'AJ9E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ9E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ9E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ17E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ9E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                    SignalOutputState(Definitions.SignalNames.AJ9E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ9E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                    SignalOutputState(Definitions.SignalNames.AJ9E) = "Clear"
                End If
            ElseIf SignalSystemState(Definitions.SignalNames.AJ9E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ9E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ9E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ9E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9E).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ9E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E))
            End If
        End If
        'AJ16E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ8E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ16E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                    End If
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                    SignalOutputState(Definitions.SignalNames.AJ16E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ16E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                    End If
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                    SignalOutputState(Definitions.SignalNames.AJ16E) = "Clear"
                End If
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ16E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ16E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                End If
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                End If
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16E) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16E).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ16E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E))
            End If
        End If
        'AJ17E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ17E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ17E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ2E) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ17E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ17E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ17E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ17E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ17E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ17E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ17E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ17E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ17E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E))
            End If
        End If
        'AJ18E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ18E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ18E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ18E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ18E) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ9E) = SignalAtDanger Or SignalOutputState(Definitions.SignalNames.AJ9E) = SignalAtShunt Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ18E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ18E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ18E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ18E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = True
                SignalOutputState(Definitions.SignalNames.AJ18E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ18E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                SignalOutputState(Definitions.SignalNames.AJ18E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18E).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ18E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E))
            End If
        End If
        'AJ21E
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = True
                SignalOutputState(Definitions.SignalNames.AJ21E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ21E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ21E) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ21E) = "Clear" Then
                If (Points.PointReturns(PointNames.P6a) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ18E) = SignalAtDanger) Or (Points.PointReturns(PointNames.P6a) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtShunt) Or (Points.PointReturns(PointNames.P6a) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ16E) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ21E).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                    If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ21E) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ21E).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                    If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ21E) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ21E! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ21E))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ21E) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ21E) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 1
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                If Points.PointReturns(PointNames.P6a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = True
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ21E) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E)) = 0
                SignalOutputs(Definitions.SignalNames.AJ21E).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ21E! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E))
            End If
        End If
        'AJ3W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = True
                SignalOutputState(Definitions.SignalNames.AJ3W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ3W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ3W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ8W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ3W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ3W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ3W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                    If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ3W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ3W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                SignalOutputState(Definitions.SignalNames.AJ3W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ3W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                If Points.PointReturns(PointNames.P5a) = PointInReverse Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ3W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ3W).route_1 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ3W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W))
            End If
        End If
        'AJ7W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ7W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ7W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ7W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ7W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ7W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ7W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ7W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ7W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ7W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W))
            End If
        End If
        'AJ8W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ8W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ8W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ16W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ8W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ8W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ8W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ8W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ8W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ8W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ8W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ8W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ8W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ8W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ8W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W))
            End If
        End If
        'AJ9W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ9W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ9W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ9W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ9W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ18W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ9W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ9W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ9W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ9W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ9W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ9W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ9W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ9W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ9W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ9W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ9W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W))
            End If
        End If
        'AJ15W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ15W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ15W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ3W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ15W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 1
                    SignalOutputState(Definitions.SignalNames.AJ15W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ15W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 1
                    SignalOutputState(Definitions.SignalNames.AJ15W) = "Clear"
                End If
            ElseIf SignalSystemState(Definitions.SignalNames.AJ15W) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ15W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ15W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 1
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                SignalOutputState(Definitions.SignalNames.AJ15W) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ15W).shunt = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressWBOFFIndicator) = 0
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ15W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W))
            End If
        End If
        'AJ16W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16W) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Shunt"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ16W) = "Clear" Then
                If (PointReturns(PointNames.P6b) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ7W) = SignalAtDanger) Or (PointReturns(PointNames.P6b) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ17W) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ16W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                    If PointReturns(PointNames.P6b) = PointInReverse Then
                        If Points.PointReturns(PointNames.P10) = PointInReverse Then
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = True
                        Else
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = True
                        End If
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ16W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ16W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                    If PointReturns(PointNames.P6b) = PointInReverse Then
                        If Points.PointReturns(PointNames.P10) = PointInReverse Then
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = True
                        Else
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = True
                        End If
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ16W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ16W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ16W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = True
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Shunt"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                If PointReturns(PointNames.P6b) = PointInReverse Then
                    If Points.PointReturns(PointNames.P10) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = True
                    End If
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                If PointReturns(PointNames.P6b) = PointInReverse Then
                    If Points.PointReturns(PointNames.P10) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = True
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = True
                    End If
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                End If
                SignalOutputState(Definitions.SignalNames.AJ16W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).route_2 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ16W).shunt = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ16W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W))
            End If
        End If
        'AJ17W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ17W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ17W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ9W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ17W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ17W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ17W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ17W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ17W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ17W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ17W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ17W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ17W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ17W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ17W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W))
            End If
        End If
        'AJ18W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = True
                SignalOutputState(Definitions.SignalNames.AJ18W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ18W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                SignalOutputState(Definitions.SignalNames.AJ18W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ18W) = "Clear" Then
                If (Points.PointReturns(PointNames.P5b) = PointInNormal And Points.PointReturns(PointNames.P10) = PointInNormal And SignalOutputState(Definitions.SignalNames.AJ17W) = SignalAtDanger) Or (Points.PointReturns(PointNames.P5b) = PointInNormal And Points.PointReturns(PointNames.P10) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ22W) = SignalAtDanger) Or (Points.PointReturns(PointNames.P5b) = PointInReverse And SignalOutputState(Definitions.SignalNames.AJ7W) = SignalAtDanger) Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                    If Points.PointReturns(PointNames.P5b) = PointInNormal Then
                        If Points.PointReturns(PointNames.P10) = PointInReverse Then
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                        Else
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = True
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                        End If
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = True
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ18W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                    If Points.PointReturns(PointNames.P5b) = PointInNormal Then
                        If Points.PointReturns(PointNames.P10) = PointInReverse Then
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                        Else
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 1
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = True
                            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                            SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                        End If
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = True
                    End If
                    SignalOutputState(Definitions.SignalNames.AJ18W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ18W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ18W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                SignalOutputState(Definitions.SignalNames.AJ18W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                If Points.PointReturns(PointNames.P5b) = PointInNormal Then
                    If Points.PointReturns(PointNames.P10) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = True
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                    End If
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = True
                End If
                SignalOutputState(Definitions.SignalNames.AJ18W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                If Points.PointReturns(PointNames.P5b) = PointInNormal Then
                    If Points.PointReturns(PointNames.P10) = PointInReverse Then
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                    Else
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 1
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = True
                        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                        SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                    End If
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = True
                End If
                SignalOutputState(Definitions.SignalNames.AJ18W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).danger = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_1 = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ18W).route_2 = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ18W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W))
            End If
        End If
        'AJ22W
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ22W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ22W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ22W) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.AJ22W) = "Clear" Then
                If SignalOutputState(Definitions.SignalNames.AJ3W) = SignalAtDanger Then
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ22W).caution = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ22W) = "Caution"
                Else
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 1
                    SignalOutputs(Definitions.SignalNames.AJ22W).clear = True
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                    SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                    SignalOutputState(Definitions.SignalNames.AJ22W) = "Clear"
                End If
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ22W! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.AJ22W))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = True
                SignalOutputState(Definitions.SignalNames.AJ22W) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = "Caution" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ22W) = "Caution"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 1
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                SignalOutputState(Definitions.SignalNames.AJ22W) = "Clear"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).caution = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W)) = 0
                SignalOutputs(Definitions.SignalNames.AJ22W).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error AJ22W! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W))
            End If
        End If
        'S11
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.S11) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).danger = True
            ElseIf SignalSystemState(Definitions.SignalNames.S11) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).danger = True
                SignalOutputState(Definitions.SignalNames.S11) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S11) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                SignalOutputState(Definitions.SignalNames.S11) = "Clear"
            ElseIf SignalSystemState(Definitions.SignalNames.S11) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                SignalOutputState(Definitions.SignalNames.S11) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S11! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.S11))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.S11) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).danger = True
                SignalOutputState(Definitions.SignalNames.S11) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S11) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                SignalOutputState(Definitions.SignalNames.S11) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S11) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 1
                SignalOutputs(Definitions.SignalNames.S11).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                SignalOutputState(Definitions.SignalNames.S11) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11)) = 0
                SignalOutputs(Definitions.SignalNames.S11).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S11! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S11))
            End If
        End If
        'S12
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.S12) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).danger = True
            ElseIf SignalSystemState(Definitions.SignalNames.S12) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).danger = True
                SignalOutputState(Definitions.SignalNames.S12) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S12) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                SignalOutputState(Definitions.SignalNames.S12) = "Clear"
            ElseIf SignalSystemState(Definitions.SignalNames.S12) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                SignalOutputState(Definitions.SignalNames.S12) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S12! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.S12))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.S12) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).danger = True
                SignalOutputState(Definitions.SignalNames.S12) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S12) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                SignalOutputState(Definitions.SignalNames.S12) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S12) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 1
                SignalOutputs(Definitions.SignalNames.S12).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                SignalOutputState(Definitions.SignalNames.S12) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12)) = 0
                SignalOutputs(Definitions.SignalNames.S12).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S12! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S12))
            End If
        End If
        'S14
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.S14) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).danger = True
                SignalOutputState(Definitions.SignalNames.S14) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S14) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).danger = True
                SignalOutputState(Definitions.SignalNames.S14) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S14) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                SignalOutputState(Definitions.SignalNames.S14) = "Clear"
            ElseIf SignalSystemState(Definitions.SignalNames.S14) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                SignalOutputState(Definitions.SignalNames.S14) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S14! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.S14))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.S14) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).danger = True
                SignalOutputState(Definitions.SignalNames.S14) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S14) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                SignalOutputState(Definitions.SignalNames.S14) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S14) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 1
                SignalOutputs(Definitions.SignalNames.S14).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                SignalOutputState(Definitions.SignalNames.S14) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14)) = 0
                SignalOutputs(Definitions.SignalNames.S14).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S14! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S14))
            End If
        End If
        'S19
        If RuntimeConfig.config.SignalState(Definitions.SignalNames.S19) = "System" And SignalAspectPower = True Then
            If Points.TestMode = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).danger = True
                SignalOutputState(Definitions.SignalNames.S19) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S19) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).danger = True
                SignalOutputState(Definitions.SignalNames.S19) = "Danger"
            ElseIf SignalSystemState(Definitions.SignalNames.S19) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                SignalOutputState(Definitions.SignalNames.S19) = "Clear"
            ElseIf SignalSystemState(Definitions.SignalNames.S19) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                SignalOutputState(Definitions.SignalNames.S19) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S19! Couldnot find system state = " & SignalSystemState(Definitions.SignalNames.S19))
            End If
        Else
            If RuntimeConfig.config.SignalState(Definitions.SignalNames.S19) = "Danger" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).danger = True
                SignalOutputState(Definitions.SignalNames.S19) = "Danger"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S19) = "Clear" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                SignalOutputState(Definitions.SignalNames.S19) = "Clear"
            ElseIf RuntimeConfig.config.SignalState(Definitions.SignalNames.S19) = "Shunt" Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 1
                SignalOutputs(Definitions.SignalNames.S19).clear = True
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                SignalOutputState(Definitions.SignalNames.S19) = "Shunt"
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).clear = False
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19)) = 0
                SignalOutputs(Definitions.SignalNames.S19).danger = False
                If SignalAspectPower = True Then sendMessage(ChatGroups.Programmers, "Error S19! Couldnot find override state = " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S19))
            End If
        End If
        For i As Integer = 0 To SignalCount - 1
            updateSignalOutput(i, SignalOutputs(i))
        Next
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
        For i As Integer = 0 To SignalCount - 1
            'Signal audio timers
            If SignalTimerAnnouncementDelay(i) < TimerDisabled And SignalTimerAnnouncementDelay(i) > 0 Then SignalTimerAnnouncementDelay(i) -= 1
            'Signal to clear timer
            If SignalTimer(i) < TimerDisabled And SignalTimer(i) > 0 Then SignalTimer(i) -= 1
            'Signal Timeouts
            If SignalTimeOut(i) < TimerDisabled And SignalTimeOut(i) > 0 Then SignalTimeOut(i) -= 1
            ' Safe to clear timer
            If SignalSafeToClearTimer(i) > 0 Then SignalSafeToClearTimer(i) -= 1
        Next
    End Sub
    Private Sub initialiseAddresses()
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ1E) = 377
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ1E) = 378
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ1E) = 379
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ1E) = 380
        DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ1E) = 381
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ2E) = 382
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ2E) = 383
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ2E) = 384
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ2E) = 369
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3E) = 370
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3E) = 371
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3E) = 372
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ4E) = 373
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ4E) = 374
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ4E) = 375
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ4E) = 376
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7E) = 361
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7E) = 362
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8E) = 363
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8E) = 364
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8E) = 365
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9E) = 366
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9E) = 367
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9E) = 368
        DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ9E) = 353
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16E) = 354
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16E) = 355
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16E) = 356
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16E) = 357
        DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16E) = 358
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17E) = 359
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17E) = 360
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17E) = 345
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18E) = 346
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18E) = 347
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18E) = 348
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ21E) = 349
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ21E) = 350
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ21E) = 351
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ21E) = 352
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ3W) = 337
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ3W) = 338
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ3W) = 339
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ3W) = 340
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ7W) = 341
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ7W) = 342
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ8W) = 343
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ8W) = 344
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ8W) = 329
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ9W) = 330
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ9W) = 331
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ9W) = 332
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ15W) = 333
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ15W) = 334
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ15W) = 335
        DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ15W) = 336
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ16W) = 321
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ16W) = 322
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ16W) = 323
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ16W) = 324
        DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ16W) = 325
        DigitalDeviceAddress.SignalOutputAddressShunt(Definitions.SignalNames.AJ16W) = 307
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ17W) = 326
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ17W) = 327
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ17W) = 328
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ18W) = 313
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ18W) = 314
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ18W) = 315
        DigitalDeviceAddress.SignalOutputAddressRoute1(Definitions.SignalNames.AJ18W) = 316
        DigitalDeviceAddress.SignalOutputAddressRoute2(Definitions.SignalNames.AJ18W) = 317
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.AJ22W) = 318
        DigitalDeviceAddress.SignalOutputAddressCaution(Definitions.SignalNames.AJ22W) = 319
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.AJ22W) = 320
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.RAJ3E) = 305
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.RAJ3E) = 306

        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S11) = 297
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S11) = 298
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S12) = 299
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S12) = 300
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S14) = 301
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S14) = 302
        DigitalDeviceAddress.SignalOutputAddressClear(Definitions.SignalNames.S19) = 303
        DigitalDeviceAddress.SignalOutputAddressDanger(Definitions.SignalNames.S19) = 304
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
