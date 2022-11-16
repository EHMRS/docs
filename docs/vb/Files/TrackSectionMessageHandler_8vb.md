---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/TrackSectionMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/TrackSectionMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::TrackSectionMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/)** <br>Handles updates of track section states provided by ModBus client  |




## Source code

```csharp

Namespace SignallingMqtt

    ''' <summary>
    ''' Handles updates of track section states provided by ModBus client
    ''' </summary>
    Public Class TrackSectionMessageHandler

        Inherits DeviceBaseMessageHandler

        ''' <summary>
        ''' Track section state message created by the modbus To MQTT system
        ''' </summary>
        Private Class InputMessage
            ''' <summary>
            ''' The voltage through the track section
            ''' </summary>
            Public value As Integer
        End Class

        ''' <summary>
        ''' Track section request message created by client apps
        ''' </summary>
        Private Class RequestMessage
            ''' <summary>
            ''' The override state for the track section
            ''' </summary>
            Public inputOverride As String = ""
            ''' <summary>
            ''' The override state for the track section
            ''' </summary>
            Public setPoint As Integer = -1
            ''' <summary>
            ''' The override state for the track section
            ''' </summary>
            Public errorPoint As Integer = -1
            ''' <summary>
            ''' The override state for the track section
            ''' </summary>
            Public delay As Integer = -1
        End Class


        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()
            ' Get the name of the section
            Dim section As String = Me.getTopic()

            If Me.action = DeviceActions.Input Then
                Dim msg As InputMessage = Newtonsoft.Json.JsonConvert.DeserializeObject(Of InputMessage)(Me.getMessagePayload())
                If section.StartsWith("P") And Not section = "P" Then
                    ' This is a point section
                    PointSections.updatePointSection(section, AnalogIOManager.convertVoltage(msg.value))
                Else
                    ' This is a track section
                    TrackSections.updateTrackSection(section, AnalogIOManager.convertVoltage(msg.value))
                End If
            End If
            If Me.action = DeviceActions.Request Then
                Dim msg As RequestMessage = Newtonsoft.Json.JsonConvert.DeserializeObject(Of RequestMessage)(Me.getMessagePayload())
                Me.updateInputOverride(section, msg.inputOverride)
                Me.updateSetPoint(section, msg.setPoint)
            End If
        End Sub

        ''' <summary>
        ''' Update the input value of the override of the section
        ''' </summary>
        ''' <param name="section"></param>
        ''' <param name="state"></param>
        Private Sub updateInputOverride(section As String, state As String)
            ' Get the state that is being requested for override
            Dim overrideState As Definitions.SectionState
            If state = "occupied" Then
                overrideState = Definitions.SectionState.Occupied
            ElseIf state = "unoccupied" Then
                overrideState = Definitions.SectionState.Unoccupied
            ElseIf state = "system" Then
                overrideState = Definitions.SectionState.System
            Else
                Return
            End If

            If section.StartsWith("P") And Not section = "P" Then
                ' This is a point section
                PointSections.updatePointSectionOverride(section, overrideState)
            Else
                ' This is a track section
                TrackSections.updateTrackSectionOverride(section, overrideState)
            End If
        End Sub

        ''' <summary>
        ''' Update the voltage set point of the section
        ''' </summary>
        ''' <param name="section"></param>
        ''' <param name="value"></param>
        Private Sub updateSetPoint(section As String, value As Integer)
            ''' @todo Implement this
        End Sub

        ''' <summary>
        ''' Update the voltage error point of the section
        ''' </summary>
        ''' <param name="section"></param>
        ''' <param name="value"></param>
        Private Sub updateErrorPoint(section As String, value As Integer)
            ''' @todo Implement this
        End Sub

        ''' <summary>
        ''' Update the delay for which the system considers the section occupied
        ''' after the input has changed
        ''' </summary>
        ''' <param name="section"></param>
        ''' <param name="value"></param>
        Private Sub updateDelay(section As String, value As Integer)
            ''' @todo Implement this
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-15 at 15:52:06 +0000
