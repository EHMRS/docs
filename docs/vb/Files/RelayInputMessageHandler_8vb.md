---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/RelayInputMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/RelayInputMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::RelayInputMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RelayInputMessageHandler/)** <br>Handles updates of relay states provided over MQTT  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/vb/Files/RelayInputMessageHandler_8vb/#variable-jsonconvert)**  |



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
    ''' Handles updates of relay states provided over MQTT
    ''' </summary>
    Public Class RelayInputMessageHandler
        Inherits DeviceBaseMessageHandler

        ''' <summary>
        ''' Relay state message created by the modbus to MQTT system
        ''' </summary>
        Private Class InputMessage
            ''' <summary>
            ''' The voltage through the relay contacts
            ''' </summary>
            Public value As Integer
        End Class


        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()
            Dim msg As InputMessage =
                DeserializeObject(Of InputMessage)(Me.getMessagePayload())

            ' Get the name of the relay, and the index of the relay in arrays
            Dim relay As String = Me.getTopic()

            If Me.action = DeviceActions.Input Then
                Relays.UpdateRelay(
                    relay,
                    AnalogIOManager.convertVoltage(msg.value)
                    )
            End If
        End Sub
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-15 at 15:52:06 +0000
