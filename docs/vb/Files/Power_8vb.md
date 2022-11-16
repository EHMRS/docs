---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Power.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Power.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[initialise](/SignallingSystem-doc/vb/Files/Power_8vb/#function-initialise)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[PowerLogic](/SignallingSystem-doc/vb/Files/Power_8vb/#function-powerlogic)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| bool | **[SignalAspectPower](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-signalaspectpower)**  |
| bool | **[FrameDisplayPower](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-framedisplaypower)**  |
| bool | **[MimicDisplayPower](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-mimicdisplaypower)**  |
| bool | **[PointSupplyPower](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-pointsupplypower)**  |
| bool | **[ACLatch](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-aclatch)**  |
| int | **[PowerUpCounter](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-powerupcounter)**  |
| string | **[PowerState](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-powerstate)**  |
| bool | **[SystemOnTime](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-systemontime)**  |
| bool | **[TunnelOpen](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-tunnelopen)**  |
| bool | **[TunnelClose](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-tunnelclose)**  |
| bool | **[SignalsOn](/SignallingSystem-doc/vb/Files/Power_8vb/#variable-signalson)**  |


## Functions Documentation

### function initialise

```csharp
void initialise()
```


### function PowerLogic

```csharp
void PowerLogic()
```



## Attributes Documentation

### variable SignalAspectPower

```csharp
bool SignalAspectPower = False;
```


### variable FrameDisplayPower

```csharp
bool FrameDisplayPower = False;
```


### variable MimicDisplayPower

```csharp
bool MimicDisplayPower = False;
```


### variable PointSupplyPower

```csharp
bool PointSupplyPower = False;
```


### variable ACLatch

```csharp
bool ACLatch = False;
```


### variable PowerUpCounter

```csharp
int PowerUpCounter = 0;
```


### variable PowerState

```csharp
string PowerState = "System";
```


### variable SystemOnTime

```csharp
bool SystemOnTime = False;
```


### variable TunnelOpen

```csharp
bool TunnelOpen = False;
```


### variable TunnelClose

```csharp
bool TunnelClose = False;
```


### variable SignalsOn

```csharp
bool SignalsOn = False;
```



## Source code

```csharp
Module Power
    Public SignalAspectPower As Boolean = False
    Public FrameDisplayPower As Boolean = False
    Public MimicDisplayPower As Boolean = False
    Public PointSupplyPower As Boolean = False
    Public ACLatch As Boolean = False
    Public PowerUpCounter As Integer = 0
    Public PowerState As String = "System"
    Public SystemOnTime As Boolean = False
    Public TunnelOpen As Boolean = False
    Public TunnelClose As Boolean = False
    Public SignalsOn As Boolean = False

    Private relayOn As RelayOutputState = New RelayOutputState()
    Private relayOff As RelayOutputState = New RelayOutputState()


    Private Class RelayOutputState
        Public value As Boolean
    End Class

    Public Sub initialise()
        relayOn.value = False
        relayOff.value = False
    End Sub
    Public Sub PowerLogic()
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressACMonitor) = 0 Then
            ACLatch = False
            Errors.RemoveError("WARNING: AC has been lost to the frame please restore power)")
        Else
            If ACLatch = False Then
                ACLatch = True
                Errors.NewError("WARNING: AC has been lost to the frame please restore power)")
            End If
        End If
        'Is time between two times 09:00 - 18:00 
        Dim current As DateTime = DateTime.Now
        Dim currentHr As Integer = current.Hour
        Dim currentday As String = Date.Today.DayOfWeek.ToString()
        If currentday = "Saturday" Or currentday = "Sunday" Then
            If currentHr >= 10 And currentHr <= 16 Then
                SystemOnTime = True
            Else
                SystemOnTime = False
            End If
        Else
            SystemOnTime = False
        End If
        'Contactor control
        If PowerState = "System" Then
            'Turn System on if not already on when either tunnel is open or in running hours
            If (SystemOnTime = True) Or (LineSide.TunnelOpen = True) Then
                SignalsOn = True
                If DataReadInputsArray(DigitalDeviceAddress.InputAddressAUXContactorDetection) = 0 Then
                    Errors.NewError("System Powering On!")
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 1

                    Safety.EStopReset = True
                Else
                    'Turn relays off if no need to update system power
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
                    Errors.RemoveError("System Powering On!")
                End If
            Else
                SignalsOn = False
                If DataReadInputsArray(DigitalDeviceAddress.InputAddressAUXContactorDetection) = 1 Then
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 1
                    Errors.NewError("System Powering Off!")
                Else
                    'Turn relays off if no need to update system power
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
                    DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
                    Errors.RemoveError("System Powering Off!")
                End If
            End If
        ElseIf PowerState = "Off" Then
            SignalsOn = False
            'Make sure the "on" relay is already off
            DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
            'Turn system off if not already off
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressAUXContactorDetection) = 1 Then
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 1
            Else
                'Turn relays off if no need to update system power
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
            End If
        Else
            SignalsOn = True
            'Make sure the "off" relay is already off
            DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
            'Turn System on if not already on
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressAUXContactorDetection) = 0 Then
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 1
                Safety.EStopReset = True
            Else
                'Turn relays off if no need to update system power
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0
                DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0
            End If
        End If

        If Not relayOn.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 1 Then
            relayOn.value = True
            SignallingMqtt.Client.sendOutputState("relays/power-on", Newtonsoft.Json.JsonConvert.SerializeObject(relayOn))
        ElseIf relayOn.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorON) = 0 Then
            relayOn.value = False
            SignallingMqtt.Client.sendOutputState("relays/power-on", Newtonsoft.Json.JsonConvert.SerializeObject(relayOn))
        End If

        If Not relayOff.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 1 Then
            relayOff.value = True
            SignallingMqtt.Client.sendOutputState("relays/power-off", Newtonsoft.Json.JsonConvert.SerializeObject(relayOff))
        ElseIf relayOff.value And DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressAUXContactorOFF) = 0 Then
            relayOff.value = False
            SignallingMqtt.Client.sendOutputState("relays/power-off", Newtonsoft.Json.JsonConvert.SerializeObject(relayOff))
        End If
        If SignalsOn = False Then
            SignalAspectPower = False
            FrameDisplayPower = False
            MimicDisplayPower = False
            PointSupplyPower = False
            PowerUpCounter = 0
        End If
        If SignalsOn = True And (Not PowerUpCounter = 200) Then ' 
            PowerUpCounter += 1
        End If
        If SignalsOn = True And PowerUpCounter > 5 Then SignalAspectPower = True
        If SignalsOn = True And PowerUpCounter > 10 Then FrameDisplayPower = True
        If SignalsOn = True And PowerUpCounter > 20 Then MimicDisplayPower = True
        If SignalsOn = True And PowerUpCounter > 40 Then PointSupplyPower = True
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
