---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/DeviceBaseMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/DeviceBaseMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::DeviceBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/)** <br>Provides a framework and common functions for message handler that are devices.  |




## Source code

```csharp

Namespace SignallingMqtt

    ''' <summary>
    ''' Provides a framework and common functions for message handler that are
    ''' devices.
    ''' </summary>
    Public MustInherit Class DeviceBaseMessageHandler
        Inherits BaseMessageHandler

        ''' <summary>
        ''' @brief The options of what message type is being received
        ''' </summary>
        Protected Enum DeviceActions
            ''' <summary>
            ''' @brief Unable to identify action type
            ''' </summary>
            Unknown = 0
            ''' <summary>
            ''' @brief Input action from TIA485 bridge
            ''' </summary>
            Input = 1
            ''' <summary>
            ''' @brief Override message - should only be sent by us
            ''' </summary>
            Override = 2
            ''' <summary>
            ''' @brief Request of some sort - sent by clients
            ''' </summary>
            Request = 3
        End Enum

        ''' <summary>
        ''' @brief The action that this message corresponds to
        ''' </summary>
        Protected action As DeviceActions

        ''' <summary>
        ''' @brief Override of getTopic to include action handling
        ''' Overrides getTopic so that the action gets set on the instance, as
        ''' well as removed from the topic name
        ''' </summary>
        ''' <returns>The topic</returns>
        Protected Overrides Function getTopic() As String
            ' Get the topic with all the prefixes removed etc.
            Dim topic As String = MyBase.getTopic()

            ' Sane default
            Me.action = DeviceActions.Unknown

            ' Is this an input message?
            If topic.Substring(topic.Length - 6) = "/input" Then
                topic = topic.Substring(0, topic.Length - 6)
                Me.action = DeviceActions.Input
                Return topic
            End If

            ' Is this a request message?
            If topic.Substring(topic.Length - 8) = "/request" Then
                topic = topic.Substring(0, topic.Length - 8)
                Me.action = DeviceActions.Request
                Return topic
            End If

            Return topic
        End Function
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
