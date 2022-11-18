---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/FrameIndicatorLights.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/FrameIndicatorLights.vb



## Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[Flash](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#function-flash)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[FrameIndicatorLights](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#function-frameindicatorlights)**() |
| [void](/SignallingSystem-doc/mainsystem/Files/SerialPixelLeds_8vb/#variable-void) | **[UpdateRGBIndicator](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#function-updatergbindicator)**(int Indicator, string RGBColour, bool overridden) |

## Attributes

|                | Name           |
| -------------- | -------------- |
| bool | **[RGBMode](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbmode)**  |
| int | **[RGBBrightness](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbbrightness)**  |
| bool | **[RGBFlash](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbflash)**  |
| string | **[RGBOFF](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgboff)**  |
| string | **[RGBRed](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbred)**  |
| string | **[RGBGreen](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbgreen)**  |
| string | **[RGBBlue](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbblue)**  |
| string | **[RGBWarmWhite](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbwarmwhite)**  |
| string | **[RGBCoolWhite](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbcoolwhite)**  |
| string | **[RGBAllWhite](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgballwhite)**  |
| string | **[RGBYellow](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbyellow)**  |
| string | **[RGBMagenta](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbmagenta)**  |
| string | **[RGBCyan](/SignallingSystem-doc/mainsystem/Files/FrameIndicatorLights_8vb/#variable-rgbcyan)**  |


## Functions Documentation

### function Flash

```csharp
void Flash()
```


### function FrameIndicatorLights

```csharp
void FrameIndicatorLights()
```


### function UpdateRGBIndicator

```csharp
void UpdateRGBIndicator(
    int Indicator,
    string RGBColour,
    bool overridden
)
```



## Attributes Documentation

### variable RGBMode

```csharp
bool RGBMode = False;
```


### variable RGBBrightness

```csharp
int RGBBrightness = 255;
```


### variable RGBFlash

```csharp
bool RGBFlash = False;
```


### variable RGBOFF

```csharp
string RGBOFF = "OFF";
```


### variable RGBRed

```csharp
string RGBRed = "RED";
```


### variable RGBGreen

```csharp
string RGBGreen = "GREEN";
```


### variable RGBBlue

```csharp
string RGBBlue = "BLUE";
```


### variable RGBWarmWhite

```csharp
string RGBWarmWhite = "WARMWHITE";
```


### variable RGBCoolWhite

```csharp
string RGBCoolWhite = "COOLWHITE";
```


### variable RGBAllWhite

```csharp
string RGBAllWhite = "ALLWHITE";
```


### variable RGBYellow

```csharp
string RGBYellow = "YELLOW";
```


### variable RGBMagenta

```csharp
string RGBMagenta = "MAGENTA";
```


### variable RGBCyan

```csharp
string RGBCyan = "CYAN";
```



## Source code

```csharp
Module FrameIndicatorLights
    Public RGBMode As Boolean = False
    Public RGBBrightness As Integer = 255
    Public RGBFlash As Boolean = False
    'Colours
    Public RGBOFF As String = "OFF"
    Public RGBRed As String = "RED"
    Public RGBGreen As String = "GREEN"
    Public RGBBlue As String = "BLUE"
    Public RGBWarmWhite As String = "WARMWHITE"
    Public RGBCoolWhite As String = "COOLWHITE"
    Public RGBAllWhite As String = "ALLWHITE"
    Public RGBYellow As String = "YELLOW"
    Public RGBMagenta As String = "MAGENTA"
    Public RGBCyan As String = "CYAN"
    'Flash
    Public Sub Flash()
        RGBFlash = Not RGBFlash
    End Sub
    'Logic
    Public Sub FrameIndicatorLights()
        'Lever 1 - (AJ1E)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever1Top, SignalOutputState(Definitions.SignalNames.AJ1E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ1E) = "System" And AJ1Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever1Bottom, RGBOFF, True)
        'Lever 2 - (AJ2E)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever2Top, SignalOutputState(Definitions.SignalNames.AJ2E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ2E) = "System" And AJ2Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever2Bottom, RGBOFF, True)
        'Lever 3 - (AJ3E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever3Top, SignalOutputState(Definitions.SignalNames.AJ3E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3E) = "System" And AJ3Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever3Top, SignalOutputState(Definitions.SignalNames.AJ3W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ3W) = "System" And AJ3Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever3Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever3Bottom, RGBOFF, True)
        'Lever 4 - (AJ4E)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever4Top, SignalOutputState(Definitions.SignalNames.AJ4E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ4E) = "System" And AJ4Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever4Bottom, RGBOFF, True)
        'Levers 5 - (P5a/b)
        If Points.PointReturns(PointNames.P5a) = PointInNormal And Points.PointReturns(PointNames.P5b) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever5Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P5b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5b) = "System" And Point5Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever5Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P5b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5b) = "System" And Point5Initiated = True))
        End If
        If Points.PointReturns(PointNames.P5a) = PointInReverse And Points.PointReturns(PointNames.P5b) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever5Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P5b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5b) = "System" And Point5Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever5Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P5b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P5b) = "System" And Point5Initiated = True))
        End If
        'Lever 6 - (P6a/b)
        If Points.PointReturns(PointNames.P6a) = PointInNormal And Points.PointReturns(PointNames.P6b) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever6Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P6b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6b) = "System" And Point6Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever6Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P6b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6b) = "System" And Point6Initiated = True))
        End If
        If Points.PointReturns(PointNames.P6a) = PointInReverse And Points.PointReturns(PointNames.P6b) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever6Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P6b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6b) = "System" And Point6Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever6Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6a) = "System" And RuntimeConfig.config.PointOutputOverrides(PointNames.P6b) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P6b) = "System" And Point6Initiated = True))
        End If
        'Lever 7 - (AJ7E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever7Top, SignalOutputState(Definitions.SignalNames.AJ7E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7E) = "System" And AJ7Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever7Top, SignalOutputState(Definitions.SignalNames.AJ7W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ7W) = "System" And AJ7Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever7Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever7Bottom, RGBOFF, True)
        'Lever 8 - (AJ8E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever8Top, SignalOutputState(Definitions.SignalNames.AJ8E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8E) = "System" And AJ8Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever8Top, SignalOutputState(Definitions.SignalNames.AJ8W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ8W) = "System" And AJ8Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever8Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever8Bottom, RGBOFF, True)
        'Lever 9 - (AJ9E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever9Top, SignalOutputState(Definitions.SignalNames.AJ9E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9E) = "System" And AJ9Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever9Top, SignalOutputState(Definitions.SignalNames.AJ9W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ9W) = "System" And AJ9Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever9Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever9Bottom, RGBOFF, True)
        'Lever 10 - (P10)
        If Points.PointReturns(PointNames.P10) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever10Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P10) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P10) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever10Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P10) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P10) = "System"))
        End If
        If Points.PointReturns(PointNames.P10) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever10Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P10) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P10) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever10Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P10) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P10) = "System"))
        End If
        'Lever 11 - (P11)
        If Points.PointReturns(PointNames.P11) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever11Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P11) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P11) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever11Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P11) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P11) = "System"))
        End If
        If Points.PointReturns(PointNames.P11) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever11Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P11) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P11) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever11Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P11) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P11) = "System"))
        End If
        'Lever 12 - (NOT USED)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever12Top, RGBOFF, True)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever12Bottom, RGBOFF, True)
        'Lever 13 - (P12)
        If Points.PointReturns(PointNames.P12) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever13Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P12) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P12) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever13Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P12) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P12) = "System"))
        End If
        If Points.PointReturns(PointNames.P12) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever13Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P12) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P12) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever13Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P12) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P12) = "System"))
        End If
        'Lever 14 - (P13)
        If Points.PointReturns(PointNames.P13) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever14Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P13) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P13) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever14Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P13) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P13) = "System"))
        End If
        If Points.PointReturns(PointNames.P13) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever14Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P13) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P13) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever14Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P13) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P13) = "System"))
        End If
        'Lever 15 - (P14)
        If Points.PointReturns(PointNames.P14) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever15Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P14) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P14) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever15Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P14) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P14) = "System"))
        End If
        If Points.PointReturns(PointNames.P14) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever15Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P14) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P14) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever15Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P14) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P14) = "System"))
        End If
        'Lever 16 - (AJ15W)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever16Top, SignalOutputState(Definitions.SignalNames.AJ15W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ15W) = "System" And AJ15Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever16Bottom, RGBOFF, True)
        'Lever 17 - (AJ16E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever17Top, SignalOutputState(Definitions.SignalNames.AJ16E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16E) = "System" And AJ16Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever17Top, SignalOutputState(Definitions.SignalNames.AJ16W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ16W) = "System" And AJ16Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever17Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever17Bottom, RGBOFF, True)
        'Lever 18 - (AJ17E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever18Top, SignalOutputState(Definitions.SignalNames.AJ17E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17E) = "System" And AJ17Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever18Top, SignalOutputState(Definitions.SignalNames.AJ17W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ17W) = "System" And AJ17Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever18Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever18Bottom, RGBOFF, True)
        'Lever 19 - (AJ18E/W)
        If EastBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever19Top, SignalOutputState(Definitions.SignalNames.AJ18E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18E) = "System" And AJ18Initiated = True))
        ElseIf WestBound Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever19Top, SignalOutputState(Definitions.SignalNames.AJ18W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ18W) = "System" And AJ18Initiated = True))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever19Top, RGBMagenta, False)
        End If
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever19Bottom, RGBOFF, True)
        'Lever 20 - (P19)
        If Points.PointReturns(PointNames.P19) = PointInNormal Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever20Top, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P19) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P19) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever20Top, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P19) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P19) = "System"))
        End If
        If Points.PointReturns(PointNames.P19) = PointInReverse Then
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever20Bottom, RGBAllWhite, (RuntimeConfig.config.PointOutputOverrides(PointNames.P19) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P19) = "System"))
        Else
            UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever20Bottom, RGBOFF, (RuntimeConfig.config.PointOutputOverrides(PointNames.P19) = "System" And RuntimeConfig.config.PointInputOverrides(PointNames.P19) = "System"))
        End If
        'Levers 21 - (NOT USED)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever21Top, RGBOFF, True)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever21Bottom, RGBOFF, True)
        'Levers 22 - (AJ21E)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever22Top, SignalOutputState(Definitions.SignalNames.AJ21E), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ21E) = "System" And AJ21Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever22Bottom, RGBOFF, True)
        'Lever 23 - (AJ22W)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever23Top, SignalOutputState(Definitions.SignalNames.AJ22W), (RuntimeConfig.config.SignalState(Definitions.SignalNames.AJ22W) = "System" And AJ22Initiated = True))
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever23Bottom, RGBOFF, True)
        'Levers 24 - (NOT USED)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever24Top, RGBOFF, True)
        UpdateRGBIndicator(Definitions.LeverIndicatorNames.Lever24Bottom, RGBOFF, True)
    End Sub
    Public Sub UpdateRGBIndicator(Indicator As Integer, RGBColour As String, overridden As Boolean)
        If FrameDisplayPower = True Then
            If overridden = False And RGBFlash = True Then
                'Flash Blue or Off depending on if display is set to RGB or Normal
                If RGBMode = True Then
                    SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                Else
                    SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                End If
            Else
                If RGBColour = RGBRed Or RGBColour = "Danger" Then
                    SerialPixelLeds.pixelRed(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                ElseIf RGBColour = RGBGreen Or RGBColour = "Clear" Then
                    If RGBMode = True Then
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    Else
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    End If
                ElseIf RGBColour = RGBBlue Then
                    If RGBMode = True Then
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    Else
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    End If
                ElseIf RGBColour = RGBWarmWhite Then
                    SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (1 * RGBBrightness)
                ElseIf RGBColour = RGBCoolWhite Then
                    SerialPixelLeds.pixelRed(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                ElseIf RGBColour = RGBAllWhite Or RGBColour = "Shunt" Then
                    SerialPixelLeds.pixelRed(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (1 * RGBBrightness)
                ElseIf RGBColour = RGBYellow Or RGBColour = "Caution" Then
                    If RGBMode = True Then
                        SerialPixelLeds.pixelRed(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    Else
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    End If
                ElseIf RGBColour = RGBMagenta Then
                    If RGBMode = True Then
                        SerialPixelLeds.pixelRed(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    Else
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    End If
                ElseIf RGBColour = RGBCyan Then
                    If RGBMode = True Then
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (1 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    Else
                        SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                        SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                    End If
                ElseIf RGBColour = RGBOFF Then
                    SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
                    SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
                End If
            End If
        Else
            SerialPixelLeds.pixelRed(Indicator) = (0 * RGBBrightness)
            SerialPixelLeds.pixelGreen(Indicator) = (0 * RGBBrightness)
            SerialPixelLeds.pixelBlue(Indicator) = (0 * RGBBrightness)
            SerialPixelLeds.pixelWhite(Indicator) = (0 * RGBBrightness)
        End If
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
