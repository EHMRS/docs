---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/PointSections.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/PointSections.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updatePointSectionOverride](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#function-updatepointsectionoverride)**(string section, [Definitions.SectionState](/SignallingSystem-doc/mainsystem/Files/Definitions_8vb/#enum-sectionstate) state) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[updatePointSection](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#function-updatepointsection)**(string section, double value) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Logic](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#function-logic)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly int | **[PointSectionCount](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectioncount)**  |
| ReadOnly string[] | **[PointSectionDisplayNames](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectiondisplaynames)**  |
| ReadOnly string[] | **[PointSectionInternalNames](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectioninternalnames)**  |
| bool[] | **[PointSectionAnalogClear](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionanalogclear)**  |
| bool[] | **[PointSectionError](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionerror)**  |
| int[] | **[PointSectionErrorCount](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionerrorcount)**  |
| bool[] | **[PointSectionErrorCheckLock](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionerrorchecklock)**  |
| int[] | **[PointSectionTimer](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectiontimer)**  |
| string[] | **[PointSectionField](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionfield)**  |
| bool[] | **[PointSectionUnoccupied](/SignallingSystem-doc/mainsystem/Files/PointSections_8vb/#variable-pointsectionunoccupied)**  |


## Functions Documentation

### function updatePointSectionOverride

```csharp
void updatePointSectionOverride(
    string section,
    Definitions.SectionState state
)
```


### function updatePointSection

```csharp
void updatePointSection(
    string section,
    double value
)
```


### function Logic

```csharp
void Logic()
```


### function SecondTick

```csharp
void SecondTick()
```



## Attributes Documentation

### variable PointSectionCount

```csharp
ReadOnly int PointSectionCount = 10;
```


### variable PointSectionDisplayNames

```csharp
ReadOnly string[] PointSectionDisplayNames = {"P5a", "P5b", "P6a", "P6b", "P10", "P11", "P12", "P13", "P14", "P19"};
```


### variable PointSectionInternalNames

```csharp
ReadOnly string[] PointSectionInternalNames = {"P5a", "P5b", "P6a", "P6b", "P10", "P11", "P12", "P13", "P14", "P19"};
```


### variable PointSectionAnalogClear

```csharp
bool[] PointSectionAnalogClear = {False, False, False, False, False, False, False, False, False, False};
```


### variable PointSectionError

```csharp
bool[] PointSectionError = {False, False, False, False, False, False, False, False, False, False};
```


### variable PointSectionErrorCount

```csharp
int[] PointSectionErrorCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
```


### variable PointSectionErrorCheckLock

```csharp
bool[] PointSectionErrorCheckLock = {False, False, False, False, False, False, False, False, False, False};
```


### variable PointSectionTimer

```csharp
int[] PointSectionTimer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
```


### variable PointSectionField

```csharp
string[] PointSectionField = {"unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied"};
```


### variable PointSectionUnoccupied

```csharp
bool[] PointSectionUnoccupied = {False, False, False, False, False, False, False, False, False, False};
```



## Source code

```csharp
Module PointSections
    Public ReadOnly PointSectionCount As Integer = 10
    Public ReadOnly PointSectionDisplayNames() As String = {"P5a", "P5b", "P6a", "P6b", "P10", "P11", "P12", "P13", "P14", "P19"}
    Public ReadOnly PointSectionInternalNames() As String = {"P5a", "P5b", "P6a", "P6b", "P10", "P11", "P12", "P13", "P14", "P19"}
    Public PointSectionAnalogClear() As Boolean = {False, False, False, False, False, False, False, False, False, False}
    Public PointSectionError() As Boolean = {False, False, False, False, False, False, False, False, False, False}
    Public PointSectionErrorCount() As Integer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Public PointSectionErrorCheckLock() As Boolean = {False, False, False, False, False, False, False, False, False, False}
    Public PointSectionTimer() As Integer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Public PointSectionField() As String = {"unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied"}
    Public PointSectionUnoccupied() As Boolean = {False, False, False, False, False, False, False, False, False, False}

    Public Sub updatePointSectionOverride(ByVal section As String, ByVal state As Definitions.SectionState)
        ' Get section based on name
        Dim sectionIndex As Integer = Array.IndexOf(PointSectionInternalNames, section)

        ' Check that the section actually exists in our system.
        If sectionIndex = -1 Then
            ' This section does not exist
            Return
        End If

        If state = Definitions.SectionState.Occupied Then
            RuntimeConfig.config.PointSectionOverrides(sectionIndex) = Definitions.TrackSectionOccupiedString
        ElseIf state = Definitions.SectionState.Unoccupied Then
            RuntimeConfig.config.PointSectionOverrides(sectionIndex) = Definitions.TrackSectionUnoccupiedString
        ElseIf state = Definitions.SectionState.System Then
            RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "Detect"
        End If
    End Sub
    Public Sub updatePointSection(ByVal section As String, ByVal value As Double)
        ' Get section based on name
        Dim sectionIndex As Integer = Array.IndexOf(PointSectionInternalNames, section)

        ' Check that the section actually exists in our system.
        If sectionIndex = -1 Then
            ' This section does not exist
            Return
        End If

        AnalogIOManager.ActualAnalogValue(sectionIndex) = value

        'Check manually section voltage against set voltage
        If value >= RuntimeConfig.config.PointSectionSetPoint(sectionIndex) Then
            PointSectionAnalogClear(sectionIndex) = True
        Else
            PointSectionAnalogClear(sectionIndex) = False
        End If
        'Reset error count and clear error state if point starts detecting again
        If PointSectionUnoccupied(sectionIndex) = False Then
            PointSectionErrorCount(sectionIndex) = 0
            PointSectionError(sectionIndex) = False
            Errors.RemoveError("Section " & PointSectionDisplayNames(sectionIndex) & ", Needs testing!")
        End If
        'When error count matches trigger number then send error message on telegram 
        If PointSectionError(sectionIndex) = False Then
            If PointSectionErrorCount(sectionIndex) >= SectionPointErrorTriggerCount Then
                PointSectionError(sectionIndex) = True
                Errors.NewError("Section " & PointSectionDisplayNames(sectionIndex) & ", Needs testing!")
            End If
        End If
        'Voltage too low error
        If value <= RuntimeConfig.config.PointSectionSetPointError(sectionIndex) Then
            Errors.NewError("Section " & PointSectionDisplayNames(sectionIndex) & ", Under Voltage!")
        Else
            Errors.RemoveError("Section " & PointSectionDisplayNames(sectionIndex) & ", Under Voltage!")
        End If
        'Set timers
        If PointSectionAnalogClear(sectionIndex) = False Then
            PointSectionTimer(sectionIndex) = SectionPointDelay
        End If
        'Final output logic
        If PointSectionAnalogClear(sectionIndex) = True And PointSectionTimer(sectionIndex) = 0 Then
            PointSectionField(sectionIndex) = "Non-Occupied"
            If RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "Detect" Then
                PointSectionUnoccupied(sectionIndex) = True
            ElseIf RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "Occupy" Then
                PointSectionUnoccupied(sectionIndex) = False
            ElseIf RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "UnOccupied" Then
                PointSectionUnoccupied(sectionIndex) = True
            Else
                PointSectionUnoccupied(sectionIndex) = False
            End If
        Else
            PointSectionField(sectionIndex) = "Occupied"
            If RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "Detect" Then
                PointSectionUnoccupied(sectionIndex) = False
            ElseIf RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "Occupy" Then
                PointSectionUnoccupied(sectionIndex) = False
            ElseIf RuntimeConfig.config.PointSectionOverrides(sectionIndex) = "UnOccupied" Then
                PointSectionUnoccupied(sectionIndex) = True
            Else
                PointSectionUnoccupied(sectionIndex) = False
            End If
        End If
    End Sub

    Public Sub Logic()
        Return
        For i As Integer = 0 To PointSectionCount - 1
            'Check manually section voltage against set voltage
            If AnalogIOManager.ActualAnalogValue(AnalogInputPointSections(i)) >= RuntimeConfig.config.PointSectionSetPoint(i) Then
                PointSectionAnalogClear(i) = True
            Else
                PointSectionAnalogClear(i) = False
            End If
            'Reset error count and clear error state if point starts detecting again
            If PointSectionUnoccupied(i) = False Then
                PointSectionErrorCount(i) = 0
                PointSectionError(i) = False
                Errors.RemoveError("Section " & PointSectionDisplayNames(i) & ", Needs testing!")
            End If
            'When error count matches trigger number then send error message on telegram 
            If PointSectionError(i) = False Then
                If PointSectionErrorCount(i) >= SectionPointErrorTriggerCount Then
                    PointSectionError(i) = True
                    Errors.NewError("Section " & PointSectionDisplayNames(i) & ", Needs testing!")
                End If
            End If
            'Voltage too low error
            If AnalogIOManager.ActualAnalogValue(AnalogInputPointSections(i)) <= RuntimeConfig.config.PointSectionSetPointError(i) Then
                Errors.NewError("Section " & PointSectionDisplayNames(i) & ", Under Voltage!")
            Else
                Errors.RemoveError("Section " & PointSectionDisplayNames(i) & ", Under Voltage!")
            End If
            'Set timers
            If PointSectionAnalogClear(i) = False Then
                PointSectionTimer(i) = SectionPointDelay
            End If
            'Final output logic
            If PointSectionAnalogClear(i) = True And PointSectionTimer(i) = 0 Then
                PointSectionField(i) = "Non-Occupied"
                If RuntimeConfig.config.PointSectionOverrides(i) = "Detect" Then
                    PointSectionUnoccupied(i) = True
                ElseIf RuntimeConfig.config.PointSectionOverrides(i) = "Occupy" Then
                    PointSectionUnoccupied(i) = False
                ElseIf RuntimeConfig.config.PointSectionOverrides(i) = "UnOccupied" Then
                    PointSectionUnoccupied(i) = True
                Else
                    PointSectionUnoccupied(i) = False
                End If
            Else
                PointSectionField(i) = "Occupied"
                If RuntimeConfig.config.PointSectionOverrides(i) = "Detect" Then
                    PointSectionUnoccupied(i) = False
                ElseIf RuntimeConfig.config.PointSectionOverrides(i) = "Occupy" Then
                    PointSectionUnoccupied(i) = False
                ElseIf RuntimeConfig.config.PointSectionOverrides(i) = "UnOccupied" Then
                    PointSectionUnoccupied(i) = True
                Else
                    PointSectionUnoccupied(i) = False
                End If
            End If
        Next
        'Error Logic
        'PointSectionP5a
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP5a) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False And TrackSectionUnoccupied(TrackSectionNames.SectionA) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointReturns(PointNames.P5a) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP5a) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP5a) = True
            ElseIf PointSectionUnoccupied(PointSectionNames.SectionP11) = False And TrackSectionUnoccupied(TrackSectionNames.SectionK) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointReturns(PointNames.P5a) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP5a) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP5a) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionH) = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = True And PointReturns(PointNames.P5a) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP5a) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = True And TrackSectionUnoccupied(TrackSectionNames.SectionK) = True And PointReturns(PointNames.P5a) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP5a) = False
        End If
        'PointSectionP5b
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP5b) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionM) = False And TrackSectionUnoccupied(TrackSectionNames.SectionL) = False And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And PointReturns(PointNames.P5b) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP5b) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP5b) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionM) = False And TrackSectionUnoccupied(TrackSectionNames.SectionK) = False And PointSectionUnoccupied(PointSectionNames.SectionP5b) = True And PointReturns(PointNames.P5b) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP5b) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP5b) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionM) = True And TrackSectionUnoccupied(TrackSectionNames.SectionL) = True And PointReturns(PointNames.P5b) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP5b) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionM) = True And TrackSectionUnoccupied(TrackSectionNames.SectionK) = True And PointReturns(PointNames.P5b) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP5b) = False
        End If
        'PointSectionP6a
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP6a) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False And TrackSectionUnoccupied(TrackSectionNames.SectionL) = False And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointReturns(PointNames.P6a) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP6a) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP6a) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointReturns(PointNames.P6a) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP6a) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP6a) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = True And TrackSectionUnoccupied(TrackSectionNames.SectionL) = True And PointReturns(PointNames.P6a) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP6a) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = True And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = True And PointReturns(PointNames.P6a) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP6a) = False
        End If
        'PointSectionP6b
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP6b) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionB) = False And TrackSectionUnoccupied(TrackSectionNames.SectionA) = False And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And PointReturns(PointNames.P6b) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP6b) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP6b) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionB) = False And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False And PointSectionUnoccupied(PointSectionNames.SectionP6b) = True And PointReturns(PointNames.P6b) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP6b) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP6b) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionB) = True And TrackSectionUnoccupied(TrackSectionNames.SectionA) = True And PointReturns(PointNames.P6b) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP6b) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionB) = True And TrackSectionUnoccupied(TrackSectionNames.SectionJ) = True And PointReturns(PointNames.P6b) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP6b) = False
        End If
        'PointSectionP10
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP10) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False And PointSectionUnoccupied(PointSectionNames.SectionP6a) = False And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And PointReturns(PointNames.P10) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP10) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP10) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False And PointSectionUnoccupied(PointSectionNames.SectionP10) = True And PointReturns(PointNames.P10) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP10) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP10) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = True And PointSectionUnoccupied(PointSectionNames.SectionP6a) = True And PointReturns(PointNames.P10) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP10) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionQ) = True And TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = True And PointReturns(PointNames.P10) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP10) = False
        End If
        'PointSectionP11
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP11) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = False And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And PointReturns(PointNames.P11) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP11) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP11) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = False And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = False And PointSectionUnoccupied(PointSectionNames.SectionP11) = True And PointReturns(PointNames.P11) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP11) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP11) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionH) = True And PointSectionUnoccupied(PointSectionNames.SectionP5a) = True And PointReturns(PointNames.P11) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP11) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionH) = True And TrackSectionUnoccupied(TrackSectionNames.SectionA11) = True And PointReturns(PointNames.P11) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP11) = False
        End If
        'PointSectionP12
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP12) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionG) = False And TrackSectionUnoccupied(TrackSectionNames.SectionF) = False And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And PointReturns(PointNames.P12) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP12) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP12) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionG) = False And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = False And PointSectionUnoccupied(PointSectionNames.SectionP12) = True And PointReturns(PointNames.P12) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP12) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP12) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionG) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = True And PointReturns(PointNames.P12) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP12) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionG) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF12) = True And PointReturns(PointNames.P12) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP12) = False
        End If
        'PointSectionP13
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP13) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionE) = False And TrackSectionUnoccupied(TrackSectionNames.SectionF) = False And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And PointReturns(PointNames.P13) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP13) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP13) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionE) = False And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = False And PointSectionUnoccupied(PointSectionNames.SectionP13) = True And PointReturns(PointNames.P13) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP13) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP13) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionE) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF) = True And PointReturns(PointNames.P13) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP13) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionE) = True And TrackSectionUnoccupied(TrackSectionNames.SectionF13) = True And PointReturns(PointNames.P13) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP13) = False
        End If
        'PointSectionP14
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP14) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionN) = False And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = False And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And PointReturns(PointNames.P14) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP14) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP14) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionN) = False And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = False And PointSectionUnoccupied(PointSectionNames.SectionP14) = True And PointReturns(PointNames.P14) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP14) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP14) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionN) = True And TrackSectionUnoccupied(TrackSectionNames.SectionNO) = True And PointReturns(PointNames.P14) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP14) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionN) = True And TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = True And PointReturns(PointNames.P14) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP14) = False
        End If
        'PointSectionP19
        'Check if point has not triggered when sections either side have been
        If PointSectionErrorCheckLock(PointSectionNames.SectionP19) = False Then
            If TrackSectionUnoccupied(TrackSectionNames.SectionC) = False And TrackSectionUnoccupied(TrackSectionNames.SectionD) = False And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And PointReturns(PointNames.P19) = PointInNormal Then
                PointSectionErrorCount(PointSectionNames.SectionP19) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP19) = True
            ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionC) = False And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = False And PointSectionUnoccupied(PointSectionNames.SectionP19) = True And PointReturns(PointNames.P19) = PointInReverse Then
                PointSectionErrorCount(PointSectionNames.SectionP19) = +1
                PointSectionErrorCheckLock(PointSectionNames.SectionP19) = True
            End If
        End If
        'if sections around point are clear then clear check lock
        If TrackSectionUnoccupied(TrackSectionNames.SectionC) = True And TrackSectionUnoccupied(TrackSectionNames.SectionD) = True And PointReturns(PointNames.P19) = PointInNormal Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP19) = False
        ElseIf TrackSectionUnoccupied(TrackSectionNames.SectionC) = True And TrackSectionUnoccupied(TrackSectionNames.SectionC19) = True And PointReturns(PointNames.P19) = PointInReverse Then
            PointSectionErrorCheckLock(PointSectionNames.SectionP19) = False
        End If
    End Sub
    Public Sub SecondTick()
        For i As Integer = 0 To PointSectionCount - 1
            If Not PointSectionTimer(i) = 0 Then PointSectionTimer(i) -= 1
        Next
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:18:55 +0000
