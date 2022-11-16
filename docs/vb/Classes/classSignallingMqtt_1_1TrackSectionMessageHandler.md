---
title: SignallingMqtt::TrackSectionMessageHandler
summary: Handles updates of track section states provided by ModBus client 

---

# SignallingMqtt::TrackSectionMessageHandler



Handles updates of track section states provided by ModBus client 

Inherits from [SignallingMqtt.DeviceBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/), [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)

## Public Functions

|                | Name           |
| -------------- | -------------- |
| override [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[handle](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/#function-handle)**()<br>Handle the message  |

## Additional inherited members

**Protected Types inherited from [SignallingMqtt.DeviceBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| enum class| **[DeviceActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#enum-deviceactions)** { Unknown, Input, Override, Request} |

**Protected Functions inherited from [SignallingMqtt.DeviceBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| override string | **[getTopic](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#function-gettopic)**() |

**Protected Attributes inherited from [SignallingMqtt.DeviceBaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| [DeviceActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#enum-deviceactions) | **[action](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#variable-action)**  |

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

Updated on 2022-11-15 at 15:52:04 +0000