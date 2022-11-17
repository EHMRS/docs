---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/DirectionMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/DirectionMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::DirectionMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DirectionMessageHandler/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/vb/Files/DirectionMessageHandler_8vb/#variable-jsonconvert)**  |



## Attributes Documentation

### variable JsonConvert

```csharp
﻿using Newtonsoft.Json. JsonConvert;
```



## Source code

```csharp
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt
    Public Class DirectionMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Request message created by client applications
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' Direction Override state
            ''' </summary>
            Public directionOverride As String = ""

            ''' <summary>
            ''' Direction for January
            ''' </summary>
            Public januaryDirection As String = ""

            ''' <summary>
            ''' Direction for February
            ''' </summary>
            Public februaryDirection As String = ""

            ''' <summary>
            ''' Direction for March
            ''' </summary>
            Public marchDirection As String = ""

            ''' <summary>
            ''' Direction for April
            ''' </summary>
            Public aprilDirection As String = ""

            ''' <summary>
            ''' Direction for May
            ''' </summary>
            Public mayDirection As String = ""

            ''' <summary>
            ''' Direction for June
            ''' </summary>
            Public juneDirection As String = ""

            ''' <summary>
            ''' Direction for July
            ''' </summary>
            Public julyDirection As String = ""

            ''' <summary>
            ''' Direction for August
            ''' </summary>
            Public augustDirection As String = ""

            ''' <summary>
            ''' Direction for September
            ''' </summary>
            Public septemberDirection As String = ""

            ''' <summary>
            ''' Direction for October
            ''' </summary>
            Public octoberDirection As String = ""

            ''' <summary>
            ''' Direction for November
            ''' </summary>
            Public novemberDirection As String = ""

            ''' <summary>
            ''' Direction for December
            ''' </summary>
            Public decemberDirection As String = ""
        End Class
        Public Overrides Sub handle()
            ' Get the action (this should probably be moved into a different
            '                                                   function)
            Me.getTopic()
            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.setDirectionOverride(msg.directionOverride)
                Me.setMonthDirection(0, msg.januaryDirection)
                Me.setMonthDirection(1, msg.februaryDirection)
                Me.setMonthDirection(2, msg.marchDirection)
                Me.setMonthDirection(3, msg.aprilDirection)
                Me.setMonthDirection(4, msg.mayDirection)
                Me.setMonthDirection(5, msg.juneDirection)
                Me.setMonthDirection(6, msg.julyDirection)
                Me.setMonthDirection(7, msg.augustDirection)
                Me.setMonthDirection(8, msg.septemberDirection)
                Me.setMonthDirection(9, msg.octoberDirection)
                Me.setMonthDirection(10, msg.novemberDirection)
                Me.setMonthDirection(11, msg.decemberDirection)
            End If
        End Sub

        Private Sub setDirectionOverride(ByVal direction As String)
            If direction = "eastbound" Then
                RuntimeConfig.config.DirectionOveride = "Eastbound"
            ElseIf direction = "westbound" Then
                RuntimeConfig.config.DirectionOveride = "Westbound"
            ElseIf direction = "system" Then
                RuntimeConfig.config.DirectionOveride = "Auto"
            Else
                Return
            End If
            RuntimeConfig.Save()
        End Sub

        Private Sub setMonthDirection(
                                     ByVal month As Integer,
                                     ByVal direction As String)
            If month < 0 Or month > 11 Then
                ' invalid month specified
                Return
            End If
            If direction = "eastbound" Then
                RuntimeConfig.config.MonthDirection(month) = "Eastbound"
            ElseIf direction = "westbound" Then
                RuntimeConfig.config.MonthDirection(month) = "Westbound"
            Else
                ' invalid setting specified
                Return
            End If
            RuntimeConfig.Save()
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
