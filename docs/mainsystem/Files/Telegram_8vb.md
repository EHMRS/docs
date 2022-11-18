---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/Telegram.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/Telegram.vb



## Types

|                | Name           |
| -------------- | -------------- |
| enum class| **[ChatGroups](/SignallingSystem-doc/mainsystem/Files/Telegram_8vb/#enum-chatgroups)** { OperationalGroup, SPADsGroup, Programmers} |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[sendMessage](/SignallingSystem-doc/mainsystem/Files/Telegram_8vb/#function-sendmessage)**(ref [ChatGroups](/SignallingSystem-doc/mainsystem/Files/Telegram_8vb/#enum-chatgroups) chatgroup, string message) |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[Net](/SignallingSystem-doc/mainsystem/Files/Telegram_8vb/#variable-net)**  |
| Module | **[TelegramMessageSender](/SignallingSystem-doc/mainsystem/Files/Telegram_8vb/#variable-telegrammessagesender)**  |

## Types Documentation

### enum ChatGroups

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| OperationalGroup | |   |
| SPADsGroup | |   |
| Programmers | |   |





## Functions Documentation

### function sendMessage

```csharp
void sendMessage(
    ref ChatGroups chatgroup,
    string message
)
```



## Attributes Documentation

### variable Net

```csharp
﻿using System. Net;
```


### variable TelegramMessageSender

```csharp
Module TelegramMessageSender;
```



## Source code

```csharp
Imports System.Net
Public Module TelegramMessageSender
    Dim httpRequest As HttpWebRequest
    Dim httpResponse As HttpWebResponse
    Enum ChatGroups
        OperationalGroup
        SPADsGroup
        Programmers
    End Enum
    Public Sub sendMessage(ByRef chatgroup As ChatGroups, message As String)
        If GlobalConfig.config.telegram.enable Then
            Try
                If chatgroup = ChatGroups.OperationalGroup Then
                    httpRequest = WebRequest.Create("https://api.telegram.org/" & GlobalConfig.config.telegram.token & "/sendMessage?chat_id=" & GlobalConfig.config.telegram.chatidoperational & "&text=" & message)
                ElseIf chatgroup = ChatGroups.SPADsGroup Then
                    httpRequest = WebRequest.Create("https://api.telegram.org/" & GlobalConfig.config.telegram.token & "/sendMessage?chat_id=" & GlobalConfig.config.telegram.chatidspads & "&text=" & message)
                Else
                    httpRequest = WebRequest.Create("https://api.telegram.org/" & GlobalConfig.config.telegram.token & "/sendMessage?chat_id=" & GlobalConfig.config.telegram.chatidsoftwarefaults & "&text=" & message)
                End If
                httpResponse = httpRequest.GetResponse()
                httpResponse.Close()
            Catch wex As WebException
                If wex.Status = WebExceptionStatus.ProtocolError Then
                    httpResponse = wex.Response
                    ''msgBox("HTTP Response Code: {0}", httpResponse.StatusCode.ToString())
                    'TelegramMessageSender.sendMessage("HTTP Response Code: {0} " & httpResponse.StatusCode.ToString())
                    httpResponse.Close()
                End If
            End Try
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
