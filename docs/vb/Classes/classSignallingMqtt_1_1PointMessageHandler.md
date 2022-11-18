---
title: SignallingMqtt::PointMessageHandler
summary: Handles updates of point states provided by ModBus client 

---

# SignallingMqtt::PointMessageHandler



Handles updates of point states provided by ModBus client 

Inherits from [SignallingMqtt.RequestableBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/), [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)

## Public Functions

|                | Name           |
| -------------- | -------------- |
| override [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[handle](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1PointMessageHandler/#function-handle)**()<br>Handle the message  |

## Additional inherited members

**Protected Types inherited from [SignallingMqtt.RequestableBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| enum class| **[MessageActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#enum-messageactions)** { Unknown, Input, Override, Request} |

**Protected Functions inherited from [SignallingMqtt.RequestableBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| override string | **[getTopic](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#function-gettopic)**() |

**Protected Attributes inherited from [SignallingMqtt.RequestableBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| [MessageActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#enum-messageactions) | **[action](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#variable-action)**  |

**Protected Attributes inherited from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| MqttApplicationMessageReceivedEventArgs | **[messageEvent](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-messageevent)** <br>Base MqttApplicationMessageReceivedEventArgs object from the message  |
| string | **[topicPrefix](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-topicprefix)** <br>String value of the topic prefix that was matched  |


## Public Functions Documentation

### function handle

```csharp
override void handle()
```

Handle the message 

-------------------------------

Updated on 2022-11-18 at 12:39:03 +0000