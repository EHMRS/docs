---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/Main.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Misc/Main.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[Main](/SignallingSystem-doc/mainsystem/Classes/classMain/)**  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[Threading](/SignallingSystem-doc/mainsystem/Files/Main_8vb/#variable-threading)**  |



## Attributes Documentation

### variable Threading

```csharp
﻿using System. Threading;
```



## Source code

```csharp
Imports System.Threading
Imports System.IO
Public Class Main
    Public Path As String
    Public Shared testModeCount As Integer = 0
    Public Shared MimicBoardImagePath As String
    Public Shared FrameImagePath As String
    Public Shared SoundFile As String
    Public Shared ConfigimagesPath As String
    Public Shared ModernDisplayPath As String
    Private AnalogIOTimer As Threading.Timer
    'MainLogic threads
    Private MainLogicLogicThread As Threading.Timer
    Private MainLogicSecondThread As Threading.Timer
    'Points threads
    Private PointsLogicThread As Threading.Timer
    Private PointsSecondThread As Threading.Timer
    'Signals threads
    Private SignalsLogicThread As Threading.Timer
    Private SignalsSecondThread As Threading.Timer
    'Levers threads
    Private LeversLogicThread As Threading.Timer
    Private LeversSecondThread As Threading.Timer
    'Track Sections threads
    Private TrackSectionsLogicThread As Threading.Timer
    Private TrackSectionsSecondThread As Threading.Timer
    'ProxySensors threads
    Private ErrorLogicThread As Threading.Timer
    Private LineSideLogicThread As Threading.Timer
    'Sounds threads
    Private SoundsLogicThread As Threading.Timer
    Private SoundsSecondThread As Threading.Timer
    'Buttons threads
    Private ButtonsLogicThread As Threading.Timer
    Private ButtonsLogicIndicatorsThread As Threading.Timer
    Private ButtonsSecondThread As Threading.Timer
    'FrameDisplays threads
    Private FrameDisplaysLogicThread As Threading.Timer
    Private FrameDisplaysSecondThread As Threading.Timer
    'Json threads
    Private JsonDisplayLogicThread As Threading.Timer
    ' Update Checker
    Private UpdateCheckThread As Threading.Timer

    Public HasUpdate As Boolean = False
    'Close the software
    Private Sub ToolStripMenuClose_Click(sender As Object, e As EventArgs) Handles ToolStripMenuClose.Click
        RuntimeConfig.Save()
        'Serial.SerialClose()
        Me.Close() 'Exits the software
    End Sub
    'Run when closing software
    Private Sub Main_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        Sound.StopAudioThread()
        AppServer.EndThreadTCP()
        'Serial.SerialClose()
        SerialPixelLeds.SerialClose()
        AppServer.StopThread()
        PopUpConfig.Close()
        PopUpConfig.Dispose()
        RuntimeConfig.Save()
        Me.AnalogIOTimer.Change(Timeout.Infinite, Timeout.Infinite)
        Me.MainLogicLogicThread.Dispose()
        Me.MainLogicSecondThread.Dispose()
        Me.PointsLogicThread.Dispose()
        Me.PointsLogicThread.Dispose()
        Me.SignalsLogicThread.Dispose()
        Me.SignalsSecondThread.Dispose()
        Me.LeversLogicThread.Dispose()
        Me.LeversSecondThread.Dispose()
        Me.TrackSectionsLogicThread.Dispose()
        Me.TrackSectionsSecondThread.Dispose()
        Me.ErrorLogicThread.Dispose()
        Me.LineSideLogicThread.Dispose()
        Me.SoundsLogicThread.Dispose()
        Me.SoundsSecondThread.Dispose()
        Me.ButtonsLogicThread.Dispose()
        Me.ButtonsLogicIndicatorsThread.Dispose()
        Me.ButtonsSecondThread.Dispose()
        Me.FrameDisplaysLogicThread.Dispose()
        Me.FrameDisplaysSecondThread.Dispose()
        Me.SoundsLogicThread.Dispose()
        Me.UpdateCheckThread.Dispose()
        Me.Dispose()
    End Sub
    'Run when form first loads
    Private Sub Main_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        GlobalConfig.loadConfig()
        RuntimeConfig.LoadConfig()
        SignallingMqtt.Client.initialise()
        Sound.StartAudioThread()
        'Serial.StartThread()
        If GlobalConfig.config.FrameLights Then
            SerialPixelLeds.StartThread()
        End If
        AlarmsAndNotifications.UpdateSystemLog("---------SOFTWARE STARTED AFTER UPDATE OR REBOOT.---------")
        AppServer.StartThreadTCP()
        RuntimeConfig.Upgrade()
        Signals.initialise()
        Points.initialise()
        Buttons.initialise()
        Power.initialise()
        Safety.initialise()
        Levers.initialise()
        LogicStart.initialise()
        Path = GlobalConfig.config.MediaPath
        MimicBoardImagePath = Path + "\Images\MimicBoard\"
        FrameImagePath = Path + "\Images\Frame\"
        SoundFile = Path + "\Sound\"
        ModernDisplayPath = Path + "\ModernDisplay\"
        ConfigimagesPath = Path + "\Configimages\"

        If Not File.Exists("C:\SignallingSystem\Updater\Signalling-Updater.exe") Then
            GroupBox3.Visible = False
            HasUpdate = False
        End If
        Dim localVersion As System.UInt64
        If Application.ProductVersion.IndexOf("-") = -1 Then
            Console.Error.WriteLine("Unable to find suffix version")
            lblCurrentVersion.Text = "ERROR"
        Else
            localVersion = Convert.ToUInt64(Application.ProductVersion.Substring(Application.ProductVersion.IndexOf("-") + 1))
            lblCurrentVersion.Text = localVersion
        End If

        lblRemoteVersion.Text = ""
        btnCheckUpdate.PerformClick()


        'Me.WindowState = FormWindowState.Minimized
        Me.AnalogIOTimer = New Threading.Timer(AddressOf TickAnalogIO, Nothing, CInt(AnalogIOTimerValue), CInt(AnalogIOTimerValue))

        'MainLogic threads
        Me.MainLogicLogicThread = New Threading.Timer(AddressOf MainLogicLogicThreadCall, Nothing, CInt(MainLogicLogicThreadValue), CInt(MainLogicLogicThreadValue))
        Me.MainLogicSecondThread = New Threading.Timer(AddressOf MainLogicSecondThreadCall, Nothing, CInt(MainLogicSecondThreadValue), CInt(MainLogicSecondThreadValue))
        'Points threads
        Me.PointsLogicThread = New Threading.Timer(AddressOf PointsLogicThreadCall, Nothing, CInt(PointsLogicThreadValue), CInt(PointsLogicThreadValue))
        Me.PointsSecondThread = New Threading.Timer(AddressOf PointsSecondThreadCall, Nothing, CInt(PointsSecondThreadValue), CInt(PointsSecondThreadValue))
        'Signals threads
        Me.SignalsLogicThread = New Threading.Timer(AddressOf SignalsLogicThreadCall, Nothing, CInt(SignalsLogicThreadValue), CInt(SignalsLogicThreadValue))
        Me.SignalsSecondThread = New Threading.Timer(AddressOf SignalsSecondThreadCall, Nothing, CInt(SignalsSecondThreadValue), CInt(SignalsSecondThreadValue))
        'Levers threads
        Me.LeversLogicThread = New Threading.Timer(AddressOf LeversLogicThreadCall, Nothing, CInt(LeversLogicThreadValue), CInt(LeversLogicThreadValue))
        Me.LeversSecondThread = New Threading.Timer(AddressOf LeversSecondThreadCall, Nothing, CInt(LeversSecondThreadValue), CInt(LeversSecondThreadValue))
        'Track Sections threads
        Me.TrackSectionsLogicThread = New Threading.Timer(AddressOf TrackSectionsLogicThreadCall, Nothing, CInt(TrackSectionsLogicThreadValue), CInt(TrackSectionsLogicThreadValue))
        Me.TrackSectionsSecondThread = New Threading.Timer(AddressOf TrackSectionsSecondThreadCall, Nothing, CInt(TrackSectionsSecondThreadValue), CInt(TrackSectionsSecondThreadValue))
        'Error Logic threads
        Me.ErrorLogicThread = New Threading.Timer(AddressOf ErrorLogicThreadCall, Nothing, CInt(ErrorLogicThreadValue), CInt(ErrorLogicThreadValue))
        'LineSide
        Me.LineSideLogicThread = New Threading.Timer(AddressOf LineSideLogicThreadCall, Nothing, CInt(LineSideLogicThreadValue), CInt(LineSideLogicThreadValue))
        'Sounds threads
        Me.SoundsLogicThread = New Threading.Timer(AddressOf SoundsLogicThreadCall, Nothing, CInt(SoundsLogicThreadValue), CInt(SoundsLogicThreadValue))
        Me.SoundsSecondThread = New Threading.Timer(AddressOf SoundsSecondThreadCall, Nothing, CInt(SoundsSecondThreadValue), CInt(SoundsSecondThreadValue))
        'Buttons threads
        Me.ButtonsLogicThread = New Threading.Timer(AddressOf ButtonsLogicThreadCall, Nothing, CInt(ButtonsLogicThreadValue), CInt(ButtonsLogicThreadValue))
        Me.ButtonsLogicIndicatorsThread = New Threading.Timer(AddressOf ButtonsLogicIndicatorsThreadCall, Nothing, CInt(ButtonsLogicIndicatorsThreadValue), CInt(ButtonsLogicIndicatorsThreadValue))
        Me.ButtonsSecondThread = New Threading.Timer(AddressOf ButtonsSecondThreadCall, Nothing, CInt(ButtonsSecondThreadValue), CInt(ButtonsSecondThreadValue))
        'FrameDisplays threads
        Me.FrameDisplaysLogicThread = New Threading.Timer(AddressOf FrameDisplaysLogicThreadCall, Nothing, CInt(FrameDisplaysLogicThreadValue), CInt(FrameDisplaysLogicThreadValue))
        Me.FrameDisplaysSecondThread = New Threading.Timer(AddressOf FrameDisplaysSecondThreadCall, Nothing, CInt(FrameDisplaysSecondThreadValue), CInt(FrameDisplaysSecondThreadValue))
        'Json Display thread
        Me.JsonDisplayLogicThread = New Threading.Timer(AddressOf JsonDisplayLogicThreadCall, Nothing, CInt(JsonDisplayThreadValue), CInt(JsonDisplayThreadValue))
        'Update Check thread
        Me.UpdateCheckThread = New Threading.Timer(AddressOf UpdateCheckThreadCall, Nothing, CInt(UpdateCheckThreadValue), CInt(UpdateCheckThreadValue))

        Me.MinimizeBox = True
        Me.SendToBack()
    End Sub
    Private Sub SystemTime_Tick(sender As Object, e As EventArgs) Handles SystemTime.Tick
        'display current system time.
        ToolStripStatusLabelTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy,  hh:mm:ss")
        'ModernDisplay.LableTime.Text = DateTime.Now.ToString("HH:mm:ss")

        If SignallingMqtt.Client.connected Then
            lblMqtt.Text = "Connected"
        ElseIf SignallingMqtt.Client.connecting Then
            lblMqtt.Text = "Connecting"
        Else
            lblMqtt.Text = "Disconnected"
        End If
    End Sub
    Private Sub SerialCount_Tick(sender As Object, e As EventArgs) Handles SerialCount.Tick
        Serial.SerialCount = 0
    End Sub
    Private Sub AuxTimer_Tick(sender As Object, e As EventArgs) Handles AuxTimer.Tick
        'Restart software
        Dim now = DateTime.Now
        Dim date1 = New DateTime(now.Year, now.Month, now.Day, 6, 0, 0)
        If now = date1 Then
            RuntimeConfig.Save()
            'System.Windows.Forms.Application.Restart()
        End If
        If EastBound = True Then
            LableDirection.Text = "Direction : EastBound"
            LableDirection.BackColor = Color.Transparent
        ElseIf WestBound = True Then
            LableDirection.Text = "Direction : WestBound"
            LableDirection.BackColor = Color.Transparent
        Else
            LableDirection.Text = "Direction : Unknown"
            LableDirection.BackColor = Color.Red
        End If
        If Mode = "Computer" Then
            LabelMode.Text = "Mode : Computer"
            LabelMode.BackColor = Color.Transparent
        ElseIf Mode = "Manual" Then
            LabelMode.Text = "Mode : Manual"
            LabelMode.BackColor = Color.Transparent
        Else
            LabelMode.Text = "Mode : Unknown"
            LabelMode.BackColor = Color.Red
        End If
        If LoggedInAccessLevel > 0 Then
            LblUserName.Text = ("UserName :" & LoggedInUserName & " (" & LoggedInAccessLevel & ")")
        Else
            LblUserName.Text = ("UserName :")
        End If
        If LoggedInAccessLevel >= 3 Then
            GroupBox2.Enabled = True
            ToolStripMenuConfigurations.Enabled = True
            UpdateSoftwareToolStripMenuItem.Enabled = HasUpdate
            ToolStripMenuClose.Enabled = True
        Else
            GroupBox2.Enabled = False
            ToolStripMenuConfigurations.Enabled = False
            UpdateSoftwareToolStripMenuItem.Enabled = False
            ToolStripMenuClose.Enabled = False
        End If
    End Sub
    Private Sub TickAnalogIO(ByVal state As Object)
        AnalogIOManager.Logic()
    End Sub
    Private Sub SystemTick_Tick(sender As Object, e As EventArgs) Handles SystemTick.Tick
        'PlaySound()
    End Sub
    'Threads for main logic
    Private Sub MainLogicLogicThreadCall(ByVal state As Object)
        LogicStart.MainStartLogic()
        Safety.Logic()
        SignalBackLockLogic()
        Errors.checkRequests()
    End Sub
    Private Sub MainLogicSecondThreadCall(ByVal state As Object)
        PowerLogic()
        SignalBackLockLogicSecoundTick()
        UserManagmentSecoundTick()
        Safety.AirSafety()
    End Sub
    'Threads for points
    Private Sub PointsLogicThreadCall(ByVal state As Object)
        Points.Points()
    End Sub
    Private Sub PointsSecondThreadCall(ByVal state As Object)
        Points.SecondTick()
    End Sub
    'Threads for Signals
    Private Sub SignalsLogicThreadCall(ByVal state As Object)
        Signals.Signals()
    End Sub
    Private Sub SignalsSecondThreadCall(ByVal state As Object)
        Signals.SecondTick()
        Initializations.SecondTick()
    End Sub
    'Threads for Levers
    Private Sub LeversLogicThreadCall(ByVal state As Object)
        Levers.LeversLogic()
    End Sub
    Private Sub LeversSecondThreadCall(ByVal state As Object)
        Levers.SecondTick()
    End Sub
    'Threads for ProxySensors
    Private Sub ErrorLogicThreadCall(ByVal state As Object)
        Errors.DisplayErrorLogic()
        Errors.DisplayRequestLogic()
    End Sub
    Private Sub LineSideLogicThreadCall(ByVal state As Object)
        LineSide.LineSideLogic()
    End Sub
    'Threads for Track sections
    Private Sub TrackSectionsLogicThreadCall(ByVal state As Object)
        TrackSections.Logic()
        PointSections.Logic()
    End Sub
    Private Sub TrackSectionsSecondThreadCall(ByVal state As Object)
        TrackSections.SecondTick()
        PointSections.SecondTick()
        AIStart.AIStart()
    End Sub
    'Threads for sounds
    Private Sub SoundsLogicThreadCall(ByVal state As Object)
    End Sub
    Private Sub SoundsSecondThreadCall(ByVal state As Object)
        Sound.SecondTick()
    End Sub
    'Threads for buttons
    Private Sub ButtonsLogicThreadCall(ByVal state As Object)
        Buttons.ButtonsLogic()
    End Sub
    Private Sub ButtonsLogicIndicatorsThreadCall(ByVal state As Object)
        Buttons.ButtonIndicators()
        Fuses.FuseLogic()
    End Sub
    Private Sub ButtonsSecondThreadCall(ByVal state As Object)
        Buttons.SecondTick()
    End Sub
    'Threads for FrameDisplays
    Private Sub FrameDisplaysLogicThreadCall(ByVal state As Object)
        MimicDiagram.MimicDiagram()
        FrameIndicatorLights.FrameIndicatorLights()
    End Sub
    Private Sub FrameDisplaysSecondThreadCall(ByVal state As Object)
        MimicDiagram.Flash()
        FrameIndicatorLights.Flash()
        Json_Values.Flash()
    End Sub
    Private Sub JsonDisplayLogicThreadCall(ByVal state As Object)
        JsonDisplay.updateJSon()
    End Sub
    'Testmode 
    Private Sub TimerPointTest_Tick(sender As Object, e As EventArgs) Handles TimerPointTest.Tick
        If Points.testNormal = True Then
            Points.testNormal = False
        Else
            Points.testNormal = True
        End If
        Points.TestMode = CBPointTest.Checked
        If TestMode = True Then
            If testModeCount = 0 Then
                'Sound.CustomSound("Warning!, the signalling System is in it's test mode! Please do not run any rolling stock!")
                testModeCount = 12
            Else
                testModeCount -= 1
            End If
        End If
    End Sub
    Private Sub MemCheck_Tick(sender As Object, e As EventArgs) Handles MemCheck.Tick
        Dim c As Process = Process.GetCurrentProcess()
        LblMem.Text = "Mem Usage (Working Set): " & Math.Round(c.WorkingSet / 1024 / 1024, 2, MidpointRounding.AwayFromZero) & " MB Current Memory Usage"
    End Sub
    Private Sub MemAlert_Tick(sender As Object, e As EventArgs) Handles MemAlert.Tick
        Dim c As Process = Process.GetCurrentProcess()
        Dim MemLavel As Double = Math.Round((c.WorkingSet / 1024) / 1024, 2, MidpointRounding.AwayFromZero)
        Dim memlevel As Integer
        If memlevel >= 750 Then
            Errors.NewError("Warning, aoftware memory is running above the flagged rate, current usage is " & memlevel & "MB")
        Else
            Errors.RemoveError("Warning, aoftware memory is running above the flagged rate, current usage is " & memlevel & "MB")
        End If
        If memlevel >= 1024 Then
            Errors.NewError("CRITICAL ERROR, software is closing due to memory usage being over 1GB")
            RuntimeConfig.Save()
            Serial.SerialClose()
            Me.Close()
        Else
            Errors.RemoveError("CRITICAL ERROR, software is closing due to memory usage being over 1GB")
        End If
    End Sub
    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub
    Private Sub ToolStripMenuConfigurations_Click(sender As Object, e As EventArgs) Handles ToolStripMenuConfigurations.Click
        PopUpConfig.Show()
    End Sub
    Private Sub UpdateSoftwareToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UpdateSoftwareToolStripMenuItem.Click
        Updater.UpdateNow()
    End Sub
    Private Sub IOMonitorToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles IOMonitorToolStripMenuItem.Click
        IOMonitor.Show()
    End Sub
    Private Sub LogInToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles LogInToolStripMenuItem.Click
        LoginForm.Show()
    End Sub
    'Thread for update check
    Private Sub UpdateCheckThreadCall(ByVal state As Object)
        CheckForUpdate()
    End Sub
    Private Sub BtnCheckUpdate_Click(sender As Object, e As EventArgs) Handles btnCheckUpdate.Click
        CheckForUpdate()
    End Sub
    Private Sub CheckForUpdate()
        If Not File.Exists("C:\SignallingSystem\Updater\Signalling-Updater.exe") Then
            Exit Sub
        End If

        Dim updater As New Process()
        updater.StartInfo.RedirectStandardOutput = True
        updater.StartInfo.RedirectStandardError = False
        updater.StartInfo.UseShellExecute = False
        updater.StartInfo.CreateNoWindow = True
        updater.StartInfo.Arguments = "/remote"
        updater.StartInfo.FileName = "C:\SignallingSystem\Updater\Signalling-Updater.exe"
        updater.Start()

        Dim output As String = Nothing

        updater.WaitForExit()
        output = updater.StandardOutput.ReadLine()

        lblRemoteVersion.Text = output

        If updater.ExitCode = -1 Then
            ' There is an update available
            HasUpdate = True
            Errors.NewError("Software update ready for install")
        Else
            HasUpdate = False
            Errors.RemoveError("Software update ready for install")
        End If

        updater.Close()
    End Sub
    Private Sub NewConfigBetaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NewConfigBetaToolStripMenuItem.Click
        Configs.Show()
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then FrameIndicatorLights.RGBMode = True Else FrameIndicatorLights.RGBMode = False
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-18 at 16:49:21 +0000
