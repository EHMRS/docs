---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigPower.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigPower.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSystemmPowerState](/SignallingSystem-doc/vb/Files/ConfigPower_8vb/#function-changesystemmpowerstate)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSystemmLogicState](/SignallingSystem-doc/vb/Files/ConfigPower_8vb/#function-changesystemmlogicstate)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdatePowerInfo](/SignallingSystem-doc/vb/Files/ConfigPower_8vb/#function-updatepowerinfo)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/vb/Files/ConfigPower_8vb/#function-timertick)**() |


## Functions Documentation

### function ChangeSystemmPowerState

```csharp
void ChangeSystemmPowerState(
    string UpdateToState
)
```


### function ChangeSystemmLogicState

```csharp
void ChangeSystemmLogicState(
    string UpdateToState
)
```


### function UpdatePowerInfo

```csharp
void UpdatePowerInfo()
```


### function TimerTick

```csharp
void TimerTick()
```




## Source code

```csharp
Module ConfigPower
    'Update signal setting
    Public Sub ChangeSystemmPowerState(UpdateToState As String)
        Power.PowerState = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated System Power to " & UpdateToState)
    End Sub
    Public Sub ChangeSystemmLogicState(UpdateToState As String)
        RuntimeConfig.config.Mode = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated System Logic to " & UpdateToState)
    End Sub
    'Update Power Info
    Public Sub UpdatePowerInfo()
        If Safety.EStopTriggered = True Then
            Configs.LabelEstopStatus.Text = "Status : Triggered!"
            Configs.LabelEstopStatus.BackColor = Configs.OffState
        Else
            Configs.LabelEstopStatus.Text = "Status : Normal"
            Configs.LabelEstopStatus.BackColor = Color.Transparent
        End If
        If Power.FrameDisplayPower = True Then
            Configs.LabelPowerFramePower.Text = "Frame Power : On"
            Configs.LabelPowerFramePower.BackColor = Configs.OnState
        Else
            Configs.LabelPowerFramePower.Text = "Frame Power : Off"
            Configs.LabelPowerFramePower.BackColor = Configs.OffState
        End If
        If Power.PointSupplyPower = True Then
            Configs.LabelPowerPointPower.Text = "Point Power : On"
            Configs.LabelPowerPointPower.BackColor = Configs.OnState
        Else
            Configs.LabelPowerPointPower.Text = "Point Power : Off"
            Configs.LabelPowerPointPower.BackColor = Configs.OffState
        End If
        If Power.SignalAspectPower = True Then
            Configs.LabelPowerSignalPower.Text = "Signal Power : On"
            Configs.LabelPowerSignalPower.BackColor = Configs.OnState
        Else
            Configs.LabelPowerSignalPower.Text = "Signal Power : Off"
            Configs.LabelPowerSignalPower.BackColor = Configs.OffState
        End If
        If Power.MimicDisplayPower = True Then
            Configs.LabelPowerMimicPower.Text = "Mimic Power : On"
            Configs.LabelPowerMimicPower.BackColor = Configs.OnState
        Else
            Configs.LabelPowerMimicPower.Text = "Mimic Power : Off"
            Configs.LabelPowerMimicPower.BackColor = Configs.OffState
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressAUXContactorDetection) = 1 Then
            Configs.LabelPowerAUXContactorState.Text = "AUX Contactor State : Closed"
            Configs.LabelPowerAUXContactorState.BackColor = Configs.OnState
        Else
            Configs.LabelPowerAUXContactorState.Text = "AUX Contactor State : Open"
            Configs.LabelPowerAUXContactorState.BackColor = Configs.OffState
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressACMonitor) = 1 Then
            Configs.LabelPowerACPowerState.Text = "AC Power State : On"
            Configs.LabelPowerACPowerState.BackColor = Configs.OnState
        Else
            Configs.LabelPowerACPowerState.Text = "AC Power State : Off"
            Configs.LabelPowerACPowerState.BackColor = Configs.OffState
        End If
        If PowerState = "System" Then
            Configs.LabelPowerSystemState.Text = "System State : " & PowerState
            Configs.LabelPowerSystemState.BackColor = Color.Transparent
        Else
            Configs.LabelPowerSystemState.Text = "System State : " & PowerState
            Configs.LabelPowerSystemState.BackColor = Configs.WarningSetting
        End If
        Configs.LabelPowerLogicState.Text = RuntimeConfig.config.Mode
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdatePowerInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
