---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Relays.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Relays.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| ReadOnly | **[RelayDisplayNames](/SignallingSystem-doc/vb/Files/Relays_8vb/#function-relaydisplaynames)**() |
| ReadOnly | **[RelayInternalNames](/SignallingSystem-doc/vb/Files/Relays_8vb/#function-relayinternalnames)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateRelay](/SignallingSystem-doc/vb/Files/Relays_8vb/#function-updaterelay)**(string name, double value) |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly int | **[RelayCount](/SignallingSystem-doc/vb/Files/Relays_8vb/#variable-relaycount)**  |
| bool[] | **[RelayState](/SignallingSystem-doc/vb/Files/Relays_8vb/#variable-relaystate)**  |


## Functions Documentation

### function RelayDisplayNames

```csharp
ReadOnly RelayDisplayNames()
```


### function RelayInternalNames

```csharp
ReadOnly RelayInternalNames()
```


### function UpdateRelay

```csharp
void UpdateRelay(
    string name,
    double value
)
```



## Attributes Documentation

### variable RelayCount

```csharp
ReadOnly int RelayCount = 7;
```


### variable RelayState

```csharp
bool[] RelayState = {False, False, False, False, False, False, False};
```



## Source code

```csharp
Module Relays
    Public ReadOnly RelayCount As Integer = 7
    Public RelayState() As Boolean = {False, False, False, False, False, False, False}
    Public ReadOnly RelayDisplayNames() = {"E-Stop Relay", "AC Contactor", "Aux Contactor", "Power on", "Power Off", "EStop Software Trigger", "EStop reset"}
    Public ReadOnly RelayInternalNames() = {"estop", "ac", "aux", "poweron", "poweroff", "estoptrigger", "estopreset"}

    Public Sub UpdateRelay(ByVal name As String, ByVal value As Double)
        ' Get index based on name
        Dim relayIndex As Integer = Array.IndexOf(RelayInternalNames, name)

        ' Check that the relay actually exists in our system.
        If relayIndex = -1 Then
            ' This relay does not exist
            Return
        End If

        If value > 10 Then
            ' This is on
            RelayState(relayIndex) = True
            Serial.DataReadInputsArray(DigitalDeviceAddress.InputRelayAddress(relayIndex)) = 1
        Else
            RelayState(relayIndex) = False
            Serial.DataReadInputsArray(DigitalDeviceAddress.InputRelayAddress(relayIndex)) = 0
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
