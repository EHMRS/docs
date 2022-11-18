---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/RuntimeConfig.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Configs/RuntimeConfig.vb



## Namespaces

| Name           |
| -------------- |
| **[YamlDotNet::Serialization](/SignallingSystem-doc/mainsystem/Namespaces/namespaceYamlDotNet_1_1Serialization/)**  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[RuntimeConfigObj](/SignallingSystem-doc/mainsystem/Classes/classRuntimeConfigObj/)**  |

## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[LoadConfig](/SignallingSystem-doc/mainsystem/Files/RuntimeConfig_8vb/#function-loadconfig)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Save](/SignallingSystem-doc/mainsystem/Files/RuntimeConfig_8vb/#function-save)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Upgrade](/SignallingSystem-doc/mainsystem/Files/RuntimeConfig_8vb/#function-upgrade)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| [RuntimeConfigObj](/SignallingSystem-doc/mainsystem/Classes/classRuntimeConfigObj/) | **[config](/SignallingSystem-doc/mainsystem/Files/RuntimeConfig_8vb/#variable-config)**  |


## Functions Documentation

### function LoadConfig

```csharp
void LoadConfig()
```


### function Save

```csharp
void Save()
```


### function Upgrade

```csharp
void Upgrade()
```



## Attributes Documentation

### variable config

```csharp
RuntimeConfigObj config;
```



## Source code

```csharp
Imports YamlDotNet.Serialization
Imports YamlDotNet.Serialization.NamingConventions
Imports System.IO

Class RuntimeConfigObj
    Public MonthDirection() As String
    Public AllowInputDirection As String
    Public DirectionOveride As String
    Public PointInputOverrides() As String
    Public PointOutputOverrides() As String
    Public LeverLock() As String
    Public LeverRestroke() As Boolean
    Public LeverState() As String
    Public Mode As String
    Public SignalState() As String
    Public TrackSectionOverrides() As String
    Public TrackSectionSetPoint() As String
    Public TrackSectionSetPointError() As String
    Public PointSectionOverrides() As String
    Public PointSectionSetPoint() As String
    Public PointSectionSetPointError() As String
    Public DepartingP1SoundEnabled As String
    Public DepartingP2SoundEnabled As String
    Public ArrivingP1SoundEnabled As String
    Public ArrivingP2SoundEnabled As String
    Public SidingSoundEnabled As String
    Public EventSoundEnabled As String
    Public SafetySoundEnabled As String
    Public AUXSound1Enabled As String
    Public AUXSound2Enabled As String
    Public AUXSound3Enabled As String
    Public DepartingP1AmountOfClips As String
    Public DepartingP2AmountOfClips As String
    Public ArrivingP1AmountOfClips As String
    Public ArrivingP2AmountOfClips As String
    Public SidingAmountOfClips As String
    Public EventAmountOfClips As String
    Public SafetyAmountOfClips As String
    Public AUXSound1OfClips As String
    Public AUXSound2OfClips As String
    Public AUXSound3OfClips As String
    Public BellEnabled As String
    Public EventLoopTime As String
    Public SafetyLoopTime As String
    Public ButtonEnabled() As String
    Public ButtonIndicatorState() As String
    Public PointReturnFaultTime As String
    Public ButtonRequestFaultTime As String
    Public AirEnabled As String
    Public ForceAir As String
    Public SignalSpadDetection() As Boolean
    Public AIEnabled As String
    Public P1Combine As String
    Public WestEndTunnel As String
    Public EastEndTunnel As String
    Public OutterGateOutSensor As String
    Public OutterGateInSensor As String
    Public InnerGateOutSensor As String
    Public InnerGateInSensor As String
    Public LevelCrossingWarningBuzzer As String
End Class

Module RuntimeConfig
    Public config As RuntimeConfigObj


    Sub LoadConfig()
        RuntimeConfig.Upgrade()
        Dim deserializer As New Deserializer()
        Using reader As New StreamReader(GlobalConfig.config.RuntimePath)
            config = deserializer.Deserialize(Of RuntimeConfigObj)(reader)
        End Using
    End Sub
    Sub Save()
        Dim serializer As New Serializer()

        Using writer As New StreamWriter(GlobalConfig.config.RuntimePath)
            writer.Write(serializer.Serialize(RuntimeConfig.config))
        End Using
    End Sub
    Sub Upgrade()
        If Not System.IO.File.Exists(GlobalConfig.config.RuntimePath) Then
            ' Create the file from empty
            Using writer As New StreamWriter(GlobalConfig.config.RuntimePath)
                writer.Write(defaultYaml)
            End Using
            Return
        End If

        Dim deserializer As New Deserializer()
        Try
            Using reader As New StreamReader(GlobalConfig.config.RuntimePath)
                config = deserializer.Deserialize(Of RuntimeConfigObj)(reader)
            End Using
        Catch e As YamlDotNet.Core.YamlException
            ' Failed to read config file - back up this one and regenerate
            System.IO.File.Copy(GlobalConfig.config.RuntimePath, GlobalConfig.config.RuntimePath & "." & DateTime.Now.ToString("yyyyMMddHHmm"))
            Using writer As New StreamWriter(GlobalConfig.config.RuntimePath)
                writer.Write(defaultYaml)
            End Using
        End Try
    End Sub
    Private ReadOnly defaultYaml = "MonthDirection:" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "- Eastbound" & Environment.NewLine &
        "AllowInputDirection: True" & Environment.NewLine &
        "DirectionOveride: Auto" & Environment.NewLine &
        "PointInputOverrides:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "PointOutputOverrides:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "LeverLock:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "LeverRestroke:" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "- False" & Environment.NewLine &
        "LeverState:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "Mode: Computer" & Environment.NewLine &
        "SignalState:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "TrackSectionOverrides:" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "TrackSectionSetPoint:" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "- 18" & Environment.NewLine &
        "TrackSectionSetPointError:" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "PointSectionOverrides:" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "- Detect" & Environment.NewLine &
        "PointSectionSetPoint:" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "- 20" & Environment.NewLine &
        "PointSectionSetPointError:" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "- 1" & Environment.NewLine &
        "DepartingP1SoundEnabled: True" & Environment.NewLine &
        "DepartingP2SoundEnabled: True" & Environment.NewLine &
        "ArrivingP1SoundEnabled: True" & Environment.NewLine &
        "ArrivingP2SoundEnabled: True" & Environment.NewLine &
        "SidingSoundEnabled: True" & Environment.NewLine &
        "EventSoundEnabled: False" & Environment.NewLine &
        "SafetySoundEnabled: False" & Environment.NewLine &
        "AUXSound1Enabled: True" & Environment.NewLine &
        "AUXSound2Enabled: True" & Environment.NewLine &
        "AUXSound3Enabled: True" & Environment.NewLine &
        "DepartingP1AmountOfClips: 3" & Environment.NewLine &
        "DepartingP2AmountOfClips: 3" & Environment.NewLine &
        "ArrivingP1AmountOfClips: 3" & Environment.NewLine &
        "ArrivingP2AmountOfClips: 3" & Environment.NewLine &
        "SidingAmountOfClips: 1" & Environment.NewLine &
        "EventAmountOfClips: 1" & Environment.NewLine &
        "SafetyAmountOfClips: 1" & Environment.NewLine &
        "AUXSound1OfClips: 1" & Environment.NewLine &
        "AUXSound2OfClips: 1" & Environment.NewLine &
        "AUXSound3OfClips: 1" & Environment.NewLine &
        "BellEnabled: True" & Environment.NewLine &
        "EventLoopTime: 300" & Environment.NewLine &
        "SafetyLoopTime: 300" & Environment.NewLine &
        "ButtonEnabled:" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "ButtonIndicatorState:" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "- System" & Environment.NewLine &
        "PointReturnFaultTime: 60" & Environment.NewLine &
        "ButtonRequestFaultTime: 480" & Environment.NewLine &
        "AirEnabled: True" & Environment.NewLine &
        "ForceAir: False" & Environment.NewLine &
        "SignalSpadDetection: " & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "- True" & Environment.NewLine &
        "AIEnabled: False" & Environment.NewLine &
        "P1Combine: False" & Environment.NewLine &
        "WestEndTunnel: System" & Environment.NewLine &
        "EastEndTunnel: System" & Environment.NewLine &
        "OutterGateOutSensor: System" & Environment.NewLine &
        "OutterGateInSensor: System" & Environment.NewLine &
        "InnerGateOutSensor: System" & Environment.NewLine &
        "InnerGateInSensor: System" & Environment.NewLine &
        "LevelCrossingWarningBuzzer: System" & Environment.NewLine
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:18:55 +0000
