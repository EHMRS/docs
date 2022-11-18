---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/LineSide.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/LineSide.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LineSideLogic](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-linesidelogic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updateSensorInput](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-updatesensorinput)**(string name, double NOValue, double NCValue) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[TunnelLogic](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-tunnellogic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LevelCrossingLogic](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-levelcrossinglogic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[TunnelError](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-tunnelerror)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LevelCrossingError](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#function-levelcrossingerror)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly string[] | **[SensorDisplayNames](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-sensordisplaynames)**  |
| ReadOnly string[] | **[SensorInternalNames](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-sensorinternalnames)**  |
| bool | **[TunnelOpen](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-tunnelopen)**  |
| bool | **[TunnelSafe](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-tunnelsafe)**  |
| bool | **[CrossingSafe](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-crossingsafe)**  |
| | **[CrossingWarningBuzzer](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-crossingwarningbuzzer)**  |
| bool | **[LCSensor1](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-lcsensor1)**  |
| bool | **[LCSensor2](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-lcsensor2)**  |
| bool | **[LCSensor3](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-lcsensor3)**  |
| bool | **[LCSensor4](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-lcsensor4)**  |
| bool | **[EastSensor](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-eastsensor)**  |
| bool | **[WestSensor](/SignallingSystem-doc/mainsystem/Files/LineSide_8vb/#variable-westsensor)**  |


## Functions Documentation

### function LineSideLogic

```csharp
void LineSideLogic()
```


### function updateSensorInput

```csharp
void updateSensorInput(
    string name,
    double NOValue,
    double NCValue
)
```


### function TunnelLogic

```csharp
void TunnelLogic()
```


### function LevelCrossingLogic

```csharp
void LevelCrossingLogic()
```


### function TunnelError

```csharp
void TunnelError()
```


### function LevelCrossingError

```csharp
void LevelCrossingError()
```



## Attributes Documentation

### variable SensorDisplayNames

```csharp
ReadOnly string[] SensorDisplayNames = {"Tunnel East", "Tunnel West", "Level crossing outer In", "Lever crossing outer out", "Level crossing inner in", "Level crossing inner out"};
```


### variable SensorInternalNames

```csharp
ReadOnly string[] SensorInternalNames = {"sitetunnel-east", "sitetunnel-west", "crossing-center-outer-in", "crossing-center-outer-out", "crossing-center-inner-in", "crossing-center-inner-out"};
```


### variable TunnelOpen

```csharp
bool TunnelOpen = False;
```


### variable TunnelSafe

```csharp
bool TunnelSafe = False;
```


### variable CrossingSafe

```csharp
bool CrossingSafe = False;
```


### variable CrossingWarningBuzzer

```csharp
CrossingWarningBuzzer = False;
```


### variable LCSensor1

```csharp
bool LCSensor1 = False;
```


### variable LCSensor2

```csharp
bool LCSensor2 = False;
```


### variable LCSensor3

```csharp
bool LCSensor3 = False;
```


### variable LCSensor4

```csharp
bool LCSensor4 = False;
```


### variable EastSensor

```csharp
bool EastSensor = False;
```


### variable WestSensor

```csharp
bool WestSensor = False;
```



## Source code

```csharp
Module LineSide

    Public ReadOnly SensorDisplayNames() As String = {"Tunnel East", "Tunnel West", "Level crossing outer In", "Lever crossing outer out", "Level crossing inner in", "Level crossing inner out"}
    Public ReadOnly SensorInternalNames() As String = {"sitetunnel-east", "sitetunnel-west", "crossing-center-outer-in", "crossing-center-outer-out", "crossing-center-inner-in", "crossing-center-inner-out"}

    'Tunnel Sensors
    Public TunnelOpen As Boolean = False
    Public TunnelSafe As Boolean = False
    'Level Crossing
    Public CrossingSafe As Boolean = False
    Public CrossingWarningBuzzer = False

    Public LCSensor1 As Boolean = False
    Public LCSensor2 As Boolean = False
    Public LCSensor3 As Boolean = False
    Public LCSensor4 As Boolean = False


    Public EastSensor As Boolean = False
    Public WestSensor As Boolean = False

    'Logic Start
    Public Sub LineSideLogic()
        TunnelError()
        TunnelLogic()
        LevelCrossingError()
        LevelCrossingLogic()
    End Sub

    Public Sub updateSensorInput(ByVal name As String, ByVal NOValue As Double, ByVal NCValue As Double)

    End Sub

    'Tunnel Logic
    Public Sub TunnelLogic()
        'Check East sensor for override
        If RuntimeConfig.config.EastEndTunnel = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndOpen) = 1 Then
            EastSensor = True
            Errors.RemoveError(Messages.TunnelNotRegistering("EastEnd"))
        ElseIf RuntimeConfig.config.EastEndTunnel = "Open" Then
            EastSensor = True
            Errors.RemoveError(Messages.TunnelNotRegistering("EastEnd"))
        Else
            EastSensor = False
            If SignalAspectPower = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = True And TunnelOpen = True Then Errors.NewError(Messages.TunnelNotRegistering("EastEnd"))
        End If
        'Check West sensor for override
        If RuntimeConfig.config.WestEndTunnel = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndOpen) = 1 Then
            WestSensor = True
            Errors.RemoveError(Messages.TunnelNotRegistering("WestEnd"))
        ElseIf RuntimeConfig.config.WestEndTunnel = "Open" Then
            WestSensor = True
            Errors.RemoveError(Messages.TunnelNotRegistering("WestEnd"))
        Else
            WestSensor = False
            If SignalAspectPower = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = True And TunnelOpen = True Then Errors.NewError(Messages.TunnelNotRegistering("WestEnd"))
        End If
        'Logic for tunnel open
        If EastSensor = True Or WestSensor = True Then
            TunnelOpen = True
        Else
            TunnelOpen = False
        End If
        'Logic for tunnel safe
        If EastSensor = True And WestSensor = True Then
            TunnelSafe = True
        Else
            TunnelSafe = False
        End If
    End Sub
    'Level Crossing Logic
    Public Sub LevelCrossingLogic()
        Dim LCBuzzer As Boolean
        'Check Sensor 1 for override
        If RuntimeConfig.config.OutterGateOutSensor = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamBroken) = 0 Then
            LCSensor1 = True
        ElseIf RuntimeConfig.config.OutterGateOutSensor = "Made" Then
            LCSensor1 = True
        Else
            LCSensor1 = False
        End If
        'Check Sensor 2 for override
        If RuntimeConfig.config.OutterGateInSensor = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamBroken) = 0 Then
            LCSensor2 = True
        ElseIf RuntimeConfig.config.OutterGateInSensor = "Made" Then
            LCSensor2 = True
        Else
            LCSensor2 = False
        End If
        'Check Sensor 3 for override
        If RuntimeConfig.config.InnerGateOutSensor = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamBroken) = 0 Then
            LCSensor3 = True
        ElseIf RuntimeConfig.config.InnerGateOutSensor = "Made" Then
            LCSensor3 = True
        Else
            LCSensor3 = False
        End If
        'Check Sensor 4 for override
        If RuntimeConfig.config.InnerGateInSensor = "System" And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamBroken) = 0 Then
            LCSensor4 = True
        ElseIf RuntimeConfig.config.InnerGateInSensor = "Made" Then
            LCSensor4 = True
        Else
            LCSensor4 = False
        End If
        'Logic
        If LCSensor1 = True And LCSensor2 = True And LCSensor3 = True And LCSensor4 = True Then
            CrossingSafe = True
        Else
            CrossingSafe = False
        End If
        If SignalsOn = True And CrossingSafe = False Then
            If WestBound = True Then
                If (TrackSectionUnoccupied(TrackSectionNames.SectionOP) = False) Then
                    LCBuzzer = True
                    Errors.NewError(Messages.LevelCrossingTrainInSection("OP"))
                ElseIf Not SignalOutputState(Definitions.SignalNames.AJ17W) = SignalAtDanger Then
                    Errors.NewError(Messages.LevelCrossingTrainRouted("Inner"))
                ElseIf Not SignalOutputState(Definitions.SignalNames.AJ3W) = SignalAtDanger Then
                    Errors.NewError(Messages.LevelCrossingTrainRouted("Outer"))
                End If
            ElseIf EastBound = True Then
                If TrackSectionUnoccupied(TrackSectionNames.SectionD) = False Then
                    LCBuzzer = True
                    Errors.NewError(Messages.LevelCrossingTrainInSection("D"))
                ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionOP) = False Then
                    LCBuzzer = True
                    Errors.NewError(Messages.LevelCrossingTrainInSection("OP"))
                ElseIf Not SignalOutputState(Definitions.SignalNames.AJ17E) = SignalAtDanger Then
                    Errors.NewError(Messages.LevelCrossingTrainRouted("Inner"))
                ElseIf Not SignalOutputState(Definitions.SignalNames.AJ3E) = SignalAtDanger Then
                    Errors.NewError(Messages.LevelCrossingTrainRouted("Outer"))
                End If
            End If
        Else
            Errors.RemoveError(Messages.LevelCrossingTrainInSection("OP"))
            Errors.RemoveError(Messages.LevelCrossingTrainInSection("D"))
            Errors.RemoveError(Messages.LevelCrossingTrainRouted("Inner"))
            Errors.RemoveError(Messages.LevelCrossingTrainRouted("Outer"))
            LCBuzzer = False
        End If
        'Check Buzzer settings
        If RuntimeConfig.config.LevelCrossingWarningBuzzer = "System" Then
            CrossingWarningBuzzer = LCBuzzer
        ElseIf RuntimeConfig.config.LevelCrossingWarningBuzzer = "Disable" Then
            CrossingWarningBuzzer = False
        ElseIf RuntimeConfig.config.LevelCrossingWarningBuzzer = "Test" Then
            CrossingWarningBuzzer = True
        End If
        'Output to buzzer
        Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressCrossingWarningBuzzer) = CrossingWarningBuzzer
    End Sub
    'Tunnel Errors
    Public Sub TunnelError()
        'East Switch Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndOpen) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndClose) = 1 Then
            Errors.NewError(Messages.TunnelInputsBothOn("EastEnd"))
        Else
            Errors.RemoveError(Messages.TunnelInputsBothOn("EastEnd"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndOpen) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndClose) = 0 Then
            Errors.NewError(Messages.TunnelInputsBothOff("EastEnd"))
        Else
            Errors.RemoveError(Messages.TunnelInputsBothOff("EastEnd"))
        End If
        'West Switch Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndOpen) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndClose) = 1 Then
            Errors.NewError(Messages.TunnelInputsBothOn("WestEnd"))
        Else
            Errors.RemoveError(Messages.TunnelInputsBothOn("WestEnd"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndOpen) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndClose) = 0 Then
            Errors.NewError(Messages.TunnelInputsBothOff("WestEnd"))
        Else
            Errors.RemoveError(Messages.TunnelInputsBothOff("WestEnd"))
        End If
    End Sub
    'Level Crossing Errors
    Public Sub LevelCrossingError()
        'Sensor 1 Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamBroken) = 1 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsHigh("1"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsHigh("1"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamMade) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamBroken) = 0 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsLow("1"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsLow("1"))
        End If
        'Sensor 2 Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamBroken) = 1 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsHigh("2"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsHigh("2"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamMade) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamBroken) = 0 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsLow("2"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsLow("2"))
        End If
        'Sensor 3 Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamBroken) = 1 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsHigh("3"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsHigh("3"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamMade) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamBroken) = 0 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsLow("3"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsLow("3"))
        End If
        'Sensor 4 Error Check
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamMade) = 1 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamBroken) = 1 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsHigh("4"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsHigh("4"))
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamMade) = 0 And DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamBroken) = 0 Then
            Errors.NewError(Messages.LevelCrossingSensorBothInputsLow("4"))
        Else
            Errors.RemoveError(Messages.LevelCrossingSensorBothInputsLow("4"))
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
