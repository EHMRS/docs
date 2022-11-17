---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/JsonDisplay.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Web/JsonDisplay.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[updateJSon](/SignallingSystem-doc/vb/Files/JsonDisplay_8vb/#function-updatejson)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System. | **[IO](/SignallingSystem-doc/vb/Files/JsonDisplay_8vb/#variable-io)**  |


## Functions Documentation

### function updateJSon

```csharp
void updateJSon()
```



## Attributes Documentation

### variable IO

```csharp
﻿using System. IO;
```



## Source code

```csharp
Imports System.IO
Imports System.Text
Imports System.Text.Json
Module JsonDisplay
    Public Sub updateJSon()
        Dim Options = New JsonWriterOptions
        With Options
            .Indented = True
        End With
        Dim MemStream As New MemoryStream
        Dim Writer As New Utf8JsonWriter(MemStream, Options)
        'Start collecting data

        CheckValues()

        'start file
        Writer.WriteStartObject()
        '---------------------------------------------------------------------
        'start sections 
        Writer.WritePropertyName("sections")
        Writer.WriteStartObject()
        'section A
        Writer.WritePropertyName("A")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionA).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(1).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionA).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionA).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionA).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionA))
        Writer.WriteEndObject()
        'section A11
        Writer.WritePropertyName("A11")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionA11).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(22).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionA11).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionA11).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionA11).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionA11))
        Writer.WriteEndObject()
        'section B
        Writer.WritePropertyName("B")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionB).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(2).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionB).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionB).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionB).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionB))
        Writer.WriteEndObject()
        'section C
        Writer.WritePropertyName("C")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionC).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(3).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionC).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionC).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionC).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionC))
        Writer.WriteEndObject() '
        'section C19
        Writer.WritePropertyName("C19")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionC19).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(26).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionC19).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionC19).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionC19).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionC19))
        Writer.WriteEndObject()
        'section CD
        Writer.WritePropertyName("CD")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionCD).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(28).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionCD).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionCD).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionCD).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionCD))
        Writer.WriteEndObject()
        'section D
        Writer.WritePropertyName("D")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionD).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(4).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionD).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionD).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionD).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionD))
        Writer.WriteEndObject()
        'section DE
        Writer.WritePropertyName("DE")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionDE).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(18).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionDE).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionDE).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionDE).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionDE))
        Writer.WriteEndObject()
        'section E
        Writer.WritePropertyName("E")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionE).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(5).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionE).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionE).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionE).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionE))
        Writer.WriteEndObject()
        'section F
        Writer.WritePropertyName("F")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionF).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(6).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionF).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionF).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionF).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionF))
        Writer.WriteEndObject()
        'section F12
        Writer.WritePropertyName("F12")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionF12).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(23).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionF12).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionF12).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionF12).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionF12))
        Writer.WriteEndObject()
        'section F13
        Writer.WritePropertyName("F13")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionF13).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(24).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionF13).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionF13).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionF13).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionF13))
        Writer.WriteEndObject()
        'section G
        Writer.WritePropertyName("G")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionG).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(7).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionG).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionG).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionG).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionG))
        Writer.WriteEndObject()
        'section H
        Writer.WritePropertyName("H")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionH).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(8).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionH).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionH).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionH).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionH))
        Writer.WriteEndObject()
        'section I
        Writer.WritePropertyName("I")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionI).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(9).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionI).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionI).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionI).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionI))
        Writer.WriteEndObject()
        'section J
        Writer.WritePropertyName("J")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionJ).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(10).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionJ).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionJ).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionJ).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionJ))
        Writer.WriteEndObject()
        'section K
        Writer.WritePropertyName("K")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionK).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(11).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionK).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionK).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionK).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionK))
        Writer.WriteEndObject()
        'section L
        Writer.WritePropertyName("L")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionL).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(12).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionL).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionL).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionL).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionL))
        Writer.WriteEndObject()
        'section M
        Writer.WritePropertyName("M")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionM).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(13).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionM).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionM).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionM).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionM))
        Writer.WriteEndObject()
        'section N
        Writer.WritePropertyName("N")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionN).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(14).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionN).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionN).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionN).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionN))
        Writer.WriteEndObject()
        'section NO
        Writer.WritePropertyName("NO")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionNO).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(19).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionNO).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionNO).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionNO).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionNO))
        Writer.WriteEndObject()
        'section NO14
        Writer.WritePropertyName("NO14")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionNO14).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(25).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionNO14).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionNO14).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionNO14).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionNO14))
        Writer.WriteEndObject()
        'section O
        Writer.WritePropertyName("O")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionO).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(15).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionO).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionO).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionO).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionO))
        Writer.WriteEndObject()
        'section OP
        Writer.WritePropertyName("OP")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionOP).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(20).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionOP).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionOP).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionOP).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionOP))
        Writer.WriteEndObject()
        'section P
        Writer.WritePropertyName("P")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionP).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(16).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionP).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionP).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionP).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionP))
        Writer.WriteEndObject()
        'section Q
        Writer.WritePropertyName("Q")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionQ).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(17).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionQ).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionQ).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionQ).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionQ))
        Writer.WriteEndObject()
        'section R
        Writer.WritePropertyName("R")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionR).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(27).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionR).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionR).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionR).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionR))
        Writer.WriteEndObject()
        'section Q10
        Writer.WritePropertyName("Q10")
        Writer.WriteStartObject()
        Writer.WriteString("state", JsonValueSectionState(Definitions.TrackSectionNames.SectionQ10).ToLower)
        Writer.WriteString("voltage", AnalogIOManager.ActualAnalogValue(21).ToString)
        Writer.WriteString("setpoint", RuntimeConfig.config.TrackSectionSetPoint(TrackSectionNames.SectionQ10).ToString)
        Writer.WriteString("timer", TrackSectionTimer(TrackSectionNames.SectionQ10).ToString)
        Writer.WriteString("errorsetpoint", RuntimeConfig.config.TrackSectionSetPointError(TrackSectionNames.SectionQ10).ToString)
        Writer.WriteBoolean("error", TrackSectionError(TrackSectionNames.SectionQ10))
        Writer.WriteEndObject()
        'End Sections
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start points
        Writer.WritePropertyName("points")
        Writer.WriteStartObject()
        'point 5a
        Writer.WritePropertyName("P5a")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P5a).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P5a).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 5b
        Writer.WritePropertyName("P5b")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P5b).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P5b).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 6a
        Writer.WritePropertyName("P6a")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P6a).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P6a).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 6b
        Writer.WritePropertyName("P6b")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P6b).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P6b).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 10
        Writer.WritePropertyName("P10")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P10).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P10).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 11
        Writer.WritePropertyName("P11")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P11).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P11).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 12
        Writer.WritePropertyName("P12")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P12).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P12).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 13
        Writer.WritePropertyName("P13")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P13).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P13).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 14
        Writer.WritePropertyName("P14")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P14).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P14).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'point 19
        Writer.WritePropertyName("P19")
        Writer.WriteStartObject()
        Writer.WriteString("route", JsonValuePointRoute(PointNames.P19).ToLower)
        Writer.WriteString("state", JsonValuePointState(PointNames.P19).ToLower)
        Writer.WriteBoolean("error", False)
        Writer.WriteEndObject()
        'End points
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start signals 
        Writer.WritePropertyName("signals")
        Writer.WriteStartObject()
        'signal AJ1E
        Writer.WritePropertyName("AJ1E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ1E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ1E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteString("announcementdelay", SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteEndObject()
        'signal AJ2E
        Writer.WritePropertyName("AJ2E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ2E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ2E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ2E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ2E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ2E).ToString)
        Writer.WriteEndObject()
        'signal AJ3E
        Writer.WritePropertyName("AJ3E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ3E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ3E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ3E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ3E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ3E).ToString)
        Writer.WriteEndObject()
        'signal RAJ3E
        Writer.WritePropertyName("RAJ3E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.RAJ3E).ToLower)
        Writer.WriteBoolean("spad", False)
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.RAJ3E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.RAJ3E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.RAJ3E).ToString)
        Writer.WriteEndObject()
        'signal AJ3W
        Writer.WritePropertyName("AJ3W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ3W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ3W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ3E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ3E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ3W).ToString)
        Writer.WriteEndObject()
        'signal AJ4E
        Writer.WritePropertyName("AJ4E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ4E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ4E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ4E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ4E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ4E).ToString)
        Writer.WriteEndObject()
        'signal AJ7E
        Writer.WritePropertyName("AJ7E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ7E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ7E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ7E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ7E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ7E).ToString)
        Writer.WriteEndObject()
        'signal AJ7W
        Writer.WritePropertyName("AJ7W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ7W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ7W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ7E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ7E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ7W).ToString)
        Writer.WriteEndObject()
        'signal AJ8E
        Writer.WritePropertyName("AJ8E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ8E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ8E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ8E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ8E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ8E).ToString)
        Writer.WriteEndObject()
        'signal AJ8W
        Writer.WritePropertyName("AJ8W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ8W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ8W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ8E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ8E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ8W).ToString)
        Writer.WriteEndObject()
        'signal AJ9E
        Writer.WritePropertyName("AJ9E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ9E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ9E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ9E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ9E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ9E).ToString)
        Writer.WriteEndObject()
        'signal AJ9W
        Writer.WritePropertyName("AJ9W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ9W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ9W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ9E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ9E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ9W).ToString)
        Writer.WriteEndObject()
        'signal AJ15W
        Writer.WritePropertyName("AJ15W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ15W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ15W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ15W).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ15W).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ15W).ToString)
        Writer.WriteString("announcementdelay", SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ15W).ToString)
        Writer.WriteEndObject()
        'signal AJ16E
        Writer.WritePropertyName("AJ16E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ16E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ16E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ16E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ16E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ16E).ToString)
        Writer.WriteEndObject()
        'signal AJ16W
        Writer.WritePropertyName("AJ16W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ16W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ16W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ16E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ16E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ16W).ToString)
        Writer.WriteEndObject()
        'signal AJ17E
        Writer.WritePropertyName("AJ17E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ17E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ17E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ17E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ17E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ17E).ToString)
        Writer.WriteEndObject()
        'signal AJ17W
        Writer.WritePropertyName("AJ17W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ17W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ17W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ18W).ToString)
        Writer.WriteEndObject()
        'signal AJ18E
        Writer.WritePropertyName("AJ18E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ18E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ18E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteEndObject()
        'signal AJ18W
        Writer.WritePropertyName("AJ18W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ18W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ18W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ18E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ18W).ToString)
        Writer.WriteEndObject()
        'signal AJ21E
        Writer.WritePropertyName("AJ21E")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ21E).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ21E))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ21E).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ21E).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ21E).ToString)
        Writer.WriteString("announcementdelay", SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ21E).ToString)
        Writer.WriteEndObject()
        'signal AJ22W
        Writer.WritePropertyName("AJ22W")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.AJ22W).ToLower)
        Writer.WriteBoolean("spad", SPADDetection.SignalSPADAlert(SPADSignalNames.AJ22W))
        Writer.WriteString("signaltimer", Signals.SignalTimer(Definitions.SignalNames.AJ22W).ToString)
        Writer.WriteString("signaltimeout", Signals.SignalTimeOut(Definitions.SignalNames.AJ22W).ToString)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ22W).ToString)
        Writer.WriteString("announcementdelay", SignalTimerAnnouncementDelay(Definitions.SignalNames.AJ22W).ToString)
        Writer.WriteEndObject()
        'signal S11
        Writer.WritePropertyName("S11")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.S11).ToLower)
        Writer.WriteBoolean("spad", False)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteEndObject()
        'signal S12
        Writer.WritePropertyName("S12")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.S12).ToLower)
        Writer.WriteBoolean("spad", False)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteEndObject()
        'signal S14
        Writer.WritePropertyName("S14")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.S14).ToLower)
        Writer.WriteBoolean("spad", False)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteEndObject()
        'signal S19
        Writer.WritePropertyName("S19")
        Writer.WriteStartObject()
        Writer.WriteString("signal", SignalOutputState(Definitions.SignalNames.S19).ToLower)
        Writer.WriteBoolean("spad", False)
        Writer.WriteString("routesafetocleartimer", SignalSafeToClearTimer(Definitions.SignalNames.AJ1E).ToString)
        Writer.WriteEndObject()
        ' Signal AJ16WLOS
        Writer.WritePropertyName("AJ16WLOS")
        Writer.WriteStartObject()
        If (Power.SignalAspectPower = True And LogicStart.EastBound = True) Or Points.TestMode = True Then
            Writer.WriteString("signal", "danger")
        Else
            Writer.WriteString("signal", "noaspect")
        End If
        Writer.WriteEndObject()
        'End signals
        Writer.WriteEndObject()

        '---------------------------------------------------------------------
        'start crossings 
        Writer.WritePropertyName("crossings")
        Writer.WriteStartObject()
        Writer.WritePropertyName("center")
        Writer.WriteStartObject()
        Writer.WriteBoolean("open", Not LineSide.CrossingSafe)
        Writer.WriteBoolean("sensor1", LineSide.LCSensor1)
        Writer.WriteBoolean("sensor2", LineSide.LCSensor2)
        Writer.WriteBoolean("sensor3", LineSide.LCSensor3)
        Writer.WriteBoolean("sensor4", LineSide.LCSensor4)
        Writer.WriteEndObject()
        'End crossings
        Writer.WriteEndObject()



        '---------------------------------------------------------------------
        'start (new) requests 
        Writer.WritePropertyName("requestsnew")
        Writer.WriteStartObject()
        'request S11
        Writer.WritePropertyName("S11")
        Writer.WriteStartObject()
        Writer.WriteString("type", "slot")
        Writer.WriteString("state", "notrequested")
        Writer.WriteEndObject()

        'request S12
        Writer.WritePropertyName("S12")
        Writer.WriteStartObject()
        Writer.WriteString("type", "slot")
        Writer.WriteString("state", "notrequested")
        Writer.WriteEndObject()

        'request S14
        Writer.WritePropertyName("S14")
        Writer.WriteStartObject()
        Writer.WriteString("type", "slot")
        Writer.WriteString("state", "notrequested")
        Writer.WriteEndObject()

        'request S19
        Writer.WritePropertyName("S19")
        Writer.WriteStartObject()
        Writer.WriteString("type", "slot")
        Writer.WriteString("state", "notrequested")
        Writer.WriteEndObject()

        'request p1trtse
        Writer.WritePropertyName("AJ1E")
        Writer.WriteStartObject()
        Writer.WriteString("type", "trts")
        Writer.WriteBoolean("state", JsonValueRequestP1TRTSE)
        Writer.WriteString("text", JsonValueRequestP1TRTSEText)
        Writer.WriteEndObject()
        'request p1trtsw
        Writer.WritePropertyName("AJ15W")
        Writer.WriteStartObject()
        Writer.WriteString("type", "trts")
        Writer.WriteBoolean("state", JsonValueRequestP1TRTSW)
        Writer.WriteString("text", JsonValueRequestP1TRTSWText)
        Writer.WriteEndObject()
        'request p2trtse
        Writer.WritePropertyName("AJ21E")
        Writer.WriteStartObject()
        Writer.WriteString("type", "trts")
        Writer.WriteBoolean("state", JsonValueRequestP2TRTSE)
        Writer.WriteString("text", JsonValueRequestP2TRTSEText)
        Writer.WriteEndObject()
        'request p2trtsw
        Writer.WritePropertyName("AJ22W")
        Writer.WriteStartObject()
        Writer.WriteString("type", "trts")
        Writer.WriteBoolean("state", JsonValueRequestP2TRTSW)
        Writer.WriteString("text", JsonValueRequestP2TRTSWText)
        Writer.WriteEndObject()
        Writer.WriteBoolean("aj22wtrts", JsonValueRequestP2TRTSW)
        Writer.WriteString("aj22wtrtstext", JsonValueRequestP2TRTSWText)
        'End requests
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start call in (new)
        Writer.WritePropertyName("callinnew")
        Writer.WriteStartObject()
        'call in eastbound
        Writer.WritePropertyName("AJ4E")
        Writer.WriteStartObject()
        Writer.WriteBoolean("ars", JsonValueCallInAJ4EState)
        Writer.WriteString("value", JsonValueCallInAJ4EText)
        Writer.WriteBoolean("waiting", False)
        Writer.WriteEndObject()
        'call in westbound
        Writer.WritePropertyName("AJ18W")
        Writer.WriteStartObject()
        Writer.WriteBoolean("ars", JsonValueCallInAJ18WState)
        Writer.WriteString("value", JsonValueCallInAJ18WText)
        Writer.WriteBoolean("waiting", False)
        Writer.WriteEndObject()
        'End call in
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start messages (new)
        Writer.WritePropertyName("messagesnew")
        Writer.WriteStartArray()
        For Each err As String In Errors.CurrentErrorList
            Writer.WriteStartObject()
            Writer.WriteString("type", "error")
            Writer.WriteString("text", err)
            Writer.WriteEndObject()
        Next
        If Not Sound.SoundText = "" Then
            Writer.WriteStartObject()
            Writer.WriteString("type", "info")
            Writer.WriteString("text", Sound.SoundText)
            Writer.WriteEndObject()
        End If
        If Not Json_Values.JsonValueRequestText = "" Then
            Writer.WriteStartObject()
            Writer.WriteString("type", "trts")
            Writer.WriteString("text", Json_Values.JsonValueRequestText)
            Writer.WriteEndObject()
        End If
        Writer.WriteEndArray()

        '---------------------------------------------------------------------
        'start requests 
        Writer.WritePropertyName("requests")
        Writer.WriteStartObject()
        'request S11
        Writer.WriteString("s11", "notrequested")
        'request S12
        Writer.WriteString("s12", "notrequested")
        'request S14
        Writer.WriteString("s14", "notrequested")
        'request S19
        Writer.WriteString("s19", "notrequested")
        'request p1trtse
        Writer.WriteBoolean("aj1etrts", JsonValueRequestP1TRTSE)
        Writer.WriteString("aj1etrtstext", JsonValueRequestP1TRTSEText)
        'request p1trtsw
        Writer.WriteBoolean("aj15wtrts", JsonValueRequestP1TRTSW)
        Writer.WriteString("aj15wtrtstext", JsonValueRequestP1TRTSWText)
        'request p2trtse
        Writer.WriteBoolean("aj21etrts", JsonValueRequestP2TRTSE)
        Writer.WriteString("aj21etrtstext", JsonValueRequestP2TRTSEText)
        'request p2trtsw
        Writer.WriteBoolean("aj22wtrts", JsonValueRequestP2TRTSW)
        Writer.WriteString("aj22wtrtstext", JsonValueRequestP2TRTSWText)
        'End requests
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start call in
        Writer.WritePropertyName("callin")
        Writer.WriteStartObject()
        'call in eastbound
        Writer.WritePropertyName("aj4e")
        Writer.WriteStartObject()
        Writer.WriteBoolean("ars", JsonValueCallInAJ4EState)
        Writer.WriteString("value", JsonValueCallInAJ4EText)
        Writer.WriteBoolean("waiting", False)
        Writer.WriteEndObject()
        'call in westbound
        Writer.WritePropertyName("aj18w")
        Writer.WriteStartObject()
        Writer.WriteBoolean("ars", JsonValueCallInAJ18WState)
        Writer.WriteString("value", JsonValueCallInAJ18WText)
        Writer.WriteBoolean("waiting", False)
        Writer.WriteEndObject()
        'End call in
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start messages
        Writer.WritePropertyName("messages")
        Writer.WriteStartObject()
        'top middle text
        Writer.WriteString("warning", Errors.DisplayCurrentRequest)
        Writer.WriteString("error", Errors.DisplayCurrentError)
        Writer.WriteString("err", Errors.DisplayCurrentError)
        Writer.WriteString("info", Sound.SoundText)
        'End messages
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start info
        Writer.WritePropertyName("info")
        Writer.WriteStartObject()
        'top middle text
        Writer.WriteString("cabincode", "AJ")
        Writer.WriteString("direction", JsonValueDirection)
        Writer.WriteString("logic", JsonValuelogic)
        Writer.WriteString("safety", UsingAir)
        Writer.WriteString("user", UserManagment.operatorName)
        Writer.WriteString("datetime", DateTime.Now.ToString("yyyyMMddHHmmss"))
        'End info
        Writer.WriteEndObject()
        '---------------------------------------------------------------------
        'start Frame
        Writer.WritePropertyName("frame")
        Writer.WriteStartObject()
        'lever 1
        Writer.WritePropertyName("lever1")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever1).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever1))
        'Writer.WriteString("display", Lever1Display.ToString)
        Writer.WriteEndObject()
        'lever 2
        Writer.WritePropertyName("lever2")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever2).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever2))
        'Writer.WriteString("display", Lever2Display.ToString)
        Writer.WriteEndObject()
        'lever 3
        Writer.WritePropertyName("lever3")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever3).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever3))
        'Writer.WriteString("display", Lever3Display.ToString)
        Writer.WriteEndObject()
        'lever 4
        Writer.WritePropertyName("lever4")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever4).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever4))
        'Writer.WriteString("display", Lever4Display.ToString)
        Writer.WriteEndObject()
        'lever 5
        Writer.WritePropertyName("lever5")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever5).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever5))
        'Writer.WriteString("displayn", Lever5NDisplay.ToString)
        'Writer.WriteString("displayr", Lever5RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 6
        Writer.WritePropertyName("lever6")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever6).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever6))
        'Writer.WriteString("displayn", Lever6NDisplay.ToString)
        'Writer.WriteString("displayr", Lever6RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 7
        Writer.WritePropertyName("lever7")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever7).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever7))
        'Writer.WriteString("display", Lever7Display.ToString)
        Writer.WriteEndObject()
        'lever 8
        Writer.WritePropertyName("lever8")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever8).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever8))
        'Writer.WriteString("display", Lever8Display.ToString)
        Writer.WriteEndObject()
        'lever 9
        Writer.WritePropertyName("lever9")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever9).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever9))
        'Writer.WriteString("display", Lever9Display.ToString)
        Writer.WriteEndObject()
        'lever 10
        Writer.WritePropertyName("lever10")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever10).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever10))
        'Writer.WriteString("displayn", Lever10NDisplay.ToString)
        'Writer.WriteString("displayr", Lever10RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 11
        Writer.WritePropertyName("lever11")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever11).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever11))
        'Writer.WriteString("displayn", Lever11NDisplay.ToString)
        'Writer.WriteString("displayr", Lever11RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 12
        Writer.WritePropertyName("lever12")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever12).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever12))
        'Writer.WriteString("displayn", Lever12NDisplay.ToString)
        'Writer.WriteString("displayr", Lever12RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 13
        Writer.WritePropertyName("lever13")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever13).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever13))
        'Writer.WriteString("displayn", Lever13NDisplay.ToString)
        'Writer.WriteString("displayr", Lever13RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 14
        Writer.WritePropertyName("lever14")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever14).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever14))
        'Writer.WriteString("displayn", Lever14NDisplay.ToString)
        'Writer.WriteString("displayr", Lever14RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 15
        Writer.WritePropertyName("lever15")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever15).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever15))
        'Writer.WriteString("display", Lever15Display.ToString)
        Writer.WriteEndObject()
        'lever 16
        Writer.WritePropertyName("lever16")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever16).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever16))
        'Writer.WriteString("display", Lever16Display.ToString)
        Writer.WriteEndObject()
        'lever 17
        Writer.WritePropertyName("lever17")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever17).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever17))
        'Writer.WriteString("display", Lever17Display.ToString)
        Writer.WriteEndObject()
        'lever 18
        Writer.WritePropertyName("lever18")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever18).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever18))
        'Writer.WriteString("display", Lever18Display.ToString)
        Writer.WriteEndObject()
        'lever 19
        Writer.WritePropertyName("lever19")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever19).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever19))
        'Writer.WriteString("displayn", Lever19NDisplay.ToString)
        'Writer.WriteString("displayr", Lever19RDisplay.ToString)
        Writer.WriteEndObject()
        'lever 20
        Writer.WritePropertyName("lever20")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever20).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever20))
        'Writer.WriteString("display", Lever20Display.ToString)
        Writer.WriteEndObject()
        'lever 21
        Writer.WritePropertyName("lever21")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever21).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever21))
        'Writer.WriteString("display", Lever21Display.ToString)
        Writer.WriteEndObject()
        'lever 22
        Writer.WritePropertyName("lever22")
        Writer.WriteStartObject()
        Writer.WriteString("state", Lever(LeverNames.Lever22).ToLower)
        Writer.WriteBoolean("locked", LeverLock(LeverNames.Lever22))
        'Writer.WriteString("display", Lever22Display.ToString)
        Writer.WriteEndObject()
        'End Frame
        Writer.WriteEndObject()
        'End File
        Writer.WriteEndObject()



        'Code to update file when done getting display data
        Writer.Flush()
        MemStream.Close()
        Dim JSON As String = Encoding.UTF8.GetString(MemStream.ToArray())
        Dim DataFile As String = GlobalConfig.config.jsonoutput.path & GlobalConfig.config.jsonoutput.filename
        If Not GlobalConfig.config.jsonoutput.enable Then
            Return
        End If
        Try
            If File.Exists(DataFile) = True Then
                Dim objWriter As New StreamWriter(DataFile, False)
                objWriter.Write(JSON)
                'objWriter.Close()
                objWriter.Dispose()
            End If
        Catch e As Exception
        End Try
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-16 at 15:02:30 +0000
