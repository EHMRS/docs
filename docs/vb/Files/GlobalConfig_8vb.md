---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/GlobalConfig.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/GlobalConfig.vb



## Namespaces

| Name           |
| -------------- |
| **[YamlDotNet::Serialization::NamingConventions](/SignallingSystem-doc/vb/Namespaces/namespaceYamlDotNet_1_1Serialization_1_1NamingConventions/)**  |
| **[System::IO](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1IO/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[GlobalConfigObj](/SignallingSystem-doc/vb/Classes/classGlobalConfigObj/)**  |
| class | **[SerialConfig](/SignallingSystem-doc/vb/Classes/classSerialConfig/)**  |
| class | **[OutputConfig](/SignallingSystem-doc/vb/Classes/classOutputConfig/)**  |
| class | **[TelegramErrorHandler](/SignallingSystem-doc/vb/Classes/classTelegramErrorHandler/)**  |
| class | **[TimerConfig](/SignallingSystem-doc/vb/Classes/classTimerConfig/)**  |
| class | **[MqttConfig](/SignallingSystem-doc/vb/Classes/classMqttConfig/)**  |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[loadConfig](/SignallingSystem-doc/vb/Files/GlobalConfig_8vb/#function-loadconfig)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using YamlDotNet. | **[Serialization](/SignallingSystem-doc/vb/Files/GlobalConfig_8vb/#variable-serialization)**  |
| [GlobalConfigObj](/SignallingSystem-doc/vb/Classes/classGlobalConfigObj/) | **[config](/SignallingSystem-doc/vb/Files/GlobalConfig_8vb/#variable-config)**  |


## Functions Documentation

### function loadConfig

```csharp
void loadConfig()
```



## Attributes Documentation

### variable Serialization

```csharp
﻿using YamlDotNet. Serialization;
```


### variable config

```csharp
GlobalConfigObj config;
```



## Source code

```csharp
Imports YamlDotNet.Serialization
Imports YamlDotNet.Serialization.NamingConventions
Imports System.IO

Module GlobalConfig

    Public config As GlobalConfigObj

    Sub loadConfig()
        Dim deserializer As New Deserializer()
        Using reader As New StreamReader("C:\SignallingSystem\Signalling.yml")
            config = deserializer.Deserialize(Of GlobalConfigObj)(reader)
        End Using
        If Not config.mqttPrefix.Substring(config.mqttPrefix.Length - 1) = "/" Then
            config.mqttPrefix = config.mqttPrefix + "/"
        End If
    End Sub
End Module

Class GlobalConfigObj
    Public serial As SerialConfig
    Public jsonoutput As OutputConfig
    Public telegram As TelegramErrorHandler
    Public timers As TimerConfig
    Public mqtt As MqttConfig
    Public MediaPath As String
    Public LogPath As String
    Public RuntimePath As String
    Public FrameLights As Boolean
    Public mqttPrefix As String = "signalling"
End Class

Class SerialConfig
    Public port As String
    Public baudrate As String
End Class

Class OutputConfig
    Public enable As Boolean
    Public path As String
    Public filename As String
End Class

Class TelegramErrorHandler
    Public enable As Boolean
    Public token As String
    Public chatidoperational As String
    Public chatidsoftwarefaults As String
    Public chatidspads As String
End Class

Class TimerConfig
    Public route As Integer = 90 ' Amount of time a route is held before timing out
    Public sectionError As Integer = 3 ' Time value for train appearing right before signal
    Public backlock As Integer = 90 ' Time which the signal locks its route until either released or timed out.
    Public pointNoReturn As Integer = 10 ' Time which it takes for points to declare no return
    Public pointNotChanging As Integer = 10 ' Time which it takes for points to declare not changing
End Class

Class MqttConfig
    Public host As String
    Public port As Integer
    Public username As String
    Public password As String
End Class
```


-------------------------------

Updated on 2022-11-18 at 12:39:04 +0000
