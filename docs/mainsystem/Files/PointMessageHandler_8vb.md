---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/PointMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/PointMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::PointMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler/)** <br>Handles updates of point states provided by ModBus client  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/mainsystem/Files/PointMessageHandler_8vb/#variable-jsonconvert)**  |



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
    ''' Handles updates of point states provided by ModBus client
    ''' </summary>
    Public Class PointMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Point state message created by the modbus to MQTT system
        ''' </summary>
        Private Class InputMessage
            ''' <summary>
            ''' The voltage through the normal microswitch
            ''' </summary>
            Public normal As Integer
            ''' <summary>
            ''' The voltage through the reverse microswitch
            ''' </summary>
            Public reverse As Integer
        End Class

        ''' <summary>
        ''' Point request message created by client applications
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' Input Override state
            ''' </summary>
            Public inputOverride As String = ""
            ''' <summary>
            ''' Output Override state 
            ''' </summary>
            Public outputOverride As String = ""
        End Class


        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()

            ' Get the name of the point
            Dim point As String = Me.getTopic()

            ' Check what we are doing to it
            If Me.action = MessageActions.Input Then
                Dim msg As InputMessage =
                    DeserializeObject(Of InputMessage)(Me.getMessagePayload())
                ' Update the point state
                Points.UpdatePointFromInput(
                    point,
                    AnalogIOManager.convertVoltage(msg.normal),
                    AnalogIOManager.convertVoltage(msg.reverse)
                    )
            End If
            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.updateOutputOverride(point, msg.outputOverride)
                Me.updateInputOverride(point, msg.inputOverride)
            End If
        End Sub

        ''' <summary>
        ''' Update the override value for the output of a point
        ''' </summary>
        ''' <param name="point"></param>
        ''' <param name="state"></param>
        Private Sub updateOutputOverride(point As String, state As String)
            ' Get the state that is being requested for override
            Dim outputState As Definitions.PointRequestState
            If state = "normal" Then
                outputState = Definitions.PointRequestState.Normal
            ElseIf state = "reverse" Then
                outputState = Definitions.PointRequestState.Reverse
            ElseIf state = "isolated" Then
                outputState = Definitions.PointRequestState.Off
            ElseIf state = "system" Then
                outputState = Definitions.PointRequestState.System
            Else
                Return
            End If
            Points.updatePointOutputOverride(point, outputState)
        End Sub

        ''' <summary>
        ''' Update the input value of the override of the point
        ''' </summary>
        ''' <param name="point"></param>
        ''' <param name="state"></param>
        Private Sub updateInputOverride(point As String, state As String)
            ' Get the state that is being requested for override
            Dim inputState As Definitions.PointReturnState
            If state = "normal" Then
                inputState = Definitions.PointReturnState.Normal
            ElseIf state = "reverse" Then
                inputState = Definitions.PointReturnState.Reverse
            ElseIf state = "noreturn" Then
                inputState = Definitions.PointReturnState.NoReturn
            ElseIf state = "system" Then
                inputState = Definitions.PointReturnState.System
            Else
                Return
            End If
            Points.updatePointInputOverride(point, inputState)
        End Sub
    End Class

End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
