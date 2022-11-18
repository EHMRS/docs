---
title: SignallingMqtt

---

# SignallingMqtt



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)** <br>Provides a framework and common functions for message handlers  |
| class | **[SignallingMqtt::ButtonMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1ButtonMessageHandler/)** <br>Handles updates of button states provided by ModBus client  |
| class | **[SignallingMqtt::DirectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1DirectionMessageHandler/)** <br>Handle the changing of configuration of the direction of travel  |
| class | **[SignallingMqtt::LeverMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler/)** <br>Lever Input State message handling class Handles updates of lever states provided by ModBus client.  |
| class | **[SignallingMqtt::OperatorMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler/)** <br>Operator message handling class - handles operator log in and out  |
| class | **[SignallingMqtt::PointMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler/)** <br>Handles updates of point states provided by ModBus client  |
| class | **[SignallingMqtt::RelayInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RelayInputMessageHandler/)** <br>Handles updates of relay states provided over MQTT  |
| class | **[SignallingMqtt::RequestableBaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)** <br>Provides a framework and common functions for message handler that can be interacted with via a request.  |
| class | **[SignallingMqtt::SensorInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SensorInputMessageHandler/)** <br>Handles updates of relay states provided by ModBus client  |
| class | **[SignallingMqtt::SignalMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SignalMessageHandler/)**  |
| class | **[SignallingMqtt::StationMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1StationMessageHandler/)**  |
| class | **[SignallingMqtt::TrackSectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/)** <br>Handles updates of track section states provided by ModBus client  |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[initialise](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/#function-initialise)**() |
| | **[Dictionary](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/#function-dictionary)**(Of MessageHandlers string, [BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/) ) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[registerHandlers](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/#function-registerhandlers)**() |


## Functions Documentation

### function initialise

```csharp
void initialise()
```


Initialisation code


### function Dictionary

```csharp
Dictionary(
    Of MessageHandlers string,
    BaseMessageHandler 
)
```


Dictionary of message handlers


### function registerHandlers

```csharp
void registerHandlers()
```


Registers the handlers for various topic prefixes






-------------------------------

Updated on 2022-11-18 at 16:49:19 +0000