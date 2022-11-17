---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/Definitions.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/Definitions.vb



## Types

|                | Name           |
| -------------- | -------------- |
| enum class| **[messageIndexes](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-messageindexes)** { Output = 0, System = 1, Override = 2} |
| enum class| **[SignalOutputStates](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-signaloutputstates)** { Danger = 0, Caution = 1, Clear = 2, Shunt = 3, Bypass = 4, System = -1} |
| enum class| **[TrackSectionNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-tracksectionnames)** { SectionA = 0, SectionB = 1, SectionC = 2, SectionD = 3, SectionE = 4, SectionF = 5, SectionG = 6, SectionH = 7, SectionI = 8, SectionJ = 9, SectionK = 10, SectionL = 11, SectionM = 12, SectionN = 13, SectionO = 14, SectionP = 15, SectionQ = 16, SectionDE = 17, SectionNO = 18, SectionOP = 19, SectionQ10 = 20, SectionA11 = 21, SectionF12 = 22, SectionF13 = 23, SectionNO14 = 24, SectionC19 = 25, SectionR = 26, SectionCD = 27} |
| enum class| **[PointSectionNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointsectionnames)** { SectionP5a = 0, SectionP5b = 1, SectionP6a = 2, SectionP6b = 3, SectionP10 = 4, SectionP11 = 5, SectionP12 = 6, SectionP13 = 7, SectionP14 = 8, SectionP19 = 9} |
| enum class| **[SectionState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-sectionstate)** { Unoccupied = 1, Occupied = 0, System = -1} |
| enum class| **[PointNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointnames)** { P5a = 0, P5b = 1, P6a = 2, P6b = 3, P10 = 4, P11 = 5, P12 = 6, P13 = 7, P14 = 8, P19 = 9} |
| enum class| **[PointRequestState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointrequeststate)** { Normal = 1, Reverse = 2, Off = 0, System = -1} |
| enum class| **[PointReturnState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-pointreturnstate)** { Normal = 1, Reverse = 2, NoReturn = 0, System = -1} |
| enum class| **[LeverNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-levernames)** { Lever1 = 0, Lever2 = 1, Lever3 = 2, Lever4 = 3, Lever5 = 4, Lever6 = 5, Lever7 = 6, Lever8 = 7, Lever9 = 8, Lever10 = 9, Lever11 = 10, Lever12 = 11, Lever13 = 12, Lever14 = 13, Lever15 = 14, Lever16 = 15, Lever17 = 16, Lever18 = 17, Lever19 = 18, Lever20 = 19, Lever21 = 20, Lever22 = 21, Lever23 = 22, Lever24 = 23} |
| enum class| **[LeverIndicatorNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-leverindicatornames)** { Lever24Top = 0, Lever23Top = 1, Lever22Top = 2, Lever21Top = 3, Lever20Top = 4, Lever19Top = 5, Lever18Top = 6, Lever17Top = 7, Lever16Top = 8, Lever15Top = 9, Lever14Top = 10, Lever13Top = 11, Lever12Top = 12, Lever11Top = 13, Lever10Top = 14, Lever9Top = 15, Lever8Top = 16, Lever7Top = 17, Lever6Top = 18, Lever5Top = 19, Lever4Top = 20, Lever3Top = 21, Lever2Top = 22, Lever1Top = 23, Lever1Bottom = 24, Lever2Bottom = 25, Lever3Bottom = 26, Lever4Bottom = 27, Lever5Bottom = 28, Lever6Bottom = 29, Lever7Bottom = 30, Lever8Bottom = 31, Lever9Bottom = 32, Lever10Bottom = 33, Lever11Bottom = 34, Lever12Bottom = 35, Lever13Bottom = 36, Lever14Bottom = 37, Lever15Bottom = 38, Lever16Bottom = 39, Lever17Bottom = 40, Lever18Bottom = 41, Lever19Bottom = 42, Lever20Bottom = 43, Lever21Bottom = 44, Lever22Bottom = 45, Lever23Bottom = 46, Lever24Bottom = 47} |
| enum class| **[LeverState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-leverstate)** { Normal = 1, Reverse = 2, Off = 0, System = -1} |
| enum class| **[LeverLockState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-leverlockstate)** { Locked = 1, Unlocked = 2, System = -1} |
| enum class| **[ButtonOutputState](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-buttonoutputstate)** { IndicatorOn = 1, IndicatorOff = 2, System = -1} |
| enum class| **[ButtonNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-buttonnames)** { Button1 = 0, Button2 = 1, Button3 = 2, Button4 = 3, Button5 = 4, Button6 = 5, Button7 = 6, Button8 = 7, Button9 = 8, Button10 = 9, Button11 = 10, Button12 = 11, Button13 = 12, Button14 = 13, Button15 = 14, Button16 = 15, Button17 = 16, Button18 = 17, Button19 = 18, Button20 = 19, Button21 = 20, Button22 = 21, Button23 = 22, Button24 = 23, Button25 = 24, Button26 = 25, Button27 = 26, Button28 = 27, Button29 = 28, Button30 = 29, Button31 = 30, Button32 = 31, Button33 = 32, Button34 = 33, Button35 = 34, Button36 = 35, Button37 = 36, Button38 = 37, Button39 = 38, Button40 = 39} |
| enum class| **[SignalNames](/SignallingSystem-doc/vb/Files/Definitions_8vb/#enum-signalnames)** { AJ1E = 0, AJ2E = 1, AJ3E = 2, RAJ3E = 3, AJ4E = 4, AJ7E = 5, AJ8E = 6, AJ9E = 7, AJ16E = 8, AJ17E = 9, AJ18E = 10, AJ21E = 11, AJ3W = 12, AJ7W = 13, AJ8W = 14, AJ9W = 15, AJ15W = 16, AJ16W = 17, AJ17W = 18, AJ18W = 19, AJ22W = 20, S11 = 21, S12 = 22, S14 = 23, S19 = 24} |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ReadOnly string | **[PointReturnNormal](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointreturnnormal)**  |
| ReadOnly string | **[PointReturnReverse](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointreturnreverse)**  |
| ReadOnly string | **[PointReturnNoReturn](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointreturnnoreturn)**  |
| ReadOnly string | **[SignalAtDanger](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-signalatdanger)**  |
| ReadOnly string | **[SignalAtCaution](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-signalatcaution)**  |
| ReadOnly string | **[SignalAtClear](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-signalatclear)**  |
| ReadOnly string | **[SignalAtShunt](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-signalatshunt)**  |
| ReadOnly string | **[SignalAtBypass](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-signalatbypass)**  |
| ReadOnly string | **[LeverInNormal](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-leverinnormal)**  |
| ReadOnly string | **[LeverInReverse](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-leverinreverse)**  |
| ReadOnly string | **[PointInNormal](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointinnormal)**  |
| ReadOnly string | **[PointInReverse](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointinreverse)**  |
| ReadOnly string | **[PointToNormal](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointtonormal)**  |
| ReadOnly string | **[PointToReverse](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointtoreverse)**  |
| ReadOnly string | **[PointToOFF](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-pointtooff)**  |
| ReadOnly string | **[LogicModeComputer](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-logicmodecomputer)**  |
| ReadOnly string | **[LogicModeManual](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-logicmodemanual)**  |
| ReadOnly bool | **[SectionIsOccupied](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-sectionisoccupied)**  |
| ReadOnly bool | **[SectionIsClear](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-sectionisclear)**  |
| ReadOnly string | **[TrackSectionOccupiedString](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-tracksectionoccupiedstring)**  |
| ReadOnly string | **[TrackSectionUnoccupiedString](/SignallingSystem-doc/vb/Files/Definitions_8vb/#variable-tracksectionunoccupiedstring)**  |

## Types Documentation

### enum messageIndexes

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Output | 0|   |
| System | 1|   |
| Override | 2|   |




### enum SignalOutputStates

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Danger | 0|   |
| Caution | 1|   |
| Clear | 2|   |
| Shunt | 3|   |
| Bypass | 4|   |
| System | -1|   |




### enum TrackSectionNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| SectionA | 0|   |
| SectionB | 1|   |
| SectionC | 2|   |
| SectionD | 3|   |
| SectionE | 4|   |
| SectionF | 5|   |
| SectionG | 6|   |
| SectionH | 7|   |
| SectionI | 8|   |
| SectionJ | 9|   |
| SectionK | 10|   |
| SectionL | 11|   |
| SectionM | 12|   |
| SectionN | 13|   |
| SectionO | 14|   |
| SectionP | 15|   |
| SectionQ | 16|   |
| SectionDE | 17|   |
| SectionNO | 18|   |
| SectionOP | 19|   |
| SectionQ10 | 20|   |
| SectionA11 | 21|   |
| SectionF12 | 22|   |
| SectionF13 | 23|   |
| SectionNO14 | 24|   |
| SectionC19 | 25|   |
| SectionR | 26|   |
| SectionCD | 27|   |




### enum PointSectionNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| SectionP5a | 0|   |
| SectionP5b | 1|   |
| SectionP6a | 2|   |
| SectionP6b | 3|   |
| SectionP10 | 4|   |
| SectionP11 | 5|   |
| SectionP12 | 6|   |
| SectionP13 | 7|   |
| SectionP14 | 8|   |
| SectionP19 | 9|   |




### enum SectionState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Unoccupied | 1|   |
| Occupied | 0|   |
| System | -1|   |




### enum PointNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| P5a | 0|   |
| P5b | 1|   |
| P6a | 2|   |
| P6b | 3|   |
| P10 | 4|   |
| P11 | 5|   |
| P12 | 6|   |
| P13 | 7|   |
| P14 | 8|   |
| P19 | 9|   |




### enum PointRequestState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Normal | 1|   |
| Reverse | 2|   |
| Off | 0|   |
| System | -1|   |




### enum PointReturnState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Normal | 1|   |
| Reverse | 2|   |
| NoReturn | 0|   |
| System | -1|   |




### enum LeverNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Lever1 | 0|   |
| Lever2 | 1|   |
| Lever3 | 2|   |
| Lever4 | 3|   |
| Lever5 | 4|   |
| Lever6 | 5|   |
| Lever7 | 6|   |
| Lever8 | 7|   |
| Lever9 | 8|   |
| Lever10 | 9|   |
| Lever11 | 10|   |
| Lever12 | 11|   |
| Lever13 | 12|   |
| Lever14 | 13|   |
| Lever15 | 14|   |
| Lever16 | 15|   |
| Lever17 | 16|   |
| Lever18 | 17|   |
| Lever19 | 18|   |
| Lever20 | 19|   |
| Lever21 | 20|   |
| Lever22 | 21|   |
| Lever23 | 22|   |
| Lever24 | 23|   |




### enum LeverIndicatorNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Lever24Top | 0|   |
| Lever23Top | 1|   |
| Lever22Top | 2|   |
| Lever21Top | 3|   |
| Lever20Top | 4|   |
| Lever19Top | 5|   |
| Lever18Top | 6|   |
| Lever17Top | 7|   |
| Lever16Top | 8|   |
| Lever15Top | 9|   |
| Lever14Top | 10|   |
| Lever13Top | 11|   |
| Lever12Top | 12|   |
| Lever11Top | 13|   |
| Lever10Top | 14|   |
| Lever9Top | 15|   |
| Lever8Top | 16|   |
| Lever7Top | 17|   |
| Lever6Top | 18|   |
| Lever5Top | 19|   |
| Lever4Top | 20|   |
| Lever3Top | 21|   |
| Lever2Top | 22|   |
| Lever1Top | 23|   |
| Lever1Bottom | 24|   |
| Lever2Bottom | 25|   |
| Lever3Bottom | 26|   |
| Lever4Bottom | 27|   |
| Lever5Bottom | 28|   |
| Lever6Bottom | 29|   |
| Lever7Bottom | 30|   |
| Lever8Bottom | 31|   |
| Lever9Bottom | 32|   |
| Lever10Bottom | 33|   |
| Lever11Bottom | 34|   |
| Lever12Bottom | 35|   |
| Lever13Bottom | 36|   |
| Lever14Bottom | 37|   |
| Lever15Bottom | 38|   |
| Lever16Bottom | 39|   |
| Lever17Bottom | 40|   |
| Lever18Bottom | 41|   |
| Lever19Bottom | 42|   |
| Lever20Bottom | 43|   |
| Lever21Bottom | 44|   |
| Lever22Bottom | 45|   |
| Lever23Bottom | 46|   |
| Lever24Bottom | 47|   |




### enum LeverState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Normal | 1|   |
| Reverse | 2|   |
| Off | 0|   |
| System | -1|   |




### enum LeverLockState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Locked | 1|   |
| Unlocked | 2|   |
| System | -1|   |




### enum ButtonOutputState

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| IndicatorOn | 1|   |
| IndicatorOff | 2|   |
| System | -1|   |




### enum ButtonNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Button1 | 0|   |
| Button2 | 1|   |
| Button3 | 2|   |
| Button4 | 3|   |
| Button5 | 4|   |
| Button6 | 5|   |
| Button7 | 6|   |
| Button8 | 7|   |
| Button9 | 8|   |
| Button10 | 9|   |
| Button11 | 10|   |
| Button12 | 11|   |
| Button13 | 12|   |
| Button14 | 13|   |
| Button15 | 14|   |
| Button16 | 15|   |
| Button17 | 16|   |
| Button18 | 17|   |
| Button19 | 18|   |
| Button20 | 19|   |
| Button21 | 20|   |
| Button22 | 21|   |
| Button23 | 22|   |
| Button24 | 23|   |
| Button25 | 24|   |
| Button26 | 25|   |
| Button27 | 26|   |
| Button28 | 27|   |
| Button29 | 28|   |
| Button30 | 29|   |
| Button31 | 30|   |
| Button32 | 31|   |
| Button33 | 32|   |
| Button34 | 33|   |
| Button35 | 34|   |
| Button36 | 35|   |
| Button37 | 36|   |
| Button38 | 37|   |
| Button39 | 38|   |
| Button40 | 39|   |




### enum SignalNames

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| AJ1E | 0|   |
| AJ2E | 1|   |
| AJ3E | 2|   |
| RAJ3E | 3|   |
| AJ4E | 4|   |
| AJ7E | 5|   |
| AJ8E | 6|   |
| AJ9E | 7|   |
| AJ16E | 8|   |
| AJ17E | 9|   |
| AJ18E | 10|   |
| AJ21E | 11|   |
| AJ3W | 12|   |
| AJ7W | 13|   |
| AJ8W | 14|   |
| AJ9W | 15|   |
| AJ15W | 16|   |
| AJ16W | 17|   |
| AJ17W | 18|   |
| AJ18W | 19|   |
| AJ22W | 20|   |
| S11 | 21|   |
| S12 | 22|   |
| S14 | 23|   |
| S19 | 24|   |






## Attributes Documentation

### variable PointReturnNormal

```csharp
ReadOnly string PointReturnNormal = "Normal";
```


### variable PointReturnReverse

```csharp
ReadOnly string PointReturnReverse = "Reverse";
```


### variable PointReturnNoReturn

```csharp
ReadOnly string PointReturnNoReturn = "No Return";
```


### variable SignalAtDanger

```csharp
ReadOnly string SignalAtDanger = "Danger";
```


### variable SignalAtCaution

```csharp
ReadOnly string SignalAtCaution = "Caution";
```


### variable SignalAtClear

```csharp
ReadOnly string SignalAtClear = "Clear";
```


### variable SignalAtShunt

```csharp
ReadOnly string SignalAtShunt = "Shunt";
```


### variable SignalAtBypass

```csharp
ReadOnly string SignalAtBypass = "Bypass";
```


### variable LeverInNormal

```csharp
ReadOnly string LeverInNormal = "Normal";
```


### variable LeverInReverse

```csharp
ReadOnly string LeverInReverse = "Reverse";
```


### variable PointInNormal

```csharp
ReadOnly string PointInNormal = "Normal";
```


### variable PointInReverse

```csharp
ReadOnly string PointInReverse = "Reverse";
```


### variable PointToNormal

```csharp
ReadOnly string PointToNormal = "Normal";
```


### variable PointToReverse

```csharp
ReadOnly string PointToReverse = "Reverse";
```


### variable PointToOFF

```csharp
ReadOnly string PointToOFF = "Off";
```


### variable LogicModeComputer

```csharp
ReadOnly string LogicModeComputer = "Computer";
```


### variable LogicModeManual

```csharp
ReadOnly string LogicModeManual = "Manual";
```


### variable SectionIsOccupied

```csharp
ReadOnly bool SectionIsOccupied = False;
```


### variable SectionIsClear

```csharp
ReadOnly bool SectionIsClear = True;
```


### variable TrackSectionOccupiedString

```csharp
ReadOnly string TrackSectionOccupiedString = "Occupied";
```


### variable TrackSectionUnoccupiedString

```csharp
ReadOnly string TrackSectionUnoccupiedString = "Unoccupied";
```



## Source code

```csharp
Module Definitions

    Enum messageIndexes
        Output = 0
        System = 1
        Override = 2
    End Enum
    Enum SignalOutputStates
        Danger = 0
        Caution = 1
        Clear = 2
        Shunt = 3
        Bypass = 4
        System = -1
    End Enum
    'Sections
    Enum TrackSectionNames
        SectionA = 0
        SectionB = 1
        SectionC = 2
        SectionD = 3
        SectionE = 4
        SectionF = 5
        SectionG = 6
        SectionH = 7
        SectionI = 8
        SectionJ = 9
        SectionK = 10
        SectionL = 11
        SectionM = 12
        SectionN = 13
        SectionO = 14
        SectionP = 15
        SectionQ = 16
        SectionDE = 17
        SectionNO = 18
        SectionOP = 19
        SectionQ10 = 20
        SectionA11 = 21
        SectionF12 = 22
        SectionF13 = 23
        SectionNO14 = 24
        SectionC19 = 25
        SectionR = 26
        SectionCD = 27
    End Enum
    Enum PointSectionNames
        SectionP5a = 0
        SectionP5b = 1
        SectionP6a = 2
        SectionP6b = 3
        SectionP10 = 4
        SectionP11 = 5
        SectionP12 = 6
        SectionP13 = 7
        SectionP14 = 8
        SectionP19 = 9
    End Enum
    Enum SectionState
        Unoccupied = 1
        Occupied = 0
        System = -1
    End Enum
    'Points
    Enum PointNames
        P5a = 0
        P5b = 1
        P6a = 2
        P6b = 3
        P10 = 4
        P11 = 5
        P12 = 6
        P13 = 7
        P14 = 8
        P19 = 9
    End Enum
    Enum PointRequestState
        Normal = 1
        Reverse = 2
        Off = 0
        System = -1
    End Enum
    Enum PointReturnState
        Normal = 1
        Reverse = 2
        NoReturn = 0
        System = -1
    End Enum
    'Levers
    Enum LeverNames
        Lever1 = 0
        Lever2 = 1
        Lever3 = 2
        Lever4 = 3
        Lever5 = 4
        Lever6 = 5
        Lever7 = 6
        Lever8 = 7
        Lever9 = 8
        Lever10 = 9
        Lever11 = 10
        Lever12 = 11
        Lever13 = 12
        Lever14 = 13
        Lever15 = 14
        Lever16 = 15
        Lever17 = 16
        Lever18 = 17
        Lever19 = 18
        Lever20 = 19
        Lever21 = 20
        Lever22 = 21
        Lever23 = 22
        Lever24 = 23
    End Enum
    Enum LeverIndicatorNames
        Lever24Top = 0
        Lever23Top = 1
        Lever22Top = 2
        Lever21Top = 3
        Lever20Top = 4
        Lever19Top = 5
        Lever18Top = 6
        Lever17Top = 7
        Lever16Top = 8
        Lever15Top = 9
        Lever14Top = 10
        Lever13Top = 11
        Lever12Top = 12
        Lever11Top = 13
        Lever10Top = 14
        Lever9Top = 15
        Lever8Top = 16
        Lever7Top = 17
        Lever6Top = 18
        Lever5Top = 19
        Lever4Top = 20
        Lever3Top = 21
        Lever2Top = 22
        Lever1Top = 23
        Lever1Bottom = 24
        Lever2Bottom = 25
        Lever3Bottom = 26
        Lever4Bottom = 27
        Lever5Bottom = 28
        Lever6Bottom = 29
        Lever7Bottom = 30
        Lever8Bottom = 31
        Lever9Bottom = 32
        Lever10Bottom = 33
        Lever11Bottom = 34
        Lever12Bottom = 35
        Lever13Bottom = 36
        Lever14Bottom = 37
        Lever15Bottom = 38
        Lever16Bottom = 39
        Lever17Bottom = 40
        Lever18Bottom = 41
        Lever19Bottom = 42
        Lever20Bottom = 43
        Lever21Bottom = 44
        Lever22Bottom = 45
        Lever23Bottom = 46
        Lever24Bottom = 47
    End Enum
    Enum LeverState
        Normal = 1
        Reverse = 2
        Off = 0
        System = -1
    End Enum

    Enum LeverLockState
        Locked = 1
        Unlocked = 2
        System = -1
    End Enum
    'Buttons
    Enum ButtonOutputState
        IndicatorOn = 1
        IndicatorOff = 2
        System = -1
    End Enum
    Enum ButtonNames
        Button1 = 0
        Button2 = 1
        Button3 = 2
        Button4 = 3
        Button5 = 4
        Button6 = 5
        Button7 = 6
        Button8 = 7
        Button9 = 8
        Button10 = 9
        Button11 = 10
        Button12 = 11
        Button13 = 12
        Button14 = 13
        Button15 = 14
        Button16 = 15
        Button17 = 16
        Button18 = 17
        Button19 = 18
        Button20 = 19
        Button21 = 20
        Button22 = 21
        Button23 = 22
        Button24 = 23
        Button25 = 24
        Button26 = 25
        Button27 = 26
        Button28 = 27
        Button29 = 28
        Button30 = 29
        Button31 = 30
        Button32 = 31
        Button33 = 32
        Button34 = 33
        Button35 = 34
        Button36 = 35
        Button37 = 36
        Button38 = 37
        Button39 = 38
        Button40 = 39
    End Enum

    Enum SignalNames
        AJ1E = 0
        AJ2E = 1
        AJ3E = 2
        RAJ3E = 3
        AJ4E = 4
        AJ7E = 5
        AJ8E = 6
        AJ9E = 7
        AJ16E = 8
        AJ17E = 9
        AJ18E = 10
        AJ21E = 11
        AJ3W = 12
        AJ7W = 13
        AJ8W = 14
        AJ9W = 15
        AJ15W = 16
        AJ16W = 17
        AJ17W = 18
        AJ18W = 19
        AJ22W = 20
        S11 = 21
        S12 = 22
        S14 = 23
        S19 = 24
    End Enum

    Public ReadOnly PointReturnNormal As String = "Normal"
    Public ReadOnly PointReturnReverse As String = "Reverse"
    Public ReadOnly PointReturnNoReturn As String = "No Return"

    'Signal States
    Public ReadOnly SignalAtDanger As String = "Danger"
    Public ReadOnly SignalAtCaution As String = "Caution"
    Public ReadOnly SignalAtClear As String = "Clear"
    Public ReadOnly SignalAtShunt As String = "Shunt"
    Public ReadOnly SignalAtBypass As String = "Bypass"

    'Lever Positionss
    Public ReadOnly LeverInNormal As String = "Normal"
    Public ReadOnly LeverInReverse As String = "Reverse"

    'Point Positions In
    Public ReadOnly PointInNormal As String = "Normal"
    Public ReadOnly PointInReverse As String = "Reverse"

    'Point Positions Out
    Public ReadOnly PointToNormal As String = "Normal"
    Public ReadOnly PointToReverse As String = "Reverse"
    Public ReadOnly PointToOFF As String = "Off"

    'Running Modes
    Public ReadOnly LogicModeComputer As String = "Computer"
    Public ReadOnly LogicModeManual As String = "Manual"

    'Track Sections
    Public ReadOnly SectionIsOccupied As Boolean = False
    Public ReadOnly SectionIsClear As Boolean = True
    Public ReadOnly TrackSectionOccupiedString As String = "Occupied"
    Public ReadOnly TrackSectionUnoccupiedString As String = "Unoccupied"
End Module
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
