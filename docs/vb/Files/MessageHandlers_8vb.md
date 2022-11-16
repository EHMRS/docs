---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/MessageHandlers.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/MessageHandlers.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/vb/Namespaces/namespaceSignallingMqtt/)**  |




## Source code

```csharp

Namespace SignallingMqtt
    Module MessageHandlers
        ''' <summary>
        ''' @brief Dictionary of message handlers
        ''' </summary>
        Public MessageHandlers As Dictionary(Of String, BaseMessageHandler) =
            New Dictionary(Of String, BaseMessageHandler)

        ''' <summary>
        ''' @brief Registers the handlers for various topic prefixes
        ''' </summary>
        Public Sub registerHandlers()
            MessageHandlers.Add("operator", New OperatorMessageHandler())
            MessageHandlers.Add("points", New PointMessageHandler())
            MessageHandlers.Add("sections", New TrackSectionMessageHandler())
            MessageHandlers.Add("relays", New RelayInputMessageHandler())
            MessageHandlers.Add("sensors", New SensorInputMessageHandler())
            MessageHandlers.Add("buttons", New ButtonMessageHandler())
            MessageHandlers.Add("levers", New LeverMessageHandler())
            MessageHandlers.Add("signals", New SignalMessageHandler())
        End Sub
    End Module

End Namespace
```


-------------------------------

Updated on 2022-11-15 at 15:52:06 +0000
