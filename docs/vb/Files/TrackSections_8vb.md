---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/TrackSections.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/TrackSections.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| ReadOnly | **[TrackSectionDisplayNames](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-tracksectiondisplaynames)**() |
| ReadOnly | **[TrackSectionInternalNames](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-tracksectioninternalnames)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[updateTrackSection](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-updatetracksection)**(string section, double value) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[updateTrackSectionOverride](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-updatetracksectionoverride)**(string section, [Definitions.SectionState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-sectionstate) state) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[Logic](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-logic)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly int | **[TrackSectionCount](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectioncount)**  |
| bool[] | **[TrackSectionAnalogClear](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectionanalogclear)**  |
| int[] | **[TrackSectionErrorSetPoint](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectionerrorsetpoint)**  |
| bool[] | **[TrackSectionError](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectionerror)**  |
| int[] | **[TrackSectionTimer](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectiontimer)**  |
| string[] | **[TrackSectionField](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectionfield)**  |
| bool[] | **[TrackSectionUnoccupied](/SignallingSystem-doc/vb/Files/TrackSections_8vb/#variable-tracksectionunoccupied)**  |


## Functions Documentation

### function TrackSectionDisplayNames

```csharp
ReadOnly TrackSectionDisplayNames()
```


### function TrackSectionInternalNames

```csharp
ReadOnly TrackSectionInternalNames()
```


### function updateTrackSection

```csharp
void updateTrackSection(
    string section,
    double value
)
```


### function updateTrackSectionOverride

```csharp
void updateTrackSectionOverride(
    string section,
    Definitions.SectionState state
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

### variable TrackSectionCount

```csharp
ReadOnly int TrackSectionCount = 28;
```


### variable TrackSectionAnalogClear

```csharp
bool[] TrackSectionAnalogClear = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```


### variable TrackSectionErrorSetPoint

```csharp
int[] TrackSectionErrorSetPoint = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
```


### variable TrackSectionError

```csharp
bool[] TrackSectionError = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```


### variable TrackSectionTimer

```csharp
int[] TrackSectionTimer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
```


### variable TrackSectionField

```csharp
string[] TrackSectionField = {"unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied"};
```


### variable TrackSectionUnoccupied

```csharp
bool[] TrackSectionUnoccupied = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False};
```



## Source code

```csharp
Module TrackSections
    Public ReadOnly TrackSectionCount As Integer = 28
    Public ReadOnly TrackSectionDisplayNames() = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "DE", "NO", "OP", "Q10", "A11", "F12", "F13", "NO14", "C19", "R", "CD"}
    Public ReadOnly TrackSectionInternalNames() = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "DE", "NO", "OP", "Q10", "A11", "F12", "F13", "NO14", "C19", "R", "CD"}
    Public TrackSectionAnalogClear() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public TrackSectionErrorSetPoint() As Integer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Public TrackSectionError() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}
    Public TrackSectionTimer() As Integer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Public TrackSectionField() As String = {"unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied", "unoccupied"}
    Public TrackSectionUnoccupied() As Boolean = {False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

    Public Sub updateTrackSection(ByVal section As String, ByVal value As Double)
        ' Get section based on name
        Dim sectionIndex As Integer = Array.IndexOf(TrackSectionInternalNames, section)

        ' Check that the section actually exists in our system.
        If sectionIndex = -1 Then
            ' This section does not exist
            Return
        End If

        AnalogIOManager.ActualAnalogValue(AnalogIOManager.AnalogInputTrackSections(sectionIndex)) = value

        'Check section voltage against set voltage
        If value >= RuntimeConfig.config.TrackSectionSetPoint(sectionIndex) Then
            TrackSectionAnalogClear(sectionIndex) = True
        Else
            TrackSectionAnalogClear(sectionIndex) = False
        End If
        'Do logic to check if read voltage is below error set voltage
        If value <= RuntimeConfig.config.TrackSectionSetPointError(sectionIndex) Then
            TrackSectionError(sectionIndex) = True
        Else
            TrackSectionError(sectionIndex) = False
        End If
        'Set timers
        If TrackSectionAnalogClear(sectionIndex) = False Then TrackSectionTimer(sectionIndex) = SectionDelay
        'Final output logic
        If TrackSectionAnalogClear(sectionIndex) = True And TrackSectionTimer(sectionIndex) = 0 Then
            TrackSectionField(sectionIndex) = "Non-Occupied"
            If RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "Detect" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsClear
            ElseIf RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "Occupy" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsOccupied
            ElseIf RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "UnOccupied" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsClear
            Else
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsOccupied
            End If
        Else
            TrackSectionField(sectionIndex) = "Occupied"
            If RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "Detect" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsOccupied
            ElseIf RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "Occupy" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsOccupied
            ElseIf RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "UnOccupied" Then
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsClear
            Else
                TrackSectionUnoccupied(sectionIndex) = Definitions.SectionIsOccupied
            End If
        End If
    End Sub

    Public Sub updateTrackSectionOverride(ByVal section As String, ByVal state As Definitions.SectionState)
        ' Get section based on name
        Dim sectionIndex As Integer = Array.IndexOf(TrackSectionInternalNames, section)

        ' Check that the section actually exists in our system.
        If sectionIndex = -1 Then
            ' This section does not exist
            Return
        End If

        If state = Definitions.SectionState.Occupied Then
            RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = Definitions.TrackSectionOccupiedString
        ElseIf state = Definitions.SectionState.Unoccupied Then
            RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = Definitions.TrackSectionUnoccupiedString
        ElseIf state = Definitions.SectionState.System Then
            RuntimeConfig.config.TrackSectionOverrides(sectionIndex) = "Detect"
        End If
    End Sub
    Public Sub Logic()
        Return
        For i As Integer = 0 To TrackSectionCount - 1
            'Check section voltage against set voltage
            If ActualAnalogValue(i + 1) >= RuntimeConfig.config.TrackSectionSetPoint(i) Then
                TrackSectionAnalogClear(i) = True
            Else
                TrackSectionAnalogClear(i) = False
            End If
            'Do logic to check if read voltage is below error set voltage
            If ActualAnalogValue(i + 1) <= RuntimeConfig.config.TrackSectionSetPointError(i) Then
                TrackSectionError(i) = True
            Else
                TrackSectionError(i) = False
            End If
            'Set timers
            If TrackSectionAnalogClear(i) = False Then TrackSectionTimer(i) = SectionDelay
            'Final output logic
            If TrackSectionAnalogClear(i) = True And TrackSectionTimer(i) = 0 Then
                TrackSectionField(i) = "Non-Occupied"
                If RuntimeConfig.config.TrackSectionOverrides(i) = "Detect" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsClear
                ElseIf RuntimeConfig.config.TrackSectionOverrides(i) = "Occupy" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsOccupied
                ElseIf RuntimeConfig.config.TrackSectionOverrides(i) = "UnOccupied" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsClear
                Else
                    TrackSectionUnoccupied(i) = Definitions.SectionIsOccupied
                End If
            Else
                TrackSectionField(i) = "Occupied"
                If RuntimeConfig.config.TrackSectionOverrides(i) = "Detect" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsOccupied
                ElseIf RuntimeConfig.config.TrackSectionOverrides(i) = "Occupy" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsOccupied
                ElseIf RuntimeConfig.config.TrackSectionOverrides(i) = "UnOccupied" Then
                    TrackSectionUnoccupied(i) = Definitions.SectionIsClear
                Else
                    TrackSectionUnoccupied(i) = Definitions.SectionIsOccupied
                End If
            End If
        Next
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
        For i As Integer = 0 To TrackSectionCount - 1
            If Not TrackSectionTimer(i) = 0 Then TrackSectionTimer(i) -= 1
        Next
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:05 +0000
