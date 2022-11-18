---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigCrossing.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/ConfigBoxSupportCode/ConfigCrossing.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateCrossingInfo](/SignallingSystem-doc/vb/Files/ConfigCrossing_8vb/#function-updatecrossinginfo)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[TimerTick](/SignallingSystem-doc/vb/Files/ConfigCrossing_8vb/#function-timertick)**() |


## Functions Documentation

### function UpdateCrossingInfo

```csharp
void UpdateCrossingInfo()
```


### function TimerTick

```csharp
void TimerTick()
```




## Source code

```csharp
Module ConfigCrossing
    'Update Crossing Info
    Public Sub UpdateCrossingInfo()
        'Overall
        If LineSide.CrossingSafe = True Then
            Configs.LabelCrossingSafe.Text = " SAFE"
            Configs.LabelCrossingSafe.BackColor = Configs.OnState
        Else
            Configs.LabelCrossingSafe.Text = "UNSAFE"
            Configs.LabelCrossingSafe.BackColor = Configs.OffState
        End If
        'Sensor 1
        If Configs.ComboBoxCrossingSensor1.SelectedIndex = -1 Then Configs.ComboBoxCrossingSensor1.Text = RuntimeConfig.config.OutterGateOutSensor
        If RuntimeConfig.config.OutterGateOutSensor = "System" Then
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamMade) = 1 Then
                Configs.LabelCrossingSensor1State.BackColor = Configs.OnState
            ElseIf DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateOutwardsBeamBroken) = 1 Then
                Configs.LabelCrossingSensor1State.BackColor = Configs.OffState
            Else
                Configs.LabelCrossingSensor1State.BackColor = Configs.OffState
            End If
        Else
            Configs.LabelCrossingSensor1State.BackColor = Configs.NoneNormalSetting
        End If
        'Sensor 2
        If Configs.ComboBoxCrossingSensor2.SelectedIndex = -1 Then Configs.ComboBoxCrossingSensor2.Text = RuntimeConfig.config.OutterGateInSensor
        If RuntimeConfig.config.OutterGateInSensor = "System" Then
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamMade) = 1 Then
                Configs.LabelCrossingSensor2State.BackColor = Configs.OnState
            ElseIf DataReadInputsArray(DigitalDeviceAddress.InputAddressOuterCrossingGateInwardsBeamBroken) = 1 Then
                Configs.LabelCrossingSensor2State.BackColor = Configs.OffState
            Else
                Configs.LabelCrossingSensor2State.BackColor = Configs.OffState
            End If
        Else
            Configs.LabelCrossingSensor2State.BackColor = Configs.NoneNormalSetting
        End If
        'Sensor 3
        If Configs.ComboBoxCrossingSensor3.SelectedIndex = -1 Then Configs.ComboBoxCrossingSensor3.Text = RuntimeConfig.config.InnerGateOutSensor
        If RuntimeConfig.config.InnerGateOutSensor = "System" Then
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamMade) = 1 Then
                Configs.LabelCrossingSensor3State.BackColor = Configs.OnState
            ElseIf DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateOutwardsBeamBroken) = 1 Then
                Configs.LabelCrossingSensor3State.BackColor = Configs.OffState
            Else
                Configs.LabelCrossingSensor3State.BackColor = Configs.OffState
            End If
        Else
            Configs.LabelCrossingSensor3State.BackColor = Configs.NoneNormalSetting
        End If
        'Sensor 4
        If Configs.ComboBoxCrossingSensor4.SelectedIndex = -1 Then Configs.ComboBoxCrossingSensor4.Text = RuntimeConfig.config.InnerGateInSensor
        If RuntimeConfig.config.InnerGateInSensor = "System" Then
            If DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamMade) = 1 Then
                Configs.LabelCrossingSensor4State.BackColor = Configs.OnState
            ElseIf DataReadInputsArray(DigitalDeviceAddress.InputAddressInnerCrossingGateInwardsBeamBroken) Then
                Configs.LabelCrossingSensor4State.BackColor = Configs.OffState
            Else
                Configs.LabelCrossingSensor4State.BackColor = Configs.OffState
            End If
        Else
            Configs.LabelCrossingSensor4State.BackColor = Configs.NoneNormalSetting
        End If
        'Buzzer
        If Configs.ComboBoxCrossingBuzzer.SelectedIndex = -1 Then Configs.ComboBoxCrossingBuzzer.Text = RuntimeConfig.config.LevelCrossingWarningBuzzer
    End Sub
    'TimerTick
    Public Sub TimerTick()
        UpdateCrossingInfo()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:04 +0000
