---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/DigitalDeviceAddress.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Devices/DigitalDeviceAddress.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[DigitalDeviceAddress](/SignallingSystem-doc/mainsystem/Classes/classDigitalDeviceAddress/)**  |




## Source code

```csharp
Public Class DigitalDeviceAddress
    'Input address
    'Frame
    Public Shared ReadOnly InputAddressEStopMonitor As Integer = 158
    Public Shared ReadOnly InputAddressACMonitor As Integer = 159
    Public Shared ReadOnly InputAddressAUXContactorDetection As Integer = 160

    Public Shared ReadOnly InputRelayAddress() As Integer = {158, 159, 160, -1, -1, -1, -1}
    Public Shared ReadOnly OutputRelayAddress() As Integer = {-1, -1, -1, 91, 92, 89, 88}

    Public Shared ReadOnly InputSensorAddresses() As Integer = {41, 42, 43, 44, 49, 50, 51, 52, 53, 54, 55, 56}
    '

    Public Shared ReadOnly InputAddressEastBound As Integer = 145
    Public Shared ReadOnly InputAddressWestBound As Integer = 146
    Public Shared ReadOnly InputAddressMode As Integer = 0
    Public Shared ReadOnly InputAddressReleaseLevers As Integer = 0
    'Frame
    Public Shared ReadOnly InputAddressOuterCrossingGateOutwardsBeamMade As Integer = 49 'Outer gate outwards facing beam made (Switch 1)
    Public Shared ReadOnly InputAddressOuterCrossingGateOutwardsBeamBroken As Integer = 50 'Outer gate outwards facing beam Broken (Switch 1)
    Public Shared ReadOnly InputAddressOuterCrossingGateInwardsBeamMade As Integer = 51 'Outer gate outwards facing beam made (Switch 2)
    Public Shared ReadOnly InputAddressOuterCrossingGateInwardsBeamBroken As Integer = 52 'Outer gate inwards facing beam made (Switch 2)
    Public Shared ReadOnly InputAddressInnerCrossingGateOutwardsBeamMade As Integer = 53 'Inner gate inwards facing beam Broken (Switch 3)
    Public Shared ReadOnly InputAddressInnerCrossingGateOutwardsBeamBroken As Integer = 54 'Inner gate outwards facing beam Broken (Switch 3)
    Public Shared ReadOnly InputAddressInnerCrossingGateInwardsBeamMade As Integer = 55 'Inner gate outwards facing beam made (Switch 4)
    Public Shared ReadOnly InputAddressInnerCrossingGateInwardsBeamBroken As Integer = 56 'Inner gate outwards facing beam Broken (Switch 4)
    Public Shared ReadOnly InputAddressTunnelEastEndOpen As Integer = 41 'Tunnel end 1 NO
    Public Shared ReadOnly InputAddressTunnelEastEndClose As Integer = 42 'Tunnel end 1 NC
    Public Shared ReadOnly InputAddressTunnelWestEndOpen As Integer = 43 'Tunnel end 2 NO
    Public Shared ReadOnly InputAddressTunnelWestEndClose As Integer = 44 'Tunnel end 2 NC

    'Levers
    Public Shared ReadOnly InputAddressLeverNormal() As Integer = {57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 0, 95, 153, 0, 0} 'Lever Normal
    Public Shared ReadOnly InputAddressLeverReverse() As Integer = {58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 0, 96, 154, 0, 0} 'Lever Reverse
    Public Shared ReadOnly OutputAddressLeverLock() As Integer = {185, 186, 187, 188, 189, 190, 191, 192, 177, 178, 179, 181, 182, 183, 184, 169, 170, 171, 172, 173, 174, 175, 0, 0} 'Lever Locks

    'Buttons
    Public Shared ReadOnly InputAddressButton() As Integer = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40} 'Button Inputs
    Public Shared ReadOnly OutputAddressButtonIndicator() As Integer = {281, 282, 283, 284, 285, 286, 287, 288, 273, 274, 275, 276, 277, 278, 279, 280, 265, 266, 267, 268, 269, 270, 271, 272, 257, 258, 259, 260, 261, 262, 263, 264, 217, 218, 219, 220, 221, 222, 223, 224} 'Button Indicators

    'Points
    Public Shared ReadOnly OutputAddressPointsNormal() As Integer = {249, 251, 253, 255, 241, 243, 245, 247, 233, 235} ' Point Normal
    Public Shared ReadOnly OutputAddressPointsReverse() As Integer = {250, 252, 254, 256, 242, 244, 246, 248, 234, 236} ' Point Reverse

    'Power check inputs
    Public Shared ReadOnly InputAddressPowerCheckInput() As Integer = {97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144} 'Supply Inputs


    'Old Output addresses
    Public Shared ReadOnly SafetyRelay As Integer = 4 'Safety Relay

    Public Shared ReadOnly OutputAddressBell As Integer = 168 ' Bell Relay
    Public Shared ReadOnly OutputAddressEastBound As Integer = 2  ' Eastbound Relay
    Public Shared ReadOnly OutputAddressWestBound As Integer = 1 ' Westbound Relay

    'Output addresses------------------------------------------------------------------------------------------------

    'Frame
    Public Shared ReadOnly OutputAddressEStopReset As Integer = 89
    Public Shared ReadOnly OutputAddressEStopTrigger As Integer = 90
    Public Shared ReadOnly OutputAddressAirRelay As Integer = 91
    Public Shared ReadOnly OutputAddressAUXContactorON As Integer = 92
    Public Shared ReadOnly OutputAddressAUXContactorOFF As Integer = 93
    'Crossing
    Public Shared ReadOnly OutputAddressCrossingWarningBuzzer As Integer = 0 'Level Crossing warning buzzer
    'Signals
    Public Shared SignalOutputAddressClear(Signals.SignalCount) As Integer
    Public Shared SignalOutputAddressCaution(Signals.SignalCount) As Integer
    Public Shared SignalOutputAddressDanger(Signals.SignalCount) As Integer
    Public Shared SignalOutputAddressRoute1(Signals.SignalCount) As Integer
    Public Shared SignalOutputAddressRoute2(Signals.SignalCount) As Integer
    Public Shared SignalOutputAddressShunt(Signals.SignalCount) As Integer

    Public Shared SignalOutputAddressAJ16WLimitOfShunt As Integer = 308


    'Station equipment Outputs
    Public Shared ReadOnly OutputAddressCallInBuzzer As Integer = 294 'WB OFF Indicator
    Public Shared ReadOnly OutputAddressEBOFFIndicator As Integer = 295 'EB OFF Indicator
    Public Shared ReadOnly OutputAddressWBOFFIndicator As Integer = 296 'WB OFF Indicator
    'Mimic Display Outputs
    Public Shared ReadOnly OutputAddressMimicDisplaySectionA As Integer = 121 'Mimic Display Section A
    Public Shared ReadOnly OutputAddressMimicDisplaySectionB As Integer = 122 'Mimic Display Section B
    Public Shared ReadOnly OutputAddressMimicDisplaySectionC As Integer = 123 'Mimic Display Section C
    Public Shared ReadOnly OutputAddressMimicDisplaySectionD As Integer = 124 'Mimic Display Section D
    Public Shared ReadOnly OutputAddressMimicDisplaySectionE As Integer = 125 'Mimic Display Section E
    Public Shared ReadOnly OutputAddressMimicDisplaySectionF As Integer = 126 'Mimic Display Section F
    Public Shared ReadOnly OutputAddressMimicDisplaySectionFF13 As Integer = 102 'Mimic Display Section F/F13
    Public Shared ReadOnly OutputAddressMimicDisplaySectionG As Integer = 127 'Mimic Display Section G
    Public Shared ReadOnly OutputAddressMimicDisplaySectionH As Integer = 128 'Mimic Display Section H
    Public Shared ReadOnly OutputAddressMimicDisplaySectionI As Integer = 113 'Mimic Display Section I
    Public Shared ReadOnly OutputAddressMimicDisplaySectionJ As Integer = 114 'Mimic Display Section J
    Public Shared ReadOnly OutputAddressMimicDisplaySectionK As Integer = 115 'Mimic Display Section K
    Public Shared ReadOnly OutputAddressMimicDisplaySectionL As Integer = 116 'Mimic Display Section L
    Public Shared ReadOnly OutputAddressMimicDisplaySectionM As Integer = 117 'Mimic Display Section M
    Public Shared ReadOnly OutputAddressMimicDisplaySectionN As Integer = 118 'Mimic Display Section N
    Public Shared ReadOnly OutputAddressMimicDisplaySectionO As Integer = 119 'Mimic Display Section O
    Public Shared ReadOnly OutputAddressMimicDisplaySectionP As Integer = 120 'Mimic Display Section P
    Public Shared ReadOnly OutputAddressMimicDisplaySectionQ As Integer = 105 'Mimic Display Section Q
    Public Shared ReadOnly OutputAddressMimicDisplayPoint5a As Integer = 106 'Mimic Display Point5a
    Public Shared ReadOnly OutputAddressMimicDisplayPoint5b As Integer = 107 'Mimic Display Point5b
    Public Shared ReadOnly OutputAddressMimicDisplayPoint6a As Integer = 108 'Mimic Display Point6a
    Public Shared ReadOnly OutputAddressMimicDisplayPoint6b As Integer = 109 'Mimic Display Point6b
    Public Shared ReadOnly OutputAddressMimicDisplayPoint10 As Integer = 110 'Mimic Display Point10
    Public Shared ReadOnly OutputAddressMimicDisplayPoint11 As Integer = 111 'Mimic Display Point11
    Public Shared ReadOnly OutputAddressMimicDisplayPoint12 As Integer = 112 'Mimic Display Point12
    Public Shared ReadOnly OutputAddressMimicDisplayPoint13 As Integer = 97 'Mimic Display Point13
    Public Shared ReadOnly OutputAddressMimicDisplayPoint14 As Integer = 98 'Mimic Display Point14
    Public Shared ReadOnly OutputAddressMimicDisplayPoint19 As Integer = 99 'Mimic Display Point19
    Public Shared ReadOnly OutputAddressMimicDisplayEB As Integer = 100 'Mimic Display EB
    Public Shared ReadOnly OutputAddressMimicDisplayWB As Integer = 101 'Mimic Display WB
End Class
```


-------------------------------

Updated on 2022-11-18 at 16:49:20 +0000
