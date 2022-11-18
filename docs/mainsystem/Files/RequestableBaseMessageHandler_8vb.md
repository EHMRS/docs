---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/RequestableBaseMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/RequestableBaseMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::RequestableBaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)** <br>Provides a framework and common functions for message handler that can be interacted with via a request.  |




## Source code

```csharp

Namespace SignallingMqtt

    ''' <summary>
    ''' Provides a framework and common functions for message handler that can
    ''' be interacted with via a request.
    ''' </summary>
    Public MustInherit Class RequestableBaseMessageHandler
        Inherits BaseMessageHandler

        ''' <summary>
        ''' @brief The options of what message type is being received
        ''' </summary>
        Protected Enum MessageActions
            ''' <summary>
            ''' @brief Unable to identify action type
            ''' </summary>
            Unknown = 0
            ''' <summary>
            ''' @brief Input action, usually from TIA485 bridge
            ''' </summary>
            Input = 1
            ''' <summary>
            ''' @brief Override message - should only be sent by us
            ''' </summary>
            Override = 2
            ''' <summary>
            ''' @brief Request of some sort, usually sent by clients
            ''' </summary>
            Request = 3
        End Enum

        ''' <summary>
        ''' @brief The action that this message corresponds to
        ''' </summary>
        Protected action As MessageActions

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
            Me.action = MessageActions.Unknown

            ' Handle the ones without a prefix first
            If topic = "input" Then
                topic = ""
                Me.action = MessageActions.Input
                Return topic
            End If

            If topic = "request" Then
                topic = ""
                Me.action = MessageActions.Request
                Return topic
            End If

            ' Is this an input message?
            If topic.Substring(topic.Length - 6) = "/input" Then
                topic = topic.Substring(0, topic.Length - 6)
                Me.action = MessageActions.Input
                Return topic
            End If

            ' Is this a request message?
            If topic.Substring(topic.Length - 8) = "/request" Then
                topic = topic.Substring(0, topic.Length - 8)
                Me.action = MessageActions.Request
                Return topic
            End If

            Return topic
        End Function
    End Class
End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
