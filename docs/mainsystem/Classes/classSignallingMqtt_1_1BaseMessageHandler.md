---
title: SignallingMqtt::BaseMessageHandler
summary: Provides a framework and common functions for message handlers 

---

# SignallingMqtt::BaseMessageHandler



Provides a framework and common functions for message handlers 

Inherited by [SignallingMqtt.OperatorMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler/), [SignallingMqtt.RequestableBaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)

## Protected Attributes

|                | Name           |
| -------------- | -------------- |
| MqttApplicationMessageReceivedEventArgs | **[messageEvent](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-messageevent)** <br>Base MqttApplicationMessageReceivedEventArgs object from the message  |
| string | **[topicPrefix](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-topicprefix)** <br>String value of the topic prefix that was matched  |

## Protected Attributes Documentation

### variable messageEvent

```csharp
MqttApplicationMessageReceivedEventArgs messageEvent;
```

Base MqttApplicationMessageReceivedEventArgs object from the message 

### variable topicPrefix

```csharp
string topicPrefix;
```

String value of the topic prefix that was matched 

-------------------------------

Updated on 2022-11-18 at 16:18:54 +0000