---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/OperatorMessageHandler.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Mqtt/OperatorMessageHandler.vb



## Namespaces

| Name           |
| -------------- |
| **[SignallingMqtt](/SignallingSystem-doc/mainsystem/Namespaces/namespaceSignallingMqtt/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[SignallingMqtt::OperatorMessageHandler](/SignallingSystem-doc/mainsystem/Classes/classSignallingMqtt_1_1OperatorMessageHandler/)** <br>Operator message handling class - handles operator log in and out  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using Newtonsoft.Json. | **[JsonConvert](/SignallingSystem-doc/mainsystem/Files/OperatorMessageHandler_8vb/#variable-jsonconvert)**  |



## Attributes Documentation

### variable JsonConvert

```csharp
﻿using Newtonsoft.Json. JsonConvert;
```



## Source code

```csharp
Imports Newtonsoft.Json.JsonConvert

Namespace SignallingMqtt
    ''' <summary>
    ''' Operator message handling class - handles operator log in and out
    ''' </summary>
    Public Class OperatorMessageHandler
        Inherits BaseMessageHandler

        ''' <summary>
        ''' Private instance of message class
        ''' </summary>
        Private msg As OperatorMessage

        ''' <summary>
        ''' Operator Login/logout message created by the Card Swipe 
        ''' system
        ''' </summary>

        Private Class OperatorMessage
            ''' <summary>
            ''' The name of the person logging in
            ''' </summary>
            Public name As String
        End Class

        ''' <summary>
        ''' Handle the message
        ''' </summary>
        Public Overrides Sub handle()
            Me.msg =
                DeserializeObject(Of OperatorMessage)(Me.getMessagePayload())
            If Me.getTopic() = "login" Then
                Me.login()
            End If
            If Me.getTopic() = "logout" Then
                Me.logout()
            End If
        End Sub

        ''' <summary>
        ''' Perform a login
        ''' </summary>
        Private Sub login()
            UserManagment.loginOperator(Me.msg.name)
        End Sub

        ''' <summary>
        ''' Perform a logout
        ''' </summary>
        Private Sub logout()
            UserManagment.logoutOperator()
        End Sub
    End Class

End Namespace
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
