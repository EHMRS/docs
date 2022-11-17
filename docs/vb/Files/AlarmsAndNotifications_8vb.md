---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/AlarmsAndNotifications.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/AlarmsAndNotifications.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateSystemLog](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#function-updatesystemlog)**(string FaultTextToAddToLog) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿public Module | **[AlarmsAndNotifications](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-alarmsandnotifications)**  |
| ReadOnly DateTime | **[MyDate](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-mydate)** <br>Get current date.  |
| ReadOnly int | **[DaysInMonth](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-daysinmonth)** <br>Get amount if days in current month.  |
| ReadOnly DateTime | **[LastDayInMonthDate](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-lastdayinmonthdate)** <br>Get the number of the last day in the month.  |
| ReadOnly string | **[theMonth](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-themonth)** <br>Get current month.  |
| ReadOnly string | **[theYear](/SignallingSystem-doc/vb/Files/AlarmsAndNotifications_8vb/#variable-theyear)** <br>Get current year.  |


## Functions Documentation

### function UpdateSystemLog

```csharp
void UpdateSystemLog(
    string FaultTextToAddToLog
)
```


### function SecondTick

```csharp
void SecondTick()
```



## Attributes Documentation

### variable AlarmsAndNotifications

```csharp
﻿public Module AlarmsAndNotifications;
```


### variable MyDate

```csharp
ReadOnly DateTime MyDate = Now;
```

Get current date. 

### variable DaysInMonth

```csharp
ReadOnly int DaysInMonth = DateTime.DaysInMonth(MyDate.Year, MyDate.Month);
```

Get amount if days in current month. 

### variable LastDayInMonthDate

```csharp
ReadOnly DateTime LastDayInMonthDate = New DateTime(MyDate.Year, MyDate.Month, DaysInMonth);
```

Get the number of the last day in the month. 

### variable theMonth

```csharp
ReadOnly string theMonth =[] DateTime.Now.ToString;
```

Get current month. 

### variable theYear

```csharp
ReadOnly string theYear =[] DateTime.Now.ToString;
```

Get current year. 


## Source code

```csharp
Public Module AlarmsAndNotifications
    'Log File
    Public ReadOnly MyDate As Date = Now 'Get current date
    Public ReadOnly DaysInMonth As Integer = Date.DaysInMonth(MyDate.Year, MyDate.Month) 'Get amount if days in current month
    Public ReadOnly LastDayInMonthDate As Date = New Date(MyDate.Year, MyDate.Month, DaysInMonth) 'Get the number of the last day in the month
    Public ReadOnly theMonth As String = DateTime.Now.ToString("MMMM") 'Get current month
    Public ReadOnly theYear As String = DateTime.Now.ToString("yyyy") 'Get current year
    'Add Fault to log file
    Public Sub UpdateSystemLog(FaultTextToAddToLog As String)
        Dim filepath As String = GlobalConfig.config.LogPath & "\EHMR Log File " & theMonth & " " & theYear & ".txt"
        If Not System.IO.File.Exists(filepath) Then
            System.IO.File.Create(filepath).Dispose()
        End If
        Try
            Using writer As New IO.StreamWriter(filepath, True)
                writer.WriteLine(MyDate & " - " & FaultTextToAddToLog.ToString)
            End Using
        Catch e As System.IO.IOException

        End Try
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
