---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/SignalMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/SignalMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::SignalMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1SignalMessageHandler/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/vb/Files/SignalMessageHandler_8vb/#variable-jsonconvert)**  |



## Attributes Documentation

### variable JsonConvert

```csharp
﻿using Newtonsoft.Json. JsonConvert;
```



## Source code

```csharp
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt

    ''' <summary>
    ''' @brief Point Input State message handling class
    ''' Handles updates of point states provided by ModBus client
    ''' </summary>
    Public Class SignalMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Point request message created by client applications
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' The output override state
            ''' </summary>
            Public outputOverride As String = ""
            ''' <summary>
            ''' The delay timer for the signal
            ''' </summary>
            Public delay As String = ""
        End Class


        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()

            ' Get the name of the point
            Dim signal As String = Me.getTopic()

            ' Check what we are doing to it
            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.updateOutputOverride(signal, msg.outputOverride)
                Me.updateDelay(signal, msg.delay)
            End If
        End Sub

        ''' <summary>
        ''' Update the output override status
        ''' </summary>
        ''' <param name="signal"></param>
        ''' <param name="state"></param>
        Private Sub updateOutputOverride(
                                        ByVal signal As String,
                                        ByVal state As String)
            ' Get the state that is being requested for override
            Dim overrideState As Definitions.SignalOutputStates
            If state = "danger" Then
                overrideState = Definitions.SignalOutputStates.Danger
            ElseIf state = "caution" Then
                overrideState = Definitions.SignalOutputStates.Caution
            ElseIf state = "clear" Then
                overrideState = Definitions.SignalOutputStates.Clear
            ElseIf state = "shunt" Then
                overrideState = Definitions.SignalOutputStates.Shunt
            ElseIf state = "bypass" Then
                overrideState = Definitions.SignalOutputStates.Bypass
            ElseIf state = "system" Then
                overrideState = Definitions.SignalOutputStates.System
            Else
                Return
            End If
            Signals.updateSignalOverride(signal, overrideState)
        End Sub

        ''' <summary>
        ''' Update the signal delay timer
        ''' </summary>
        ''' <param name="signal"></param>
        ''' <param name="delay"></param>
        Private Sub updateDelay(ByVal signal As String, ByVal delay As String)
            If delay = "" Then
                Return
            End If
            Dim delayValue As Integer
            delayValue = Convert.ToInt32(delay)
            If delayValue < 0 Or delayValue > 254 Then
                Return
            End If
            ''' @todo Implement this
        End Sub
    End Class

End Namespace
```


-------------------------------

Updated on 2022-11-16 at 15:02:30 +0000
