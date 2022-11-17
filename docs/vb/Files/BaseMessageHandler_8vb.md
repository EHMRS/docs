---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/BaseMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/BaseMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |
| **[System::Text](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Text/)**  |
| **[System::Text::Json](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Text_1_1Json/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)** <br>Provides a framework and common functions for message handlers  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using MQTTnet. | **[Client](/SignallingSystem-doc/vb/Files/BaseMessageHandler_8vb/#variable-client)**  |



## Attributes Documentation

### variable Client

```csharp
﻿using MQTTnet. Client;
```



## Source code

```csharp
Imports MQTTnet.Client
Imports System.IO
Imports System.Text
Imports System.Text.Json
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt
    ''' <summary>
    ''' Provides a framework and common functions for message handlers
    ''' </summary>
    Public MustInherit Class BaseMessageHandler
        ''' <summary>
        ''' Base MqttApplicationMessageReceivedEventArgs object from the message
        ''' </summary>
        Protected messageEvent As MqttApplicationMessageReceivedEventArgs

        ''' <summary>
        ''' String value of the topic prefix that was matched
        ''' </summary>
        Protected topicPrefix As String

        ''' <summary>
        ''' The message as received, with all metadata
        ''' </summary>
        Private wrappedMessage As MessageWrapper

        ''' <summary>
        ''' Prepare the MessageHanlder
        ''' </summary>
        ''' <param name="e">
        '''     Base MqttApplicationMessageReceivedEventArgs from Mqtt.net
        ''' </param>
        ''' <param name="topicPrefix">
        '''     Prefix that matched this handler, if any
        ''' </param>
        Public Sub prepare(
                          e As MqttApplicationMessageReceivedEventArgs,
                          Optional topicPrefix As String = ""
                          )
            Me.messageEvent = e
            Me.topicPrefix = topicPrefix
            Dim msg As String = Encoding.UTF8.GetString(
                Me.messageEvent.ApplicationMessage.Payload
                )
            Me.wrappedMessage = DeserializeObject(Of MessageWrapper)(msg)
        End Sub

        ''' <summary>
        ''' @brief Handle method; must be overloaded by children
        ''' </summary>
        Public MustOverride Sub handle()

        ''' <summary>
        ''' @brief The wrapper of all MQTT messages, including metadata
        ''' </summary>
        Private Class MessageWrapper
            ''' <summary>
            ''' @brief The user on behalf of whom the message was sent
            ''' </summary>
            Public Property username As String
            ''' <summary>
            ''' @brief The source of the message
            ''' </summary>
            Public Property source As String
            ''' <summary>
            ''' @brief The payload of the message - the message itself
            ''' </summary>
            Public Property payload As Object
        End Class

        ''' <summary>
        ''' @brief Gets the message payload of this message as a string
        ''' </summary>
        ''' <returns>String representation of the JSON message</returns>
        Protected Function getMessagePayload() As String
            Return SerializeObject(wrappedMessage.payload)
        End Function

        ''' <summary>
        ''' @brief Get the topic of this message
        ''' This function strips off the prefix (set in global config), and any
        ''' topic prefix that was defined.
        ''' </summary>
        ''' <returns>The topic</returns>
        Protected Overridable Function getTopic() As String
            Dim topic As String = Me.messageEvent.ApplicationMessage.Topic
            ' Take of the global prefix (signalling/)
            If topic.Substring(0, GlobalConfig.config.mqttPrefix.Length) =
                                GlobalConfig.config.mqttPrefix Then
                topic = topic.Substring(GlobalConfig.config.mqttPrefix.Length)
            End If

            ' Take off the topic prefix, if there is one
            If Not Me.topicPrefix = "" Then
                topic = topic.Replace(Me.topicPrefix, "")
                If topic.Substring(0, 1) = "/" Then
                    topic = topic.Substring(1)
                End If
            End If

            ' Return the topic as processed
            Return topic
        End Function
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
