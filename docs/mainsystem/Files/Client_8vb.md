---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/Client.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/Client.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |
| **[MQTTnet::Client](/SignallingSystem-doc/mainsystem/Namespaces/namespaceMQTTnet_1_1Client/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using | **[MQTTnet](/SignallingSystem-doc/mainsystem/Files/Client_8vb/#variable-mqttnet)**  |



## Attributes Documentation

### variable MQTTnet

```csharp
﻿using MQTTnet;
```



## Source code

```csharp
Imports MQTTnet
Imports MQTTnet.Client
Imports System.IO
Imports System.Text
Imports System.Text.Json
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt
    Module Client
        ''' <summary>
        ''' @brief Mqtt Factory
        ''' </summary>
        Private mqFactory As MqttFactory = New MqttFactory()
        ''' <summary>
        ''' @brief MQTT client object itself
        ''' </summary>
        Private WithEvents mqClient As MqttClient = mqFactory.CreateMqttClient()
        Private tlsOptions As MqttClientOptionsBuilderTlsParameters =
                New MqttClientOptionsBuilderTlsParameters()
        Private options As MqttClientOptions
        ''' <summary>
        ''' @brief Are we currently connected to the MQTT server
        ''' </summary>
        Friend connected As Boolean = False
        ''' <summary>
        ''' @brief Are we currently connecting to the MQTT server
        ''' </summary>
        Friend connecting As Boolean = False
        ''' <summary>
        ''' Outer message template that includes the wrapper and also the actual
        ''' message payload
        ''' </summary>
        Private Class MessageTemplate
            ''' <summary>
            ''' @brief Username responsible for sending the message
            ''' </summary>
            ''' <returns>Username</returns>
            Public Property username As String
            ''' <summary>
            ''' @brief The source application of the message
            ''' </summary>
            ''' <returns>Source Application</returns>
            Public Property source As String
            ''' <summary>
            ''' @brief The payload of the message
            ''' </summary>
            ''' <returns>JSON Payload</returns>
            Public Property payload As Object
        End Class

        ''' <summary>
        ''' @brief Initialisation code
        ''' </summary>
        Public Sub initialise()
            MessageHandlers.registerHandlers()

            connect()
        End Sub

        Private Async Function connect() As Task
            If connecting Or connected Then
                Return
            End If
            connecting = True

            tlsOptions.AllowUntrustedCertificates = True
            tlsOptions.UseTls = True

            tlsOptions.CertificateValidationHandler = Function(__) True
            options = New MqttClientOptionsBuilder() _
                .WithTcpServer("localhost", 1883) _
                .WithCredentials("mainlogic", "password") _
                .WithTls(tlsOptions) _
                .Build()


            While Not connected
                ' Keep trying to connect until it succeeds - 1000ms inbetween
                ' tries
                Try
                    Await mqClient.ConnectAsync(options)
                    connected = True
                Catch ex As MQTTnet.Exceptions.MqttCommunicationException
                    Threading.Thread.Sleep(1000)
                End Try
            End While

            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "operator/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "points/#") _
                .Build())
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "buttons/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "signals/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "relays/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "levers/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "sections/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "sensors/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "direction/#") _
                .Build()
            )
            Await mqClient.SubscribeAsync(
                New MqttTopicFilterBuilder() _
                .WithTopic(GlobalConfig.config.mqttPrefix + "station/#") _
                .Build()
            )
            connecting = False
        End Function

        Private Async Function publish(
                                      topic As String,
                                      payload As String
                                      ) As Task
            Dim ApplicationMessage As MqttApplicationMessage

            ' This should be a variable configuration parameter
            topic = GlobalConfig.config.mqttPrefix + topic

            ApplicationMessage = New MqttApplicationMessageBuilder() _
                .WithTopic(topic) _
                .WithPayload(payload) _
                .WithRetainFlag(True) _
                .Build()
            Await mqClient.PublishAsync(ApplicationMessage)
        End Function

        Private Async Function ReceiveMqttMessage(
                                 e As MqttApplicationMessageReceivedEventArgs
                               ) As Task _
                               Handles mqClient.ApplicationMessageReceivedAsync
            Dim payload As String =
                Encoding.UTF8.GetString(e.ApplicationMessage.Payload)

            Dim topic As String

            ' Convert the topic - remove the beinning of the message as defined
            ' by the config file
            topic = e.ApplicationMessage.Topic
            topic = topic.Substring(GlobalConfig.config.mqttPrefix.Length)

            ' See if there is a direct match
            If MessageHandlers.MessageHandlers.ContainsKey(topic) Then
                Dim handler As BaseMessageHandler =
                    MessageHandlers.MessageHandlers.Item(topic)
                handler.prepare(e)
                handler.handle()
                Return
            End If

            ' See if there is a match for less of the subject
            For Each entry In MessageHandlers.MessageHandlers
                If topic.StartsWith(entry.Key) Then
                    ' Use this handler
                    Dim handler As BaseMessageHandler = entry.Value

                    handler.prepare(e, entry.Key)
                    handler.handle()
                    Return
                End If
            Next
        End Function

        Private Async Function MqttDisconnected(
                                               ByVal e As MqttClientDisconnectedEventArgs
                                               ) As Task Handles mqClient.DisconnectedAsync
            connected = False
            Await connect()
        End Function

        Private Sub sendMessage(ByVal topic As String, ByVal payload As String)
            Dim encapsulatedPayload As Object
            encapsulatedPayload =
                DeserializeObject(payload)
            Dim message As MessageTemplate = New MessageTemplate()
            message.payload = encapsulatedPayload
            message.username = "system"
            message.source = "mainlogic"
            publish(topic, SerializeObject(message))
        End Sub

        Public Sub sendState(
                            ByVal type As Definitions.messageIndexes,
                            ByVal topic As String,
                            ByVal payload As String)
            If type = Definitions.messageIndexes.System Then
                sendSystemState(topic, payload)
            End If
            If type = Definitions.messageIndexes.Override Then
                sendOverrideState(topic, payload)
            End If
            If type = Definitions.messageIndexes.Output Then
                sendOutputState(topic, payload)
            End If
        End Sub

        Public Sub sendOutputState(
                                  ByVal topic As String,
                                  ByVal payload As String
                                  )
            sendMessage(topic + "/output", payload)
        End Sub

        Public Sub sendSystemState(
                                  ByVal topic As String,
                                  ByVal payload As String
                                  )
            sendMessage(topic + "/system", payload)
        End Sub
        Public Sub sendOverrideState(
                                    ByVal topic As String,
                                    ByVal payload As String
                                    )
            sendMessage(topic + "/override", payload)
        End Sub

    End Module
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
