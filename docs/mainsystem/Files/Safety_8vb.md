---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Safety.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Safety.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[initialise](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#function-initialise)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Logic](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#function-logic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[AirSafety](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#function-airsafety)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿public Module | **[Safety](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-safety)**  |
| string | **[SafetyRunningMode](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-safetyrunningmode)**  |
| bool | **[SafetySerialConnected](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-safetyserialconnected)**  |
| bool | **[SafetySerialTimeout](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-safetyserialtimeout)**  |
| bool | **[EStopTriggered](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-estoptriggered)**  |
| bool | **[EStopReset](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-estopreset)**  |
| bool | **[EStopSoftware](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-estopsoftware)**  |
| bool | **[EStopnotification](/SignallingSystem-doc/mainsystem/Files/Safety_8vb/#variable-estopnotification)**  |


## Functions Documentation

### function initialise

```csharp
void initialise()
```


### function Logic

```csharp
void Logic()
```


### function AirSafety

```csharp
void AirSafety()
```



## Attributes Documentation

### variable Safety

```csharp
﻿public Module Safety;
```


### variable SafetyRunningMode

```csharp
string SafetyRunningMode = "Safe Mode";
```


### variable SafetySerialConnected

```csharp
bool SafetySerialConnected = False;
```


### variable SafetySerialTimeout

```csharp
bool SafetySerialTimeout = True;
```


### variable EStopTriggered

```csharp
bool EStopTriggered = False;
```


### variable EStopReset

```csharp
bool EStopReset = True;
```


### variable EStopSoftware

```csharp
bool EStopSoftware = False;
```


### variable EStopnotification

```csharp
bool EStopnotification = False;
```



## Source code

```csharp
Public Module Safety
    Public SafetyRunningMode As String = "Safe Mode"
    Public SafetySerialConnected As Boolean = False
    Public SafetySerialTimeout As Boolean = True
    'E-Stop
    Public EStopTriggered As Boolean = False
    Public EStopReset As Boolean = True
    Public EStopSoftware As Boolean = False
    Public EStopnotification As Boolean = False
    Private AirPulse As Boolean

    Private airPulseRelay As RelayOutputState = New RelayOutputState()
    Private eStopSoftwareRelay As RelayOutputState = New RelayOutputState()
    Private eStopResetRelay As RelayOutputState = New RelayOutputState()


    Private Class RelayOutputState
        Public value As Boolean
    End Class

    Public Sub initialise()
        airPulseRelay.value = False
        eStopSoftwareRelay.value = False
        eStopResetRelay.value = False
    End Sub
    Public Sub Logic()
        'air safety relay
        'E-Stop Logic
        If EStopSoftware = False Then
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopTrigger) = 1
        Else
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopTrigger) = 0
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressEStopMonitor) = 1 Then
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopReset) = 0
            EStopSoftware = False
            EStopTriggered = False
            EStopReset = False
        Else
            EStopTriggered = True
            If EStopReset = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopReset) = 1
                EStopSoftware = False
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopReset) = 0
            End If
        End If
        'Notification
        If Safety.EStopTriggered = True And Safety.EStopReset = False And SignalsOn = True Then
            Errors.NewError("E-STOP ACTIVATED! - Cause = unknown")
            If EStopnotification = False Then
                EStopnotification = True
            End If
        Else
            Errors.RemoveError("E-STOP ACTIVATED! - Cause = unknown")
            EStopnotification = False
        End If


        If Not eStopSoftwareRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopTrigger) = 1 Then
            eStopSoftwareRelay.value = True
            SignallingMqtt.Client.sendOutputState("relays/estop-trigger", Newtonsoft.Json.JsonConvert.SerializeObject(eStopSoftwareRelay))
        ElseIf eStopSoftwareRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopTrigger) = 0 Then
            eStopSoftwareRelay.value = False
            SignallingMqtt.Client.sendOutputState("relays/estop-trigger", Newtonsoft.Json.JsonConvert.SerializeObject(eStopSoftwareRelay))
        End If

        If Not eStopResetRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopReset) = 1 Then
            eStopResetRelay.value = True
            SignallingMqtt.Client.sendOutputState("relays/estop-reset", Newtonsoft.Json.JsonConvert.SerializeObject(eStopResetRelay))
        ElseIf eStopResetRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressEStopReset) = 0 Then
            eStopResetRelay.value = False
            SignallingMqtt.Client.sendOutputState("relays/estop-reset", Newtonsoft.Json.JsonConvert.SerializeObject(eStopResetRelay))
        End If
    End Sub

    Public Sub AirSafety()

        If EStopSoftware = False And PointSupplyPower = True And Points.AirInUse = True Then
            AirRelayOn = True
            If AirPulse = True Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAirRelay) = 1
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAirRelay) = 0
            End If
            AirPulse = Not AirPulse
            SafetyRunningMode = "Normal"
        Else
            AirRelayOn = False
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAirRelay) = 0
            SafetyRunningMode = "Safe Mode"
        End If

        If Not airPulseRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAirRelay) = 1 Then
            airPulseRelay.value = True
            SignallingMqtt.Client.sendOutputState("relays/air-relay", Newtonsoft.Json.JsonConvert.SerializeObject(airPulseRelay))
        ElseIf airPulseRelay.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAirRelay) = 0 Then
            airPulseRelay.value = False
            SignallingMqtt.Client.sendOutputState("relays/air-relay", Newtonsoft.Json.JsonConvert.SerializeObject(airPulseRelay))
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
