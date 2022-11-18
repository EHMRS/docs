---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/ButtonMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/ButtonMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::ButtonMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1ButtonMessageHandler/)** <br>Handles updates of button states provided by ModBus client  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/vb/Files/ButtonMessageHandler_8vb/#variable-jsonconvert)**  |



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
    ''' Handles updates of button states provided by ModBus client
    ''' </summary>
    Public Class ButtonMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Relay state message created by the modbus to MQTT system
        ''' </summary>
        Private Class InputMessage
            ''' <summary>
            ''' The voltage through the button contacts
            ''' </summary>
            Public value As Integer
        End Class

        ''' <summary>
        ''' Button request message created by client apps
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' Output override for the halo
            ''' </summary>
            Public outputOverride As String = ""
            ''' <summary>
            ''' Whether the button is enabled
            ''' </summary>
            Public enabled As String = ""
        End Class

        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()
            ' Get the name of the relay, and the index of the relay in arrays
            Dim button As Integer = Convert.ToInt32(Me.getTopic())

            If Me.action = MessageActions.Input Then
                Dim msg As InputMessage =
                    DeserializeObject(Of InputMessage)(Me.getMessagePayload())

                If button > 0 And button < Buttons.ButtonCount Then
                    If AnalogIOManager.convertVoltage(msg.value) > 0 Then
                        Serial.DataReadInputsArray(button) = 1
                    Else
                        Serial.DataReadInputsArray(button) = 0
                    End If
                End If
            End If
            If Me.action = MessageActions.Request Then
                Dim msg As RequestMessage =
                    DeserializeObject(Of RequestMessage)(Me.getMessagePayload())

                Me.updateOutputOverride(button, msg.outputOverride)
                Me.updateButtonEnabled(button, msg.enabled)
            End If
        End Sub

        ''' <summary>
        ''' Update the override value for the output of a button
        ''' </summary>
        ''' <param name="button"></param>
        ''' <param name="state"></param>
        Private Sub updateOutputOverride(button As Integer, state As String)
            Dim outputState As Definitions.ButtonOutputState
            If state = "on" Then
                outputState = Definitions.ButtonOutputState.IndicatorOn
            ElseIf state = "off" Then
                outputState = Definitions.ButtonOutputState.IndicatorOff
            ElseIf state = "system" Then
                outputState = Definitions.ButtonOutputState.System
            Else
                Return
            End If

            Buttons.updateButtonOutputOverride(button, outputState)
        End Sub

        ''' <summary>
        ''' Update the override value for the output of a button
        ''' </summary>
        ''' <param name="button"></param>
        ''' <param name="enabled"></param>
        Private Sub updateButtonEnabled(button As Integer, enabled As String)
            Dim buttonEnabled As Boolean
            If enabled = "true" Then
                buttonEnabled = True
            ElseIf enabled = "false" Then
                buttonEnabled = False
            Else
                Return
            End If
            Buttons.updateButtonEnabled(button, buttonEnabled)
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 12:39:05 +0000
