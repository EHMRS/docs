---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigSignals.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigSignals.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSelectedGroup](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#function-changeselectedgroup)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSignalState](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#function-changesignalstate)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateSignalInfo](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#function-updatesignalinfo)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#function-timertick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| string[] | **[EastBoundLIST](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#variable-eastboundlist)** <br>Index 0.  |
| string[] | **[WestBoundLIST](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#variable-westboundlist)** <br>Index 1.  |
| string[] | **[ShuntLIST](/SignallingSystem-doc/vb/Files/ConfigSignals_8vb/#variable-shuntlist)** <br>Index 2.  |


## Functions Documentation

### function ChangeSelectedGroup

```csharp
void ChangeSelectedGroup()
```


### function ChangeSignalState

```csharp
void ChangeSignalState(
    string UpdateToState
)
```


### function UpdateSignalInfo

```csharp
void UpdateSignalInfo()
```


### function TimerTick

```csharp
void TimerTick()
```



## Attributes Documentation

### variable EastBoundLIST

```csharp
string[] EastBoundLIST = {"AJ1E", "AJ2E", "AJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E"};
```

Index 0. 

### variable WestBoundLIST

```csharp
string[] WestBoundLIST = {"AJ3W", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W"};
```

Index 1. 

### variable ShuntLIST

```csharp
string[] ShuntLIST = {"S11", "S12", "S14", "S19"};
```

Index 2. 


## Source code

```csharp
Module ConfigSignals
    'DropDown Signal Lists                0        1       2       3       4       5       6       7         8       9        10
    Public EastBoundLIST() As String = {"AJ1E", "AJ2E", "AJ3E", "AJ4E", "AJ7E", "AJ8E", "AJ9E", "AJ16E", "AJ17E", "AJ18E", "AJ21E"} 'Index 0
    Public WestBoundLIST() As String = {"AJ3W", "AJ7W", "AJ8W", "AJ9W", "AJ15W", "AJ16W", "AJ17W", "AJ18W", "AJ22W"} 'Index 1
    Public ShuntLIST() As String = {"S11", "S12", "S14", "S19"} 'Index 2
    'Update which signal list to display
    Public Sub ChangeSelectedGroup()
        Configs.ComboBoxSignal.Items.Clear()
        Configs.ComboBoxSignal.ResetText()
        If Configs.ComboBoxSignalGroups.SelectedIndex = 0 Then
            Configs.ComboBoxSignal.Items.AddRange(EastBoundLIST)
        ElseIf Configs.ComboBoxSignalGroups.SelectedIndex = 1 Then
            Configs.ComboBoxSignal.Items.AddRange(WestBoundLIST)
        ElseIf Configs.ComboBoxSignalGroups.SelectedIndex = 2 Then
            Configs.ComboBoxSignal.Items.AddRange(ShuntLIST)
        End If
        Configs.ComboBoxSignal.DroppedDown = True
    End Sub
    'Update signal setting
    Public Sub ChangeSignalState(UpdateToState As String)
        UpdateSettings.TCPUpdateSetting(UserManagment.LoggedInUserName, UpdateSettings.SettingPassword, Configs.ComboBoxSignal.Text, UpdateToState)
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Signal " & Configs.ComboBoxSignal.Text & " To " & UpdateToState)
    End Sub
    'Update Signal Info and buttons
    Public Sub UpdateSignalInfo()
        If Configs.ComboBoxSignal.Text = "AJ1E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ1E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ1E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ1E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ1E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ1E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ1E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E)
        ElseIf Configs.ComboBoxSignal.Text = "AJ2E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ2E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ2E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ2E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ2E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ2E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ2E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ3E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ3E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ3E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ3E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ3E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ3E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ3E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ4E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ4E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ4E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ4E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ4E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ4E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ4E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ7E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ7E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ7E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ7E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ7E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ7E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ7E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ8E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ8E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ8E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ8E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ8E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ8E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ8E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ9E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ9E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ9E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ9E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ9E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ9E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ9E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ16E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ16E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ16E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ16E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ16E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ16E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ16E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ17E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ17E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ17E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ17E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ17E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ17E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ17E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ18E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ18E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ18E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ18E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ18E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ18E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ18E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ21E" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ21E))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ21E))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ21E)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ21E)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ21E)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ21E)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E)
        ElseIf Configs.ComboBoxSignal.Text = "AJ3W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ3W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ3W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ3W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ3W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ3W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ3W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ7W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ7W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ7W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ7W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ7W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ7W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ7W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ8W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ8W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ8W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ8W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ8W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ8W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ8W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ9W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ9W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ9W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ9W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ9W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ9W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ9W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ15W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ15W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ15W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ15W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ15W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ15W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ15W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W)
        ElseIf Configs.ComboBoxSignal.Text = "AJ16W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ16W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ16W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ16W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ16W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ16W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ16W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ17W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ17W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ17W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ17W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ17W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ17W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ17W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ18W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ18W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ18W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ18W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ18W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ8W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ18W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "AJ22W" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.AJ22W))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.AJ22W))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = True 'Clear
            Configs.ButtonSignalCaution.Enabled = True 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & Signals.SignalTimer(Definitions.SignalNames.AJ22W)
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & Signals.SignalTimeOut(Definitions.SignalNames.AJ22W)
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.AJ22W)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.AJ22W)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W)
        ElseIf Configs.ComboBoxSignal.Text = "S11" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.S11))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.S11))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = False 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S11)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & "NA"
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & "NA"
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.S11)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.S11)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "S12" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.S12))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.S12))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = False 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S12)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & "NA"
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & "NA"
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.S12)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.S12)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "S14" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.S14))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.S14))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = False 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S14)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & "NA"
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & "NA"
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.S14)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.S14)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        ElseIf Configs.ComboBoxSignal.Text = "S19" Then
            Configs.PaintSignalFieldState(SignalOutputState(Definitions.SignalNames.S19))
            Configs.PaintSignalLogicState(SignalSystemState(Definitions.SignalNames.S19))
            Configs.ButtonSignalSystem.Enabled = True 'System
            Configs.ButtonSignalReset.Enabled = True 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = False 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = True 'Danger
            Configs.ButtonSignalShunt.Enabled = True 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : " & RuntimeConfig.config.SignalState(Definitions.SignalNames.S19)
            Configs.LabelSignalTimer.Text = "Signal Timer : " & "NA"
            Configs.LabelSignalTimeout.Text = "Signal Timeout : " & "NA"
            Configs.LabelSPAD.Text = "Signal SPAD State : " & SPADDetection.SignalSPADAlert(SPADSignalNames.S19)
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : " & SignalSafeToClearTimer(Definitions.SignalNames.S19)
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : " & "NA"
        Else
            Configs.ButtonSignalSystem.Enabled = False 'System
            Configs.ButtonSignalReset.Enabled = False 'Reset
            Configs.ButtonSignalBypass.Enabled = False 'Bypass
            Configs.ButtonSignalClear.Enabled = False 'Clear
            Configs.ButtonSignalCaution.Enabled = False 'Caution
            Configs.ButtonSignalDanger.Enabled = False 'Danger
            Configs.ButtonSignalShunt.Enabled = False 'Shunt
            Configs.LabelSignalSetting.Text = "Signal Setting : "
            Configs.LabelSignalTimer.Text = "Signal Timer : "
            Configs.LabelSignalTimeout.Text = "Signal Timeout : "
            Configs.LabelSPAD.Text = "Signal SPAD State : "
            Configs.LabelRouteSafeToClearTimer.Text = "Route Safe To Clear Timer : "
            Configs.LabelAnnouncementDelay.Text = "Announcement Delay : "
        End If
        If Configs.LabelSignalSetting.Text = "Signal Setting : System" Or Configs.LabelSignalSetting.Text = "Signal Setting : " Then
            Configs.LabelSignalSetting.BackColor = Color.Transparent
        Else
            Configs.LabelSignalSetting.BackColor = Configs.NoneNormalSetting
        End If
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdateSignalInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:04 +0000
