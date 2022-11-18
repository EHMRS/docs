---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/SensorInputMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/SensorInputMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::SensorInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SensorInputMessageHandler/)** <br>Handles updates of relay states provided by ModBus client  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/mainsystem/Files/SensorInputMessageHandler_8vb/#variable-jsonconvert)**  |



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
    ''' Handles updates of relay states provided by ModBus client
    ''' </summary>
    Public Class SensorInputMessageHandler
        Inherits RequestableBaseMessageHandler

        ''' <summary>
        ''' Sensor state message created by the modbus to MQTT system
        ''' </summary>
        Private Class InputMessage
            ''' <summary>
            ''' The voltage through the Normally Open sensor contacts
            ''' </summary>
            Public NO As Integer
            ''' <summary>
            ''' The voltage through the Normally Closed sensor contacts
            ''' </summary>
            Public NC As Integer
        End Class


        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()

            ' Get the topic and work out what we're handling here
            Dim sensor As String = Me.getTopic()

            If Me.action = MessageActions.Input Then
                Dim msg As InputMessage =
                    DeserializeObject(Of InputMessage)(Me.getMessagePayload())

                ' Get index based on name
                Dim sensorIndex As Integer = Array.IndexOf(
                    LineSide.SensorInternalNames,
                    sensor
                    )

                ' Check that the sensor actually exists in our system.
                If sensorIndex = -1 Then
                    ' This sensor does not exist
                    Return
                End If

                Dim NoIndex As Integer
                Dim NcIndex As Integer
                NoIndex = DigitalDeviceAddress.InputSensorAddresses(
                    sensorIndex * 2
                    )
                NcIndex = DigitalDeviceAddress.InputSensorAddresses(
                    sensorIndex * 2 + 1
                    )

                If msg.NO > 0 Then
                    Serial.DataReadInputsArray(NoIndex) = 1
                Else
                    Serial.DataReadInputsArray(NoIndex) = 0
                End If

                If msg.NC > 0 Then
                    Serial.DataReadInputsArray(NcIndex) = 1
                Else
                    Serial.DataReadInputsArray(NcIndex) = 0
                End If
            End If
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
