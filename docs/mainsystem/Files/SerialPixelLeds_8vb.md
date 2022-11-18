---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Serial/SerialPixelLeds.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Serial/SerialPixelLeds.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[MyBackgroundThread](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-mybackgroundthread)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[StartThread](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-startthread)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[SerialClose](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-serialclose)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[SerialOpen](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-serialopen)**()<br>Try to open serial.  |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[ReadInData](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-readindata)**()<br>Reading the data.  |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Write](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#function-write)**()<br>Writing the data.  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[Threading](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-threading)**  |
| bool | **[SerialConnected](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialconnected)**  |
| long | **[SerialTime](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialtime)**  |
| int | **[SerialCount](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialcount)**  |
| string | **[SerialStatusText](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialstatustext)**  |
| string | **[SerialPortNumber](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialportnumber)**  |
| int | **[SerialSpeed](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialspeed)**  |
| ReadOnly int | **[AmountDataIn](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-amountdatain)** <br>How many bytes are to be received.  |
| ReadOnly int | **[PixelQuanitiy](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-pixelquanitiy)**  |
| int | **[TimeOutValue](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-timeoutvalue)**  |
| int[] | **[pixelRed](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-pixelred)**  |
| int[] | **[pixelGreen](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-pixelgreen)**  |
| int[] | **[pixelBlue](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-pixelblue)**  |
| int[] | **[pixelWhite](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-pixelwhite)**  |
| int | **[data](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-data)**  |
| bool | **[ReadTimeout](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-readtimeout)**  |
| bool | **[WriteTimeout](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-writetimeout)**  |
| string | **[SerialStatus](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-serialstatus)**  |
| End | **[void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void)** <br>End sub.  |


## Functions Documentation

### function MyBackgroundThread

```csharp
void MyBackgroundThread()
```


### function StartThread

```csharp
void StartThread()
```


### function SerialClose

```csharp
void SerialClose()
```


### function SerialOpen

```csharp
void SerialOpen()
```

Try to open serial. 

### function ReadInData

```csharp
void ReadInData()
```

Reading the data. 

### function Write

```csharp
void Write()
```

Writing the data. 


## Attributes Documentation

### variable Threading

```csharp
﻿using System. Threading;
```


### variable SerialConnected

```csharp
bool SerialConnected = False;
```


### variable SerialTime

```csharp
long SerialTime;
```


### variable SerialCount

```csharp
int SerialCount = 0;
```


### variable SerialStatusText

```csharp
string SerialStatusText = "Disconnected";
```


### variable SerialPortNumber

```csharp
string SerialPortNumber = "COM200";
```


### variable SerialSpeed

```csharp
int SerialSpeed = 9600;
```


### variable AmountDataIn

```csharp
ReadOnly int AmountDataIn = 1;
```

How many bytes are to be received. 

### variable PixelQuanitiy

```csharp
ReadOnly int PixelQuanitiy = 48;
```


### variable TimeOutValue

```csharp
int TimeOutValue = 8000;
```


### variable pixelRed

```csharp
int[] pixelRed = {255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0};
```


### variable pixelGreen

```csharp
int[] pixelGreen = {0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0};
```


### variable pixelBlue

```csharp
int[] pixelBlue = {0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0};
```


### variable pixelWhite

```csharp
int[] pixelWhite = {0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255};
```


### variable data

```csharp
int data;
```


### variable ReadTimeout

```csharp
bool ReadTimeout = False;
```


### variable WriteTimeout

```csharp
bool WriteTimeout = False;
```


### variable SerialStatus

```csharp
string SerialStatus = "";
```


### variable void

```csharp
End void;
```

End sub. 

end sub 



## Source code

```csharp
Imports System.Threading
Module SerialPixelLeds
    Public SerialConnected As Boolean = False
    Public SerialTime As Long
    Public SerialCount As Integer = 0
    Public SerialStatusText As String = "Disconnected"

    Public SerialPortNumber As String = "COM200"
    Public SerialSpeed As Integer = 9600
    Sub MyBackgroundThread()
        Do
            Dim SerialTimerCount As Stopwatch = Stopwatch.StartNew
            If PixelSerialPort.IsOpen = True Then
                Write()
                SerialStatusText = SerialPortNumber & " = Connected"
                Errors.RemoveError("Failed to start serial " & SerialPortNumber & " : " & SerialSpeed & "   -   " & PixelSerialPort.ToString())
            Else
                SerialStatusText = SerialPortNumber & " = Disconnected"
                SerialPixelLeds.SerialOpen()
            End If
            SerialCount = SerialCount + 1
            SerialTime = (SerialTimerCount.ElapsedMilliseconds)
            'Report error
            If ReadTimeout = True Then
                Errors.NewError("Serial for Arduino has timed out.")
            Else
                Errors.RemoveError("Serial for Arduino has timed out.")
            End If
        Loop
    End Sub
    Dim ThreadSerial As New Thread(AddressOf MyBackgroundThread)
    Public Sub StartThread()
        ThreadSerial.Start()
    End Sub
    Public Sub SerialClose()
        PixelSerialPort.Close()
        SerialConnected = False
        SerialStatusText = SerialPortNumber & " = Disconnected"
        ThreadSerial.Suspend()
    End Sub
    '----> CONFIG START <----'
    Public ReadOnly AmountDataIn As Integer = 1 'How many bytes are to be received. 
    Public ReadOnly PixelQuanitiy As Integer = 48
    Public TimeOutValue As Integer = 8000
    '----> CONFIG END <----'

    Dim WithEvents PixelSerialPort As New IO.Ports.SerialPort 'Set up the serial port.
    Public pixelRed() As Integer = {255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0}
    Public pixelGreen() As Integer = {0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0}
    Public pixelBlue() As Integer = {0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0}
    Public pixelWhite() As Integer = {0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255}

    Public data As Integer
    Public ReadTimeout As Boolean = False
    Public WriteTimeout As Boolean = False
    Public SerialStatus As String = ""
    Public Sub SerialOpen() 'Try to open serial
        If PixelSerialPort.IsOpen = True Then
            PixelSerialPort.Close()
        End If
        Thread.Sleep(100)
        Try 'Try statement to open the serial port with the following parts.
            PixelSerialPort.BaudRate = SerialSpeed 'BaudRate.
            PixelSerialPort.PortName = SerialPortNumber 'ComPort.
            PixelSerialPort.Open() 'Open port.
            ReadTimeout = False
        Catch 'If it fails.
            PixelSerialPort.Close() 'Close port if failed.
            Errors.NewError("Failed to start serial " & SerialPortNumber & " : " & SerialSpeed)
            'MsgBox("Error, Could not open serial port please check device is on port " & SerialPortNumber & " : " & SerialSpeed) 'Display message stating that opening the port has failed.
        End Try 'End of try statement to open the serial port.
    End Sub
    Public Sub ReadInData() 'Reading the data.
        Try
            '
            PixelSerialPort.ReadTimeout = TimeOutValue
            '
            If PixelSerialPort.IsOpen Then 'Read the data only if the serial port is established and open.
                SerialStatus = "Read"
                Dim DataRead As Byte = PixelSerialPort.ReadByte 'Read the data and store the byte as "DataRead".
                ReadTimeout = False
            End If
            SerialStatus = "None"
        Catch ex As TimeoutException
            'TelegramMessageSender.sendMessage(ex.ToString())
            ReadTimeout = True
            SerialStatus = "None"
        End Try
    End Sub 'End sub.
    Public Sub Write() 'Writing the data.
        Try
            If PixelSerialPort.IsOpen Then 'Write the data only if the serial port is established and open.
                SerialStatus = "Write"
                Dim DataIndex As Integer = 0 'follows what point of transmission it is at.
                Do While DataIndex <= PixelQuanitiy - 1 'checks which point of transmission it is at.
                    Try 'try to send or give error.
                        PixelSerialPort.WriteLine(DataIndex + 1)
                        PixelSerialPort.WriteLine(pixelRed(DataIndex))
                        PixelSerialPort.WriteLine(pixelGreen(DataIndex))
                        PixelSerialPort.WriteLine(pixelBlue(DataIndex))
                        PixelSerialPort.WriteLine(pixelWhite(DataIndex))
                        'Thread.Sleep(10)
                    Catch ex As TimeoutException 'if error
                        TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString())
                        WriteTimeout = True
                        SerialStatus = "None"
                    End Try 'end trying to send the data.
                    DataIndex += 1 'increase the data index.
                Loop 'loop to keep alive the data transmission.
                PixelSerialPort.DiscardOutBuffer()
                'ReadInData() 'once all data has been sent trigger the software to read the data from the inputs.
            End If
            SerialStatus = "None"
        Catch ex As TimeoutException
            'TelegramMessageSender.sendMessage(ex.ToString())
            WriteTimeout = True
            SerialStatus = "None"
        End Try
    End Sub 'end sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
