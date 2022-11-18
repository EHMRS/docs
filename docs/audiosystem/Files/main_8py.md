---
title: C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/main.py

---

# C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/main.py



## Namespaces

| Name           |
| -------------- |
| **[main](/SignallingSystem-doc/audiosystem/Namespaces/namespacemain/)** <br>Main entry point.  |




## Source code

```python
"""! @brief Main entry point"""


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

Updated on 2022-11-18 at 16:18:58 +0000
