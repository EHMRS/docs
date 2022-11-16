---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Fuses.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Fuses.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[FuseLogic](/SignallingSystem-doc/vb/Files/Fuses_8vb/#function-fuselogic)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| bool | **[AirRelayOn](/SignallingSystem-doc/vb/Files/Fuses_8vb/#variable-airrelayon)**  |


## Functions Documentation

### function FuseLogic

```csharp
void FuseLogic()
```



## Attributes Documentation

### variable AirRelayOn

```csharp
bool AirRelayOn;
```



## Source code

```csharp
Module Fuses
    Public AirRelayOn As Boolean
    Private FuseTripCount As Integer() = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Private ReadOnly boardcount As Integer = 12
    Private ReadOnly FuseTripAlertCountValue = 6
    Public Sub FuseLogic()
        Dim board As Integer = 1
        Dim chip As Integer = 1
        For i As Integer = 0 To boardcount - 1
            'rules For any board that has its power switched on and off under normal operation
            If board = 5 Then
                If AirRelayOn = True And Power.PointSupplyPower = True And Safety.EStopTriggered = False Then
                Else
                    FuseTripCount(i) = 0
                End If
            End If
            'Logic for all boards
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressPowerCheckInput(i)) = 0 And FuseTripCount(i) = FuseTripAlertCountValue Then
                'Errors.NewError(Messages.OutPutCardsSupplyLost(board, chip))
            ElseIf DataReadInputsArray(DigitalDeviceAddress.InputAddressPowerCheckInput(i)) = 1 Then
                Errors.RemoveError(Messages.OutPutCardsSupplyLost(board, chip))
                If FuseTripCount(i) = FuseTripAlertCountValue Then
                    'Errors.NewError(Messages.OutPutCardsSupplyRestored(board, chip))
                Else
                    Errors.RemoveError(Messages.OutPutCardsSupplyRestored(board, chip))
                End If
                FuseTripCount(i) = 0
            Else
                FuseTripCount(i) += 1
            End If
            'move to next board
            If chip = 4 Then
                chip = 1
                board += 1
            Else
                chip += 1
            End If
        Next
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
