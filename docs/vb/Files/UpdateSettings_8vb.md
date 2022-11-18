---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/UpdateSettings.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/UpdateSettings.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| string | **[TCPUpdateSetting](/SignallingSystem-doc/vb/Files/UpdateSettings_8vb/#function-tcpupdatesetting)**(string TCPUser, string TCPPassword, string TCPDevice, string TCPDeviceSetting) |

## Attributes

|                | Name           |
| -------------- | -------------- |
| string | **[SettingPassword](/SignallingSystem-doc/vb/Files/UpdateSettings_8vb/#variable-settingpassword)**  |


## Functions Documentation

### function TCPUpdateSetting

```csharp
string TCPUpdateSetting(
    string TCPUser,
    string TCPPassword,
    string TCPDevice,
    string TCPDeviceSetting
)
```



## Attributes Documentation

### variable SettingPassword

```csharp
string SettingPassword = "9b24e5a0caf537ea6b95424e3c4b0b9b";
```



## Source code

```csharp
Module UpdateSettings
    Public SettingPassword As String = "9b24e5a0caf537ea6b95424e3c4b0b9b"
    Function TCPUpdateSetting(ByVal TCPUser As String, ByVal TCPPassword As String, ByVal TCPDevice As String, ByVal TCPDeviceSetting As String) As String
        If TCPPassword = SettingPassword Then
            'Login
            If TCPDevice = "Login" Then
                Dim task As Task(Of Integer)
                task = UserManagment.auth(TCPUser, TCPDeviceSetting)
                task.Start()
                task.Wait()


                Return task.Result
            End If
            'Log Commands
            If Not TCPDevice = "Login" Then
                'TelegramMessageSender.sendMessage("APP COMMAND LOG - " & TCPUser & " Updated " & TCPDevice & " To " & TCPDeviceSetting)
                AlarmsAndNotifications.UpdateSystemLog("APP COMMAND LOG - " & TCPUser & " Updated " & TCPDevice & " To " & TCPDeviceSetting)
            End If
            'Signals
            If TCPDevice = "AJ1E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ2E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ3E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ4E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ7E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ8E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ9E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ16E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ17E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ18E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ21E" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ3W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ7W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ8W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ9W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ15W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ16W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ17W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ18W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "AJ22W" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "S11" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.S11) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "S12" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.S12) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "S14" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.S14) = TCPDeviceSetting
                Return "Signal Updated"
            ElseIf TCPDevice = "S19" Then
                RuntimeConfig.config.SignalState(Definitions.SignalNames.S19) = TCPDeviceSetting
                Return "Signal Updated"
            End If
            'Estop Reset
            If TCPDevice = "EStopReset" Then
                Safety.EStopReset = True
                Return "Command for EStop reset has been recieved"
            End If
            'Estop
            If TCPDevice = "EStop" Then
                Safety.EStopSoftware = True
                Return "Command for EStop has been recieved"
            End If
            'Estop
            If TCPDevice = "Update" Then
                Updater.UpdateNow()
                Return "Command for Update has been recieved"
            End If
            'Audio
            If TCPDevice = "Sound1" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.TrainDepartingP1()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.DepartingP1SoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.DepartingP1SoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound2" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.TrainDepartingP2()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.DepartingP2SoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.DepartingP2SoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound3" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.TrainApprochingP1()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.ArrivingP1SoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.ArrivingP1SoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound4" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.TrainApprochingP2()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.ArrivingP2SoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.ArrivingP2SoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound5" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.TrainEnteringSiding()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.SidingSoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.SidingSoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound6" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.EventSound()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.EventSoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.EventSoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound7" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.SafetySound()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.SafetySoundEnabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.SafetySoundEnabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound8" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.AUXSound1()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.AUXSound1Enabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.AUXSound1Enabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound9" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.AUXSound2()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.AUXSound2Enabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.AUXSound2Enabled = False
                    Return "Audio Disabled"
                End If
            ElseIf TCPDevice = "Sound10" Then
                If TCPDeviceSetting = "Play" Then
                    Sound.AUXSound3()
                    Return "Audio added to queue"
                ElseIf TCPDeviceSetting = "Enable" Then
                    RuntimeConfig.config.AUXSound3Enabled = True
                    Return "Audio Enabled"
                ElseIf TCPDeviceSetting = "Disable" Then
                    RuntimeConfig.config.AUXSound3Enabled = False
                    Return "Audio Disabled"
                End If
            End If
            'System Power
            If TCPDevice = "Power" Then
                If TCPDeviceSetting = "On" Then
                    PowerState = "On"
                    Return "System Turned On"
                ElseIf TCPDeviceSetting = "System" Then
                    PowerState = "System"
                    Return "Systems power set back to default"
                ElseIf TCPDeviceSetting = "Off" Then
                    PowerState = "Off"
                    Return "System Turned Off"
                End If
            End If
            'Buttons
            If TCPDevice = "EastBound Platform 1" Then
                If TCPDeviceSetting = "Inner" Then
                    Buttons.ButtonToggle(ButtonNames.Button1) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Outer" Then
                    Buttons.ButtonToggle(ButtonNames.Button2) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "HeadShunt" Then
                    Buttons.ButtonToggle(ButtonNames.Button3) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Extension" Then
                    Buttons.ButtonToggle(ButtonNames.Button4) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Engine Shed" Then
                    Buttons.ButtonToggle(ButtonNames.Button5) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Foxhole" Then
                    Buttons.ButtonToggle(ButtonNames.Button6) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "EastBound Platform 2" Then
                If TCPDeviceSetting = "Inner" Then
                    Buttons.ButtonToggle(ButtonNames.Button10) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Outer" Then
                    Buttons.ButtonToggle(ButtonNames.Button11) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Extension" Then
                    Buttons.ButtonToggle(ButtonNames.Button12) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Engine Shed" Then
                    Buttons.ButtonToggle(ButtonNames.Button13) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Foxhole" Then
                    Buttons.ButtonToggle(ButtonNames.Button14) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "WestBound Platform 1" Then
                If TCPDeviceSetting = "Tunnel" Then
                    Buttons.ButtonToggle(ButtonNames.Button7) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Extension" Then
                    Buttons.ButtonToggle(ButtonNames.Button8) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "TurnTable" Then
                    Buttons.ButtonToggle(ButtonNames.Button9) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "WestBound Platform 2" Then
                If TCPDeviceSetting = "Tunnel" Then
                    Buttons.ButtonToggle(ButtonNames.Button7) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Extension" Then
                    Buttons.ButtonToggle(ButtonNames.Button8) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "Remote Platform 1" Then
                If TCPDeviceSetting = "TRTS" Then
                    Buttons.ButtonToggle(ButtonNames.Button17) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "Remote Platform 2" Then
                If TCPDeviceSetting = "TRTS" Then
                    Buttons.ButtonToggle(ButtonNames.Button18) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "Engine Shed" Then
                If TCPDeviceSetting = "MainLine" Then
                    Buttons.ButtonToggle(ButtonNames.Button19) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "TurnTable" Then
                If TCPDeviceSetting = "MainLine" Then
                    Buttons.ButtonToggle(ButtonNames.Button20) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "HeadShunt" Then
                If TCPDeviceSetting = "MainLine" Then
                    Buttons.ButtonToggle(ButtonNames.Button21) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "Foxhole" Then
                If TCPDeviceSetting = "MainLine" Then
                    Buttons.ButtonToggle(ButtonNames.Button22) = True
                    Return "Button Request Submitted"
                End If
            ElseIf TCPDevice = "Platform Controller" Then
                If TCPDeviceSetting = "TRTS" Then
                    Buttons.ButtonToggle(ButtonNames.Button23) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "Enable Manual" Then
                    Buttons.ButtonToggle(ButtonNames.Button25) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "P1 Approach" Then
                    Buttons.ButtonToggle(ButtonNames.Button26) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "P2 Approach" Then
                    Buttons.ButtonToggle(ButtonNames.Button27) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "AUX1" Then
                    Buttons.ButtonToggle(ButtonNames.Button28) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "AUX2" Then
                    Buttons.ButtonToggle(ButtonNames.Button29) = True
                    Return "Button Request Submitted"
                ElseIf TCPDeviceSetting = "AUX3" Then
                    Buttons.ButtonToggle(ButtonNames.Button30) = True
                    Return "Button Request Submitted"
                End If
            End If
            'Fault Report
            If TCPDevice = "FaultReport" Then
                TelegramMessageSender.sendMessage(ChatGroups.OperationalGroup, TCPUser & " has reported the following fault - " & TCPDeviceSetting)
                Return "Thanks for reporting the fault"
            End If
            'Points set output
            If TCPDevice = "P5aFeed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P5a) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P5bFeed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P5b) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P6aFeed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P6a) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P6bFeed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P6b) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P10Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P10) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P11Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P11) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P12Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P12) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P13Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P13) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P14Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P14) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P19Feed" Then
                RuntimeConfig.config.PointOutputOverrides(PointNames.P19) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            End If
            'Points set Input
            If TCPDevice = "P5aReturn" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P5a) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P5bReturn" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P5b) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P6aReturn" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P6a) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P6bReturn" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P6b) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P10Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P10) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P11Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P11) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P12Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P12) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P13Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P13) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P14Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P14) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            ElseIf TCPDevice = "P19Return" Then
                RuntimeConfig.config.PointInputOverrides(PointNames.P19) = TCPDeviceSetting
                Return (TCPDevice & " set to " & TCPDeviceSetting)
            End If
        Else
            Return "APP security key does not match"
        End If
        Return "ERROR Talk to Tom"
    End Function
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:04 +0000
