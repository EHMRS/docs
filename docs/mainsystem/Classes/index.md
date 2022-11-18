---
title: Classes

---

# Classes




* **class [AuthentikApiAuthenticationRequest](/SignallingSystem-doc/mainsystem/Classes/classAuthentikApiAuthenticationRequest/)** 
* **class [AuthentikApiResponse](/SignallingSystem-doc/mainsystem/Classes/classAuthentikApiResponse/)** 
* **class [AuthentikUserApiResponse](/SignallingSystem-doc/mainsystem/Classes/classAuthentikUserApiResponse/)** 
* **class [AuthentikUserGroupRecord](/SignallingSystem-doc/mainsystem/Classes/classAuthentikUserGroupRecord/)** 
* **class [AuthentikUserRecord](/SignallingSystem-doc/mainsystem/Classes/classAuthentikUserRecord/)** 
* **class [Configs](/SignallingSystem-doc/mainsystem/Classes/classConfigs/)** 
* **class [DigitalDeviceAddress](/SignallingSystem-doc/mainsystem/Classes/classDigitalDeviceAddress/)** 
* **class [DirectionMessage](/SignallingSystem-doc/mainsystem/Classes/classDirectionMessage/)** 
* **namespace [EHMR_Signalling_System::LogicStart](/SignallingSystem-doc/mainsystem/Namespaces/namespaceEHMR__Signalling__System_1_1LogicStart/)** 
* **class [EastBoundComputer](/SignallingSystem-doc/mainsystem/Classes/classEastBoundComputer/)** 
* **class [EastBoundManual](/SignallingSystem-doc/mainsystem/Classes/classEastBoundManual/)** 
* **class [GGSMTP_GMAIL](/SignallingSystem-doc/mainsystem/Classes/classGGSMTP__GMAIL/)** 
* **class [GlobalConfigObj](/SignallingSystem-doc/mainsystem/Classes/classGlobalConfigObj/)** 
* **class [IOMonitor](/SignallingSystem-doc/mainsystem/Classes/classIOMonitor/)** 
* **class [LeverLockOutputState](/SignallingSystem-doc/mainsystem/Classes/classLeverLockOutputState/)** 
* **class [LoginForm](/SignallingSystem-doc/mainsystem/Classes/classLoginForm/)** 
* **namespace [MQTTnet::Client](/SignallingSystem-doc/mainsystem/Namespaces/namespaceMQTTnet_1_1Client/)** 
* **class [Main](/SignallingSystem-doc/mainsystem/Classes/classMain/)** 
* **class [MqttConfig](/SignallingSystem-doc/mainsystem/Classes/classMqttConfig/)** 
* **namespace [Newtonsoft::Json](/SignallingSystem-doc/mainsystem/Namespaces/namespaceNewtonsoft_1_1Json/)** 
* **namespace [Newtonsoft::Json::JsonConvert](/SignallingSystem-doc/mainsystem/Namespaces/namespaceNewtonsoft_1_1Json_1_1JsonConvert/)** 
* **class [OutputConfig](/SignallingSystem-doc/mainsystem/Classes/classOutputConfig/)** 
* **class [PointOutput](/SignallingSystem-doc/mainsystem/Classes/classPointOutput/)** 
* **class [PopUpConfig](/SignallingSystem-doc/mainsystem/Classes/classPopUpConfig/)** 
* **class [RelayOutputState](/SignallingSystem-doc/mainsystem/Classes/classRelayOutputState/)** 
* **class [RuntimeConfigObj](/SignallingSystem-doc/mainsystem/Classes/classRuntimeConfigObj/)** 
* **class [SerialConfig](/SignallingSystem-doc/mainsystem/Classes/classSerialConfig/)** 
* **namespace [SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)** 
    * **class [BaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1BaseMessageHandler/)** <br>Provides a framework and common functions for message handlers 
    * **class [ButtonMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1ButtonMessageHandler/)** <br>Handles updates of button states provided by ModBus client 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1ButtonMessageHandler_1_1InputMessage/)** <br>Relay state message created by the modbus to MQTT system 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1ButtonMessageHandler_1_1RequestMessage/)** <br>Button request message created by client apps 
    * **class [DirectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1DirectionMessageHandler/)** <br>Handle the changing of configuration of the direction of travel 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1DirectionMessageHandler_1_1RequestMessage/)** <br>Request message created by client applications 
    * **class [LeverMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler/)** <br>Lever Input State message handling class Handles updates of lever states provided by ModBus client. 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler_1_1InputMessage/)** <br>Lever state message created by the modbus to MQTT system. 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1LeverMessageHandler_1_1RequestMessage/)** <br>Request message created by client applications. 
    * **class [MessageTemplate](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1MessageTemplate/)** <br>Outer message template that includes the wrapper and also the actual message payload 
    * **class [OperatorMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler/)** <br>Operator message handling class - handles operator log in and out 
        * **class [OperatorMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler_1_1OperatorMessage/)** <br>Operator Login/logout message created by the Card Swipe system 
    * **class [PointMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler/)** <br>Handles updates of point states provided by ModBus client 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler_1_1InputMessage/)** <br>Point state message created by the modbus to MQTT system 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1PointMessageHandler_1_1RequestMessage/)** <br>Point request message created by client applications 
    * **class [RelayInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RelayInputMessageHandler/)** <br>Handles updates of relay states provided over MQTT 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RelayInputMessageHandler_1_1InputMessage/)** <br>Relay state message created by the modbus to MQTT system 
    * **class [RequestableBaseMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1RequestableBaseMessageHandler/)** <br>Provides a framework and common functions for message handler that can be interacted with via a request. 
    * **class [SensorInputMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SensorInputMessageHandler/)** <br>Handles updates of relay states provided by ModBus client 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SensorInputMessageHandler_1_1InputMessage/)** <br>Sensor state message created by the modbus to MQTT system 
    * **class [SignalMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SignalMessageHandler/)** 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1SignalMessageHandler_1_1RequestMessage/)** <br>Point request message created by client applications 
    * **class [StationMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1StationMessageHandler/)** 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1StationMessageHandler_1_1RequestMessage/)** <br>Request message created by client applications 
    * **class [TrackSectionMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler/)** <br>Handles updates of track section states provided by ModBus client 
        * **class [InputMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler_1_1InputMessage/)** <br>Track section state message created by the modbus To MQTT system 
        * **class [RequestMessage](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1TrackSectionMessageHandler_1_1RequestMessage/)** <br>Track section request message created by client apps 
* **namespace [System](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem/)** 
* **namespace [System::IO](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1IO/)** 
* **namespace [System::Net](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Net/)** 
* **namespace [System::Net::Http](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Net_1_1Http/)** 
* **namespace [System::Net::Http::Headers](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Net_1_1Http_1_1Headers/)** 
* **namespace [System::Text](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Text/)** 
* **namespace [System::Text::Json](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Text_1_1Json/)** 
* **namespace [System::Threading](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSystem_1_1Threading/)** 
* **class [TelegramErrorHandler](/SignallingSystem-doc/mainsystem/Classes/classTelegramErrorHandler/)** 
* **class [TimerConfig](/SignallingSystem-doc/mainsystem/Classes/classTimerConfig/)** 
* **class [WestBoundComputer](/SignallingSystem-doc/mainsystem/Classes/classWestBoundComputer/)** 
* **class [WestBoundManual](/SignallingSystem-doc/mainsystem/Classes/classWestBoundManual/)** 
* **namespace [YamlDotNet::Serialization](/SignallingSystem-doc/mainsystem/Namespaces/namespaceYamlDotNet_1_1Serialization/)** 
* **namespace [YamlDotNet::Serialization::NamingConventions](/SignallingSystem-doc/mainsystem/Namespaces/namespaceYamlDotNet_1_1Serialization_1_1NamingConventions/)** 
* **namespace [utils](/SignallingSystem-doc/mainsystem/Namespaces/namespaceutils/)** 



-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
