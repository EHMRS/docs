---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Serial/Serial.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Serial/Serial.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[MyBackgroundThread](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-mybackgroundthread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[StartThread](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-startthread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SerialClose](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-serialclose)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SerialOpen](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-serialopen)**()<br>Try to open serial.  |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ReadInData](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-readindata)**()<br>Reading the data.  |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[Write](/SignallingSystem-doc/vb/Files/Serial_8vb/#function-write)**()<br>Writing the data.  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[Threading](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-threading)**  |
| Module | **[Serial](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serial)**  |
| bool | **[SerialConnected](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serialconnected)**  |
| long | **[SerialTime](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serialtime)**  |
| int | **[SerialCount](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serialcount)**  |
| string | **[SerialStatusText](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serialstatustext)**  |
| ReadOnly int | **[AmountDataIn](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-amountdatain)** <br>How many bytes are to be received.  |
| ReadOnly int | **[AmountDataOut](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-amountdataout)** <br>How many bytes are to be sent.  |
| int | **[AmountDatainAnalog](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-amountdatainanalog)** <br>How many bytes are to be received.  |
| int | **[TimeOutValue](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-timeoutvalue)**  |
| int[] | **[DataReadInputsArray](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-datareadinputsarray)** <br>Array of bytes what have been read.  |
| int[] | **[DataWriteOutputsOutArray](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-datawriteoutputsoutarray)** <br>Array of bytes what are to be sent.  |
| byte[] | **[DataReadInputAnalogArray](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-datareadinputanalogarray)** <br>Array of bytes what are to be read.  |
| int | **[data](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-data)**  |
| bool | **[ReadTimeout](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-readtimeout)**  |
| bool | **[WriteTimeout](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-writetimeout)**  |
| string | **[SerialStatus](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-serialstatus)**  |
| End | **[void](/SignallingSystem-doc/vb/Files/Serial_8vb/#variable-void)** <br>End sub.  |


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


### variable Serial

```csharp
Module Serial;
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


### variable AmountDataIn

```csharp
ReadOnly int AmountDataIn = 192;
```

How many bytes are to be received. 

### variable AmountDataOut

```csharp
ReadOnly int AmountDataOut = 384;
```

How many bytes are to be sent. 

### variable AmountDatainAnalog

```csharp
int AmountDatainAnalog = 128;
```

How many bytes are to be received. 

### variable TimeOutValue

```csharp
int TimeOutValue = 10000;
```


### variable DataReadInputsArray

```csharp
int[] DataReadInputsArray;
```

Array of bytes what have been read. 

### variable DataWriteOutputsOutArray

```csharp
int[] DataWriteOutputsOutArray;
```

Array of bytes what are to be sent. 

### variable DataReadInputAnalogArray

```csharp
byte[] DataReadInputAnalogArray;
```

Array of bytes what are to be read. 

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
Public Module Serial
    Public SerialConnected As Boolean = False
    Public SerialTime As Long
    Public SerialCount As Integer = 0
    Public SerialStatusText As String = "Disconnected"
    Sub MyBackgroundThread()
        Do
            Dim SerialTimerCount As Stopwatch = Stopwatch.StartNew
            If SerialPort.IsOpen = True Then
                Write()
                SerialStatusText = GlobalConfig.config.serial.port & " = Connected"
                Errors.RemoveError("Failed to start serial " & GlobalConfig.config.serial.port & " : " & GlobalConfig.config.serial.baudrate & "   -   " & SerialPort.ToString())
            Else
                SerialStatusText = GlobalConfig.config.serial.port & " = Disconnected"
                Serial.SerialOpen()
                safety.EStopReset = true
            End If
            SerialCount = SerialCount + 1
            SerialTime = (SerialTimerCount.ElapsedMilliseconds)
            'Report error
            If ReadTimeout = True Then
                Errors.NewError("Serial for Arduino has timed out.")
                safety.EStopReset = true
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
        SerialPort.Close()
        SerialConnected = False
        SerialStatusText = GlobalConfig.config.serial.port & " = Disconnected"
        ThreadSerial.Suspend()
    End Sub
    '----> CONFIG START <----'
    Public ReadOnly AmountDataIn As Integer = 192 'How many bytes are to be received. 
    Public ReadOnly AmountDataOut As Integer = 384 'How many bytes are to be sent. 
    Public AmountDatainAnalog As Integer = 128 'How many bytes are to be received. 
    Public TimeOutValue As Integer = 10000
    '----> CONFIG END <----'

    Dim WithEvents SerialPort As New IO.Ports.SerialPort 'Set up the serial port.
    Public DataReadInputsArray(AmountDataIn) As Integer 'Array of bytes what have been read.
    Public DataWriteOutputsOutArray(AmountDataOut) As Integer  'Array of bytes what are to be sent.
    Public DataReadInputAnalogArray(AmountDatainAnalog) As Byte  'Array of bytes what are to be read.
    Public data As Integer
    Public ReadTimeout As Boolean = False
    Public WriteTimeout As Boolean = False
    Public SerialStatus As String = ""
    Public Sub SerialOpen() 'Try to open serial
        If SerialPort.IsOpen = True Then
            SerialPort.Close()
        End If
        Thread.Sleep(100)
        Try 'Try statement to open the serial port with the following parts.
            SerialPort.BaudRate = GlobalConfig.config.serial.baudrate 'BaudRate.
            SerialPort.PortName = GlobalConfig.config.serial.port 'ComPort.
            SerialPort.Open() 'Open port.  
            Serial.ReadTimeout = False
            safety.EStopReset = true
        Catch 'If it fails.
            SerialPort.Close() 'Close port if failed.
            Errors.NewError("Failed to start serial " & GlobalConfig.config.serial.port & " : " & GlobalConfig.config.serial.baudrate)
            ''msgBox("Error, Could not open serial port please check device is on port " & ComPort & " : " & BaudRate) 'Display message stating that opening the port has failed.
        End Try 'End of try statement to open the serial port.
    End Sub
    Public Sub ReadInData() 'Reading the data.
        Try
            '
            SerialPort.ReadTimeout = TimeOutValue
            '
            If SerialPort.IsOpen Then 'Read the data only if the serial port is established and open.
                Safety.SafetySerialConnected = True
                SerialStatus = "Read"
                Dim DataReadIn As Integer = 1 'Keeps track of which byte it is reading.
                Do While DataReadIn <= AmountDataIn 'Loop to read all the data.
                    If DataReadIn > AmountDataIn Then 'Check if the correct amount of data has been read and end the loop if it has.
                        Exit Do 'Command to end loop.
                    End If
                    Dim DataRead As Byte = SerialPort.ReadByte 'Read the data and store the byte as "DataRead".
                    DataReadInputsArray(DataReadIn) = DataRead 'Store the data in the array using the "DataReadIn" Value.
                    DataReadIn = DataReadIn + 1 'Add a Step to the "DataReadIn" Value.
                Loop 'Loop.

                '
                Dim DataReadInAnalog As Integer = 1 'Keeps track of which byte it is reading.
                Do While DataReadInAnalog <= AmountDatainAnalog 'Loop to read all the data.
                    If DataReadInAnalog > AmountDatainAnalog Then 'Check if the correct amount of data has been read and end the loop if it has.
                        Exit Do 'Command to end loop.
                    End If
                    Dim DataReadAnalog As Byte = SerialPort.ReadByte 'Read the data and store the byte as "DataRead".
                    DataReadInputAnalogArray(DataReadInAnalog) = DataReadAnalog 'Store the data in the array using the "DataReadIn" Value.
                    DataReadInAnalog = DataReadInAnalog + 1 'Add a Step to the "DataReadIn" Value.
                Loop 'Loop.
                '
                SerialPort.DiscardInBuffer()
                ReadTimeout = False
                Safety.SafetySerialTimeout = False
            Else
                Safety.SafetySerialConnected = False
            End If
            SerialStatus = "None"
        Catch ex As TimeoutException
            'TelegramMessageSender.sendMessage(ex.ToString())
            ReadTimeout = True
            SerialStatus = "None"
            Safety.SafetySerialTimeout = True
        End Try
    End Sub 'End sub.
    Public Sub Write() 'Writing the data.
        Try
            If SerialPort.IsOpen Then 'Write the data only if the serial port is established and open.
                SerialStatus = "Write"
                Dim DataIndex As Integer = 1 'follows what point of transmission it is at.
                Do While DataIndex <= AmountDataOut 'checks which point of transmission it is at.
                    data = DataWriteOutputsOutArray(DataIndex) 'access the data from the array.
                    Try 'try to send or give error.
                        'If Not data = 1 Or data = 0 Then data = 1
                        If data = 1 Then
                            SerialPort.Write(1)
                        Else
                            SerialPort.Write(0) 'send the data.
                        End If
                    Catch ex As TimeoutException 'if error
                        TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString())
                        WriteTimeout = True
                        SerialStatus = "None"
                    End Try 'end trying to send the data.
                    DataIndex = DataIndex + 1 'increase the data index.
                Loop 'loop to keep alive the data transmission.
                SerialPort.DiscardOutBuffer()
                Serial.ReadInData() 'once all data has been sent trigger the software to read the data from the inputs.
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

Updated on 2022-11-18 at 12:39:06 +0000
