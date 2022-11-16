---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigPoints.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigPoints.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangePointOutput](/SignallingSystem-doc/vb/Files/ConfigPoints_8vb/#function-changepointoutput)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangePointInput](/SignallingSystem-doc/vb/Files/ConfigPoints_8vb/#function-changepointinput)**(string UpdateToState) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdatePointInfo](/SignallingSystem-doc/vb/Files/ConfigPoints_8vb/#function-updatepointinfo)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/vb/Files/ConfigPoints_8vb/#function-timertick)**() |


## Functions Documentation

### function ChangePointOutput

```csharp
void ChangePointOutput(
    string UpdateToState
)
```


### function ChangePointInput

```csharp
void ChangePointInput(
    string UpdateToState
)
```


### function UpdatePointInfo

```csharp
void UpdatePointInfo()
```


### function TimerTick

```csharp
void TimerTick()
```




## Source code

```csharp
Module ConfigPoints
    'Update signal setting
    Public Sub ChangePointOutput(UpdateToState As String)
        RuntimeConfig.config.PointOutputOverrides(Configs.ComboBoxPoint.SelectedIndex) = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Point OutPut " & Configs.ComboBoxPoint.Text & " To " & UpdateToState)
    End Sub
    Public Sub ChangePointInput(UpdateToState As String)
        RuntimeConfig.config.PointInputOverrides(Configs.ComboBoxPoint.SelectedIndex) = UpdateToState
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Point InPut " & Configs.ComboBoxPoint.Text & " To " & UpdateToState)
    End Sub
    'Update Signal Info and buttons
    Public Sub UpdatePointInfo()
        If Configs.ComboBoxPoint.SelectedIndex = -1 Then
            Configs.ButtonPointInputSystem.Enabled = False
            Configs.ButtonPointInputNormal.Enabled = False
            Configs.ButtonPointInputReverse.Enabled = False
            Configs.ButtonPointInputNoInput.Enabled = False
            Configs.ButtonPointOutputSystem.Enabled = False
            Configs.ButtonPointOutputNormal.Enabled = False
            Configs.ButtonPointOutputReverse.Enabled = False
            Configs.ButtonPointOutputIsolate.Enabled = False
        Else
            Configs.ButtonPointInputSystem.Enabled = True
            Configs.ButtonPointInputNormal.Enabled = True
            Configs.ButtonPointInputReverse.Enabled = True
            Configs.ButtonPointInputNoInput.Enabled = True
            Configs.ButtonPointOutputSystem.Enabled = True
            Configs.ButtonPointOutputNormal.Enabled = True
            Configs.ButtonPointOutputReverse.Enabled = True
            Configs.ButtonPointOutputIsolate.Enabled = True
        End If
        If Configs.ComboBoxPoint.SelectedIndex = -1 Then
            Configs.LabelPointInputSetting.Text = "Point Input Setting : "
            Configs.LabelPointOutputSetting.Text = "Point Output Setting : "
            Configs.LabelPointInputFieldState.Text = "Point Input Field State : "
            Configs.LabelPointOutputFieldState.Text = "Point Output Field State : "
            Configs.LabelPointInputLogicState.Text = "Point Input Logic State : "
            Configs.LabelPointOutputLogicState.Text = "Point Output Logic State : "
            Configs.LabelPointNoReturnTimer.Text = "Point No Return Timer : "
            Configs.LabelPointNotChangingTimer.Text = "Point Not Changing Timer : "
        Else
            Configs.LabelPointInputSetting.Text = "Point Input Setting : " & RuntimeConfig.config.PointInputOverrides(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointOutputSetting.Text = "Point Output Setting : " & RuntimeConfig.config.PointOutputOverrides(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointInputFieldState.Text = "Point Input Field State : " & Points.PointFieldStates(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointOutputFieldState.Text = "Point Output Field State : " & Points.PointOutputs(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointInputLogicState.Text = "Point Input Logic State : " & Points.PointReturns(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointOutputLogicState.Text = "Point Output Logic State : " & Points.PointRequestedOutputs(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointNoReturnTimer.Text = "Point No Return Timer : " & Points.PointNoReturnCountdown(Configs.ComboBoxPoint.SelectedIndex)
            Configs.LabelPointNotChangingTimer.Text = "Point Not Changing Timer : " & Points.PointNotChangingCountdown(Configs.ComboBoxPoint.SelectedIndex)
        End If
        If Configs.LabelPointInputSetting.Text = "Point Input Setting : System" Or Configs.LabelPointInputSetting.Text = "Point Input Setting : " Then
            Configs.LabelPointInputSetting.BackColor = Color.Transparent
        Else
            Configs.LabelPointInputSetting.BackColor = Configs.NoneNormalSetting
        End If
        If Configs.LabelPointOutputSetting.Text = "Point Output Setting : System" Or Configs.LabelPointOutputSetting.Text = "Point Output Setting : " Then
            Configs.LabelPointOutputSetting.BackColor = Color.Transparent
        Else
            Configs.LabelPointOutputSetting.BackColor = Configs.NoneNormalSetting
        End If
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdatePointInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
