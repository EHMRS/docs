---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Errors.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Logic/Errors.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[DisplayErrorLogic](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-displayerrorlogic)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[NewError](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-newerror)**(string AddNewError) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[RemoveError](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-removeerror)**(string RemoveOldError) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[DisplayRequestLogic](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-displayrequestlogic)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[NewRequest](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-newrequest)**(string AddNewRequest) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[RemoveRequest](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-removerequest)**(string RemoveOldRequest) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[checkRequests](/SignallingSystem-doc/vb/Files/Errors_8vb/#function-checkrequests)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Microsoft.AspNetCore. | **[Hosting](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-hosting)**  |
| List< string > | **[CurrentErrorList](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-currenterrorlist)**  |
| string | **[DisplayCurrentError](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-displaycurrenterror)**  |
| int | **[CurrentDisplayCount](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-currentdisplaycount)**  |
| int | **[AllowSoftwareToStartBeforeLoggingFaults](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-allowsoftwaretostartbeforeloggingfaults)**  |
| List< string > | **[CurrentRequestList](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-currentrequestlist)**  |
| string | **[DisplayCurrentRequest](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-displaycurrentrequest)**  |
| int | **[CurrentDisplayCountRequest](/SignallingSystem-doc/vb/Files/Errors_8vb/#variable-currentdisplaycountrequest)**  |


## Functions Documentation

### function DisplayErrorLogic

```csharp
void DisplayErrorLogic()
```


### function NewError

```csharp
void NewError(
    string AddNewError
)
```


### function RemoveError

```csharp
void RemoveError(
    string RemoveOldError
)
```


### function DisplayRequestLogic

```csharp
void DisplayRequestLogic()
```


### function NewRequest

```csharp
void NewRequest(
    string AddNewRequest
)
```


### function RemoveRequest

```csharp
void RemoveRequest(
    string RemoveOldRequest
)
```


### function checkRequests

```csharp
void checkRequests()
```



## Attributes Documentation

### variable Hosting

```csharp
﻿using Microsoft.AspNetCore. Hosting;
```


### variable CurrentErrorList

```csharp
List< string > CurrentErrorList;
```


### variable DisplayCurrentError

```csharp
string DisplayCurrentError = "";
```


### variable CurrentDisplayCount

```csharp
int CurrentDisplayCount = 0;
```


### variable AllowSoftwareToStartBeforeLoggingFaults

```csharp
int AllowSoftwareToStartBeforeLoggingFaults = 10;
```


### variable CurrentRequestList

```csharp
List< string > CurrentRequestList;
```


### variable DisplayCurrentRequest

```csharp
string DisplayCurrentRequest = "";
```


### variable CurrentDisplayCountRequest

```csharp
int CurrentDisplayCountRequest = 0;
```



## Source code

```csharp
Imports Microsoft.AspNetCore.Hosting

Module Errors
    Public CurrentErrorList As New List(Of String)
    Public DisplayCurrentError As String = ""
    Public CurrentDisplayCount As Integer = 0
    Public AllowSoftwareToStartBeforeLoggingFaults As Integer = 10

    Public CurrentRequestList As New List(Of String)
    Public DisplayCurrentRequest As String = ""
    Public CurrentDisplayCountRequest As Integer = 0
    Public Sub DisplayErrorLogic()
        If AllowSoftwareToStartBeforeLoggingFaults = 0 Then
            If CurrentErrorList.Count = 0 Then
                DisplayCurrentError = ""
            Else
                CurrentDisplayCount = CurrentDisplayCount + 1
                If CurrentDisplayCount > CurrentErrorList.Count Then
                    CurrentDisplayCount = 0
                Else
                    If CurrentErrorList.Count > 1 Then
                        DisplayCurrentError = ("(Error " & CurrentDisplayCount & " of " & CurrentErrorList.Count & ") " & Left(CurrentErrorList(CurrentDisplayCount - 1), 48))
                    Else
                        DisplayCurrentError = (Left(CurrentErrorList(CurrentDisplayCount - 1), 48))
                    End If
                End If
            End If
        Else
            DisplayCurrentError = ("Initializing... ")
            If Not AllowSoftwareToStartBeforeLoggingFaults = 0 Then AllowSoftwareToStartBeforeLoggingFaults = AllowSoftwareToStartBeforeLoggingFaults - 1
        End If
    End Sub
    Public Sub NewError(AddNewError As String)
        If AllowSoftwareToStartBeforeLoggingFaults = 0 Then
            AddNewError = AddNewError
            If CurrentErrorList.Contains(AddNewError) = False Then
                CurrentErrorList.Add(AddNewError)
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, AddNewError)
                UpdateSystemLog(AddNewError)
            End If
        End If
    End Sub
    Public Sub RemoveError(RemoveOldError As String)
        CurrentErrorList.Remove(RemoveOldError)
    End Sub

    Public Sub DisplayRequestLogic()
        If AllowSoftwareToStartBeforeLoggingFaults = 0 Then
            If CurrentRequestList.Count = 0 Then
                DisplayCurrentRequest = ""
            Else
                CurrentDisplayCountRequest = CurrentDisplayCountRequest + 1
                If CurrentDisplayCountRequest > CurrentRequestList.Count Then
                    CurrentDisplayCountRequest = 0
                Else
                    If CurrentRequestList.Count > 1 Then
                        DisplayCurrentRequest = ("(Request " & CurrentDisplayCountRequest & " of " & CurrentRequestList.Count & ") " & Left(CurrentRequestList(CurrentDisplayCountRequest - 1), 48))
                    Else
                        DisplayCurrentRequest = (Left(CurrentRequestList(CurrentDisplayCountRequest - 1), 48))
                    End If
                End If
            End If
        End If
    End Sub
    Public Sub NewRequest(AddNewRequest As String)
        If AllowSoftwareToStartBeforeLoggingFaults = 0 Then
            AddNewRequest = AddNewRequest
            If CurrentRequestList.Contains(AddNewRequest) = False Then
                CurrentRequestList.Add(AddNewRequest)
            End If
        End If
    End Sub
    Public Sub RemoveRequest(RemoveOldRequest As String)
        CurrentRequestList.Remove(RemoveOldRequest)
    End Sub

    Public Sub checkRequests()
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button1)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> Inner")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> Inner")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button2)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> Outer")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> Outer")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button3)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> HeadShunt")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> HeadShunt")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button4)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> Extention")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> Extention")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button5)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> EngineShed")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> EngineShed")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button6)) = 1 Then
            Errors.NewRequest("Request - Eastend P1 -> FoxHole")
        Else
            Errors.RemoveRequest("Request - Eastend P1 -> FoxHole")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button7)) = 1 Then
            Errors.NewRequest("Request - Westend P1 -> Tunnel")
        Else
            Errors.RemoveRequest("Request - Westend P1 -> Tunnel")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button8)) = 1 Then
            Errors.NewRequest("Request - Westend P1 -> Extention")
        Else
            Errors.RemoveRequest("Request - Westend P1 -> Extention")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button9)) = 1 Then
            Errors.NewRequest("Request - Westend P1 -> Turntable")
        Else
            Errors.RemoveRequest("Request - Westend P1 -> Turntable")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button10)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> Inner")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> Inner")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button11)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> Outer")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> Outer")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button12)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> Extention")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> Extention")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button13)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> EngineShed")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> EngineShed")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button14)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> FoxHole")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> FoxHole")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button15)) = 1 Then
            Errors.NewRequest("Request - Eastend P2 -> Tunnel")
        Else
            Errors.RemoveRequest("Request - Eastend P2 -> Tunnel")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button16)) = 1 Then
            Errors.NewRequest("Request - Westend P2 -> Extention")
        Else
            Errors.RemoveRequest("Request - Westend P2 -> Extention")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button17)) = 1 Then
            'Errors.NewRequest("Request - Westend P1 -> Centre platform")
        Else
            Errors.RemoveRequest("Request - Westend P1 -> Centre platform")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button18)) = 1 Then
            'Errors.NewRequest("Request - Westend P2 -> Centre platform")
        Else
            Errors.RemoveRequest("Request - Westend P2 -> Centre platform")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button19)) = 1 Then
            Errors.NewRequest("Request - Engine Shed -> Main Line")
        Else
            Errors.RemoveRequest("Request - Engine Shed -> Main Line")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button20)) = 1 Then
            Errors.NewRequest("Request - TurnTable -> Main Line")
        Else
            Errors.RemoveRequest("Request - TurnTable -> Main Line")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button21)) = 1 Then
            Errors.NewRequest("Request - HeadShunt -> Main Line")
        Else
            Errors.RemoveRequest("Request - HeadShunt -> Main Line")
        End If
        If Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressButtonIndicator(ButtonNames.Button22)) = 1 Then
            Errors.NewRequest("Request - Foxhole -> Main Line")
        Else
            Errors.RemoveRequest("Request - Foxhole -> Main Line")
        End If
        If EastBound = True Then
            JsonValueCallInAJ18WText = ""
            If Buttons.ButtonIndicatorLight(ButtonNames.Button26) = True And Buttons.ButtonIndicatorLight(ButtonNames.Button27) = True Then
                Errors.NewRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
                Errors.RemoveRequest("Request call in P2")
            ElseIf Buttons.ButtonIndicatorLight(ButtonNames.Button26) = True Then
                Errors.NewRequest("Request call in P1")
                Errors.RemoveRequest("Request call in P2")
                Errors.RemoveRequest("Waiting for selection to be made")
            ElseIf Buttons.ButtonIndicatorLight(ButtonNames.Button27) = True Then
                Errors.NewRequest("Request call in P2")
                Errors.RemoveRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
            Else
                Errors.RemoveRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
                Errors.RemoveRequest("Request call in P2")
            End If
        ElseIf WestBound = True Then
            JsonValueCallInAJ4EText = ""
            If Buttons.ButtonIndicatorLight(ButtonNames.Button26) = True And Buttons.ButtonIndicatorLight(ButtonNames.Button27) = True Then
                Errors.NewRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
                Errors.RemoveRequest("Request call in P2")
            ElseIf Buttons.ButtonIndicatorLight(ButtonNames.Button26) = True Then
                Errors.NewRequest("Request call in P1")
                Errors.RemoveRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P2")
            ElseIf Buttons.ButtonIndicatorLight(ButtonNames.Button27) = True Then
                Errors.NewRequest("Request call in P2")
                Errors.RemoveRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
            Else
                Errors.RemoveRequest("Waiting for selection to be made")
                Errors.RemoveRequest("Request call in P1")
                Errors.RemoveRequest("Request call in P2")
            End If
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:05 +0000
