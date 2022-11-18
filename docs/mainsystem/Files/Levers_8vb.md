---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Levers.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Levers.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[initialise](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-initialise)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updateLeverFromInput](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-updateleverfrominput)**(string lever, double normal, double reverse) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LeversLogic](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-leverslogic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updateLeverOutputOverride](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-updateleveroutputoverride)**(int lever, [Definitions.LeverLockState](/SignallingSystem-doc/mainsystem/Files/Definitions_8vb/#enum-leverlockstate) state)<br>Update the lever output override setting to a given override state  |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updateLeverInputOverride](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-updateleverinputoverride)**(int lever, [Definitions.LeverState](/SignallingSystem-doc/mainsystem/Files/Definitions_8vb/#enum-leverstate) state)<br>Update the lever return state override to a given override state  |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updateLeverAutorestroke](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-updateleverautorestroke)**(int lever, bool state)<br>Update the lever's auto restroke setting  |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using EHMR_Signalling_System. | **[DigitalDeviceAddress](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-digitaldeviceaddress)**  |
| ReadOnly int | **[LeverCount](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-levercount)**  |
| string[] | **[Lever](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-lever)**  |
| string[] | **[LeverFrameState](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-leverframestate)**  |
| bool[] | **[LeverLock](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-leverlock)**  |
| string[] | **[LeverlockState](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-leverlockstate)**  |
| bool[] | **[LeverRestroke](/SignallingSystem-doc/mainsystem/Files/Levers_8vb/#variable-leverrestroke)**  |


## Functions Documentation

### function initialise

```csharp
void initialise()
```


### function updateLeverFromInput

```csharp
void updateLeverFromInput(
    string lever,
    double normal,
    double reverse
)
```


### function LeversLogic

```csharp
void LeversLogic()
```


### function updateLeverOutputOverride

```csharp
void updateLeverOutputOverride(
    int lever,
    Definitions.LeverLockState state
)
```

Update the lever output override setting to a given override state 

**Parameters**: 

  * **lever** 
  * **state** 


### function updateLeverInputOverride

```csharp
void updateLeverInputOverride(
    int lever,
    Definitions.LeverState state
)
```

Update the lever return state override to a given override state 

**Parameters**: 

  * **lever** 
  * **state** 


### function updateLeverAutorestroke

```csharp
void updateLeverAutorestroke(
    int lever,
    bool state
)
```

Update the lever's auto restroke setting 

**Parameters**: 

  * **lever** 
  * **state** 


### function SecondTick

```csharp
void SecondTick()
```



## Attributes Documentation

### variable DigitalDeviceAddress

```csharp
﻿using EHMR_Signalling_System. DigitalDeviceAddress;
```


### variable LeverCount

```csharp
ReadOnly int LeverCount = 24;
```


### variable Lever

```csharp
string[] Lever = {"Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal"};
```


### variable LeverFrameState

```csharp
string[] LeverFrameState = {"Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal"};
```


### variable LeverLock

```csharp
bool[] LeverLock = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```


### variable LeverlockState

```csharp
string[] LeverlockState = {"Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked"};
```


### variable LeverRestroke

```csharp
bool[] LeverRestroke = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```



## Source code

```csharp
Imports EHMR_Signalling_System.DigitalDeviceAddress
Module Levers
    Public ReadOnly LeverCount As Integer = 24
    Public Lever() As String = {"Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal"}
    Public LeverFrameState() As String = {"Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal", "Normal"}
    Public LeverLock() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public LeverlockState() As String = {"Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked", "Locked"}
    Public LeverRestroke() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

    Private LeverLockOutputStates() As LeverLockOutputState = New LeverLockOutputState(LeverCount) {}
    Private LastLeverLockOutputStates() As LeverLockOutputState = New LeverLockOutputState(LeverCount) {}

    Private Class LeverLockOutputState
        Public locked As Boolean

        Public Shared Operator =(ByVal s1 As LeverLockOutputState, ByVal s2 As LeverLockOutputState) As Boolean
            If s1.locked = s2.locked Then
                Return True
            End If
            Return False
        End Operator
        Public Shared Operator <>(ByVal s1 As LeverLockOutputState, ByVal s2 As LeverLockOutputState) As Boolean
            If s1.locked = s2.locked Then
                Return False
            End If
            Return True
        End Operator
    End Class

    Public Sub initialise()
        For i As Integer = 0 To LeverCount - 1
            LeverLockOutputStates(i) = New LeverLockOutputState()
            LeverLockOutputStates(i).locked = False

            LastLeverLockOutputStates(i) = New LeverLockOutputState()
            LastLeverLockOutputStates(i).locked = False
        Next
    End Sub

    'Logic start
    Public Sub updateLeverFromInput(ByVal lever As String, ByVal normal As Double, ByVal reverse As Double)
        Dim leverIndex As Integer = Convert.ToInt16(lever) - 1
        If leverIndex < 0 Or leverIndex >= LeverCount Then
            ' This is not a valid lever
            Return
        End If

        ' Do the actual change
        If normal > 0 Then
            Serial.DataReadInputsArray(InputAddressLeverNormal(leverIndex)) = 1
        End If
        If reverse > 0 Then
            Serial.DataReadInputsArray(InputAddressLeverReverse(leverIndex)) = 1
        End If
    End Sub
    Public Sub LeversLogic()
        For i As Integer = 0 To LeverCount - 1
            'Check for error
            If DataReadInputsArray(InputAddressLeverNormal(i)) = 1 And DataReadInputsArray(InputAddressLeverReverse(i)) = 1 Then
                NewError(LeverReadingBothWays(i))
            Else
                RemoveError(LeverReadingBothWays(i))
            End If
            'Lever Read
            If DataReadInputsArray(InputAddressLeverNormal(i)) = 1 Then
                LeverFrameState(i) = "Normal"
            ElseIf DataReadInputsArray(InputAddressLeverReverse(i)) = 1 Then
                LeverFrameState(i) = "Reverse"
            Else
                LeverFrameState(i) = "Unknown"
            End If
            If RuntimeConfig.config.LeverState(i) = "System" Then
                If DataReadInputsArray(InputAddressLeverNormal(i)) = 1 Then
                    Lever(i) = "Normal"
                ElseIf DataReadInputsArray(InputAddressLeverReverse(i)) = 1 Then
                    Lever(i) = "Reverse"
                Else
                    Lever(i) = "Unknown"
                End If
            ElseIf RuntimeConfig.config.LeverState(i) = "Normal" Then
                Lever(i) = "Normal"
            ElseIf RuntimeConfig.config.LeverState(i) = "Reverse" Then
                Lever(i) = "Reverse"
            ElseIf RuntimeConfig.config.LeverState(i) = "Unknown" Then
                Lever(i) = "Unknown"
            End If
            'Lever Lock
            If ReleaseLevers = True Then
                DataWriteOutputsOutArray(OutputAddressLeverLock(i)) = 1
                LeverlockState(i) = "Released"
                LeverLockOutputStates(i).locked = False
            Else
                If RuntimeConfig.config.LeverLock(i) = "System" Then
                    If LeverLock(i) = True Then
                        DataWriteOutputsOutArray(OutputAddressLeverLock(i)) = 0
                        LeverLockOutputStates(i).locked = True
                        LeverlockState(i) = "Locked"
                    ElseIf LeverLock(i) = False Then
                        DataWriteOutputsOutArray(OutputAddressLeverLock(i)) = 1
                        LeverlockState(i) = "Released"
                        LeverLockOutputStates(i).locked = False
                    Else
                        LeverlockState(i) = "Code Error"
                    End If
                Else
                    If RuntimeConfig.config.LeverLock(i) = "Lock" Then
                        DataWriteOutputsOutArray(OutputAddressLeverLock(i)) = 0
                        LeverlockState(i) = "Locked"
                        LeverLockOutputStates(i).locked = True
                    ElseIf RuntimeConfig.config.LeverLock(i) = "Release" Then
                        DataWriteOutputsOutArray(OutputAddressLeverLock(i)) = 1
                        LeverlockState(i) = "Released"
                        LeverLockOutputStates(i).locked = False
                    Else
                        LeverlockState(i) = "Code Error"
                    End If
                End If
            End If
            If Not LastLeverLockOutputStates(i) = LeverLockOutputStates(i) Then
                SignallingMqtt.Client.sendOutputState("levers/" + Convert.ToString(i), Newtonsoft.Json.JsonConvert.SerializeObject(LeverLockOutputStates(i)))
                LastLeverLockOutputStates(i).locked = LeverLockOutputStates(i).locked
            End If
        Next
    End Sub

    ''' <summary>
    ''' Update the lever output override setting to a given override state
    ''' </summary>
    ''' <param name="lever"></param>
    ''' <param name="state"></param>
    Public Sub updateLeverOutputOverride(ByVal lever As Integer, ByVal state As Definitions.LeverLockState)
        If lever > LeverCount - 1 Or lever < 1 Then
            Return
        End If
        ' Get point based on name
        Dim leverIndex As Integer = lever - 1

        If state = Definitions.LeverLockState.Locked Then
            RuntimeConfig.config.LeverLock(leverIndex) = "Lock"
        ElseIf state = Definitions.LeverLockState.Unlocked Then
            RuntimeConfig.config.LeverLock(leverIndex) = "Release"
        ElseIf state = Definitions.LeverLockState.System Then
            RuntimeConfig.config.LeverLock(leverIndex) = "System"
        End If
    End Sub
    ''' <summary>
    ''' Update the lever return state override to a given override state
    ''' </summary>
    ''' <param name="lever"></param>
    ''' <param name="state"></param>
    Public Sub updateLeverInputOverride(ByVal lever As Integer, ByVal state As Definitions.LeverState)
        If lever > LeverCount - 1 Or lever < 1 Then
            Return
        End If
        ' Get point based on name
        Dim leverIndex As Integer = lever - 1

        If state = Definitions.LeverState.Normal Then
            RuntimeConfig.config.LeverState(leverIndex) = Definitions.LeverInNormal
        ElseIf state = Definitions.LeverState.Reverse Then
            RuntimeConfig.config.LeverState(leverIndex) = Definitions.LeverInReverse
        ElseIf state = Definitions.LeverState.System Then
            RuntimeConfig.config.LeverState(leverIndex) = "System"
        End If
    End Sub
    ''' <summary>
    ''' Update the lever's auto restroke setting
    ''' </summary>
    ''' <param name="lever"></param>
    ''' <param name="state"></param>
    Public Sub updateLeverAutorestroke(ByVal lever As Integer, ByVal state As Boolean)
        If lever > LeverCount - 1 Or lever < 1 Then
            Return
        End If
        ' Get point based on name
        Dim leverIndex As Integer = lever - 1

        RuntimeConfig.config.LeverRestroke(leverIndex) = state
    End Sub

    'Second timer countdown
    Public Sub SecondTick()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
