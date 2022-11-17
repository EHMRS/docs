---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Messages.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Messages.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| string | **[OutPutCardsSupplyLost](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-outputcardssupplylost)**(int CardNumber, int ChipNumber) |
| string | **[OutPutCardsSupplyRestored](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-outputcardssupplyrestored)**(int CardNumber, int ChipNumber) |
| | **[PointReadingNormalAndReverseSameTime](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-pointreadingnormalandreversesametime)**(string PointName) |
| | **[PointReadingNoReturn](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-pointreadingnoreturn)**(string PointName) |
| | **[PointNotChanging](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-pointnotchanging)**(string PointName) |
| | **[TunnelNotRegistering](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-tunnelnotregistering)**(string TunnelEnd) |
| | **[TunnelInputsBothOn](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-tunnelinputsbothon)**(string TunnelEnd) |
| | **[TunnelInputsBothOff](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-tunnelinputsbothoff)**(string TunnelEnd) |
| | **[LevelCrossingTrainRouted](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-levelcrossingtrainrouted)**(string Line) |
| | **[LevelCrossingTrainInSection](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-levelcrossingtraininsection)**(string Section) |
| | **[LevelCrossingSensorBothInputsHigh](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-levelcrossingsensorbothinputshigh)**(string Sensor) |
| | **[LevelCrossingSensorBothInputsLow](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-levelcrossingsensorbothinputslow)**(string Sensor) |
| | **[LeverReadingBothWays](/SignallingSystem-doc/vb/Files/Messages_8vb/#function-leverreadingbothways)**(int LeverNumber) |


## Functions Documentation

### function OutPutCardsSupplyLost

```csharp
string OutPutCardsSupplyLost(
    int CardNumber,
    int ChipNumber
)
```


### function OutPutCardsSupplyRestored

```csharp
string OutPutCardsSupplyRestored(
    int CardNumber,
    int ChipNumber
)
```


### function PointReadingNormalAndReverseSameTime

```csharp
PointReadingNormalAndReverseSameTime(
    string PointName
)
```


### function PointReadingNoReturn

```csharp
PointReadingNoReturn(
    string PointName
)
```


### function PointNotChanging

```csharp
PointNotChanging(
    string PointName
)
```


### function TunnelNotRegistering

```csharp
TunnelNotRegistering(
    string TunnelEnd
)
```


### function TunnelInputsBothOn

```csharp
TunnelInputsBothOn(
    string TunnelEnd
)
```


### function TunnelInputsBothOff

```csharp
TunnelInputsBothOff(
    string TunnelEnd
)
```


### function LevelCrossingTrainRouted

```csharp
LevelCrossingTrainRouted(
    string Line
)
```


### function LevelCrossingTrainInSection

```csharp
LevelCrossingTrainInSection(
    string Section
)
```


### function LevelCrossingSensorBothInputsHigh

```csharp
LevelCrossingSensorBothInputsHigh(
    string Sensor
)
```


### function LevelCrossingSensorBothInputsLow

```csharp
LevelCrossingSensorBothInputsLow(
    string Sensor
)
```


### function LeverReadingBothWays

```csharp
LeverReadingBothWays(
    int LeverNumber
)
```




## Source code

```csharp
Module Messages
    '##################################################################################################################################
    '--> Power <--
    'Generic error message for output cards power detection
    Public Function OutPutCardsSupplyLost(CardNumber As Integer, ChipNumber As Integer) As String
        Return ("Critical: Supply Lost to output card " & CardNumber.ToString & ", Group " & ChipNumber.ToString & "!")
    End Function
    'Generic error message for output cards power detection
    Public Function OutPutCardsSupplyRestored(CardNumber As Integer, ChipNumber As Integer) As String
        Return ("Info: Supply restored to output card " & CardNumber.ToString & ", Group " & ChipNumber.ToString & ".")
    End Function
    '##################################################################################################################################
    '--> Points <--
    'Generic error message for points reading normal and reverse at the same time.
    Public Function PointReadingNormalAndReverseSameTime(PointName As String)
        Return ("WARNING: Point " & PointName & " is reading 'Normal' and 'Reverse'!")
    End Function
    'Generic error message for points with no return.
    Public Function PointReadingNoReturn(PointName As String)
        Return ("WARNING: Point " & PointName & " has not got a return!")
    End Function
    'Generic error message for points not changing.
    Public Function PointNotChanging(PointName As String)
        Return ("Info: Point " & PointName & " is not changing!")
    End Function
    '##################################################################################################################################
    '--> LineSide <--
    'Generic error messages for tunnel not registering as fully up
    Public Function TunnelNotRegistering(TunnelEnd As String)
        Return ("Critical: Tunnel shutter " & TunnelEnd & " not registering as open!")
    End Function
    'Generic error messages for tunnel inputs both on
    Public Function TunnelInputsBothOn(TunnelEnd As String)
        Return ("Warning: Tunnel shutter " & TunnelEnd & " both inputs high!")
    End Function
    'Generic error messages for tunnel inouts both off
    Public Function TunnelInputsBothOff(TunnelEnd As String)
        Return ("Warning: Tunnel shutter " & TunnelEnd & " both inputs low!")
    End Function
    'Level Crossing Train Routed
    Public Function LevelCrossingTrainRouted(Line As String)
        Return ("Warning: Crossing open, train routed on " & Line & "!")
    End Function
    'Level Crossing Train Routed
    Public Function LevelCrossingTrainInSection(Section As String)
        Return ("Warning: Crossing open, train in section " & Section & "!")
    End Function
    'Level Crossing gate sensor both inputs high
    Public Function LevelCrossingSensorBothInputsHigh(Sensor As String)
        Return ("Warning: Crossing gate sensor " & Sensor & " both inputs high!")
    End Function
    'Level Crossing gate sensor both inputs Low
    Public Function LevelCrossingSensorBothInputsLow(Sensor As String)
        Return ("Critical: Crossing gate sensor " & Sensor & " both inputs low!")
    End Function
    '##################################################################################################################################
    '--> LineSide <--
    'Generic error messages for levers reading both positions
    Public Function LeverReadingBothWays(LeverNumber As Integer)
        Return ("WARNING: Lever " & LeverNumber.ToString & " is reading Normal/Reverse at the same time!")
    End Function
    '##################################################################################################################################

    '##################################################################################################################################

    '##################################################################################################################################

    '##################################################################################################################################

    '##################################################################################################################################

    '##################################################################################################################################

    '##################################################################################################################################
End Module
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
