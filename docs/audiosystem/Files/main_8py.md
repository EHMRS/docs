---
title: C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/main.py
summary: Main application entry. 

---

# C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/main.py

Main application entry. 

## Namespaces

| Name           |
| -------------- |
| **[main](/SignallingSystem-doc/audiosystem/Namespaces/namespacemain/)**  |




## Source code

```python
"""!
@mainpage Signalling System Audio System
@section intro_sec Introduction

This is the audio code for the signalling system for the East Herts Miniature Railway. The
project is written in python and handles all audio that is played through the station PA
system

@file main.py

@brief Main application entry
"""

import logging
from mqtt import mqtt
from audio import audio

logging.basicConfig(level=logging.DEBUG)

def main():
    """! Main entry point"""

    logging.info("Booting")
    mqtt.init()
    audio.init()
    while True:
        audio.loop()

main()
```


-------------------------------

Updated on 2022-11-18 at 16:49:24 +0000
