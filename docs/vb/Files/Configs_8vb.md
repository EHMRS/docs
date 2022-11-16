---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/Configs.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/ConfigBox/Configs.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[Configs](/SignallingSystem-doc/vb/Classes/classConfigs/)**  |




## Source code

```csharp
Public Class Configs
    Public NoneNormalSetting As Color = Color.LightBlue
    Public WarningSetting As Color = Color.LightYellow
    Public OnState As Color = Color.LightGreen
    Public OffState As Color = Color.Red
    'Access and control
    Private Sub TimerUserManagment_Tick(sender As Object, e As EventArgs) Handles TimerUserManagment.Tick
        LabelLoggedInAs.Text = "Logged in as : " & UserManagment.LoggedInUserName & " (Access level : " & UserManagment.LoggedInAccessLevel & ")"
        If UserManagment.LoggedInAccessLevel > 0 Then
            ButtonLogin.Text = "Logout"
        Else
            ButtonLogin.Text = "Login"
        End If
        'Power access
        If UserManagment.LoggedInAccessLevel > 0 Then
            GroupBoxPowerControls.Enabled = True
            GroupBoxPowerControls.Text = "Power Control"
        Else
            GroupBoxPowerControls.Enabled = False
            GroupBoxPowerControls.Text = "Power - LOCKED!"
        End If
        If UserManagment.LoggedInAccessLevel > 2 Then
            GroupBoxEStop.Enabled = True
            GroupBoxEStop.Text = "EStop Control"
        Else
            GroupBoxEStop.Enabled = False
            GroupBoxEStop.Text = "EStop Locked - LOCKED!"
        End If
        'Logic access
        If UserManagment.LoggedInAccessLevel > 1 Then
            GroupBoxDirectionControls.Enabled = True
            GroupBoxDirectionControls.Text = "Logic Control"
        Else
            GroupBoxDirectionControls.Enabled = False
            GroupBoxDirectionControls.Text = "Logic - LOCKED!"
        End If
        'Signal access
        If UserManagment.LoggedInAccessLevel > 1 Then
            GroupBoxSignalControls.Enabled = True
            GroupBoxSignalControls.Text = "Signal Settings"
        Else
            GroupBoxSignalControls.Enabled = False
            GroupBoxSignalControls.Text = "Signal Settings - LOCKED!"
        End If
        'Point access
        If UserManagment.LoggedInAccessLevel > 2 Then
            GroupBoxPointControls.Enabled = True
            GroupBoxPointControls.Text = "Point Settings"
        Else
            GroupBoxPointControls.Enabled = False
            GroupBoxPointControls.Text = "Point Settings - LOCKED!"
        End If
        'Section access
        If UserManagment.LoggedInAccessLevel > 1 Then
            GroupBoxSectionControls.Enabled = True
            GroupBoxSectionControls.Text = "Section Settings"
        Else
            GroupBoxSectionControls.Enabled = False
            GroupBoxSectionControls.Text = "Section Settings - LOCKED!"
        End If
        'lever access
        If UserManagment.LoggedInAccessLevel > 1 Then
            GroupBoxLeverControls.Enabled = True
            GroupBoxLeverControls.Text = "lever Settings"
        Else
            GroupBoxLeverControls.Enabled = False
            GroupBoxleverControls.Text = "lever Settings - LOCKED!"
        End If
    End Sub
    'LogicTimer
    Private Sub TimerMainLogic_Tick(sender As Object, e As EventArgs) Handles TimerMainLogic.Tick
        ConfigPower.TimerTick()
        ConfigSignals.TimerTick()
        ConfigPoints.TimerTick()
        ConfigSections.TimerTick()
        Configlevers.TimerTick()
        ConfigCrossing.TimerTick()
    End Sub
    'Login/out button
    Private Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
        If UserManagment.LoggedInAccessLevel > 0 Then
            UserManagment.Logout()
        Else
            LoginForm.Show()
        End If
    End Sub
    'Save to file button
    Private Sub ButtonSave_Click(sender As Object, e As EventArgs) Handles ButtonSave.Click
        RuntimeConfig.Save()
    End Sub
    'Close Button
    Private Sub ButtonClose_Click(sender As Object, e As EventArgs)
        Me.Close()
    End Sub
    'EStop
    Private Sub ButtonESTOP_Click(sender As Object, e As EventArgs) Handles ButtonESTOP.Click
        Safety.EStopSoftware = True
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Triggered Estop ")
    End Sub
    'Power and Logic
    Private Sub ButtonPowerSystem_Click(sender As Object, e As EventArgs) Handles ButtonPowerSystem.Click
        ConfigPower.ChangeSystemmPowerState("System")
    End Sub
    Private Sub ButtonPowerOn_Click(sender As Object, e As EventArgs) Handles ButtonPowerOn.Click
        ConfigPower.ChangeSystemmPowerState("On")
    End Sub
    Private Sub ButtonPowerOff_Click(sender As Object, e As EventArgs) Handles ButtonPowerOff.Click
        ConfigPower.ChangeSystemmPowerState("Off")
    End Sub
    Private Sub ButtonPowerExternal_Click(sender As Object, e As EventArgs) Handles ButtonPowerExternal.Click
        ChangeSystemmLogicState("External")
    End Sub
    Private Sub ButtonPowerManual_Click(sender As Object, e As EventArgs) Handles ButtonPowerManual.Click
        ChangeSystemmLogicState("Manual")
        UserManagment.loginOperator(UserManagment.LoggedInUserName)
    End Sub
    Private Sub ButtonPowerAutomatic_Click(sender As Object, e As EventArgs) Handles ButtonPowerAutomatic.Click
        ChangeSystemmLogicState("Computer")
        UserManagment.logoutOperator()
    End Sub
    Private Sub ButtonEStopReset_Click(sender As Object, e As EventArgs) Handles ButtonEStopReset.Click
        Safety.EStopReset = True
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Reset EStop ")
    End Sub
    'Signals
    Private Sub ComboBoxSignalGroups_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxSignalGroups.SelectedIndexChanged
        ConfigSignals.ChangeSelectedGroup()
    End Sub
    Private Sub ButtonSignalSystem_Click(sender As Object, e As EventArgs) Handles ButtonSignalSystem.Click
        ConfigSignals.ChangeSignalState("System")
    End Sub
    Private Sub ButtonSignalReset_Click(sender As Object, e As EventArgs) Handles ButtonSignalReset.Click
        ConfigSignals.ChangeSignalState("System")
    End Sub
    Private Sub ButtonSignalClear_Click(sender As Object, e As EventArgs) Handles ButtonSignalClear.Click
        ConfigSignals.ChangeSignalState("Clear")
    End Sub
    Private Sub ButtonSignalCaution_Click(sender As Object, e As EventArgs) Handles ButtonSignalCaution.Click
        ConfigSignals.ChangeSignalState("Caution")
    End Sub
    Private Sub ButtonSignalDanger_Click(sender As Object, e As EventArgs) Handles ButtonSignalDanger.Click
        ConfigSignals.ChangeSignalState("Danger")
    End Sub
    Private Sub ButtonSignalShunt_Click(sender As Object, e As EventArgs) Handles ButtonSignalShunt.Click
        ConfigSignals.ChangeSignalState("Shunt")
    End Sub
    Private Sub ButtonSignalBypass_Click(sender As Object, e As EventArgs) Handles ButtonSignalBypass.Click
        ConfigSignals.ChangeSignalState("Bypass")
    End Sub
    Public Sub PaintSignalFieldState(State As String)
        Dim F As System.Drawing.Graphics
        F = PictureBoxSignalFieldState.CreateGraphics
        If State = SignalAtDanger Then
            F.FillEllipse(Brushes.Red, 4, 4, 42, 42)
        ElseIf State = SignalAtCaution Then
            F.FillEllipse(Brushes.Yellow, 4, 4, 42, 42)
        ElseIf State = SignalAtClear Then
            F.FillEllipse(Brushes.LightGreen, 4, 4, 42, 42)
        ElseIf State = SignalAtShunt Then
            F.FillEllipse(Brushes.White, 4, 4, 42, 42)
        ElseIf State = "Off" Then
            F.FillEllipse(Brushes.Gray, 4, 4, 42, 42)
        Else
            F.FillEllipse(Brushes.Pink, 4, 4, 42, 42)
        End If
    End Sub
    Public Sub PaintSignalLogicState(State As String)
        Dim L As System.Drawing.Graphics
        L = PictureBoxSignalLogicState.CreateGraphics
        If State = SignalAtDanger Then
            L.FillEllipse(Brushes.Red, 4, 4, 42, 42)
        ElseIf State = SignalAtCaution Then
            L.FillEllipse(Brushes.Yellow, 4, 4, 42, 42)
        ElseIf State = SignalAtClear Then
            L.FillEllipse(Brushes.LightGreen, 4, 4, 42, 42)
        ElseIf State = SignalAtShunt Then
            L.FillEllipse(Brushes.White, 4, 4, 42, 42)
        ElseIf State = "Off" Then
            L.FillEllipse(Brushes.Gray, 4, 4, 42, 42)
        Else
            L.FillEllipse(Brushes.Pink, 4, 4, 42, 42)
        End If
    End Sub
    'Points
    Private Sub ButtonPointInputSystem_Click(sender As Object, e As EventArgs) Handles ButtonPointInputSystem.Click
        ConfigPoints.ChangePointInput("System")
    End Sub
    Private Sub ButtonPointInputNormal_Click(sender As Object, e As EventArgs) Handles ButtonPointInputNormal.Click
        ConfigPoints.ChangePointInput("Normal")
    End Sub
    Private Sub ButtonPointInputReverse_Click(sender As Object, e As EventArgs) Handles ButtonPointInputReverse.Click
        ConfigPoints.ChangePointInput("Reverse")
    End Sub
    Private Sub ButtonPointInputNoInput_Click(sender As Object, e As EventArgs) Handles ButtonPointInputNoInput.Click
        ConfigPoints.ChangePointInput("NoInput")
    End Sub
    Private Sub ButtonPointOutputSystem_Click(sender As Object, e As EventArgs) Handles ButtonPointOutputSystem.Click
        ConfigPoints.ChangePointOutput("System")
    End Sub
    Private Sub ButtonPointOutputNormal_Click(sender As Object, e As EventArgs) Handles ButtonPointOutputNormal.Click
        ConfigPoints.ChangePointOutput("Normal")
    End Sub
    Private Sub ButtonPointOutputReverse_Click(sender As Object, e As EventArgs) Handles ButtonPointOutputReverse.Click
        ConfigPoints.ChangePointOutput("Reverse")
    End Sub
    Private Sub ButtonPointOutputIsolate_Click(sender As Object, e As EventArgs) Handles ButtonPointOutputIsolate.Click
        ConfigPoints.ChangePointOutput("Off")
    End Sub
    'Sections
    Private Sub ComboBoxSectionGroups_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxSectionGroups.SelectedIndexChanged
        ConfigSections.ChangeSelectedGroup()
    End Sub
    Private Sub ComboBoxSection_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxSection.SelectedIndexChanged
        ConfigSections.GetSectionValues()
    End Sub
    Private Sub TrackBarSectionSetVoltage_Scroll(sender As Object, e As EventArgs) Handles TrackBarSectionSetVoltage.Scroll
        ConfigSections.ChangeSectionSetValue(TrackBarSectionSetVoltage.Value)
    End Sub
    Private Sub TrackBarSectionErrorVoltage_Scroll(sender As Object, e As EventArgs) Handles TrackBarSectionErrorVoltage.Scroll
        ConfigSections.ChangeSectionErrorValue(TrackBarSectionErrorVoltage.Value)
    End Sub
    Private Sub ButtonSectionUnoccupied_Click(sender As Object, e As EventArgs) Handles ButtonSectionUnoccupied.Click
        ConfigSections.ChangeSectionState("UnOccupied")
    End Sub
    Private Sub ButtonSectionOccupied_Click(sender As Object, e As EventArgs) Handles ButtonSectionOccupied.Click
        ConfigSections.ChangeSectionState("Occupy")
    End Sub
    Private Sub ButtonSectionSystem_Click(sender As Object, e As EventArgs) Handles ButtonSectionSystem.Click
        ConfigSections.ChangeSectionState("Detect")
    End Sub
    'levers
    Private Sub ButtonLeversInputReverse_Click(sender As Object, e As EventArgs) Handles ButtonLeversInputReverse.Click
        Configlevers.ChangeleverInput("Reverse")
    End Sub
    Private Sub ButtonLeverInputSystem_Click(sender As Object, e As EventArgs) Handles ButtonLeverInputSystem.Click
        Configlevers.ChangeleverInput("System")
    End Sub
    Private Sub ButtonLeverOutputLock_Click(sender As Object, e As EventArgs) Handles ButtonLeverOutputLock.Click
        Configlevers.ChangeleverOutput("Lock")
    End Sub
    Private Sub ButtonLeverInputNormal_Click(sender As Object, e As EventArgs) Handles ButtonLeverInputNormal.Click
        Configlevers.ChangeleverInput("Normal")
    End Sub
    Private Sub ButtonLeverOutputSystem_Click(sender As Object, e As EventArgs) Handles ButtonLeverOutputSystem.Click
        Configlevers.ChangeleverOutput("System")
    End Sub
    Private Sub ButtonLeversInputNoInput_Click(sender As Object, e As EventArgs) Handles ButtonLeversInputNoInput.Click
        Configlevers.ChangeleverInput("Unknown")
    End Sub
    Private Sub ButtonLeverOutputRelease_Click(sender As Object, e As EventArgs) Handles ButtonLeverOutputRelease.Click
        Configlevers.ChangeleverOutput("Release")
    End Sub
    Private Sub ButtonLeverAutoRestroke_Click(sender As Object, e As EventArgs) Handles ButtonLeverAutoRestroke.Click
        If Not ComboBoxLever.SelectedIndex = -1 Then
            If LeverHasRestrokeSetting(ComboBoxLever.SelectedIndex) = True Then
                If RuntimeConfig.config.LeverRestroke(ComboBoxLever.SelectedIndex) = True Then
                    ChangeleverAutoRestroke(False)
                Else
                    ChangeleverAutoRestroke(True)
                End If
            End If
        End If
    End Sub
    'Level Crossing
    Private Sub ComboBoxCrossingSensor1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxCrossingSensor1.SelectedIndexChanged
        RuntimeConfig.config.OutterGateOutSensor = ComboBoxCrossingSensor1.Text
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Crossing Sensor 1 to " & ComboBoxCrossingSensor1.Text)
    End Sub
    Private Sub ComboBoxCrossingSensor2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxCrossingSensor2.SelectedIndexChanged
        RuntimeConfig.config.OutterGateInSensor = ComboBoxCrossingSensor2.Text
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Crossing Sensor 2 to " & ComboBoxCrossingSensor2.Text)
    End Sub
    Private Sub ComboBoxCrossingSensor3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxCrossingSensor3.SelectedIndexChanged
        RuntimeConfig.config.InnerGateOutSensor = ComboBoxCrossingSensor3.Text
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Crossing Sensor 3 to " & ComboBoxCrossingSensor3.Text)
    End Sub
    Private Sub ComboBoxCrossingSensor4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxCrossingSensor4.SelectedIndexChanged
        RuntimeConfig.config.InnerGateInSensor = ComboBoxCrossingSensor4.Text
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Crossing Sensor 4 to " & ComboBoxCrossingSensor4.Text)
    End Sub
    Private Sub ComboBoxCrossingBuzzer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxCrossingBuzzer.SelectedIndexChanged
        RuntimeConfig.config.LevelCrossingWarningBuzzer = ComboBoxCrossingBuzzer.Text
        AlarmsAndNotifications.UpdateSystemLog("SYSTEM SETTINGS LOG - " & UserManagment.LoggedInUserName & " Updated Crossing Buzzer to " & ComboBoxCrossingBuzzer.Text)
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-15 at 15:52:05 +0000
