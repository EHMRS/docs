---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Sound.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/Sound.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[MyBackgroundThread](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-mybackgroundthread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[StartAudioThread](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-startaudiothread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[StopAudioThread](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-stopaudiothread)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[R1Play](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-r1play)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[R2Play](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-r2play)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[R3Play](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-r3play)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TrainDepartingP1](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-traindepartingp1)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TrainDepartingP2](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-traindepartingp2)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TrainApprochingP1](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-trainapprochingp1)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TrainApprochingP2](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-trainapprochingp2)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TrainEnteringSiding](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-trainenteringsiding)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[EventSound](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-eventsound)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SafetySound](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-safetysound)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AUXSound1](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-auxsound1)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AUXSound2](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-auxsound2)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[AUXSound3](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-auxsound3)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[CustomSound](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-customsound)**(string CustomSoundText) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[PlaySound](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-playsound)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[SecondTick](/SignallingSystem-doc/vb/Files/Sound_8vb/#function-secondtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[Threading](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-threading)**  |
| Module | **[Sound](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-sound)**  |
| bool | **[TrainDepartingP1State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-traindepartingp1state)** <br>sounds  |
| int | **[trainDepartingP1SoundNumer](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-traindepartingp1soundnumer)**  |
| bool | **[TrainDepartingP2State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-traindepartingp2state)**  |
| int | **[trainDepartingP2SoundNumer](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-traindepartingp2soundnumer)**  |
| bool | **[TrainApprochingP1State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainapprochingp1state)**  |
| int | **[TrainApprochingP1SoundNumber](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainapprochingp1soundnumber)**  |
| bool | **[TrainApprochingP2State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainapprochingp2state)**  |
| int | **[TrainApprochingP2SoundNumber](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainapprochingp2soundnumber)**  |
| bool | **[TrainEnteringSidingState](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainenteringsidingstate)**  |
| int | **[TrainEnteringSidingSoundNumber](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-trainenteringsidingsoundnumber)**  |
| bool | **[EventState](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-eventstate)**  |
| int | **[EventSoundNumber](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-eventsoundnumber)**  |
| bool | **[SafetyState](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-safetystate)**  |
| int | **[SafetySoundNumber](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-safetysoundnumber)**  |
| string | **[SoundText](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-soundtext)**  |
| int | **[Bell](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-bell)**  |
| int | **[EventSoundTrigger](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-eventsoundtrigger)**  |
| int | **[SafetySoundTrigger](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-safetysoundtrigger)**  |
| bool | **[AuxSound1State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound1state)**  |
| int | **[AuxSound1Number](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound1number)**  |
| bool | **[AuxSound2State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound2state)**  |
| int | **[AuxSound2Number](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound2number)**  |
| bool | **[AuxSound3State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound3state)**  |
| int | **[AuxSound3Number](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-auxsound3number)**  |
| string | **[CustomSoundTextToPlay](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-customsoundtexttoplay)**  |
| bool | **[CustomSoundState](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-customsoundstate)**  |
| bool | **[R1State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-r1state)**  |
| bool | **[R2State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-r2state)**  |
| bool | **[R3State](/SignallingSystem-doc/vb/Files/Sound_8vb/#variable-r3state)**  |


## Functions Documentation

### function MyBackgroundThread

```csharp
void MyBackgroundThread()
```


### function StartAudioThread

```csharp
void StartAudioThread()
```


### function StopAudioThread

```csharp
void StopAudioThread()
```


### function R1Play

```csharp
void R1Play()
```


### function R2Play

```csharp
void R2Play()
```


### function R3Play

```csharp
void R3Play()
```


### function TrainDepartingP1

```csharp
void TrainDepartingP1()
```


### function TrainDepartingP2

```csharp
void TrainDepartingP2()
```


### function TrainApprochingP1

```csharp
void TrainApprochingP1()
```


### function TrainApprochingP2

```csharp
void TrainApprochingP2()
```


### function TrainEnteringSiding

```csharp
void TrainEnteringSiding()
```


### function EventSound

```csharp
void EventSound()
```


### function SafetySound

```csharp
void SafetySound()
```


### function AUXSound1

```csharp
void AUXSound1()
```


### function AUXSound2

```csharp
void AUXSound2()
```


### function AUXSound3

```csharp
void AUXSound3()
```


### function CustomSound

```csharp
void CustomSound(
    string CustomSoundText
)
```


### function PlaySound

```csharp
void PlaySound()
```


### function SecondTick

```csharp
void SecondTick()
```



## Attributes Documentation

### variable Threading

```csharp
﻿using System. Threading;
```


### variable Sound

```csharp
Module Sound;
```


### variable TrainDepartingP1State

```csharp
bool TrainDepartingP1State;
```

sounds 

### variable trainDepartingP1SoundNumer

```csharp
int trainDepartingP1SoundNumer = 1;
```


### variable TrainDepartingP2State

```csharp
bool TrainDepartingP2State;
```


### variable trainDepartingP2SoundNumer

```csharp
int trainDepartingP2SoundNumer = 1;
```


### variable TrainApprochingP1State

```csharp
bool TrainApprochingP1State;
```


### variable TrainApprochingP1SoundNumber

```csharp
int TrainApprochingP1SoundNumber = 1;
```


### variable TrainApprochingP2State

```csharp
bool TrainApprochingP2State;
```


### variable TrainApprochingP2SoundNumber

```csharp
int TrainApprochingP2SoundNumber = 1;
```


### variable TrainEnteringSidingState

```csharp
bool TrainEnteringSidingState;
```


### variable TrainEnteringSidingSoundNumber

```csharp
int TrainEnteringSidingSoundNumber = 1;
```


### variable EventState

```csharp
bool EventState;
```


### variable EventSoundNumber

```csharp
int EventSoundNumber = 1;
```


### variable SafetyState

```csharp
bool SafetyState;
```


### variable SafetySoundNumber

```csharp
int SafetySoundNumber = 1;
```


### variable SoundText

```csharp
string SoundText = ("The current sound playing is: event " & EventSoundNumber & ".wav");
```


### variable Bell

```csharp
int Bell = 0;
```


### variable EventSoundTrigger

```csharp
int EventSoundTrigger = RuntimeConfig.config.EventLoopTime;
```


### variable SafetySoundTrigger

```csharp
int SafetySoundTrigger = RuntimeConfig.config.SafetyLoopTime;
```


### variable AuxSound1State

```csharp
bool AuxSound1State;
```


### variable AuxSound1Number

```csharp
int AuxSound1Number = 1;
```


### variable AuxSound2State

```csharp
bool AuxSound2State;
```


### variable AuxSound2Number

```csharp
int AuxSound2Number = 1;
```


### variable AuxSound3State

```csharp
bool AuxSound3State;
```


### variable AuxSound3Number

```csharp
int AuxSound3Number = 1;
```


### variable CustomSoundTextToPlay

```csharp
string CustomSoundTextToPlay;
```


### variable CustomSoundState

```csharp
bool CustomSoundState;
```


### variable R1State

```csharp
bool R1State;
```


### variable R2State

```csharp
bool R2State;
```


### variable R3State

```csharp
bool R3State;
```



## Source code

```csharp
Imports System.Threading

Public Module Sound
    Public TrainDepartingP1State As Boolean ' sounds
    Public trainDepartingP1SoundNumer As Integer = 1
    Public TrainDepartingP2State As Boolean
    Public trainDepartingP2SoundNumer As Integer = 1
    Public TrainApprochingP1State As Boolean
    Public TrainApprochingP1SoundNumber As Integer = 1
    Public TrainApprochingP2State As Boolean
    Public TrainApprochingP2SoundNumber As Integer = 1
    Public TrainEnteringSidingState As Boolean
    Public TrainEnteringSidingSoundNumber As Integer = 1
    Public EventState As Boolean
    Public EventSoundNumber As Integer = 1
    Public SafetyState As Boolean
    Public SafetySoundNumber As Integer = 1
    Public SoundText As String
    Public Bell As Integer = 0
    Public EventSoundTrigger As Integer = RuntimeConfig.config.EventLoopTime
    Public SafetySoundTrigger As Integer = RuntimeConfig.config.SafetyLoopTime
    Public AuxSound1State As Boolean
    Public AuxSound1Number As Integer = 1
    Public AuxSound2State As Boolean
    Public AuxSound2Number As Integer = 1
    Public AuxSound3State As Boolean
    Public AuxSound3Number As Integer = 1
    Public CustomSoundTextToPlay As String
    Public CustomSoundState As Boolean
    'Remeberance 
    Public R1State As Boolean
    Public R2State As Boolean
    Public R3State As Boolean

    Sub MyBackgroundThread()
        Do
            PlaySound()
        Loop
    End Sub
    Dim ThreadAudio As New Thread(AddressOf MyBackgroundThread)
    Public Sub StartAudioThread()
        ThreadAudio.Start()
    End Sub
    Public Sub StopAudioThread()
        'ThreadAudio.Suspend()
    End Sub
    Public Sub R1Play()
        If R1State = False Then
            R1State = True
        End If
    End Sub
    Public Sub R2Play()
        If R2State = False Then
            R2State = True
        End If
    End Sub
    Public Sub R3Play()
        If R3State = False Then
            R3State = True
        End If
    End Sub
    Public Sub TrainDepartingP1()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.DepartingP1SoundEnabled = True And AllowAudio Then
                If TrainDepartingP1State = False Then
                    TrainDepartingP1State = True
                End If
            End If
        Else
            TrainDepartingP1State = False
        End If
    End Sub
    Public Sub TrainDepartingP2()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.DepartingP2SoundEnabled = True And AllowAudio Then
                If TrainDepartingP2State = False Then
                    TrainDepartingP2State = True
                End If
            End If
        Else
            TrainDepartingP2State = False
        End If
    End Sub
    Public Sub TrainApprochingP1()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.ArrivingP1SoundEnabled = True And AllowAudio Then
                If TrainApprochingP1State = False Then
                    TrainApprochingP1State = True
                End If
            End If
        Else
            TrainApprochingP1State = False
        End If
    End Sub
    Public Sub TrainApprochingP2()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.ArrivingP2SoundEnabled = True And AllowAudio Then
                If TrainApprochingP2State = False Then
                    TrainApprochingP2State = True
                End If
            End If
        Else
            TrainApprochingP2State = False
        End If
    End Sub
    Public Sub TrainEnteringSiding()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.SidingSoundEnabled = True And AllowAudio Then
                If TrainEnteringSidingState = False Then
                    TrainEnteringSidingState = True
                End If
            End If
        Else
            TrainEnteringSidingState = False
        End If
    End Sub
    Public Sub EventSound()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.EventSoundEnabled = True And AllowAudio Then
                If EventState = False Then
                    EventState = True
                End If
            End If
        Else
            EventState = False
        End If
    End Sub
    Public Sub SafetySound()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.SafetySoundEnabled = True And AllowAudio Then
                If SafetyState = False Then
                    SafetyState = True
                End If
            End If
        Else
            SafetyState = False
        End If
    End Sub
    Public Sub AUXSound1()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.AUXSound1Enabled = True And AllowAudio Then
                If AuxSound1State = False Then
                    AuxSound1State = True
                End If
            End If
        Else
            AuxSound1State = False
        End If
    End Sub
    Public Sub AUXSound2()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.AUXSound2Enabled = True And AllowAudio Then
                If AuxSound2State = False Then
                    AuxSound2State = True
                End If
            End If
        Else
            AuxSound2State = False
        End If
    End Sub
    Public Sub AUXSound3()
        If Initializations.SoundInitiated = True Then
            If RuntimeConfig.config.AUXSound3Enabled = True And AllowAudio Then
                If AuxSound3State = False Then
                    AuxSound3State = True
                End If
            End If
        Else
            AuxSound3State = False
        End If
    End Sub
    Public Sub CustomSound(CustomSoundText As String)
        CustomSoundTextToPlay = CustomSoundText
        If Initializations.SoundInitiated = True Then
            If CustomSoundState = False Then
                CustomSoundState = True
            End If
        Else
            CustomSoundState = False
        End If
    End Sub
    Public Sub PlaySound()
        Buttons.ButtonFlash(ButtonNames.Button28) = True
        Buttons.ButtonFlash(ButtonNames.Button29) = True
        Buttons.ButtonFlash(ButtonNames.Button30) = True
        'Train Departing P1
        If TrainDepartingP1State = True Then
            If trainDepartingP1SoundNumer = RuntimeConfig.config.DepartingP1AmountOfClips + 1 Then
                trainDepartingP1SoundNumer = 1
            End If
            SoundText = ("The current sound playing is: P1 Departing " & trainDepartingP1SoundNumer & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "P1Departing" & trainDepartingP1SoundNumer & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - train departing platform 1 sound file " & trainDepartingP1SoundNumer)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            trainDepartingP1SoundNumer = trainDepartingP1SoundNumer + 1
            TrainDepartingP1State = False
            Thread.Sleep(ThreadSleepTime)
            'Train Departing P2
        ElseIf TrainDepartingP2State = True Then
            If trainDepartingP2SoundNumer = RuntimeConfig.config.DepartingP2AmountOfClips + 1 Then
                trainDepartingP2SoundNumer = 1
            End If
            SoundText = ("The current sound playing is: P2 Departing " & trainDepartingP2SoundNumer & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "P2Departing" & trainDepartingP2SoundNumer & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - train departing platform 2 sound file " & trainDepartingP2SoundNumer)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            trainDepartingP2SoundNumer = trainDepartingP2SoundNumer + 1
            TrainDepartingP2State = False
            Thread.Sleep(ThreadSleepTime)
            'Train Approaching P1
        ElseIf TrainApprochingP1State = True Then
            If TrainApprochingP1SoundNumber = RuntimeConfig.config.ArrivingP1AmountOfClips + 1 Then
                TrainApprochingP1SoundNumber = 1
            End If
            SoundText = ("The current sound playing Is P1 Approaching " & TrainApprochingP1SoundNumber & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "P1Approaching" & TrainApprochingP1SoundNumber & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - train approching platform 1 sound file " & TrainApprochingP1SoundNumber)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            TrainApprochingP1SoundNumber = TrainApprochingP1SoundNumber + 1
            TrainApprochingP1State = False
            Thread.Sleep(ThreadSleepTime)
            'Train Approaching P2
        ElseIf TrainApprochingP2State = True Then
            If TrainApprochingP2SoundNumber = RuntimeConfig.config.ArrivingP2AmountOfClips + 1 Then
                TrainApprochingP2SoundNumber = 1
            End If
            SoundText = ("The current sound playing is: P2 Approaching " & TrainApprochingP2SoundNumber & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "P2Approaching" & TrainApprochingP2SoundNumber & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - train approching platform 2 sound file " & TrainApprochingP2SoundNumber)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            TrainApprochingP2SoundNumber = TrainApprochingP2SoundNumber + 1
            TrainApprochingP2State = False
            Thread.Sleep(ThreadSleepTime)
            'Train Entering Siding
        ElseIf TrainEnteringSidingState = True Then
            If TrainEnteringSidingSoundNumber = RuntimeConfig.config.SidingAmountOfClips + 1 Then
                TrainEnteringSidingSoundNumber = 1
            End If
            SoundText = ("The current sound playing Is EnteringSiding" & TrainEnteringSidingSoundNumber & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "TrainMovingIntoSiding" & TrainEnteringSidingSoundNumber & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - train entering siding sound file " & TrainEnteringSidingSoundNumber)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            TrainEnteringSidingSoundNumber = TrainEnteringSidingSoundNumber + 1
            TrainEnteringSidingState = False
            Thread.Sleep(ThreadSleepTime)
            'Event
        ElseIf EventState = True Then
            If EventSoundNumber = RuntimeConfig.config.EventAmountOfClips + 1 Then
                EventSoundNumber = 1
            End If
            SoundText = ("The current sound playing is: Event " & EventSoundNumber & ".wav")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "Event" & EventSoundNumber & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - event sound file " & EventSoundNumber)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            EventSoundNumber = EventSoundNumber + 1
            EventState = False
            Thread.Sleep(ThreadSleepTime)
            'Safety
        ElseIf SafetyState = True Then
            If SafetySoundNumber = RuntimeConfig.config.SafetyAmountOfClips + 1 Then
                SafetySoundNumber = 1
            End If
            SoundText = ("The current sound playing Is Safety " & SafetySoundNumber & ".wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "Safety" & SafetySoundNumber & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - safety sound file " & SafetySoundNumber)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            SafetySoundNumber = SafetySoundNumber + 1
            SafetyState = False
            Thread.Sleep(ThreadSleepTime)
            'AUXSound1
        ElseIf AuxSound1State = True Then
            Buttons.ButtonFlash(ButtonNames.Button28) = False
            If AuxSound1Number = RuntimeConfig.config.AUXSound1OfClips + 1 Then
                AuxSound1Number = 1
            End If
            SoundText = ("The current sound playing Is AUX Sound 1 - " & AuxSound1Number & ".wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "AUX1" & AuxSound1Number & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - AUX 1 sound file " & AuxSound1Number)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            AuxSound1Number = AuxSound1Number + 1
            AuxSound1State = False
            Buttons.ButtonRequest(ButtonNames.Button28) = False
            Thread.Sleep(ThreadSleepTime)
            'AUXSound2
        ElseIf AuxSound2State = True Then
            Buttons.ButtonFlash(ButtonNames.Button29) = False
            If AuxSound2Number = RuntimeConfig.config.AUXSound2OfClips + 1 Then
                AuxSound2Number = 1
            End If
            SoundText = ("The current sound playing Is AUX Sound 2 - " & AuxSound2Number & ".wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "AUX2" & AuxSound2Number & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - AUX 2 sound file " & AuxSound2Number)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            AuxSound2Number = AuxSound2Number + 1
            AuxSound2State = False
            Buttons.ButtonRequest(ButtonNames.Button29) = False
            Thread.Sleep(ThreadSleepTime)
            'AUXSound3
        ElseIf AuxSound3State = True Then
            Buttons.ButtonFlash(ButtonNames.Button30) = False
            If AuxSound3Number = RuntimeConfig.config.AUXSound3OfClips + 1 Then
                AuxSound3Number = 1
            End If
            SoundText = ("The current sound playing Is AUX Sound 3 - " & AuxSound3Number & ".wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "AUX3" & AuxSound3Number & ".wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - AUX 3 sound file " & AuxSound3Number)
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            AuxSound3Number = AuxSound3Number + 1
            AuxSound3State = False
            Buttons.ButtonRequest(ButtonNames.Button30) = False
            Thread.Sleep(ThreadSleepTime)
            'R1
        ElseIf R1State = True Then
            SoundText = ("The current sound playing Is R1.wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "R1.wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - R1")
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            R1State = False
            Thread.Sleep(ThreadSleepTime)
            'R2
        ElseIf R2State = True Then
            SoundText = ("The current sound playing Is R2.wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "R2.wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - R2")
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            R2State = False
            Thread.Sleep(ThreadSleepTime)
            'R3
        ElseIf R3State = True Then
            SoundText = ("The current sound playing Is R3.wav ")
            Try
                My.Computer.Audio.Play(Main.SoundFile & "R3.wav", AudioPlayMode.WaitToComplete)
            Catch ex As Exception
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, "Error playing audio - R3")
                TelegramMessageSender.sendMessage(ChatGroups.Programmers, ex.ToString)
            End Try
            R3State = False
            Thread.Sleep(ThreadSleepTime)
            'Custom Sound
        ElseIf CustomSoundState = True Then
            SoundText = ("The current sound playing Is a custom sound - " & CustomSoundTextToPlay)
            Dim SAPI
            SAPI = CreateObject("SAPI.spvoice")
            SAPI.Volume = 100
            SAPI.rate = 0.5
            SAPI.Speak(CustomSoundTextToPlay)
            CustomSoundState = False
            CustomSoundTextToPlay = ""
            Thread.Sleep(ThreadSleepTime)
        End If
        SoundText = ("")
    End Sub
    'Second timer countdown
    Public Sub SecondTick()
        'Event sound cycle
        If Not EventSoundTrigger = 0 Then
            EventSoundTrigger -= 1
        Else
            EventSound()
            EventSoundTrigger = RuntimeConfig.config.EventLoopTime
        End If
        'Safety sound cycle
        If Not SafetySoundTrigger = 0 Then
            SafetySoundTrigger -= 1
        Else
            SafetySound()
            SafetySoundTrigger = RuntimeConfig.config.SafetyLoopTime
        End If
        'Bell
        If RuntimeConfig.config.BellEnabled = True Then
            If Not Bell = 0 Then
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressBell) = 1
                Bell -= 1
            Else
                Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressBell) = 0
            End If
        Else
            Serial.DataWriteOutputsOutArray(DigitalDeviceAddress.OutputAddressBell) = 0
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:05 +0000
