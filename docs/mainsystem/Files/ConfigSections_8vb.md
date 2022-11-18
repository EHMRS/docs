---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigSections.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigSections.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSelectedGroup](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-changeselectedgroup)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSectionState](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-changesectionstate)**(string UpdateToState) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSectionSetValue](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-changesectionsetvalue)**(string UpdateToValue) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[ChangeSectionErrorValue](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-changesectionerrorvalue)**(string UpdateToValue) |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[GetSectionValues](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-getsectionvalues)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateSectionInfo](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-updatesectioninfo)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#function-timertick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| string[] | **[SectionLIST](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#variable-sectionlist)** <br>Index 0.  |
| string[] | **[TrackSectionLIST](/SignallingSystem-doc/mainsystem/Files/ConfigSections_8vb/#variable-tracksectionlist)** <br>Index 1.  |


## Functions Documentation

### function ChangeSelectedGroup

```csharp
void ChangeSelectedGroup()
```


### function ChangeSectionState

```csharp
void ChangeSectionState(
    string UpdateToState
)
```


### function ChangeSectionSetValue

```csharp
void ChangeSectionSetValue(
    string UpdateToValue
)
```


### function ChangeSectionErrorValue

```csharp
void ChangeSectionErrorValue(
    string UpdateToValue
)
```


### function GetSectionValues

```csharp
void GetSectionValues()
```


### function UpdateSectionInfo

```csharp
void UpdateSectionInfo()
```


### function TimerTick

```csharp
void TimerTick()
```



## Attributes Documentation

### variable SectionLIST

```csharp
string[] SectionLIST = {"SectionA", "SectionB", "SectionC", "SectionD", "SectionE", "SectionF", "SectionG", "SectionH", "SectionI", "SectionJ", "SectionK", "SectionL", "SectionM", "SectionN", "SectionO", "SectionP", "SectionQ", "SectionDE", "SectionNO", "SectionOP", "SectionQ10", "SectionA11", "SectionF12", "SectionF13", "SectionNO14", "SectionC19", "SectionR", "SectionCD"};
```

Index 0. 

### variable TrackSectionLIST

```csharp
string[] TrackSectionLIST = {"SectionP5a", "SectionP5b", "SectionP6a", "SectionP6b", "SectionP10", "SectionP11", "SectionP12", "SectionP13", "SectionP14", "SectionP19"};
```

Index 1. 


## Source code

```csharp
Module ConfigSections
    'DropDown Section Lists
    Public SectionLIST() As String = {"SectionA", "SectionB", "SectionC", "SectionD", "SectionE", "SectionF", "SectionG", "SectionH", "SectionI", "SectionJ", "SectionK", "SectionL", "SectionM", "SectionN", "SectionO", "SectionP", "SectionQ", "SectionDE", "SectionNO", "SectionOP", "SectionQ10", "SectionA11", "SectionF12", "SectionF13", "SectionNO14", "SectionC19", "SectionR", "SectionCD"} 'Index 0
    Public TrackSectionLIST() As String = {"SectionP5a", "SectionP5b", "SectionP6a", "SectionP6b", "SectionP10", "SectionP11", "SectionP12", "SectionP13", "SectionP14", "SectionP19"} 'Index 1
    'Update which Section list to display
    Public Sub ChangeSelectedGroup()
        Configs.ComboBoxSection.Items.Clear()
        Configs.ComboBoxSection.ResetText()
        If Configs.ComboBoxSectionGroups.SelectedIndex = 0 Then
            Configs.ComboBoxSection.Items.AddRange(SectionLIST)
        ElseIf Configs.ComboBoxSectionGroups.SelectedIndex = 1 Then
            Configs.ComboBoxSection.Items.AddRange(TrackSectionLIST)
        End If
        Configs.ComboBoxSection.DroppedDown = True
    End Sub
    'Update Section setting
    Public Sub ChangeSectionState(UpdateToState As String)
        If Configs.ComboBoxSectionGroups.SelectedIndex = 0 Then
            RuntimeConfig.config.TrackSectionOverrides(Configs.ComboBoxSection.SelectedIndex) = UpdateToState
        ElseIf Configs.ComboBoxSectionGroups.SelectedIndex = 1 Then
            RuntimeConfig.config.PointSectionOverrides(Configs.ComboBoxSection.SelectedIndex) = UpdateToState
        End If
        UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Section " & Configs.ComboBoxSection.Text & " To " & UpdateToState)
    End Sub
    Public Sub ChangeSectionSetValue(UpdateToValue As String)
        If Configs.ComboBoxSectionGroups.SelectedIndex = 0 Then
            RuntimeConfig.config.TrackSectionSetPoint(Configs.ComboBoxSection.SelectedIndex) = UpdateToValue
        ElseIf Configs.ComboBoxSectionGroups.SelectedIndex = 1 Then
            RuntimeConfig.config.PointSectionSetPoint(Configs.ComboBoxSection.SelectedIndex) = UpdateToValue
        End If
        UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Section " & Configs.ComboBoxSection.Text & " Trigger value to " & UpdateToValue)
    End Sub
    Public Sub ChangeSectionErrorValue(UpdateToValue As String)
        If Configs.ComboBoxSectionGroups.SelectedIndex = 0 Then
            RuntimeConfig.config.TrackSectionSetPointError(Configs.ComboBoxSection.SelectedIndex) = UpdateToValue
        ElseIf Configs.ComboBoxSectionGroups.SelectedIndex = 1 Then
            RuntimeConfig.config.PointSectionSetPointError(Configs.ComboBoxSection.SelectedIndex) = UpdateToValue
        End If
        UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Section " & Configs.ComboBoxSection.Text & " Error value to " & UpdateToValue)
    End Sub
    'Fetch stored values for trackbars
    Public Sub GetSectionValues()
        Configs.TrackBarSectionSetVoltage.Value = RuntimeConfig.config.TrackSectionSetPoint(Configs.ComboBoxSection.SelectedIndex)
        Configs.TrackBarSectionErrorVoltage.Value = RuntimeConfig.config.TrackSectionSetPointError(Configs.ComboBoxSection.SelectedIndex)
    End Sub
    'Update Section Info and buttons
    Public Sub UpdateSectionInfo()
        Configs.LabelSectionSetVoltageTrackBar.Text = "Set Voltage : " & Configs.TrackBarSectionSetVoltage.Value
        Configs.LabelSectionErrorVoltageTrackBar.Text = "Error Voltage : " & Configs.TrackBarSectionErrorVoltage.Value
        If Configs.ComboBoxSection.SelectedIndex = -1 Then
            Configs.LabelSectionSetting.Text = "Section Setting : "
            Configs.LabelSectionLogicState.Text = "Section Logic State : "
            Configs.LabelSectionFieldState.Text = "Section Field State : "
            Configs.LabelSectionFieldVoltage.Text = "Section Field Voltage : "
            Configs.LabelSectionSetVoltage.Text = "Section Set Voltage : "
            Configs.LabelSectionErrorVoltage.Text = "Section Error Voltage : "
            Configs.LabelSectionTimer.Text = "Section Timer : "
            Configs.LabelSectionErrorState.Text = "Error State : "
            Configs.ButtonSectionOccupied.Enabled = False
            Configs.ButtonSectionSystem.Enabled = False
            Configs.ButtonSectionUnoccupied.Enabled = False
        Else
            If Configs.ComboBoxSectionGroups.SelectedIndex = 0 Then
                Configs.LabelSectionSetting.Text = "Section Setting : " & RuntimeConfig.config.TrackSectionOverrides(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionLogicState.Text = "Section Logic State : " & TrackSectionUnoccupied(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionFieldState.Text = "Section Field State : " & TrackSectionField(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionFieldVoltage.Text = "Section Field Voltage : " & ActualAnalogValue(Configs.ComboBoxSection.SelectedIndex + 1) & "V"
                Configs.LabelSectionSetVoltage.Text = "Section Set Voltage : " & RuntimeConfig.config.TrackSectionSetPoint(Configs.ComboBoxSection.SelectedIndex) & "V"
                Configs.LabelSectionErrorVoltage.Text = "Section Error Voltage : " & RuntimeConfig.config.TrackSectionSetPointError(Configs.ComboBoxSection.SelectedIndex) & "V"
                Configs.LabelSectionTimer.Text = "Section Timer : " & TrackSectionTimer(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionErrorState.Text = "Error State : " & TrackSectionError(Configs.ComboBoxSection.SelectedIndex)
                Configs.ButtonSectionOccupied.Enabled = True
                Configs.ButtonSectionSystem.Enabled = True
                Configs.ButtonSectionUnoccupied.Enabled = True
            ElseIf Configs.ComboBoxSectionGroups.SelectedIndex = 1 Then
                Configs.LabelSectionSetting.Text = "Section Setting : " & RuntimeConfig.config.PointSectionOverrides(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionLogicState.Text = "Section Logic State : " & PointSectionUnoccupied(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionFieldState.Text = "Section Field State : " & PointSectionField(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionFieldVoltage.Text = "Section Field Voltage : " & ActualAnalogValue(AnalogInputPointSections(Configs.ComboBoxSection.SelectedIndex)) & "V"
                Configs.LabelSectionSetVoltage.Text = "Section Set Voltage : " & RuntimeConfig.config.PointSectionSetPoint(Configs.ComboBoxSection.SelectedIndex) & "V"
                Configs.LabelSectionErrorVoltage.Text = "Section Error Voltage : " & RuntimeConfig.config.PointSectionSetPointError(Configs.ComboBoxSection.SelectedIndex) & "V"
                Configs.LabelSectionTimer.Text = "Section Timer : " & PointSectionTimer(Configs.ComboBoxSection.SelectedIndex)
                Configs.LabelSectionErrorState.Text = "Error State : " & PointSectionError(Configs.ComboBoxSection.SelectedIndex)
                Configs.ButtonSectionOccupied.Enabled = True
                Configs.ButtonSectionSystem.Enabled = True
                Configs.ButtonSectionUnoccupied.Enabled = True
            End If
        End If
        If Configs.LabelSectionSetting.Text = "Section Setting : Detect" Or Configs.LabelSectionSetting.Text = "Section Setting : " Then
            Configs.LabelSectionSetting.BackColor = Color.Transparent
        Else
            Configs.LabelSectionSetting.BackColor = Configs.NoneNormalSetting
        End If
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdateSectionInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:18:55 +0000
