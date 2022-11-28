# Topics

All topics to do with signalling are prefixed with `signalling/`.

The topics below show the payload part of the message. The actual message will,
of course, be packaged within an envelope.

## Voltage values

All read values in from the field are voltage values.  
These are an integer between 0 and 1024. This equates to 0 to 50 volts.

## audio

Messages to do with the playing and control of audio

Platform can be 0 for both, 1 for platform 1, or 2 for platform 2

### play

Play an audio clip.

```json
{
  "audio": "approaching|aux1|aux2|aux3|departing|remembranceat|remembrancepost|remembrancepre|siding",
  "platform": 0
}
```

### playing

Notification that a specific file / audio clip is playing.

```json
{
  "file": "/path/to/audio/file.wav",
  "audio": "approaching|aux1|aux2|aux3|departing|remembranceat|remembrancepost|remembrancepre|siding",
  "platform": 0
}
```

### played

Notification that a specific file / audio clip has completed playing.

```json
{
  "file": "/path/to/audio/file.wav",
  "audio": "approaching|aux1|aux2|aux3|departing|remembranceat|remembrancepost|remembrancepre|siding",
  "platform": 0
}
```

## buttons/&lt;id&gt;

Message to do with request buttons. Output sets the halo lights

### input

```json
{
  "value": 450
}
```

### output

```json
{
  "value": true
}
```

### system

```json
{
  "value": true,
  "enabled": true
}
```

### override

```json
{
  "value": true
}
```

### request

```json
{
  "outputOverride": "true|false|system",
  "enabled": "true|false"
}
```

## direction

Direction information

### output

```json
{
  "direction": "eastbound|westbound"
}
```

### system

```json
{
  "direction": "eastbound|westbound"
}
```

### override

```json
{
  "direction": "eastbound|westbound|system"
}
```

### request

Request both direction override, and configure month-based direction

```json
{
  "directionOverride": "eastbound|westbound|system",
  "januaryDirection": "eastbound|westbound",
  "februaryDirection": "eastbound|westbound",
  "marchDirection": "eastbound|westbound",
  "aprilDirection": "eastbound|westbound",
  "mayDirection": "eastbound|westbound",
  "juneDirection": "eastbound|westbound",
  "julyDirection": "eastbound|westbound",
  "augustDirection": "eastbound|westbound",
  "septemberDirection": "eastbound|westbound",
  "octoberDirection": "eastbound|westbound",
  "novemberDirection": "eastbound|westbound",
  "decemberDirection": "eastbound|westbound"
}
```


## levers/&lt;id&gt;

### input

```json
{
  "normal": 450,
  "reverse": 0
}
```

### output

```json
{
  "locked": true
}
```

### system

```json
{
  "input": "normal|reverse|noreturn",
  "locked": true,
  "autoRestroke": false
}
```

### override

```json
{
  "input": "normal|reverse|noreturn|system",
  "locked": "true|false|system"
}
```

### request

```json
{
  "outputOverride": "true|false|system",
  "inputOverride": "true|false|system",
  "autoRestroke": "true|false"
}
```

## messages/add

```json
{
  "type": "error|trts|info",
  "message": "message text"
}
```

## messages/remove

```json
{
  "type": "error|trts|info",
  "message": "message text"
}
```

## points/&lt;name&gt;

Point names are their number.

### input

```json
{
  "normal": 0,
  "reverse": 450
}
```

### output

```json
{
  "normal": false,
  "reverse": false
}
```

### system

```json
{
  "input": "normal|reverse|noreturn",
  "output": "normal|reverse|off"
}
```

### override

```json
{
  "input": "normal|reverse|noreturn|system",
  "output": "normal|reverse|isolated|system"
}
```

### request

```json
{
  "inputOverride": "normal|reverse|noreturn|system",
  "outputOverride": "normal|reverse|isolated|system"
}
```

## relays/&lt;name&gt;

This covers all output and input relays

### input

```json
{
  "value": 450
}
```

### output

```json
{
  "value": true
}
```

## sections/&lt;name&gt;

Section names are their letter, or for point sections P followed by their number
(eg `P5a`)

### input

```json
{
  "value": 450
}
```

### system

```json
{
  "state": "occupied|unoccupied|route|engineer",
  "setPoint": "10",
  "errorPoint": "1",
  "delay": "5"
}
```

### override

```json
{
  "state": "occupied|unoccupied|engineer|system"
}
```

### request

```json
{
  "inputOverride": "occupied|unoccupied|engineer|system",
  "setPoint": "10",
  "errorPoint": "1",
  "delay": "5"
}
```

## sensors/&lt;name&gt;

### input

```json
{
  "no": 450,
  "nc": 0
}
```

### system

```json
{
  "state": "open|closed|noreturn"
}
```

### override

```json
{
  "state": "open|closed|noreturn|system"
}
```

### request

```json
{
  "overrideState": "open|closed|noreturn|system"
}
```

## signals/&lt;name&gt;

`name` is in the format AJ, followed by the number, followed by E or W for 
mainline signals, S followed by the number for shunt only signals

### input

*not currently used, but will be implemented with the new cards*

### output

```json
{
  "danger": true,
  "caution": false,
  "clear": false,
  "route_1": false,
  "route_2": false,
  "shunt": false
}
```

### system

```json
{
  "output": "danger|caution|clear|shunt|noaspect",
  "route_1": true,
  "route_2": true,
  "delay": 5
}
```

### override

```json
{
  "output": "danger|caution|clear|shunt|noaspect|system"
}
```

### request

```json
{
  "outputOverride": "danger|caution|clear|shunt|noaspect|system",
  "delay": 5
}
```

## station

### request

```json
{
  "combineP1": "true|false",
  "requireRequestForSS": "true|false",
  "allowDeparting": "true|false"
}
```
