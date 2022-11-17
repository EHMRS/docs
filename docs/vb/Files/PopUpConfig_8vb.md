---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/PopUpConfig.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/PopUpConfig.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[PopUpConfig](/SignallingSystem-doc/vb/Classes/classPopUpConfig/)**  |




## Source code

```csharp
Public Class PopUpConfig
    Private Sub PopUpConfig_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        LoadValues()
    End Sub
    'Timer
    Private Sub ConfigUpdateInfo_Tick(sender As Object, e As EventArgs) Handles ConfigUpdateInfo.Tick
        'Tunnel
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndOpen) = 1 Then
            CBEastEndTunnelStateOpen.Checked = True
        Else
            CBEastEndTunnelStateOpen.Checked = False
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelEastEndClose) = 1 Then
            CBEastEndTunnelStateCLose.Checked = True
        Else
            CBEastEndTunnelStateCLose.Checked = False
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndOpen) = 1 Then
            CBWestEndTunnelStateOpen.Checked = True
        Else
            CBWestEndTunnelStateOpen.Checked = False
        End If
        If DataReadInputsArray(DigitalDeviceAddress.InputAddressTunnelWestEndClose) = 1 Then
            CBWestEndTunnelStateClose.Checked = True
        Else
            CBWestEndTunnelStateClose.Checked = False
        End If
        LblTunnelOpen.Text = ("Tunnel Open - " & LineSide.TunnelOpen)
        LblTunnelSafe.Text = ("Tunnel Safe - " & LineSide.TunnelSafe)


        'Audio Buttons
        If RuntimeConfig.config.DepartingP1SoundEnabled = True Then
            BtnDepartingP1Enabled.Text = "Enabled"
            BtnDepartingPlayP1.Enabled = True
        Else
            BtnDepartingP1Enabled.Text = "Disabled"
            BtnDepartingPlayP1.Enabled = False
        End If
        If RuntimeConfig.config.DepartingP2SoundEnabled = True Then
            BtnDepartingP2Enabled.Text = "Enabled"
            BtnDepartingPlayP2.Enabled = True
        Else
            BtnDepartingP2Enabled.Text = "Disabled"
            BtnDepartingPlayP2.Enabled = False
        End If
        If RuntimeConfig.config.ArrivingP1SoundEnabled = True Then
            BtnArrivingP1Enabled.Text = "Enabled"
            BtnArrivingPlayP1.Enabled = True
        Else
            BtnArrivingP1Enabled.Text = "Disabled"
            BtnArrivingPlayP1.Enabled = False
        End If
        If RuntimeConfig.config.ArrivingP2SoundEnabled = True Then
            BtnArrivingP2Enabled.Text = "Enabled"
            BtnArrivingPlayP2.Enabled = True
        Else
            BtnArrivingP2Enabled.Text = "Disabled"
            BtnArrivingPlayP2.Enabled = False
        End If
        If RuntimeConfig.config.SidingSoundEnabled = True Then
            BtnSidingEnabled.Text = "Enabled"
            BtnSidingPlay.Enabled = True
        Else
            BtnSidingEnabled.Text = "Disabled"
            BtnSidingPlay.Enabled = False
        End If
        If RuntimeConfig.config.EventSoundEnabled = True Then
            BtnEventEnabled.Text = "Enabled"
            BtnEventPlay.Enabled = True
        Else
            BtnEventEnabled.Text = "Disabled"
            BtnEventPlay.Enabled = False
        End If
        If RuntimeConfig.config.SafetySoundEnabled = True Then
            BtnSafetyEnabled.Text = "Enabled"
            BtnSafetyPlay.Enabled = True
        Else
            BtnSafetyEnabled.Text = "Disabled"
            BtnSafetyPlay.Enabled = False
        End If
        If RuntimeConfig.config.AUXSound1Enabled = True Then
            BtnAUX1Enabled.Text = "Enabled"
            BtnAUX1Play.Enabled = True
        Else
            BtnAUX1Enabled.Text = "Disabled"
            BtnAUX1Play.Enabled = False
        End If
        If RuntimeConfig.config.AUXSound2Enabled = True Then
            BtnAUX2Enabled.Text = "Enabled"
            BtnAUX2Play.Enabled = True
        Else
            BtnAUX2Enabled.Text = "Disabled"
            BtnAUX2Play.Enabled = False
        End If
        If RuntimeConfig.config.AUXSound3Enabled = True Then
            BtnAUX3Enabled.Text = "Enabled"
            BtnAUX3Play.Enabled = True
        Else
            BtnAUX3Enabled.Text = "Disabled"
            BtnAUX3Play.Enabled = False
        End If
        If RuntimeConfig.config.BellEnabled = True Then
            BtnBellEnabled.Text = "Enabled"
            BtnBellTest.Enabled = True
        Else
            BtnBellEnabled.Text = "Disabled"
            BtnBellTest.Enabled = False
        End If
        'Overall Air
        If RuntimeConfig.config.AirEnabled = True Then
            BtnDisableAir.Text = "ALL AIR ENABLED"
            BtnForceEnableAir.Enabled = True
        Else
            BtnDisableAir.Text = "ALL AIR DISABLED"
            BtnForceEnableAir.Enabled = False
        End If
        If RuntimeConfig.config.ForceAir = True Then
            BtnForceEnableAir.Text = "Air Forced On"
        Else
            BtnForceEnableAir.Text = "Air Forced Off"
        End If
        'Initializations
        If Initializations.AJ1Initiated = True Then
            BtnInitializationAJ1.Text = "Re-Initiate AJ1"
            LblInitializationAJ1.Text = "AJ1 Is fully initiated!"
            LblInitializationAJ1.ForeColor = Color.Black
        Else
            BtnInitializationAJ1.Text = "Force Initiate AJ1"
            If AJ1InitiatedTimer = InitilizationStart Or AJ1InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ1.ForeColor = Color.Red
                LblInitializationAJ1.Text = "AJ1 Is being prevented to initiate (" & AJ1InitiatedTimer & ")"
            Else
                LblInitializationAJ1.ForeColor = Color.Green
                LblInitializationAJ1.Text = "AJ1 Is still trying to initiate (" & AJ1InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ2Initiated = True Then
            BtnInitializationAJ2.Text = "Re-Initiate AJ2"
            LblInitializationAJ2.Text = "AJ2 Is fully initiated!"
            LblInitializationAJ2.ForeColor = Color.Black
        Else
            BtnInitializationAJ2.Text = "Force Initiate AJ2"
            If AJ2InitiatedTimer = InitilizationStart Or AJ2InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ2.ForeColor = Color.Red
                LblInitializationAJ2.Text = "AJ2 Is being prevented to initiate (" & AJ2InitiatedTimer & ")"
            Else
                LblInitializationAJ2.ForeColor = Color.Green
                LblInitializationAJ2.Text = "AJ2 Is still trying to initiate (" & AJ2InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ3Initiated = True Then
            BtnInitializationAJ3.Text = "Re-Initiate AJ3"
            LblInitializationAJ3.Text = "AJ3 Is fully initiated!"
            LblInitializationAJ3.ForeColor = Color.Black
        Else
            BtnInitializationAJ3.Text = "Force Initiate AJ3"
            If AJ3InitiatedTimer = InitilizationStart Or AJ3InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ3.ForeColor = Color.Red
                LblInitializationAJ3.Text = "AJ3 Is being prevented to initiate (" & AJ3InitiatedTimer & ")"
            Else
                LblInitializationAJ3.ForeColor = Color.Green
                LblInitializationAJ3.Text = "AJ3 Is still trying to initiate (" & AJ3InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ4Initiated = True Then
            BtnInitializationAJ4.Text = "Re-Initiate AJ4"
            LblInitializationAJ4.Text = "AJ4 Is fully initiated!"
            LblInitializationAJ4.ForeColor = Color.Black
        Else
            BtnInitializationAJ4.Text = "Force Initiate AJ4"
            If AJ4InitiatedTimer = InitilizationStart Or AJ4InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ4.ForeColor = Color.Red
                LblInitializationAJ4.Text = "AJ4 Is being prevented to initiate (" & AJ4InitiatedTimer & ")"
            Else
                LblInitializationAJ4.ForeColor = Color.Green
                LblInitializationAJ4.Text = "AJ4 Is still trying to initiate (" & AJ4InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ7Initiated = True Then
            BtnInitializationAJ7.Text = "Re-Initiate AJ7"
            LblInitializationAJ7.Text = "AJ7 Is fully initiated!"
            LblInitializationAJ7.ForeColor = Color.Black
        Else
            BtnInitializationAJ7.Text = "Force Initiate AJ7"
            If AJ7InitiatedTimer = InitilizationStart Or AJ7InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ7.ForeColor = Color.Red
                LblInitializationAJ7.Text = "AJ7 Is being prevented to initiate (" & AJ7InitiatedTimer & ")"
            Else
                LblInitializationAJ7.ForeColor = Color.Green
                LblInitializationAJ7.Text = "AJ7 Is still trying to initiate (" & AJ7InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ8Initiated = True Then
            BtnInitializationAJ8.Text = "Re-Initiate AJ8"
            LblInitializationAJ8.Text = "AJ8 Is fully initiated!"
            LblInitializationAJ8.ForeColor = Color.Black
        Else
            BtnInitializationAJ8.Text = "Force Initiate AJ8"
            If AJ8InitiatedTimer = InitilizationStart Or AJ8InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ8.ForeColor = Color.Red
                LblInitializationAJ8.Text = "AJ8 Is being prevented to initiate (" & AJ8InitiatedTimer & ")"
            Else
                LblInitializationAJ8.ForeColor = Color.Green
                LblInitializationAJ8.Text = "AJ8 Is still trying to initiate (" & AJ8InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ9Initiated = True Then
            BtnInitializationAJ9.Text = "Re-Initiate AJ9"
            LblInitializationAJ9.Text = "AJ9 Is fully initiated!"
            LblInitializationAJ9.ForeColor = Color.Black
        Else
            BtnInitializationAJ9.Text = "Force Initiate AJ9"
            If AJ9InitiatedTimer = InitilizationStart Or AJ9InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ9.ForeColor = Color.Red
                LblInitializationAJ9.Text = "AJ9 Is being prevented to initiate (" & AJ9InitiatedTimer & ")"
            Else
                LblInitializationAJ9.ForeColor = Color.Green
                LblInitializationAJ9.Text = "AJ9 Is still trying to initiate (" & AJ9InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ15Initiated = True Then
            BtnInitializationAJ15.Text = "Re-Initiate AJ15"
            LblInitializationAJ15.Text = "AJ15 Is fully initiated!"
            LblInitializationAJ15.ForeColor = Color.Black
        Else
            BtnInitializationAJ15.Text = "Force Initiate AJ15"
            If AJ15InitiatedTimer = InitilizationStart Or AJ15InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ15.ForeColor = Color.Red
                LblInitializationAJ15.Text = "AJ15 Is being prevented to initiate (" & AJ15InitiatedTimer & ")"
            Else
                LblInitializationAJ15.ForeColor = Color.Green
                LblInitializationAJ15.Text = "AJ15 Is still trying to initiate (" & AJ15InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ16Initiated = True Then
            BtnInitializationAJ16.Text = "Re-Initiate AJ16"
            LblInitializationAJ16.Text = "AJ16 Is fully initiated!"
            LblInitializationAJ16.ForeColor = Color.Black
        Else
            BtnInitializationAJ16.Text = "Force Initiate AJ16"
            If AJ16InitiatedTimer = InitilizationStart Or AJ16InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ16.ForeColor = Color.Red
                LblInitializationAJ16.Text = "AJ16 Is being prevented to initiate (" & AJ16InitiatedTimer & ")"
            Else
                LblInitializationAJ16.ForeColor = Color.Green
                LblInitializationAJ16.Text = "AJ16 Is still trying to initiate (" & AJ16InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ17Initiated = True Then
            BtnInitializationAJ17.Text = "Re-Initiate AJ17"
            LblInitializationAJ17.Text = "AJ17 Is fully initiated!"
            LblInitializationAJ17.ForeColor = Color.Black
        Else
            BtnInitializationAJ17.Text = "Force Initiate AJ17"
            If AJ17InitiatedTimer = InitilizationStart Or AJ17InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ17.ForeColor = Color.Red
                LblInitializationAJ17.Text = "AJ17 Is being prevented to initiate (" & AJ17InitiatedTimer & ")"
            Else
                LblInitializationAJ17.ForeColor = Color.Green
                LblInitializationAJ17.Text = "AJ17 Is still trying to initiate (" & AJ17InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ18Initiated = True Then
            BtnInitializationAJ18.Text = "Re-Initiate AJ18"
            LblInitializationAJ18.Text = "AJ18 Is fully initiated!"
            LblInitializationAJ18.ForeColor = Color.Black
        Else
            BtnInitializationAJ18.Text = "Force Initiate AJ18"
            If AJ18InitiatedTimer = InitilizationStart Or AJ18InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ18.ForeColor = Color.Red
                LblInitializationAJ18.Text = "AJ18 Is being prevented to initiate (" & AJ18InitiatedTimer & ")"
            Else
                LblInitializationAJ18.ForeColor = Color.Green
                LblInitializationAJ18.Text = "AJ18 Is still trying to initiate (" & AJ18InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ21Initiated = True Then
            BtnInitializationAJ21.Text = "Re-Initiate AJ21"
            LblInitializationAJ21.Text = "AJ21 Is fully initiated!"
            LblInitializationAJ21.ForeColor = Color.Black
        Else
            BtnInitializationAJ21.Text = "Force Initiate AJ21"
            If AJ21InitiatedTimer = InitilizationStart Or AJ21InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ21.ForeColor = Color.Red
                LblInitializationAJ21.Text = "AJ21 Is being prevented to initiate (" & AJ21InitiatedTimer & ")"
            Else
                LblInitializationAJ21.ForeColor = Color.Green
                LblInitializationAJ21.Text = "AJ21 Is still trying to initiate (" & AJ21InitiatedTimer & ")"
            End If
        End If
        If Initializations.AJ22Initiated = True Then
            BtnInitializationAJ22.Text = "Re-Initiate AJ22"
            LblInitializationAJ22.Text = "AJ22 Is fully initiated!"
            LblInitializationAJ22.ForeColor = Color.Black
        Else
            BtnInitializationAJ22.Text = "Force Initiate AJ22"
            If AJ22InitiatedTimer = InitilizationStart Or AJ22InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationAJ22.ForeColor = Color.Red
                LblInitializationAJ22.Text = "AJ22 Is being prevented to initiate (" & AJ22InitiatedTimer & ")"
            Else
                LblInitializationAJ22.ForeColor = Color.Green
                LblInitializationAJ22.Text = "AJ22 Is still trying to initiate (" & AJ22InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point5Initiated = True Then
            BtnInitializationPoint5.Text = "Re-Initiate Point5"
            LblInitializationPoint5.Text = "Point5 Is fully initiated!"
            LblInitializationPoint5.ForeColor = Color.Black
        Else
            BtnInitializationPoint5.Text = "Force Initiate Point5"
            If Point5InitiatedTimer = InitilizationStart Or Point5InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint5.ForeColor = Color.Red
                LblInitializationPoint5.Text = "Point5 Is being prevented to initiate (" & Point5InitiatedTimer & ")"
            Else
                LblInitializationPoint5.ForeColor = Color.Green
                LblInitializationPoint5.Text = "Point5 Is still trying to initiate (" & Point5InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point6Initiated = True Then
            BtnInitializationPoint6.Text = "Re-Initiate Point6"
            LblInitializationPoint6.Text = "Point6 Is fully initiated!"
            LblInitializationPoint6.ForeColor = Color.Black
        Else
            BtnInitializationPoint6.Text = "Force Initiate Point6"
            If Point6InitiatedTimer = InitilizationStart Or Point6InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint6.ForeColor = Color.Red
                LblInitializationPoint6.Text = "Point6 Is being prevented to initiate (" & Point6InitiatedTimer & ")"
            Else
                LblInitializationPoint6.ForeColor = Color.Green
                LblInitializationPoint6.Text = "Point6 Is still trying to initiate (" & Point6InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point10Initiated = True Then
            BtnInitializationPoint10.Text = "Re-Initiate Point10"
            LblInitializationPoint10.Text = "Point10 Is fully initiated!"
            LblInitializationPoint10.ForeColor = Color.Black
        Else
            BtnInitializationPoint10.Text = "Force Initiate Point10"
            If Point10InitiatedTimer = InitilizationStart Or Point10InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint10.ForeColor = Color.Red
                LblInitializationPoint10.Text = "Point10 Is being prevented to initiate (" & Point10InitiatedTimer & ")"
            Else
                LblInitializationPoint10.ForeColor = Color.Green
                LblInitializationPoint10.Text = "Point10 Is still trying to initiate (" & Point10InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point11Initiated = True Then
            BtnInitializationPoint11.Text = "Re-Initiate Point11"
            LblInitializationPoint11.Text = "Point11 Is fully initiated!"
            LblInitializationPoint11.ForeColor = Color.Black
        Else
            BtnInitializationPoint11.Text = "Force Initiate Point11"
            If Point11InitiatedTimer = InitilizationStart Or Point11InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint11.ForeColor = Color.Red
                LblInitializationPoint11.Text = "Point11 Is being prevented to initiate (" & Point11InitiatedTimer & ")"
            Else
                LblInitializationPoint11.ForeColor = Color.Green
                LblInitializationPoint11.Text = "Point11 Is still trying to initiate (" & Point11InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point12Initiated = True Then
            BtnInitializationPoint12.Text = "Re-Initiate Point12"
            LblInitializationPoint12.Text = "Point12 Is fully initiated!"
            LblInitializationPoint12.ForeColor = Color.Black
        Else
            BtnInitializationPoint12.Text = "Force Initiate Point12"
            If Point12InitiatedTimer = InitilizationStart Or Point12InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint12.ForeColor = Color.Red
                LblInitializationPoint12.Text = "Point12 Is being prevented to initiate (" & Point12InitiatedTimer & ")"
            Else
                LblInitializationPoint12.ForeColor = Color.Green
                LblInitializationPoint12.Text = "Point12 Is still trying to initiate (" & Point12InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point13Initiated = True Then
            BtnInitializationPoint13.Text = "Re-Initiate Point13"
            LblInitializationPoint13.Text = "Point13 Is fully initiated!"
            LblInitializationPoint13.ForeColor = Color.Black
        Else
            BtnInitializationPoint13.Text = "Force Initiate Point13"
            If Point13InitiatedTimer = InitilizationStart Or Point13InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint13.ForeColor = Color.Red
                LblInitializationPoint13.Text = "Point13 Is being prevented to initiate (" & Point13InitiatedTimer & ")"
            Else
                LblInitializationPoint13.ForeColor = Color.Green
                LblInitializationPoint13.Text = "Point13 Is still trying to initiate (" & Point13InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point14Initiated = True Then
            BtnInitializationPoint14.Text = "Re-Initiate Point14"
            LblInitializationPoint14.Text = "Point14 Is fully initiated!"
            LblInitializationPoint14.ForeColor = Color.Black
        Else
            BtnInitializationPoint14.Text = "Force Initiate Point14"
            If Point14InitiatedTimer = InitilizationStart Or Point14InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint14.ForeColor = Color.Red
                LblInitializationPoint14.Text = "Point14 Is being prevented to initiate (" & Point14InitiatedTimer & ")"
            Else
                LblInitializationPoint14.ForeColor = Color.Green
                LblInitializationPoint14.Text = "Point14 Is still trying to initiate (" & Point14InitiatedTimer & ")"
            End If
        End If
        If Initializations.Point19Initiated = True Then
            BtnInitializationPoint19.Text = "Re-Initiate Point19"
            LblInitializationPoint19.Text = "Point19 Is fully initiated!"
            LblInitializationPoint19.ForeColor = Color.Black
        Else
            BtnInitializationPoint19.Text = "Force Initiate Point19"
            If Point19InitiatedTimer = InitilizationStart Or Point19InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationPoint19.ForeColor = Color.Red
                LblInitializationPoint19.Text = "Point19 Is being prevented to initiate (" & Point19InitiatedTimer & ")"
            Else
                LblInitializationPoint19.ForeColor = Color.Green
                LblInitializationPoint19.Text = "Point19 Is still trying to initiate (" & Point19InitiatedTimer & ")"
            End If
        End If
        If Initializations.S11Initiated = True Then
            BtnInitializationS11.Text = "Re-Initiate S11"
            LblInitializationS11.Text = "S11 Is fully initiated!"
            LblInitializationS11.ForeColor = Color.Black
        Else
            BtnInitializationS11.Text = "Force Initiate S11"
            If S11InitiatedTimer = InitilizationStart Or S11InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationS11.ForeColor = Color.Red
                LblInitializationS11.Text = "S11 Is being prevented to initiate (" & S11InitiatedTimer & ")"
            Else
                LblInitializationS11.ForeColor = Color.Green
                LblInitializationS11.Text = "S11 Is still trying to initiate (" & S11InitiatedTimer & ")"
            End If
        End If
        If Initializations.S12Initiated = True Then
            BtnInitializationS12.Text = "Re-Initiate S12"
            LblInitializationS12.Text = "S12 Is fully initiated!"
            LblInitializationS12.ForeColor = Color.Black
        Else
            BtnInitializationS12.Text = "Force Initiate S12"
            If S12InitiatedTimer = InitilizationStart Or S12InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationS12.ForeColor = Color.Red
                LblInitializationS12.Text = "S12 Is being prevented to initiate (" & S12InitiatedTimer & ")"
            Else
                LblInitializationS12.ForeColor = Color.Green
                LblInitializationS12.Text = "S12 Is still trying to initiate (" & S12InitiatedTimer & ")"
            End If
        End If
        If Initializations.S14Initiated = True Then
            BtnInitializationS14.Text = "Re-Initiate S14"
            LblInitializationS14.Text = "S14 Is fully initiated!"
            LblInitializationS14.ForeColor = Color.Black
        Else
            BtnInitializationS14.Text = "Force Initiate S14"
            If S14InitiatedTimer = InitilizationStart Or S14InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationS14.ForeColor = Color.Red
                LblInitializationS14.Text = "S14 Is being prevented to initiate (" & S14InitiatedTimer & ")"
            Else
                LblInitializationS14.ForeColor = Color.Green
                LblInitializationS14.Text = "S14 Is still trying to initiate (" & S14InitiatedTimer & ")"
            End If
        End If
        If Initializations.S19Initiated = True Then
            BtnInitializationS19.Text = "Re-Initiate S19"
            LblInitializationS19.Text = "S19 Is fully initiated!"
            LblInitializationS19.ForeColor = Color.Black
        Else
            BtnInitializationS19.Text = "Force Initiate S19"
            If S19InitiatedTimer = InitilizationStart Or S19InitiatedTimer = InitilizationStart - 1 Then
                LblInitializationS19.ForeColor = Color.Red
                LblInitializationS19.Text = "S19 Is being prevented to initiate (" & S19InitiatedTimer & ")"
            Else
                LblInitializationS19.ForeColor = Color.Green
                LblInitializationS19.Text = "S19 Is still trying to initiate (" & S19InitiatedTimer & ")"
            End If
        End If
        If Initializations.SoundInitiated = True Then
            BtnInitializationSound.Text = "Re-Initiate Sound"
            LblInitializationSound.Text = "Sound Is fully initiated!"
            LblInitializationSound.ForeColor = Color.Black
        Else
            BtnInitializationSound.Text = "Force Initiate Sound"
            If SoundInitiatedTimer = InitilizationStart Or SoundInitiatedTimer = InitilizationStart - 1 Then
                LblInitializationSound.ForeColor = Color.Red
                LblInitializationSound.Text = "Sound Is being prevented to initiate (" & SoundInitiatedTimer & ")"
            Else
                LblInitializationSound.ForeColor = Color.Green
                LblInitializationSound.Text = "Sound Is still trying to initiate (" & SoundInitiatedTimer & ")"
            End If
        End If
        If Initializations.ButtonsInitiated = True Then
            BtnInitializationButtons.Text = "Re-Initiate Buttons"
            LblInitializationButtons.Text = "Buttons Is fully initiated!"
            LblInitializationButtons.ForeColor = Color.Black
        Else
            BtnInitializationButtons.Text = "Force Initiate Buttons"
            If ButtonsInitiatedTimer = InitilizationStart Or ButtonsInitiatedTimer = InitilizationStart - 1 Then
                LblInitializationButtons.ForeColor = Color.Red
                LblInitializationButtons.Text = "Buttons Is being prevented to initiate (" & ButtonsInitiatedTimer & ")"
            Else
                LblInitializationButtons.ForeColor = Color.Green
                LblInitializationButtons.Text = "Buttons Is still trying to initiate (" & ButtonsInitiatedTimer & ")"
            End If
        End If

    End Sub
    'Load Values
    Private Sub LoadValues()
        RuntimeConfig.LoadConfig()
        'Tunnel
        If RuntimeConfig.config.WestEndTunnel = "System" Then
            RDWestEndTunnelSetSystem.Checked = True
        ElseIf RuntimeConfig.config.WestEndTunnel = "Open" Then
            RDWestEndTunnelSetOpen.Checked = True
        ElseIf RuntimeConfig.config.WestEndTunnel = "Closed" Then
            RDWestEndTunnelSetClosed.Checked = True
        End If
        If RuntimeConfig.config.EastEndTunnel = "System" Then
            RDEastEndTunnelSetSystem.Checked = True
        ElseIf RuntimeConfig.config.EastEndTunnel = "Open" Then
            RDEastEndTunnelSetOpen.Checked = True
        ElseIf RuntimeConfig.config.EastEndTunnel = "Closed" Then
            RDEastEndTunnelSetClosed.Checked = True
        End If
        'Platform 1 combined
        If RuntimeConfig.config.P1Combine = True Then
            BtnCombineP1.Text = "Enabled"
        Else
            BtnCombineP1.Text = "Disabled"
        End If
        'Audio
        TxtboxDepartingP1SoundAmount.Text = RuntimeConfig.config.DepartingP1AmountOfClips
        TxtboxDepartingP2SoundAmount.Text = RuntimeConfig.config.DepartingP2AmountOfClips
        TxtboxArrivingP1SoundAmount.Text = RuntimeConfig.config.ArrivingP1AmountOfClips
        TxtboxArrivingP2SoundAmount.Text = RuntimeConfig.config.ArrivingP2AmountOfClips
        TxtboxSidingSoundAmount.Text = RuntimeConfig.config.SidingAmountOfClips
        TxtboxEventSoundAmount.Text = RuntimeConfig.config.EventAmountOfClips
        TxtboxSafetySoundAmount.Text = RuntimeConfig.config.SafetyAmountOfClips
        TxtboxAUX1SoundAmount.Text = RuntimeConfig.config.AUXSound1OfClips
        TxtboxAUX2SoundAmount.Text = RuntimeConfig.config.AUXSound2OfClips
        TxtboxAUX3SoundAmount.Text = RuntimeConfig.config.AUXSound3OfClips
        TxtboxEventSoundLoopTime.Text = RuntimeConfig.config.EventLoopTime
        TxtboxSafetySoundLoopTime.Text = RuntimeConfig.config.SafetyLoopTime


        'Lastly start normal timer.
        ConfigUpdateInfo.Enabled = True
    End Sub
    Private Sub BtnDepartingPlayP1_Click(sender As Object, e As EventArgs) Handles BtnDepartingPlayP1.Click
        Sound.TrainDepartingP1()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Train Deaprting P1)"
    End Sub
    Private Sub BtnDepartingPlayP2_Click(sender As Object, e As EventArgs) Handles BtnDepartingPlayP2.Click
        Sound.TrainDepartingP2()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Train Deaprting P2)"
    End Sub
    Private Sub BtnArrivingPlayP1_Click(sender As Object, e As EventArgs) Handles BtnArrivingPlayP1.Click
        Sound.TrainApprochingP1()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Train Approching P1)"
    End Sub
    Private Sub BtnArrivingPlayP2_Click(sender As Object, e As EventArgs) Handles BtnArrivingPlayP2.Click
        Sound.TrainApprochingP2()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Train Approching P2)"
    End Sub
    Private Sub BtnSidingPlay_Click(sender As Object, e As EventArgs) Handles BtnArrivingPlayP1.Click
        Sound.TrainEnteringSiding()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Train Entering Siding)"
    End Sub
    Private Sub BtnEventPlay_Click(sender As Object, e As EventArgs) Handles BtnArrivingPlayP2.Click
        Sound.EventSound()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Event Sound)"
    End Sub
    Private Sub BtnSafetyMessagePlay_Click(sender As Object, e As EventArgs) Handles BtnSafetyPlay.Click
        Sound.SafetySound()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Saftey Message)"
    End Sub
    Private Sub BtnAUX1Play_Click(sender As Object, e As EventArgs) Handles BtnAUX1Play.Click
        Sound.AUXSound1()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (AUX 1)"
    End Sub
    Private Sub BtnAUX2Play_Click(sender As Object, e As EventArgs) Handles BtnAUX2Play.Click
        Sound.AUXSound2()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (AUX 2)"
    End Sub
    Private Sub BtnAUX3Play_Click(sender As Object, e As EventArgs) Handles BtnAUX3Play.Click
        Sound.AUXSound3()
        'alarmsandNotifications.SystemEventLog = "Manually triggered (AUX 3)"
    End Sub
    Private Sub BtnBellTest_Click(sender As Object, e As EventArgs) Handles BtnBellTest.Click
        Bell = 5
        'alarmsandNotifications.SystemEventLog = "Manually triggered (Bell) for 5 seconds"
    End Sub
    Private Sub BtnDepartingP1Enabled_Click(sender As Object, e As EventArgs) Handles BtnDepartingP1Enabled.Click
        If RuntimeConfig.config.DepartingP1SoundEnabled = False Then
            RuntimeConfig.config.DepartingP1SoundEnabled = True
            BtnDepartingP1Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled Sound (Departing P1)"
        Else
            RuntimeConfig.config.DepartingP1SoundEnabled = False
            BtnDepartingP1Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled Sound (Departing P1)"
        End If
    End Sub
    Private Sub BtnDepartingP2Enabled_Click(sender As Object, e As EventArgs) Handles BtnDepartingP2Enabled.Click
        If RuntimeConfig.config.DepartingP2SoundEnabled = False Then
            RuntimeConfig.config.DepartingP2SoundEnabled = True
            BtnDepartingP2Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Departing P2)"
        Else
            RuntimeConfig.config.DepartingP2SoundEnabled = False
            BtnDepartingP2Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Departing P2)"
        End If
    End Sub
    Private Sub BtnArrivingP1Enabled_Click(sender As Object, e As EventArgs) Handles BtnArrivingP1Enabled.Click
        If RuntimeConfig.config.ArrivingP1SoundEnabled = False Then
            RuntimeConfig.config.ArrivingP1SoundEnabled = True
            BtnArrivingP1Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Arriving P1)"
        Else
            RuntimeConfig.config.ArrivingP1SoundEnabled = False
            BtnArrivingP1Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Arriving P1)"
        End If
    End Sub
    Private Sub BtnArrivingP2Enabled_Click(sender As Object, e As EventArgs) Handles BtnArrivingP2Enabled.Click
        If RuntimeConfig.config.ArrivingP2SoundEnabled = False Then
            RuntimeConfig.config.ArrivingP2SoundEnabled = True
            BtnArrivingP2Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Arriving P2)"
        Else
            RuntimeConfig.config.ArrivingP2SoundEnabled = False
            BtnArrivingP2Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Arriving P2)"
        End If
    End Sub
    Private Sub BtnSidingEnabled_Click(sender As Object, e As EventArgs) Handles BtnSidingEnabled.Click
        If RuntimeConfig.config.SidingSoundEnabled = False Then
            RuntimeConfig.config.SidingSoundEnabled = True
            BtnSidingEnabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Entering Siding)"
        Else
            RuntimeConfig.config.SidingSoundEnabled = False
            BtnSidingEnabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Entering Siding)"
        End If
    End Sub
    Private Sub BtnEventEnabled_Click(sender As Object, e As EventArgs) Handles BtnEventEnabled.Click
        If RuntimeConfig.config.EventSoundEnabled = False Then
            RuntimeConfig.config.EventSoundEnabled = True
            BtnEventEnabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Event)"
        Else
            RuntimeConfig.config.EventSoundEnabled = False
            BtnEventEnabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Event)"
        End If
    End Sub
    Private Sub BtnSafetyEnabled_Click(sender As Object, e As EventArgs) Handles BtnSafetyEnabled.Click
        If RuntimeConfig.config.SafetySoundEnabled = False Then
            RuntimeConfig.config.SafetySoundEnabled = True
            BtnSafetyEnabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (Safety message)"
        Else
            RuntimeConfig.config.SafetySoundEnabled = False
            BtnSafetyEnabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (Safety message)"
        End If
    End Sub
    Private Sub BtnAUX1Enabled_Click(sender As Object, e As EventArgs) Handles BtnAUX1Enabled.Click
        If RuntimeConfig.config.AUXSound1Enabled = False Then
            RuntimeConfig.config.AUXSound1Enabled = True
            BtnAUX1Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (AUX 1)"
        Else
            RuntimeConfig.config.AUXSound1Enabled = False
            BtnAUX1Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (AUX 1)"
        End If
    End Sub
    Private Sub BtnAUX2Enabled_Click(sender As Object, e As EventArgs) Handles BtnAUX2Enabled.Click
        If RuntimeConfig.config.AUXSound2Enabled = False Then
            RuntimeConfig.config.AUXSound2Enabled = True
            BtnAUX2Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (AUX 2)"
        Else
            RuntimeConfig.config.AUXSound2Enabled = False
            BtnAUX2Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (AUX 2)"
        End If
    End Sub
    Private Sub BtnAUX3Enabled_Click(sender As Object, e As EventArgs) Handles BtnAUX3Enabled.Click
        If RuntimeConfig.config.AUXSound3Enabled = False Then
            RuntimeConfig.config.AUXSound3Enabled = True
            BtnAUX3Enabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled sound (AUX 3)"
        Else
            RuntimeConfig.config.AUXSound3Enabled = False
            BtnAUX3Enabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled sound (AUX 3)"
        End If
    End Sub
    Private Sub BtnBellEnabled_Click(sender As Object, e As EventArgs) Handles BtnBellEnabled.Click
        If RuntimeConfig.config.BellEnabled = False Then
            RuntimeConfig.config.BellEnabled = True
            BtnBellEnabled.Text = "Enabled"
            'alarmsandNotifications.SystemEventLog = "Enabled the bell"
        Else
            RuntimeConfig.config.BellEnabled = False
            BtnBellEnabled.Text = "Disabled"
            'alarmsandNotifications.SystemEventLog = "Disabled the bell"
        End If
    End Sub
    Private Sub TxtboxDepartingP1SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxDepartingP1SoundAmount.TextChanged
        RuntimeConfig.config.DepartingP1AmountOfClips = TxtboxDepartingP1SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Departing P1) to " & TxtboxDepartingP1SoundAmount.Text
    End Sub
    Private Sub TxtboxDepartingP2SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxDepartingP2SoundAmount.TextChanged
        RuntimeConfig.config.DepartingP2AmountOfClips = TxtboxDepartingP2SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Departing P2) to " & TxtboxDepartingP2SoundAmount.Text
    End Sub
    Private Sub TxtboxArrivingP1SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxArrivingP1SoundAmount.TextChanged
        RuntimeConfig.config.ArrivingP1AmountOfClips = TxtboxArrivingP1SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Arriving P1) to " & TxtboxArrivingP1SoundAmount.Text
    End Sub
    Private Sub TxtboxArrivingP2SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxArrivingP2SoundAmount.TextChanged
        RuntimeConfig.config.ArrivingP2AmountOfClips = TxtboxArrivingP2SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Arriving P2) to " & TxtboxArrivingP2SoundAmount.Text
    End Sub
    Private Sub TxtboxSidingSoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxSidingSoundAmount.TextChanged
        RuntimeConfig.config.SidingAmountOfClips = TxtboxSidingSoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Entering siding) to " & TxtboxSidingSoundAmount.Text
    End Sub
    Private Sub TxtboxEventSoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxEventSoundAmount.TextChanged
        RuntimeConfig.config.EventAmountOfClips = TxtboxEventSoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Event) to " & TxtboxEventSoundAmount.Text
    End Sub
    Private Sub TxtboxSafetySoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxSafetySoundAmount.TextChanged
        RuntimeConfig.config.SafetyAmountOfClips = TxtboxSafetySoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (Safety Message) to " & TxtboxSafetySoundAmount.Text
    End Sub
    Private Sub TxtboxAUX1SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxAUX1SoundAmount.TextChanged
        RuntimeConfig.config.AUXSound1OfClips = TxtboxAUX1SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (AUX 1) to " & TxtboxAUX1SoundAmount.Text
    End Sub
    Private Sub TxtboxAUX2SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxAUX2SoundAmount.TextChanged
        RuntimeConfig.config.AUXSound2OfClips = TxtboxAUX2SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (AUX 2) to " & TxtboxAUX2SoundAmount.Text
    End Sub
    Private Sub TxtboxAUX3SoundAmount_TextChanged(sender As Object, e As EventArgs) Handles TxtboxAUX3SoundAmount.TextChanged
        RuntimeConfig.config.AUXSound3OfClips = TxtboxAUX3SoundAmount.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of sounds for (AUX 3) to " & TxtboxAUX3SoundAmount.Text
    End Sub
    Private Sub TxtboxEventSoundLoopTime_TextChanged(sender As Object, e As EventArgs) Handles TxtboxEventSoundLoopTime.TextChanged
        RuntimeConfig.config.EventLoopTime = TxtboxEventSoundLoopTime.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of secound for the sound to loop (Event) to " & TxtboxEventSoundLoopTime.Text
    End Sub
    Private Sub TxtboxSafetySoundLoopTime_TextChanged(sender As Object, e As EventArgs) Handles TxtboxSafetySoundLoopTime.TextChanged
        RuntimeConfig.config.SafetyLoopTime = TxtboxSafetySoundLoopTime.Text
        'alarmsandNotifications.SystemEventLog = "Adjusted amount of secound for the sound to loop (Safety Message) to " & TxtboxSafetySoundLoopTime.Text
    End Sub
    'Save settings
    Private Sub Save_Tick(sender As Object, e As EventArgs) Handles Save.Tick
        RuntimeConfig.Save()
    End Sub
    'Air controls
    Private Sub BtnDisableAir_Click(sender As Object, e As EventArgs) Handles BtnDisableAir.Click
        If RuntimeConfig.config.AirEnabled = True Then
            RuntimeConfig.config.AirEnabled = False
            RuntimeConfig.config.ForceAir = False
            'alarmsandNotifications.SystemEventLog = "Overall air was disabled "
        Else
            RuntimeConfig.config.AirEnabled = True
            'alarmsandNotifications.SystemEventLog = "Overall air was enabled "
        End If
    End Sub
    Private Sub BtnForceEnableAir_Click(sender As Object, e As EventArgs) Handles BtnForceEnableAir.Click
        If RuntimeConfig.config.ForceAir = True Then
            RuntimeConfig.config.ForceAir = False
            'alarmsandNotifications.SystemEventLog = "Force Air was disabled "
        Else
            RuntimeConfig.config.ForceAir = True
            'alarmsandNotifications.SystemEventLog = "Force Air was enabled "
        End If
    End Sub
    Private Sub BtnEngineeringMode_Click(sender As Object, e As EventArgs)
        'alarmsandNotifications.EngineerMode()
    End Sub
    'Initializations
    Private Sub BtnInitializationAJ1_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ1.Click
        If Initializations.AJ1Initiated = True Then
            Initializations.AJ1Initiated = False
            AJ1InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ1 Has been manually re-initiated "
        Else
            AJ1InitiatedTimer = 0
            Initializations.AJ1Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ1 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ2_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ2.Click
        If Initializations.AJ2Initiated = True Then
            Initializations.AJ2Initiated = False
            AJ2InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ2 Has been manually re-initiated "
        Else
            AJ2InitiatedTimer = 0
            Initializations.AJ2Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ2 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ3_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ3.Click
        If Initializations.AJ3Initiated = True Then
            Initializations.AJ3Initiated = False
            AJ3InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ3 Has been manually re-initiated "
        Else
            AJ3InitiatedTimer = 0
            Initializations.AJ3Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ3 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ4_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ4.Click
        If Initializations.AJ4Initiated = True Then
            Initializations.AJ4Initiated = False
            AJ4InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ4 Has been manually re-initiated "
        Else
            AJ4InitiatedTimer = 0
            Initializations.AJ4Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ4 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ7_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ7.Click
        If Initializations.AJ7Initiated = True Then
            Initializations.AJ7Initiated = False
            AJ7InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ7 Has been manually re-initiated "
        Else
            AJ7InitiatedTimer = 0
            Initializations.AJ7Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ7 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ8_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ8.Click
        If Initializations.AJ8Initiated = True Then
            Initializations.AJ8Initiated = False
            AJ8InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ8 Has been manually re-initiated "
        Else
            AJ8InitiatedTimer = 0
            Initializations.AJ8Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ8 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ9_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ9.Click
        If Initializations.AJ9Initiated = True Then
            Initializations.AJ9Initiated = False
            AJ9InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ9 Has been manually re-initiated "
        Else
            AJ9InitiatedTimer = 0
            Initializations.AJ9Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ9 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ15_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ15.Click
        If Initializations.AJ15Initiated = True Then
            Initializations.AJ15Initiated = False
            AJ15InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ15 Has been manually re-initiated "
        Else
            AJ15InitiatedTimer = 0
            Initializations.AJ15Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ15 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ16_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ16.Click
        If Initializations.AJ16Initiated = True Then
            Initializations.AJ16Initiated = False
            AJ16InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ16 Has been manually re-initiated "
        Else
            AJ16InitiatedTimer = 0
            Initializations.AJ16Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ16 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ17_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ17.Click
        If Initializations.AJ17Initiated = True Then
            Initializations.AJ17Initiated = False
            AJ17InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ17 Has been manually re-initiated "
        Else
            AJ17InitiatedTimer = 0
            Initializations.AJ17Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ17 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ18_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ18.Click
        If Initializations.AJ18Initiated = True Then
            Initializations.AJ18Initiated = False
            AJ18InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ18 Has been manually re-initiated "
        Else
            AJ18InitiatedTimer = 0
            Initializations.AJ18Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ18 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ21_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ21.Click
        If Initializations.AJ21Initiated = True Then
            Initializations.AJ21Initiated = False
            AJ21InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ21 Has been manually re-initiated "
        Else
            AJ21InitiatedTimer = 0
            Initializations.AJ21Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ21 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationAJ22_Click(sender As Object, e As EventArgs) Handles BtnInitializationAJ22.Click
        If Initializations.AJ22Initiated = True Then
            Initializations.AJ22Initiated = False
            AJ22InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "AJ22 Has been manually re-initiated "
        Else
            AJ22InitiatedTimer = 0
            Initializations.AJ22Initiated = True
            'alarmsandNotifications.SystemEventLog = "AJ22 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint5_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint5.Click
        If Initializations.Point5Initiated = True Then
            Initializations.Point5Initiated = False
            Point5InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point5 Has been manually re-initiated "
        Else
            Point5InitiatedTimer = 0
            Initializations.Point5Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point5 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint6_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint6.Click
        If Initializations.Point6Initiated = True Then
            Initializations.Point6Initiated = False
            Point6InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point6 Has been manually re-initiated "
        Else
            Point6InitiatedTimer = 0
            Initializations.Point6Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point6 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint10_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint10.Click
        If Initializations.Point10Initiated = True Then
            Initializations.Point10Initiated = False
            Point10InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point10 Has been manually re-initiated "
        Else
            Point10InitiatedTimer = 0
            Initializations.Point10Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point10 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint11_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint11.Click
        If Initializations.Point11Initiated = True Then
            Initializations.Point11Initiated = False
            Point11InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point11 Has been manually re-initiated "
        Else
            Point11InitiatedTimer = 0
            Initializations.Point11Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point11 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint12_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint12.Click
        If Initializations.Point12Initiated = True Then
            Initializations.Point12Initiated = False
            Point12InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point12 Has been manually re-initiated "
        Else
            Point12InitiatedTimer = 0
            Initializations.Point12Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point12 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint13_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint13.Click
        If Initializations.Point13Initiated = True Then
            Initializations.Point13Initiated = False
            Point13InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point13 Has been manually re-initiated "
        Else
            Point13InitiatedTimer = 0
            Initializations.Point13Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point13 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint14_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint14.Click
        If Initializations.Point14Initiated = True Then
            Initializations.Point14Initiated = False
            Point14InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point14 Has been manually re-initiated "
        Else
            Point14InitiatedTimer = 0
            Initializations.Point14Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point14 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationPoint19_Click(sender As Object, e As EventArgs) Handles BtnInitializationPoint19.Click
        If Initializations.Point19Initiated = True Then
            Initializations.Point19Initiated = False
            Point19InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Point19 Has been manually re-initiated "
        Else
            Point19InitiatedTimer = 0
            Initializations.Point19Initiated = True
            'alarmsandNotifications.SystemEventLog = "Point19 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationS11_Click(sender As Object, e As EventArgs) Handles BtnInitializationS11.Click
        If Initializations.S11Initiated = True Then
            Initializations.S11Initiated = False
            S11InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "S11 Has been manually re-initiated "
        Else
            S11InitiatedTimer = 0
            Initializations.S11Initiated = True
            'alarmsandNotifications.SystemEventLog = "S11 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationS12_Click(sender As Object, e As EventArgs) Handles BtnInitializationS12.Click
        If Initializations.S12Initiated = True Then
            Initializations.S12Initiated = False
            S12InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "S12 Has been manually re-initiated "
        Else
            S12InitiatedTimer = 0
            Initializations.S12Initiated = True
            'alarmsandNotifications.SystemEventLog = "S12 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationS14_Click(sender As Object, e As EventArgs) Handles BtnInitializationS14.Click
        If Initializations.S14Initiated = True Then
            Initializations.S14Initiated = False
            S14InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "S14 Has been manually re-initiated "
        Else
            S14InitiatedTimer = 0
            Initializations.S14Initiated = True
            'alarmsandNotifications.SystemEventLog = "S14 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationS19_Click(sender As Object, e As EventArgs) Handles BtnInitializationS19.Click
        If Initializations.S19Initiated = True Then
            Initializations.S19Initiated = False
            S19InitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "S19 Has been manually re-initiated "
        Else
            S19InitiatedTimer = 0
            Initializations.S19Initiated = True
            'alarmsandNotifications.SystemEventLog = "S19 has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationSound_Click(sender As Object, e As EventArgs) Handles BtnInitializationSound.Click
        If Initializations.SoundInitiated = True Then
            Initializations.SoundInitiated = False
            SoundInitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Sound Has been manually re-initiated "
        Else
            SoundInitiatedTimer = 0
            Initializations.SoundInitiated = True
            'alarmsandNotifications.SystemEventLog = "Sound has been forced initiated "
        End If
    End Sub
    Private Sub BtnInitializationButtons_Click(sender As Object, e As EventArgs) Handles BtnInitializationButtons.Click
        If Initializations.ButtonsInitiated = True Then
            Initializations.ButtonsInitiated = False
            ButtonsInitiatedTimer = InitilizationStart
            'alarmsandNotifications.SystemEventLog = "Buttons Has been manually re-initiated "
        Else
            ButtonsInitiatedTimer = 0
            Initializations.ButtonsInitiated = True
            'alarmsandNotifications.SystemEventLog = "Buttons has been forced initiated "
        End If
    End Sub
    Private Sub BtnSetWestbound_Click(sender As Object, e As EventArgs) Handles BtnSetWestbound.Click
        RuntimeConfig.config.DirectionOveride = "Westbound"
    End Sub
    Private Sub BtnSetSystem_Click(sender As Object, e As EventArgs) Handles BtnSetSystem.Click
        RuntimeConfig.config.DirectionOveride = "Auto"
    End Sub
    Private Sub BtnSetEastbound_Click(sender As Object, e As EventArgs) Handles BtnSetEastbound.Click
        RuntimeConfig.config.DirectionOveride = "Eastbound"
    End Sub
    Private Sub BtnAddTrainSectionI_Click(sender As Object, e As EventArgs)
        AIStart.AISectionNOccupie = True
    End Sub
    Private Sub BtnAIEnable_Click(sender As Object, e As EventArgs)
        If RuntimeConfig.config.AIEnabled = False Then
            RuntimeConfig.config.AIEnabled = True
        Else
            RuntimeConfig.config.AIEnabled = False
        End If
    End Sub
    Private Sub BtnCombineP1_Click(sender As Object, e As EventArgs) Handles BtnCombineP1.Click
        If RuntimeConfig.config.P1Combine = True Then
            RuntimeConfig.config.P1Combine = False
            BtnCombineP1.Text = "Disabled"
        Else
            RuntimeConfig.config.P1Combine = True
            BtnCombineP1.Text = "Enabled"
        End If
    End Sub
    Private Sub CBAllowAudio_CheckedChanged(sender As Object, e As EventArgs) Handles CBAllowAudio.CheckedChanged
        AllowAudio = CBAllowAudio.CheckState
    End Sub
    Private Sub CBAllowDeparting_CheckedChanged(sender As Object, e As EventArgs) Handles CBAllowDeparting.CheckedChanged
        AllowDeparting = CBAllowDeparting.CheckState
    End Sub
    Private Sub BtnR3_Click(sender As Object, e As EventArgs) Handles BtnR3.Click
        Sound.R3Play()
    End Sub
    Private Sub BtnR2_Click(sender As Object, e As EventArgs) Handles BtnR2.Click
        Sound.R2Play()
    End Sub
    Private Sub BtnR1_Click(sender As Object, e As EventArgs) Handles BtnR1.Click
        Sound.R1Play()
    End Sub
    Private Sub CBAllowModeInput_CheckedChanged(sender As Object, e As EventArgs)

    End Sub
    Private Sub BtnModeComputer_Click(sender As Object, e As EventArgs)
        RuntimeConfig.config.Mode = "Computer"
    End Sub
    Private Sub BtnModeExternal_Click(sender As Object, e As EventArgs)
        RuntimeConfig.config.Mode = "External"
    End Sub
    Private Sub BtnModeManual_Click(sender As Object, e As EventArgs)
        RuntimeConfig.config.Mode = "Manual"
    End Sub
    Private Sub CBmanualStationStartedRequestRequired_CheckedChanged(sender As Object, e As EventArgs) Handles CBmanualStationStartedRequestRequired.CheckedChanged
        RequireButtonInputToClearSignal = CBmanualStationStartedRequestRequired.CheckState
    End Sub
    'Tunnel
    Private Sub RDEastEndTunnelSetOpen_CheckedChanged(sender As Object, e As EventArgs) Handles RDEastEndTunnelSetOpen.CheckedChanged
        RuntimeConfig.config.EastEndTunnel = "Open"
    End Sub
    Private Sub RDEastEndTunnelSetSystem_CheckedChanged(sender As Object, e As EventArgs) Handles RDEastEndTunnelSetSystem.CheckedChanged
        RuntimeConfig.config.EastEndTunnel = "System"
    End Sub
    Private Sub RDEastEndTunnelSetClosed_CheckedChanged(sender As Object, e As EventArgs) Handles RDEastEndTunnelSetClosed.CheckedChanged
        RuntimeConfig.config.EastEndTunnel = "Closed"
    End Sub
    Private Sub RDWestEndTunnelSetOpen_CheckedChanged(sender As Object, e As EventArgs) Handles RDWestEndTunnelSetOpen.CheckedChanged
        RuntimeConfig.config.WestEndTunnel = "Open"
    End Sub
    Private Sub RDWestEndTunnelSetSystem_CheckedChanged(sender As Object, e As EventArgs) Handles RDWestEndTunnelSetSystem.CheckedChanged
        RuntimeConfig.config.WestEndTunnel = "System"
    End Sub
    Private Sub RDWestEndTunnelSetClosed_CheckedChanged(sender As Object, e As EventArgs) Handles RDWestEndTunnelSetClosed.CheckedChanged
        RuntimeConfig.config.WestEndTunnel = "Closed"
    End Sub

End Class
```


-------------------------------

Updated on 2022-11-16 at 15:02:29 +0000
