---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Points.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Points.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[initialise](/SignallingSystem-doc/vb/Files/Points_8vb/#function-initialise)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[Points](/SignallingSystem-doc/vb/Files/Points_8vb/#function-points)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AirOnWithSafetyChecks](/SignallingSystem-doc/vb/Files/Points_8vb/#function-aironwithsafetychecks)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AirOnBypassSafety](/SignallingSystem-doc/vb/Files/Points_8vb/#function-aironbypasssafety)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AirOff](/SignallingSystem-doc/vb/Files/Points_8vb/#function-airoff)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[PointsErrorDetection](/SignallingSystem-doc/vb/Files/Points_8vb/#function-pointserrordetection)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdatePointFromInput](/SignallingSystem-doc/vb/Files/Points_8vb/#function-updatepointfrominput)**(string name, double normalValue, double reverseValue) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[updatePointOutputOverride](/SignallingSystem-doc/vb/Files/Points_8vb/#function-updatepointoutputoverride)**(string name, [Definitions.PointRequestState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointrequeststate) state) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[updatePointInputOverride](/SignallingSystem-doc/vb/Files/Points_8vb/#function-updatepointinputoverride)**(string name, [Definitions.PointReturnState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointreturnstate) state) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[PointIOUpdate](/SignallingSystem-doc/vb/Files/Points_8vb/#function-pointioupdate)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/vb/Files/Points_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly int | **[PointCount](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointcount)**  |
| ReadOnly string[] | **[PointDisplayNames](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointdisplaynames)**  |
| ReadOnly string[] | **[PointInternalNames](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointinternalnames)**  |
| string | **[UsingAir](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-usingair)**  |
| bool | **[AirInUse](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-airinuse)**  |
| string[] | **[PointRequestedOutputs](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointrequestedoutputs)**  |
| int[] | **[PointNoReturnCountdown](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointnoreturncountdown)**  |
| int[] | **[PointNotChangingCountdown](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointnotchangingcountdown)**  |
| string[] | **[PointReturns](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointreturns)**  |
| string[] | **[PointFieldStates](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointfieldstates)**  |
| string[] | **[PointOutputs](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointoutputs)**  |
| int | **[PointDetectVoltage](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointdetectvoltage)**  |
| int | **[PointErrorVoltage](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-pointerrorvoltage)**  |
| bool | **[testNormal](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-testnormal)**  |
| bool | **[TestMode](/SignallingSystem-doc/vb/Files/Points_8vb/#variable-testmode)**  |


## Functions Documentation

### function initialise

```csharp
void initialise()
```


### function Points

```csharp
void Points()
```


### function AirOnWithSafetyChecks

```csharp
void AirOnWithSafetyChecks()
```


### function AirOnBypassSafety

```csharp
void AirOnBypassSafety()
```


### function AirOff

```csharp
void AirOff()
```


### function PointsErrorDetection

```csharp
void PointsErrorDetection()
```


### function UpdatePointFromInput

```csharp
void UpdatePointFromInput(
    string name,
    double normalValue,
    double reverseValue
)
```


### function updatePointOutputOverride

```csharp
void updatePointOutputOverride(
    string name,
    Definitions.PointRequestState state
)
```


### function updatePointInputOverride

```csharp
void updatePointInputOverride(
    string name,
    Definitions.PointReturnState state
)
```


### function PointIOUpdate

```csharp
void PointIOUpdate()
```


### function SecondTick

```csharp
void SecondTick()
```



## Attributes Documentation

### variable PointCount

```csharp
ReadOnly int PointCount = 10;
```


### variable PointDisplayNames

```csharp
ReadOnly string[] PointDisplayNames = {"Point5a", "Point5b", "Point6a", "Point6b", "Point10", "Point11", "Point12", "Point13", "Point14", "Point19"};
```


### variable PointInternalNames

```csharp
ReadOnly string[] PointInternalNames = {"5a", "5b", "6a", "6b", "10", "11", "12", "13", "14", "19"};
```


### variable UsingAir

```csharp
string UsingAir = "Disabled";
```


### variable AirInUse

```csharp
bool AirInUse = False;
```


### variable PointRequestedOutputs

```csharp
string[] PointRequestedOutputs = {PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF};
```


### variable PointNoReturnCountdown

```csharp
int[] PointNoReturnCountdown = {160, 160, 160, 160, 160, 160, 160, 160, 160, 160};
```


### variable PointNotChangingCountdown

```csharp
int[] PointNotChangingCountdown = {160, 160, 160, 160, 160, 160, 160, 160, 160, 160};
```


### variable PointReturns

```csharp
string[] PointReturns = {PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn};
```


### variable PointFieldStates

```csharp
string[] PointFieldStates = {PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn};
```


### variable PointOutputs

```csharp
string[] PointOutputs = {PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF};
```


### variable PointDetectVoltage

```csharp
int PointDetectVoltage = 10;
```


### variable PointErrorVoltage

```csharp
int PointErrorVoltage = 5;
```


### variable testNormal

```csharp
bool testNormal = False;
```


### variable TestMode

```csharp
bool TestMode = False;
```



## Source code

```csharp

Module Points
    Public ReadOnly PointCount As Integer = 10
    Public ReadOnly PointDisplayNames() As String = {"Point5a", "Point5b", "Point6a", "Point6b", "Point10", "Point11", "Point12", "Point13", "Point14", "Point19"}
    Public ReadOnly PointInternalNames() As String = {"5a", "5b", "6a", "6b", "10", "11", "12", "13", "14", "19"}
    Public UsingAir As String = "Disabled"
    Public AirInUse As Boolean = False
    Public PointRequestedOutputs() As String = {PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF}
    Public PointNoReturnCountdown() As Integer = {160, 160, 160, 160, 160, 160, 160, 160, 160, 160}
    Public PointNotChangingCountdown() As Integer = {160, 160, 160, 160, 160, 160, 160, 160, 160, 160}
    Public PointReturns() As String = {PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn}
    Public PointFieldStates() As String = {PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn, PointReturnNoReturn}
    Public PointOutputs() As String = {PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF, PointToOFF}

    'Point detection settings
    Public PointDetectVoltage As Integer = 10
    Public PointErrorVoltage As Integer = 5
    Public testNormal As Boolean = False
    Public TestMode As Boolean = False

    Private PointMqttOutputs() As PointOutput = New PointOutput(PointCount) {}
    Private LastPointMqttOutputs() As PointOutput = New PointOutput(PointCount) {}

    Private Class PointOutput
        Public normal As Boolean
        Public reverse As Boolean

        Public Shared Operator =(ByVal s1 As PointOutput, ByVal s2 As PointOutput) As Boolean
            If s1.normal = s2.normal And s1.reverse = s2.reverse Then
                Return True
            End If
            Return False
        End Operator
        Public Shared Operator <>(ByVal s1 As PointOutput, ByVal s2 As PointOutput) As Boolean
            If s1.normal = s2.normal And s1.reverse = s2.reverse Then
                Return False
            End If
            Return True
        End Operator
    End Class

    Public Sub initialise()
        For i As Integer = 0 To PointCount - 1
            Dim output As PointOutput
            output = New PointOutput()
            output.normal = True
            output.reverse = True
            PointMqttOutputs(i) = output

            output = New PointOutput()
            output.normal = True
            output.reverse = True
            LastPointMqttOutputs(i) = output
        Next
    End Sub
    'Start
    Public Sub Points()
        If SignalsOn = True Then PointsErrorDetection()
        If TestMode = True Then
            If testNormal = True Then
                For i As Integer = 0 To PointCount - 1
                    PointOutputs(i) = PointToNormal
                Next
            Else
                For i As Integer = 0 To PointCount - 1
                    PointOutputs(i) = PointToReverse
                Next
            End If
            UsingAir = "Enabled (Without safety net)"
            AirInUse = True
        Else
            If RuntimeConfig.config.AirEnabled = True And Safety.EStopTriggered = False Then
                If RuntimeConfig.config.ForceAir = True Then
                    If Mode = LogicModeManual Then
                        AirOnBypassSafety()
                    ElseIf Mode = LogicModeComputer Then
                        AirOnWithSafetyChecks()
                    End If
                Else
                    If AirOffsetting = True Then
                        AirOff()
                    Else
                        If Mode = LogicModeManual Then
                            AirOnBypassSafety()
                        ElseIf Mode = LogicModeComputer Then
                            AirOnWithSafetyChecks()
                        End If
                    End If
                End If
            Else
                AirOff()
            End If
        End If
        PointIOUpdate()
    End Sub
    'Operating points
    Public Sub AirOnWithSafetyChecks()
        'Point 5a
        If Initializations.Point5Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And BackLockAJ1EtoAJ16E = 0 And BackLockAJ1EtoAJ18E = 0 Then
                If PointRequestedOutputs(PointNames.P5a) = PointToNormal Then
                    PointOutputs(PointNames.P5a) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P5a) = PointToReverse Then
                    PointOutputs(PointNames.P5a) = PointToReverse
                Else
                    PointOutputs(PointNames.P5a) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True Then
                If PointRequestedOutputs(PointNames.P5a) = PointToNormal Then
                    PointOutputs(PointNames.P5a) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P5a) = PointToReverse Then
                    PointOutputs(PointNames.P5a) = PointToReverse
                Else
                    PointOutputs(PointNames.P5a) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P5a) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P5a) = PointToOFF
        End If
        'Point 5b
        If Initializations.Point5Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And BackLockAJ1EtoAJ18E = 0 And BackLockAJ2EtoAJ18E = 0 And BackLockAJ21EtoAJ18E = 0 Then
                If PointRequestedOutputs(PointNames.P5b) = PointToNormal Then
                    PointOutputs(PointNames.P5b) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P5b) = PointToReverse Then
                    PointOutputs(PointNames.P5b) = PointToReverse
                Else
                    PointOutputs(PointNames.P5b) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionM) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ18W) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True Then
                If PointRequestedOutputs(PointNames.P5b) = PointToNormal Then
                    PointOutputs(PointNames.P5b) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P5b) = PointToReverse Then
                    PointOutputs(PointNames.P5b) = PointToReverse
                Else
                    PointOutputs(PointNames.P5b) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P5b) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P5b) = PointToOFF
        End If
        'Point 6a
        If Initializations.Point6Initiated Then
            If EastBound And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ18E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockAJ21EtoAJ18E = 0 Then
                If PointRequestedOutputs(PointNames.P6a) = PointToNormal Then
                    PointOutputs(PointNames.P6a) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P6a) = PointToReverse Then
                    PointOutputs(PointNames.P6a) = PointToReverse
                Else
                    PointOutputs(PointNames.P6a) = PointToOFF
                End If
            ElseIf WestBound And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True Then
                If PointRequestedOutputs(PointNames.P6a) = PointToNormal Then
                    PointOutputs(PointNames.P6a) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P6a) = PointToReverse Then
                    PointOutputs(PointNames.P6a) = PointToReverse
                Else
                    PointOutputs(PointNames.P6a) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P6a) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P6a) = PointToOFF
        End If
        'Point 6b
        If Initializations.Point6Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And BackLockAJ1EtoAJ16E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ21EtoAJ16E = 0 Then
                If PointRequestedOutputs(PointNames.P6b) = PointToNormal Then
                    PointOutputs(PointNames.P6b) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P6b) = PointToReverse Then
                    PointOutputs(PointNames.P6b) = PointToReverse
                Else
                    PointOutputs(PointNames.P6b) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionB) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ16W) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True Then
                If PointRequestedOutputs(PointNames.P6b) = PointToNormal Then
                    PointOutputs(PointNames.P6b) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P6b) = PointToReverse Then
                    PointOutputs(PointNames.P6b) = PointToReverse
                Else
                    PointOutputs(PointNames.P6b) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P6b) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P6b) = PointToOFF
        End If
        'Point 10
        If Initializations.Point10Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And BackLockAJ2EtoAJ16E = 0 And BackLockAJ2EtoAJ16E = 0 And BackLockAJ21EtoAJ16E = 0 And BackLockAJ21EtoAJ18E = 0 Then
                If PointRequestedOutputs(PointNames.P10) = PointToNormal Then
                    PointOutputs(PointNames.P10) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P10) = PointToReverse Then
                    PointOutputs(PointNames.P10) = PointToReverse
                Else
                    PointOutputs(PointNames.P10) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionQ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionL) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ2E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ21E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP10) = True Then
                If PointRequestedOutputs(PointNames.P10) = PointToNormal Then
                    PointOutputs(PointNames.P10) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P10) = PointToReverse Then
                    PointOutputs(PointNames.P10) = PointToReverse
                Else
                    PointOutputs(PointNames.P10) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P10) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P10) = PointToOFF
        End If
        'Point 11
        If Initializations.Point11Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S11) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And BackLockAJ1EtoAJ16E = 0 And BackLockAJ1EtoAJ18E = 0 And BackLockAJ1EtoSiding = 0 Then
                If PointRequestedOutputs(PointNames.P11) = PointToNormal Then
                    PointOutputs(PointNames.P11) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P11) = PointToReverse Then
                    PointOutputs(PointNames.P11) = PointToReverse
                Else
                    PointOutputs(PointNames.P11) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionK) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ1E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S11) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP11) = True Then
                If PointRequestedOutputs(PointNames.P11) = PointToNormal Then
                    PointOutputs(PointNames.P11) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P11) = PointToReverse Then
                    PointOutputs(PointNames.P11) = PointToReverse
                Else
                    PointOutputs(PointNames.P11) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P11) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P11) = PointToOFF
        End If
        'Point 12
        If Initializations.Point12Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S12) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And BackLockAJ4EtoAJ7E = 0 Then
                If PointRequestedOutputs(PointNames.P12) = PointToNormal Then
                    PointOutputs(PointNames.P12) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P12) = PointToReverse Then
                    PointOutputs(PointNames.P12) = PointToReverse
                Else
                    PointOutputs(PointNames.P12) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ15W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S12) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP12) = True Then
                If PointRequestedOutputs(PointNames.P12) = PointToNormal Then
                    PointOutputs(PointNames.P12) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P12) = PointToReverse Then
                    PointOutputs(PointNames.P12) = PointToReverse
                Else
                    PointOutputs(PointNames.P12) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P12) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P12) = PointToOFF
        End If
        'Point 13
        If Initializations.Point13Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And BackLockAJ4EtoAJ7E = 0 And BackLockAJ4EtoAJ21E = 0 Then
                If PointRequestedOutputs(PointNames.P13) = PointToNormal Then
                    PointOutputs(PointNames.P13) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P13) = PointToReverse Then
                    PointOutputs(PointNames.P13) = PointToReverse
                Else
                    PointOutputs(PointNames.P13) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ22W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ4E) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP13) = True Then
                If PointRequestedOutputs(PointNames.P13) = PointToNormal Then
                    PointOutputs(PointNames.P13) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P13) = PointToReverse Then
                    PointOutputs(PointNames.P13) = PointToReverse
                Else
                    PointOutputs(PointNames.P13) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P13) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P13) = PointToOFF
        End If
        'Point 14
        If Initializations.Point14Initiated Then
            If EastBound = True And SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S14) = SignalAtDanger And TrackSectionUnoccupied(TrackSectionNames.SectionO) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = SectionIsClear And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And BackLockAJ9EtoAJ17E = 0 And BackLockAJ9EtoSiding = 0 Then
                If PointRequestedOutputs(PointNames.P14) = PointToNormal Then
                    PointOutputs(PointNames.P14) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P14) = PointToReverse Then
                    PointOutputs(PointNames.P14) = PointToReverse
                Else
                    PointOutputs(PointNames.P14) = PointToOFF
                End If
            ElseIf WestBound = True And SignalSystemState(Definitions.SignalNames.AJ9W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ9E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S14) = SignalAtDanger And TrackSectionUnoccupied(TrackSectionNames.SectionN) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = SectionIsClear And PointSectionUnoccupied(PointSectionNames.SectionP14) = True Then
                If PointRequestedOutputs(PointNames.P14) = PointToNormal Then
                    PointOutputs(PointNames.P14) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P14) = PointToReverse Then
                    PointOutputs(PointNames.P14) = PointToReverse
                Else
                    PointOutputs(PointNames.P14) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P14) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P14) = PointToOFF
        End If
        'Point 19
        If Initializations.Point19Initiated Then
            If EastBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S19) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And BackLockAJ16EtoAJ8E = 0 And BackLockAJ16EtoSiding = 0 Then
                If PointRequestedOutputs(PointNames.P19) = PointToNormal Then
                    PointOutputs(PointNames.P19) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P19) = PointToReverse Then
                    PointOutputs(PointNames.P19) = PointToReverse
                Else
                    PointOutputs(PointNames.P19) = PointToOFF
                End If
            ElseIf WestBound = True And TrackSectionUnoccupied(TrackSectionNames.SectionC) = SectionIsClear And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = SectionIsClear And SignalSystemState(Definitions.SignalNames.AJ16E) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.AJ8W) = SignalAtDanger And SignalSystemState(Definitions.SignalNames.S19) = SignalAtDanger And PointSectionUnoccupied(PointSectionNames.SectionP19) = True Then
                If PointRequestedOutputs(PointNames.P19) = PointToNormal Then
                    PointOutputs(PointNames.P19) = PointToNormal
                ElseIf PointRequestedOutputs(PointNames.P19) = PointToReverse Then
                    PointOutputs(PointNames.P19) = PointToReverse
                Else
                    PointOutputs(PointNames.P19) = PointToOFF
                End If
            Else
                PointOutputs(PointNames.P19) = PointToOFF
            End If
        Else
            PointOutputs(PointNames.P19) = PointToOFF
        End If
        UsingAir = "Enabled (With safety net)"
        AirInUse = True
    End Sub
    Public Sub AirOnBypassSafety()
        For i As Integer = 0 To PointCount - 1
            If PointRequestedOutputs(i) = PointInNormal Then
                PointOutputs(i) = PointToNormal
            ElseIf PointRequestedOutputs(i) = PointInReverse Then
                PointOutputs(i) = PointToReverse
            Else
                PointOutputs(i) = PointToOFF
            End If
        Next
        UsingAir = "Enabled (Without safety net)"
        AirInUse = True
    End Sub
    Public Sub AirOff()
        UsingAir = "Disabled"
        AirInUse = False
        For i As Integer = 0 To PointCount - 1
            PointRequestedOutputs(i) = PointToOFF
        Next
    End Sub
    'ERROR Checking
    Public Sub PointsErrorDetection()
        For i As Integer = 0 To PointCount - 1
            'Point reading both directions
            If AnalogIOManager.ActualAnalogValue(AnalogIOManager.AnalogInputPointReturnNormal(i)) > PointDetectVoltage = True And AnalogIOManager.ActualAnalogValue(AnalogIOManager.AnalogInputPointReturnReverse(i)) > PointDetectVoltage = True Then
                Errors.NewError(Messages.PointReadingNormalAndReverseSameTime(PointDisplayNames(i)))
            Else
                Errors.RemoveError(Messages.PointReadingNormalAndReverseSameTime(PointDisplayNames(i)))
            End If
            'Point reading no return after set timer
            If (PointReturns(i) = "Reverse" Or PointReturns(i) = "Normal") Then PointNoReturnCountdown(i) = GlobalConfig.config.timers.pointNoReturn
            If PointNoReturnCountdown(i) = 0 Then
                Errors.NewError(Messages.PointReadingNoReturn(PointDisplayNames(i)))
            Else
                Errors.RemoveError(Messages.PointReadingNoReturn(PointDisplayNames(i)))
            End If
            'Point not changing when system requesting after set time
            If (Not PointReturns(i) = PointOutputs(i)) And (Not PointOutputs(i) = "Off") Then
                If PointNotChangingCountdown(i) = 0 Then Errors.NewError(Messages.PointNotChanging(PointDisplayNames(i)))
            Else
                PointNotChangingCountdown(i) = GlobalConfig.config.timers.pointNotChanging
                Errors.RemoveError(Messages.PointNotChanging(PointDisplayNames(i)))
            End If
        Next
    End Sub
    'Update Points IO
    'Update Point Output
    Private Sub UpdatePointOutputs()
        For i As Integer = 0 To PointCount - 1
            Dim RequestedState As String
            Dim NewState As PointRequestState

            ' Check if we have an override from settings
            If RuntimeConfig.config.PointOutputOverrides(i) = "System" And PointSupplyPower = True Then
                RequestedState = PointOutputs(i)
            Else
                RequestedState = RuntimeConfig.config.PointOutputOverrides(i)
            End If

            ' Check if we are already in the state - if we are, then we don't need to do anything
            ' If we aren't, then actually request a change
            If RequestedState = "Normal" And Not PointReturns(i) = PointInNormal Then
                NewState = PointRequestState.Normal
            ElseIf RequestedState = "Reverse" And Not PointReturns(i) = PointInReverse Then
                NewState = PointRequestState.Reverse
            Else
                NewState = PointRequestState.Off
            End If

            ' Relay the change to the actual outputs on the Arduino
            Select Case NewState
                Case PointRequestState.Normal
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsNormal(i)) = 1
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsReverse(i)) = 0
                    PointMqttOutputs(i).normal = True
                    PointMqttOutputs(i).reverse = False
                    Exit Select
                Case PointRequestState.Reverse
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsNormal(i)) = 0
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsReverse(i)) = 1
                    PointMqttOutputs(i).normal = False
                    PointMqttOutputs(i).reverse = True
                    Exit Select
                Case PointRequestState.Off
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsNormal(i)) = 0
                    Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressPointsReverse(i)) = 0
                    PointMqttOutputs(i).normal = False
                    PointMqttOutputs(i).reverse = False
                    Exit Select
            End Select

            If LastPointMqttOutputs(i) = PointMqttOutputs(i) Then
                ' This is the same as last time - do nothing
                Continue For
            End If
            Dim json As String

            json = Newtonsoft.Json.JsonConvert.SerializeObject(PointMqttOutputs(i))
            SignallingMqtt.Client.sendOutputState("points/" + PointInternalNames(i), json)
            LastPointMqttOutputs(i).normal = PointMqttOutputs(i).normal
            LastPointMqttOutputs(i).reverse = PointMqttOutputs(i).reverse
        Next
    End Sub

    Public Sub UpdatePointFromInput(ByVal name As String, ByVal normalValue As Double, ByVal reverseValue As Double)
        ' Get index based on name
        Dim pointIndex As Integer = Array.IndexOf(PointInternalNames, name)

        ' Check that the point actually exists in our system.
        If pointIndex = -1 Then
            ' This point does not exist
            Return
        End If
        AnalogIOManager.ActualAnalogValue(AnalogIOManager.AnalogInputPointReturnNormal(pointIndex)) = normalValue
        AnalogIOManager.ActualAnalogValue(AnalogIOManager.AnalogInputPointReturnReverse(pointIndex)) = reverseValue

        ' Set the field return value
        If normalValue >= PointDetectVoltage Then
            PointFieldStates(pointIndex) = PointReturnNormal
        ElseIf reverseValue >= PointDetectVoltage Then
            PointFieldStates(pointIndex) = PointReturnReverse
        Else
            PointFieldStates(pointIndex) = PointReturnNoReturn
        End If

        Dim prs As Definitions.PointReturnState

        ' Check the state as defined in the settings
        If RuntimeConfig.config.PointInputOverrides(pointIndex) = "System" Then
            ' Return should read what the system reads
            If PointFieldStates(pointIndex) = PointReturnNormal Then
                PointReturns(pointIndex) = PointReturnNormal
                prs = Definitions.PointReturnState.Normal
            ElseIf PointFieldStates(pointIndex) = PointReturnReverse Then
                PointReturns(pointIndex) = PointReturnReverse
                prs = Definitions.PointReturnState.Reverse
            Else
                PointReturns(pointIndex) = PointReturnNoReturn
                prs = Definitions.PointReturnState.NoReturn
            End If
            ' Or we are overriden
        ElseIf RuntimeConfig.config.PointInputOverrides(pointIndex) = PointReturnNormal Then
            PointReturns(pointIndex) = PointReturnNormal
            prs = Definitions.PointReturnState.Normal
        ElseIf RuntimeConfig.config.PointInputOverrides(pointIndex) = PointReturnReverse Then
            PointReturns(pointIndex) = PointReturnReverse
            prs = Definitions.PointReturnState.Reverse
        ElseIf RuntimeConfig.config.PointInputOverrides(pointIndex) = PointReturnNoReturn Then
            PointReturns(pointIndex) = PointReturnNoReturn
            prs = Definitions.PointReturnState.NoReturn
        End If
    End Sub

    Public Sub updatePointOutputOverride(ByVal name As String, ByVal state As Definitions.PointRequestState)
        ' Get point based on name
        Dim pointIndex As Integer = Array.IndexOf(PointInternalNames, name)

        ' Check that the point actually exists in our system.
        If pointIndex = -1 Then
            ' This section does not exist
            Return
        End If

        If state = Definitions.PointRequestState.Normal Then
            RuntimeConfig.config.PointOutputOverrides(pointIndex) = Definitions.PointToNormal
        ElseIf state = Definitions.PointRequestState.Reverse Then
            RuntimeConfig.config.PointOutputOverrides(pointIndex) = Definitions.PointToReverse
        ElseIf state = Definitions.PointRequestState.Off Then
            RuntimeConfig.config.PointOutputOverrides(pointIndex) = Definitions.PointToOFF
        ElseIf state = Definitions.PointRequestState.System Then
            RuntimeConfig.config.PointOutputOverrides(pointIndex) = "System"
        End If
    End Sub
    Public Sub updatePointInputOverride(ByVal name As String, ByVal state As Definitions.PointReturnState)
        ' Get point based on name
        Dim pointIndex As Integer = Array.IndexOf(PointInternalNames, name)

        ' Check that the point actually exists in our system.
        If pointIndex = -1 Then
            ' This section does not exist
            Return
        End If

        If state = Definitions.PointReturnState.Normal Then
            RuntimeConfig.config.PointInputOverrides(pointIndex) = Definitions.PointReturnNormal
        ElseIf state = Definitions.PointReturnState.Reverse Then
            RuntimeConfig.config.PointInputOverrides(pointIndex) = Definitions.PointReturnReverse
        ElseIf state = Definitions.PointReturnState.NoReturn Then
            RuntimeConfig.config.PointInputOverrides(pointIndex) = Definitions.PointReturnNoReturn
        ElseIf state = Definitions.PointReturnState.System Then
            RuntimeConfig.config.PointInputOverrides(pointIndex) = "System"
        End If
    End Sub

    Public Sub PointIOUpdate()
        'Outputs
        UpdatePointOutputs()
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
        For i As Integer = 0 To PointCount - 1
            If Not PointNoReturnCountdown(i) = 0 Then PointNoReturnCountdown(i) -= 1
            If Not PointNotChangingCountdown(i) = 0 Then PointNotChangingCountdown(i) -= 1
        Next
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
