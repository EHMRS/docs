---
title: SignallingMqtt::OperatorMessageHandler
summary: Operator message handling class - handles operator log in and out 

---

# SignallingMqtt::OperatorMessageHandler



Operator message handling class - handles operator log in and out 

Inherits from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)

## Public Functions

|                | Name           |
| -------------- | -------------- |
| override [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[handle](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler/#function-handle)**()<br>Handle the message  |

## Additional inherited members

**Protected Attributes inherited from [SignallingMqtt.BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)**

|                | Name           |
| -------------- | -------------- |
| MqttApplicationMessageReceivedEventArgs | **[messageEvent](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-messageevent)** <br>Base MqttApplicationMessageReceivedEventArgs object from the message  |
| string | **[topicPrefix](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/#variable-topicprefix)** <br>String value of the topic prefix that was matched  |


## Public Functions Documentation

### function handle

```csharp
override void handle()
```

Handle the message 

-------------------------------

Updated on 2022-11-18 at 16:18:54 +0000