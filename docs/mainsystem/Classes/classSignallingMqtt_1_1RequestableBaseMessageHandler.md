---
title: SignallingMqtt::RequestableBaseMessageHandler
summary: Provides a framework and common functions for message handler that can be interacted with via a request. 

---

# SignallingMqtt::RequestableBaseMessageHandler



Provides a framework and common functions for message handler that can be interacted with via a request. 

Inherits from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)

Inherited by [SignallingMqtt.ButtonMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1ButtonMessageHandler/), [SignallingMqtt.DirectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1DirectionMessageHandler/), [SignallingMqtt.LeverMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler/), [SignallingMqtt.PointMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler/), [SignallingMqtt.RelayInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RelayInputMessageHandler/), [SignallingMqtt.SensorInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SensorInputMessageHandler/), [SignallingMqtt.SignalMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SignalMessageHandler/), [SignallingMqtt.StationMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1StationMessageHandler/), [SignallingMqtt.TrackSectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/)

## Protected Types

|                | Name           |
| -------------- | -------------- |
| enum class| **[MessageActions](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#enum-messageactions)** { Unknown = 0, Input = 1, Override = 2, Request = 3} |

## Protected Functions

|                | Name           |
| -------------- | -------------- |
| override string | **[getTopic](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#function-gettopic)**() |

## Protected Attributes

|                | Name           |
| -------------- | -------------- |
| [MessageActions](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#enum-messageactions) | **[action](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/#variable-action)**  |

## Additional inherited members

**Protected Attributes inherited from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| MqttApplicationMessageReceivedEventArgs | **[messageEvent](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-messageevent)** <br>Base MqttApplicationMessageReceivedEventArgs object from the message  |
| string | **[topicPrefix](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-topicprefix)** <br>String value of the topic prefix that was matched  |


## Protected Types Documentation

### enum MessageActions

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| Unknown | 0|  Unable to identify action type |
| Input | 1|  Input action, usually from TIA485 bridge |
| Override | 2|  Override message - should only be sent by us |
| Request | 3|  Request of some sort, usually sent by clients |




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
MessageActions action;
```


The action that this message corresponds to


-------------------------------

Updated on 2022-11-18 at 16:49:19 +0000