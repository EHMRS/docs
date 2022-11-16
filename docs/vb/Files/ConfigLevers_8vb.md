---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigLevers.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigLevers.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeleverOutput](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#function-changeleveroutput)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeleverInput](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#function-changeleverinput)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeleverAutoRestroke](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#function-changeleverautorestroke)**(bool UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateleverInfo](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#function-updateleverinfo)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#function-timertick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| bool[] | **[LeverHasRestrokeSetting](/SignallingSystem-doc/vb/Files/ConfigLevers_8vb/#variable-leverhasrestrokesetting)**  |


## Functions Documentation

### function ChangeleverOutput

```csharp
void ChangeleverOutput(
    string UpdateToState
)
```


### function ChangeleverInput

```csharp
void ChangeleverInput(
    string UpdateToState
)
```


### function ChangeleverAutoRestroke

```csharp
void ChangeleverAutoRestroke(
    bool UpdateToState
)
```


### function UpdateleverInfo

```csharp
void UpdateleverInfo()
```


### function TimerTick

```csharp
void TimerTick()
```



## Attributes Documentation

### variable LeverHasRestrokeSetting

```csharp
bool[] LeverHasRestrokeSetting = {True, True, True, True, False, False, True, True, True, False, False, False, False, False, True, True, True, True, False, False, True, True, False, False};
```



## Source code

```csharp
Module Configlevers
    'Update signal setting
    Public Sub ChangeleverOutput(UpdateToState As String)
        RuntimeConfig.config.LeverLock(Configs.ComboBoxLever.SelectedIndex) = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated lever OutPut " & Configs.ComboBoxLever.Text & " To " & UpdateToState)
    End Sub
    Public Sub ChangeleverInput(UpdateToState As String)
        RuntimeConfig.config.LeverState(Configs.ComboBoxLever.SelectedIndex) = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated lever InPut " & Configs.ComboBoxLever.Text & " To " & UpdateToState)
    End Sub
    Public Sub ChangeleverAutoRestroke(UpdateToState As Boolean)
        RuntimeConfig.config.LeverRestroke(Configs.ComboBoxLever.SelectedIndex) = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated lever Auto Restroke " & Configs.ComboBoxLever.Text & " To " & UpdateToState)
    End Sub
    'Update Signal Info and buttons
    Public LeverHasRestrokeSetting() As Boolean = {True, True, True, True, False, False, True, True, True, False, False, False, False, False, True, True, True, True, False, False, True, True, False, False}
    Public Sub UpdateleverInfo()
        If Configs.ComboBoxLever.SelectedIndex = -1 Then
            Configs.ButtonleverInputSystem.Enabled = False
            Configs.ButtonleverInputNormal.Enabled = False
            Configs.ButtonLeversInputReverse.Enabled = False
            Configs.ButtonLeversInputNoInput.Enabled = False
            Configs.ButtonleverOutputSystem.Enabled = False
            Configs.ButtonLeverOutputLock.Enabled = False
            Configs.ButtonLeverOutputRelease.Enabled = False
        Else
            Configs.ButtonleverInputSystem.Enabled = True
            Configs.ButtonleverInputNormal.Enabled = True
            Configs.ButtonLeversInputReverse.Enabled = True
            Configs.ButtonLeversInputNoInput.Enabled = True
            Configs.ButtonleverOutputSystem.Enabled = True
            Configs.ButtonLeverOutputLock.Enabled = True
            Configs.ButtonLeverOutputRelease.Enabled = True
        End If
        If Configs.ComboBoxLever.SelectedIndex = -1 Then
            Configs.LabelleverInputSetting.Text = "lever Input Setting : "
            Configs.LabelleverOutputSetting.Text = "lever Output Setting : "
            Configs.LabelleverInputFieldState.Text = "lever Input Field State : "
            Configs.LabelleverOutputFieldState.Text = "lever Output Field State : "
            Configs.LabelleverInputLogicState.Text = "lever Input Logic State : "
            Configs.LabelleverOutputLogicState.Text = "lever Output Logic State : "
            Configs.LabelLeverAutoRestrokeSetting.Text = "lever Auto Restroke Setting : "
        Else
            Configs.LabelLeverInputSetting.Text = "lever Input Setting : " & RuntimeConfig.config.LeverState(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverOutputSetting.Text = "lever Output Setting : " & RuntimeConfig.config.LeverLock(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverInputFieldState.Text = "lever Input Field State : " & Levers.LeverFrameState(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverOutputFieldState.Text = "lever Output Field State : " & Levers.LeverFrameState(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverInputLogicState.Text = "lever Input Logic State : " & Levers.Lever(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverOutputLogicState.Text = "lever Output Logic State : " & Levers.LeverlockState(Configs.ComboBoxLever.SelectedIndex)
            Configs.LabelLeverAutoRestrokeSetting.Text = "lever Auto Restroke Setting : " & RuntimeConfig.config.LeverRestroke(Configs.ComboBoxLever.SelectedIndex)
        End If
        If Not Configs.ComboBoxLever.SelectedIndex = -1 Then
            If LeverHasRestrokeSetting(Configs.ComboBoxLever.SelectedIndex) = True Then
                Configs.ButtonLeverAutoRestroke.Enabled = True
                If RuntimeConfig.config.LeverRestroke(Configs.ComboBoxLever.SelectedIndex) = True Then
                    Configs.ButtonLeverAutoRestroke.Text = "Enabled"
                    Configs.LabelLeverAutoRestrokeSetting.BackColor = Configs.WarningSetting
                Else
                    Configs.ButtonLeverAutoRestroke.Text = "Disabled"
                    Configs.LabelLeverAutoRestrokeSetting.BackColor = Color.Transparent
                End If
            Else
                Configs.ButtonLeverAutoRestroke.Enabled = False
                Configs.ButtonLeverAutoRestroke.Text = "N / A"
                Configs.LabelLeverAutoRestrokeSetting.BackColor = Color.Transparent
            End If
        Else
            Configs.ButtonLeverAutoRestroke.Enabled = False
            Configs.ButtonLeverAutoRestroke.Text = "N / A"
            Configs.LabelLeverAutoRestrokeSetting.BackColor = Color.Transparent
        End If
        If Configs.LabelleverInputSetting.Text = "lever Input Setting : System" Or Configs.LabelleverInputSetting.Text = "lever Input Setting : " Then
            Configs.LabelleverInputSetting.BackColor = Color.Transparent
        Else
            Configs.LabelleverInputSetting.BackColor = Configs.NoneNormalSetting
        End If
        If Configs.LabelleverOutputSetting.Text = "lever Output Setting : System" Or Configs.LabelleverOutputSetting.Text = "lever Output Setting : " Then
            Configs.LabelleverOutputSetting.BackColor = Color.Transparent
        Else
            Configs.LabelleverOutputSetting.BackColor = Configs.NoneNormalSetting
        End If
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdateleverInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
