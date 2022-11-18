---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/AnalogIOManager.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/AnalogIOManager.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Logic](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#function-logic)**() |
| double | **[convertVoltage](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#function-convertvoltage)**(int value) |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿public Module | **[AnalogIOManager](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-analogiomanager)**  |
| double[] | **[ActualAnalogValue](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-actualanalogvalue)**  |
| string | **[PlaceHolder](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-placeholder)**  |
| ReadOnly int[] | **[AnalogInputPointReturnNormal](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-analoginputpointreturnnormal)**  |
| ReadOnly int[] | **[AnalogInputPointReturnReverse](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-analoginputpointreturnreverse)**  |
| ReadOnly int[] | **[AnalogInputPointSections](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-analoginputpointsections)**  |
| ReadOnly int[] | **[AnalogInputTrackSections](/SignallingSystem-doc/mainsystem/Files/AnalogIOManager_8vb/#variable-analoginputtracksections)**  |


## Functions Documentation

### function Logic

```csharp
void Logic()
```


### function convertVoltage

```csharp
double convertVoltage(
    int value
)
```



## Attributes Documentation

### variable AnalogIOManager

```csharp
﻿public Module AnalogIOManager;
```


### variable ActualAnalogValue

```csharp
double[] ActualAnalogValue;
```


### variable PlaceHolder

```csharp
string PlaceHolder;
```


### variable AnalogInputPointReturnNormal

```csharp
ReadOnly int[] AnalogInputPointReturnNormal = {33, 35, 37, 39, 41, 43, 45, 47, 49, 51};
```


### variable AnalogInputPointReturnReverse

```csharp
ReadOnly int[] AnalogInputPointReturnReverse = {34, 36, 38, 40, 42, 44, 46, 48, 50, 52};
```


### variable AnalogInputPointSections

```csharp
ReadOnly int[] AnalogInputPointSections = {55, 56, 57, 58, 59, 60, 61, 62, 63, 64};
```


### variable AnalogInputTrackSections

```csharp
ReadOnly int[] AnalogInputTrackSections = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28};
```



## Source code

```csharp
Public Module AnalogIOManager
    Public ActualAnalogValue(64) As Double
    Public PlaceHolder As String
    Public ReadOnly AnalogInputPointReturnNormal() As Integer = {33, 35, 37, 39, 41, 43, 45, 47, 49, 51}
    Public ReadOnly AnalogInputPointReturnReverse() As Integer = {34, 36, 38, 40, 42, 44, 46, 48, 50, 52}
    Public ReadOnly AnalogInputPointSections() As Integer = {55, 56, 57, 58, 59, 60, 61, 62, 63, 64}
    Public ReadOnly AnalogInputTrackSections() As Integer = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28}
    Public Sub Logic()
        Return
        Dim x As Integer = 1
        Dim y As Integer = 1
        Do Until x = 65
            PlaceHolder = (Serial.DataReadInputAnalogArray(y) & "." & Serial.DataReadInputAnalogArray(y + 1))
            ActualAnalogValue(x) = (Math.Round(CDbl(Val(PlaceHolder)), 2))
            x = x + 1
            y = y + 2
        Loop
    End Sub

    Public Function convertVoltage(value As Integer) As Double
        Dim res As Double = 0
        res = (50 / 1024) * value
        Return Math.Round(res, 2)
    End Function
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
