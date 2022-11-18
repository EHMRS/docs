---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/StationMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/StationMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::StationMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1StationMessageHandler/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/mainsystem/Files/StationMessageHandler_8vb/#variable-jsonconvert)**  |



## Attributes Documentation

### variable JsonConvert

```csharp
﻿using Newtonsoft.Json. JsonConvert;
```



## Source code

```csharp
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt
    Public Class StationMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Request message created by client applications
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' Combine Platform 1 into single platform
            ''' </summary>
            Public combineP1 As String = ""

            ''' <summary>
            ''' Require a button request for auto restroke on station starter
            ''' signals
            ''' </summary>
            Public requireRequestForSS As String = ""

            ''' <summary>
            ''' Allow departing from the station
            ''' </summary>
            Public allowDeparting As String = ""

        End Class
        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()
            ' Get the action (this should probably be moved into a different
            '                                                   function)
            Me.getTopic()
            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.setCombinedPlatform(msg.combineP1)
                Me.setRequireRequestForSS(msg.requireRequestForSS)
                Me.setAllowDeparting(msg.allowDeparting)
            End If
        End Sub

        ''' <summary>
        ''' Set whether Platform 1 is a combined platform
        ''' </summary>
        ''' <param name="value"></param>
        Private Sub setCombinedPlatform(ByVal value As String)
            If value = "true" Then
                RuntimeConfig.config.P1Combine = "True"
            ElseIf value = "false" Then
                RuntimeConfig.config.P1Combine = "False"
            Else
                Return
            End If
            RuntimeConfig.Save()
        End Sub
        ''' <summary>
        ''' Require a button request for the Station Starter signal to clear
        ''' even if autorestroke is set
        ''' </summary>
        ''' <param name="value"></param>
        Private Sub setRequireRequestForSS(ByVal value As String)
            If value = "true" Then
                LogicStart.RequireButtonInputToClearSignal = True
            ElseIf value = "false" Then
                LogicStart.RequireButtonInputToClearSignal = False
            Else
                Return
            End If
        End Sub
        ''' <summary>
        ''' Allow departing from the station
        ''' </summary>
        ''' <param name="value"></param>
        Private Sub setAllowDeparting(ByVal value As String)
            If value = "true" Then
                LogicStart.AllowDeparting = True
            ElseIf value = "false" Then
                LogicStart.AllowDeparting = False
            Else
                Return
            End If
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
