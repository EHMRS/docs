---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/AppServer.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/AppServer.vb



## Namespaces

| Name           |
| -------------- |
| **[System::Threading](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Threading/)**  |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[MyBackgroundThread](/SignallingSystem-doc/vb/Files/AppServer_8vb/#function-mybackgroundthread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[StartThreadTCP](/SignallingSystem-doc/vb/Files/AppServer_8vb/#function-startthreadtcp)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[EndThreadTCP](/SignallingSystem-doc/vb/Files/AppServer_8vb/#function-endthreadtcp)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TCPRequest](/SignallingSystem-doc/vb/Files/AppServer_8vb/#function-tcprequest)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[StopThread](/SignallingSystem-doc/vb/Files/AppServer_8vb/#function-stopthread)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System.Net. | **[Sockets](/SignallingSystem-doc/vb/Files/AppServer_8vb/#variable-sockets)**  |
| const int | **[portNumber](/SignallingSystem-doc/vb/Files/AppServer_8vb/#variable-portnumber)**  |


## Functions Documentation

### function MyBackgroundThread

```csharp
void MyBackgroundThread()
```


### function StartThreadTCP

```csharp
void StartThreadTCP()
```


### function EndThreadTCP

```csharp
void EndThreadTCP()
```


### function TCPRequest

```csharp
void TCPRequest()
```


### function StopThread

```csharp
void StopThread()
```



## Attributes Documentation

### variable Sockets

```csharp
﻿using System.Net. Sockets;
```


### variable portNumber

```csharp
static const int portNumber = 801;
```



## Source code

```csharp
Imports System.Net.Sockets
Imports System.Text
Imports System.Threading
Module AppServer
    Sub MyBackgroundThread()
        Do
            TCPRequest()
        Loop
    End Sub
    ReadOnly ThreadTCPRequest As New Thread(AddressOf MyBackgroundThread)
    Public Sub StartThreadTCP()
        ThreadTCPRequest.Start()
    End Sub
    Public Sub EndThreadTCP()
        ThreadTCPRequest.Suspend()
    End Sub
    Sub TCPRequest()
        ' Must listen on correct port- must be same as port client wants to connect on.
        Const portNumber As Integer = 801
        Dim tcpListener As New TcpListener(portNumber)
        tcpListener.Start()
        'Console.WriteLine("Waiting for connection...")
        Try
            '------Accept the pending client connection and return 
            '------a TcpClient initialized for communication. 
            Dim tcpClient As TcpClient = tcpListener.AcceptTcpClient()
            'tcpClient.ReceiveTimeout = 7200000
            'Console.WriteLine("Connection accepted.")
            '----- Get the stream
            Dim networkStream As NetworkStream = tcpClient.GetStream()
            '----- Read the stream into a byte array
            Dim bytes(tcpClient.ReceiveBufferSize) As Byte
            networkStream.Read(bytes, 0, CInt(tcpClient.ReceiveBufferSize))
            '----- Return the data received from the client to the console.
            Dim clientdata As String = Encoding.ASCII.GetString(bytes)
            'Console.WriteLine(("Client sent: " + clientdata))
            Dim UserName As String
            Dim Password As String
            Dim Device As String
            Dim DeviceState As String
            Dim EndCheck As String
            Dim split = clientdata.Split(":")
            If (split.Count = 5) Then
                UserName = split(0).ToString()
                Password = split(1).ToString()
                Device = split(2).ToString()
                DeviceState = split(3).ToString()
                EndCheck = split(4).ToString()
            End If
            Dim responseString As String = UpdateSettings.TCPUpdateSetting(UserName, Password, Device, DeviceState)
            Dim sendBytes As [Byte]() = Encoding.ASCII.GetBytes(responseString)
            networkStream.Write(sendBytes, 0, sendBytes.Length)
            'Console.WriteLine(("Message Sent /> : " + clientdata))            'responseString))
            'Any communication with the remote client using the TcpClient can go here.
            'Close TcpListener and TcpClient.
            tcpClient.Close()
            tcpListener.Stop()
            'Console.WriteLine("exit")
            'Console.ReadLine()
        Catch e As Exception
            tcpListener.Stop()
            'TelegramMessageSender.sendMessage(TelegramMessageSender.SoftwareFaults, e.ToString())
            'Console.ReadLine()
            Updater.UpdateNow()
        End Try
    End Sub

    Public Sub StopThread()
        ThreadTCPRequest.Suspend()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:06 +0000
