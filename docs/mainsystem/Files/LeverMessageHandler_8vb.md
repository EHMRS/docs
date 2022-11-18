---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/LeverMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/LeverMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::LeverMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler/)** <br>Lever Input State message handling class Handles updates of lever states provided by ModBus client.  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/mainsystem/Files/LeverMessageHandler_8vb/#variable-jsonconvert)**  |



## Attributes Documentation

### variable JsonConvert

```csharp
﻿using Newtonsoft.Json. JsonConvert;
```



## Source code

```csharp
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt

    ''' @brief Lever Input State message handling class
    ''' Handles updates of lever states provided by ModBus client
    Public Class LeverMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' @brief Lever state message created by the modbus to MQTT system
        Private Class InputMessage
            ''' @brief The voltage through the normal side
            Public normal As Integer
            ''' @brief The voltage through the reverse side
            Public reverse As Integer
        End Class

        ''' @brief Request message created by client applications
        Private Class RequestMessage
            ''' @brief Output Override state
            Public outputOverride As String = ""
            ''' @brief Input Override state
            Public inputOverride As String = ""
            ''' @brief Auto restroke setting
            Public autoRestroke As String = ""
        End Class


        ''' @brief Handle the message
        Public Overrides Sub handle()
            ' Get the name of the lever
            Dim lever As String = Me.getTopic()

            If Me.action = MessageActions.Input Then
                Dim msg As InputMessage =
                    DeserializeObject(Of InputMessage)(Me.getMessagePayload())
                ' Update the lever state
                Levers.updateLeverFromInput(
                    lever,
                    AnalogIOManager.convertVoltage(msg.normal),
                    AnalogIOManager.convertVoltage(msg.reverse)
                    )
            End If

            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.updateOutputOverride(lever, msg.outputOverride)
                Me.updateInputOverride(lever, msg.inputOverride)
                Me.updateAutoRestroke(lever, msg.autoRestroke)
            End If
        End Sub


        ''' <summary>
        ''' Update the override value for the output of a lever
        ''' </summary>
        ''' <param name="lever"></param>
        ''' <param name="state"></param>
        Private Sub updateOutputOverride(lever As String, state As String)
            ' Get the state that is being requested for override
            Dim outputState As Definitions.LeverLockState
            If state = "true" Then
                outputState = Definitions.LeverLockState.Locked
            ElseIf state = "false" Then
                outputState = Definitions.LeverLockState.Unlocked
            ElseIf state = "system" Then
                outputState = Definitions.LeverLockState.System
            Else
                Return
            End If
            Levers.updateLeverOutputOverride(
                Convert.ToInt16(lever),
                outputState
                )
        End Sub

        ''' <summary>
        ''' Update the input value of the override of the lever
        ''' </summary>
        ''' <param name="lever"></param>
        ''' <param name="state"></param>
        Private Sub updateInputOverride(lever As String, state As String)
            ' Get the state that is being requested for override
            Dim inputState As Definitions.LeverState
            If state = "normal" Then
                inputState = Definitions.LeverState.Normal
            ElseIf state = "reverse" Then
                inputState = Definitions.LeverState.Reverse
            ElseIf state = "noreturn" Then
                inputState = Definitions.LeverState.Off
            ElseIf state = "system" Then
                inputState = Definitions.LeverState.System
            Else
                Return
            End If
            Levers.updateLeverInputOverride(Convert.ToInt16(lever), inputState)
        End Sub

        ''' <summary>
        ''' Update the auto restroke value of the lever
        ''' </summary>
        ''' <param name="lever"></param>
        ''' <param name="state"></param>
        Private Sub updateAutoRestroke(lever As String, state As String)
            Dim restrokeState As Boolean
            If state = "true" Then
                restrokeState = True
            ElseIf state = "false" Then
                restrokeState = False
            Else
                Return
            End If

            Levers.updateLeverAutorestroke(
                Convert.ToInt16(lever),
                restrokeState
                )
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
