---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/BlockSections.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/BlockSections.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[BlockSafeAJ1EtoAJ16E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj1etoaj16e)**() |
| | **[BlockSafeAJ1EtoAJ18E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj1etoaj18e)**() |
| | **[BlockSafeAJ1EtoSiding](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj1etosiding)**() |
| | **[BlockSafeAJ2EtoAJ16E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj2etoaj16e)**() |
| | **[BlockSafeAJ3EtoAJ4E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj3etoaj4e)**() |
| | **[BlockSafeAJ4EtoAJ7E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj4etoaj7e)**() |
| | **[BlockSafeAJ4EtoAJ21E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj4etoaj21e)**() |
| | **[BlockSafeAJ7EtoAJ1E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj7etoaj1e)**() |
| | **[BlockSafeAJ8EtoAJ3E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj8etoaj3e)**() |
| | **[BlockSafeAJ9EtoAJ17E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj9etoaj17e)**() |
| | **[BlockSafeAJ9EtoSiding](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj9etosiding)**() |
| | **[BlockSafeAJ16EtoAJ8E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj16etoaj8e)**() |
| | **[BlockSafeAJ16EtoSiding](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj16etosiding)**() |
| | **[BlockSafeAJ17EtoAJ2E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj17etoaj2e)**() |
| | **[BlockSafeAJ18EtoAJ9E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj18etoaj9e)**() |
| | **[BlockSafeAJ21EtoAJ16E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj21etoaj16e)**() |
| | **[BlockSafeAJ21EtoAJ18E](/SignallingSystem-doc/mainsystem/Files/BlockSections_8vb/#function-blocksafeaj21etoaj18e)**() |


## Functions Documentation

### function BlockSafeAJ1EtoAJ16E

```csharp
BlockSafeAJ1EtoAJ16E()
```


### function BlockSafeAJ1EtoAJ18E

```csharp
BlockSafeAJ1EtoAJ18E()
```


### function BlockSafeAJ1EtoSiding

```csharp
BlockSafeAJ1EtoSiding()
```


### function BlockSafeAJ2EtoAJ16E

```csharp
BlockSafeAJ2EtoAJ16E()
```


### function BlockSafeAJ3EtoAJ4E

```csharp
BlockSafeAJ3EtoAJ4E()
```


### function BlockSafeAJ4EtoAJ7E

```csharp
BlockSafeAJ4EtoAJ7E()
```


### function BlockSafeAJ4EtoAJ21E

```csharp
BlockSafeAJ4EtoAJ21E()
```


### function BlockSafeAJ7EtoAJ1E

```csharp
BlockSafeAJ7EtoAJ1E()
```


### function BlockSafeAJ8EtoAJ3E

```csharp
BlockSafeAJ8EtoAJ3E()
```


### function BlockSafeAJ9EtoAJ17E

```csharp
BlockSafeAJ9EtoAJ17E()
```


### function BlockSafeAJ9EtoSiding

```csharp
BlockSafeAJ9EtoSiding()
```


### function BlockSafeAJ16EtoAJ8E

```csharp
BlockSafeAJ16EtoAJ8E()
```


### function BlockSafeAJ16EtoSiding

```csharp
BlockSafeAJ16EtoSiding()
```


### function BlockSafeAJ17EtoAJ2E

```csharp
BlockSafeAJ17EtoAJ2E()
```


### function BlockSafeAJ18EtoAJ9E

```csharp
BlockSafeAJ18EtoAJ9E()
```


### function BlockSafeAJ21EtoAJ16E

```csharp
BlockSafeAJ21EtoAJ16E()
```


### function BlockSafeAJ21EtoAJ18E

```csharp
BlockSafeAJ21EtoAJ18E()
```




## Source code

```csharp
Module BlockTrackSection
    'EastBound
    'AJ1E
    Function BlockSafeAJ1EtoAJ16E()
        If (Points.PointReturns(PointNames.P6a)) = PointInReverse And (TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False Or PointSectionUnoccupied(PointSectionNames.SectionP10) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionR) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6a) = False) Or PointSectionUnoccupied(PointSectionNames.SectionP6b) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionB) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ1EtoAJ18E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False Or PointSectionUnoccupied(PointSectionNames.SectionP10) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionR) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6b) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5b) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionL) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionM) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ1EtoSiding()
        If PointSectionUnoccupied(PointSectionNames.SectionP11) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5a) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA11) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ2E
    Function BlockSafeAJ2EtoAJ16E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False Or PointSectionUnoccupied(PointSectionNames.SectionP10) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionR) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6b) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5b) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionL) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionB) = False Or (Points.PointReturns(PointNames.P11)) = PointInNormal And (PointSectionUnoccupied(PointSectionNames.SectionP11) = False) Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ3E
    Function BlockSafeAJ3EtoAJ4E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionE) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ4E
    Function BlockSafeAJ4EtoAJ7E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionG) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionF) = False Or PointSectionUnoccupied(PointSectionNames.SectionP13) = False Or PointSectionUnoccupied(PointSectionNames.SectionP12) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionF12) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionF13) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ4EtoAJ21E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionF) = False Or PointSectionUnoccupied(PointSectionNames.SectionP13) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionF13) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ7E
    Function BlockSafeAJ7EtoAJ1E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionH) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ8E
    Function BlockSafeAJ8EtoAJ3E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionD) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionDE) = False And TunnelSafe = True And CrossingSafe = True Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ9E
    Function BlockSafeAJ9EtoAJ17E()
        If PointSectionUnoccupied(PointSectionNames.SectionP14) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionNO) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionO) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ9EtoSiding()
        If PointSectionUnoccupied(PointSectionNames.SectionP14) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionNO) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionNO14) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionO) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ15W
    'AJ16E
    Function BlockSafeAJ16EtoAJ8E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionC) = False Or PointSectionUnoccupied(PointSectionNames.SectionP19) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionC19) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionCD) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ16EtoSiding()
        If TrackSectionUnoccupied(TrackSectionNames.SectionC) = False Or PointSectionUnoccupied(PointSectionNames.SectionP19) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionC19) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionCD) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ17E
    Function BlockSafeAJ17EtoAJ2E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionC) = False Or TrackSectionUnoccupied(TrackSectionNames.Sectionop) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionP) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ18E
    Function BlockSafeAJ18EtoAJ9E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionN) = False Then
            Return False
        Else
            Return True
        End If
    End Function
    'AJ21E
    Function BlockSafeAJ21EtoAJ16E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False Or PointSectionUnoccupied(PointSectionNames.SectionP10) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionR) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6b) = False And PointSectionUnoccupied(PointSectionNames.SectionP5a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5b) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionL) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionA) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionB) = False Or (Points.PointReturns(PointNames.P11)) = PointInNormal And (PointSectionUnoccupied(PointSectionNames.SectionP11) = False) Then
            Return False
        Else
            Return True
        End If
    End Function
    Function BlockSafeAJ21EtoAJ18E()
        If TrackSectionUnoccupied(TrackSectionNames.SectionQ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionQ10) = False Or PointSectionUnoccupied(PointSectionNames.SectionP10) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionR) = False Or PointSectionUnoccupied(PointSectionNames.SectionP6a) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5b) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionL) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionJ) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionK) = False Or TrackSectionUnoccupied(TrackSectionNames.SectionM) = False Or (PointReturns(PointNames.P5a) = PointInNormal Or (PointSectionUnoccupied(PointSectionNames.SectionP11) = False Or PointSectionUnoccupied(PointSectionNames.SectionP5a) = False)) Then
            Return False
        Else
            Return True
        End If
    End Function

End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
