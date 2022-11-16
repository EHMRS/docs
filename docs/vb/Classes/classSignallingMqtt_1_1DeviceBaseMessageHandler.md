---
title: SignallingMqtt::DeviceBaseMessageHandler
summary: Provides a framework and common functions for message handler that are devices. 

---

# SignallingMqtt::DeviceBaseMessageHandler



Provides a framework and common functions for message handler that are devices. 

Inherits from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)

Inherited by [SignallingMqtt.ButtonMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1ButtonMessageHandler/), [SignallingMqtt.LeverMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1LeverMessageHandler/), [SignallingMqtt.PointMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1PointMessageHandler/), [SignallingMqtt.RelayInputMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1RelayInputMessageHandler/), [SignallingMqtt.SensorInputMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1SensorInputMessageHandler/), [SignallingMqtt.SignalMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1SignalMessageHandler/), [SignallingMqtt.TrackSectionMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/)

## Protected Types

|                | Name           |
| -------------- | -------------- |
| enum class| **[DeviceActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#enum-deviceactions)** { Unknown = 0, Input = 1, Override = 2, Request = 3} |

## Protected Functions

|                | Name           |
| -------------- | -------------- |
| override string | **[getTopic](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#function-gettopic)**() |

## Protected Attributes

|                | Name           |
| -------------- | -------------- |
| [DeviceActions](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#enum-deviceactions) | **[action](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1DeviceBaseMessageHandler/#variable-action)**  |

## Additional inherited members

**Protected Attributes inherited from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| MqttApplicationMessageReceivedEventArgs | **[messageEvent](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-messageevent)** <br>Base MqttApplicationMessageReceivedEventArgs object from the message  |
| string | **[topicPrefix](/SignallingSystem-doc/vb/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-topicprefix)** <br>String value of the topic prefix that was matched  |


## Protected Types Documentation

### enum DeviceActions

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Unknown | 0|  Unable to identify action type |
| Input | 1|  Input action from TIA485 bridge |
| Override | 2|  Override message - should only be sent by us |
| Request | 3|  Request of some sort - sent by clients |




The options of what message type is being received


## Protected Functions Documentation

### function getTopic

```csharp
override string getTopic()
```


**Return**: The topic

Override of getTopic to include action handling Overrides getTopic so that the action gets set on the instance, as well as removed from the topic name


## Protected Attributes Documentation

### variable action

```csharp
DeviceActions action;
```


The action that this message corresponds to


-------------------------------

Updated on 2022-11-15 at 15:52:04 +0000