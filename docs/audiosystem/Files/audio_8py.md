---
title: C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/audio.py

---

# C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/audio.py



## Namespaces

| Name           |
| -------------- |
| **[audio](/SignallingSystem-doc/audiosystem/Namespaces/namespaceaudio/)** <br>Functions handling audio.  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[audio::AudioHandler](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/)** <br>Audio handler class.  |




## Source code

```python
"""! Functions handling audio """
import os
import queue
import logging

from pydub import AudioSegment
from pydub.playback import play
from mqtt import mqtt


class AudioHandler:
    """! Audio handler class """
    directories = []
    audio_files = {}

    audio_counters = {}
    audio_count = {}
    root = os.path.dirname(__file__)

    audio_queue = queue.Queue()

    def init(self):
        """! Initialise the class """
        for option in os.listdir(f"{self.root}/media"):
            if option[:1] == ".":
                continue
            if os.path.isdir(f"{self.root}/media/{option}"):
                self.directoriesdirectories.append(option)

        for directory in self.directoriesdirectories:
            has_wave = False
            self.audio_filesaudio_files[directory] = []
            for option in os.listdir(f"{self.root}/media/{directory}"):
                if option[-4:] == ".wav":
                    has_wave = True
                    self.audio_filesaudio_files[directory].append(
                        f"{self.root}/media/{directory}/{option}"
                        )
            if not has_wave:
                del self.audio_filesaudio_files[directory]
            else:
                self.audio_countaudio_count[directory] = len(self.audio_filesaudio_files[directory])
                self.audio_countersaudio_counters[directory] = 0

    def queue_audio(self, audio_type, left, right):
        """! Queue an audio file for playing """
        # Check it is a valid sound
        try:
            self.audio_filesaudio_files[audio_type]
        except KeyError:
            # Invalid audio file
            logging.debug("Invalid audio file requested: %s", audio_type)
            return
        current_index = self.audio_countersaudio_counters[audio_type]
        filename = self.audio_filesaudio_files[audio_type][current_index]

        self.audio_queueaudio_queue.put((filename, audio_type, left, right))

        self.audio_countersaudio_counters[audio_type] = (current_index + 1) % self.audio_countaudio_count[audio_type]

    def play_file(self, filename, filetype, left, right):
        """! Actually play an audio file """
        logging.info("Playing file %s", filename)
        if left and right:
            platform = 0
        elif left:
            platform = 1
        elif right:
            platform = 2
        mqtt.send_message("signalling/audio/playing",
                    {"file": filename, "audio": filetype, "platform": platform})
        file = AudioSegment.from_file(filename)

        if file.channels == 2:
            file, _ = file[:len(file)].split_to_mono()

        silent = AudioSegment.silent(len(file), frame_rate=file.frame_rate)
        if left and right:
            new = AudioSegment.from_mono_audiosegments(file[:len(file)], file[:len(file)])
        elif left:
            new = AudioSegment.from_mono_audiosegments(file[:len(file)], silent)
        elif right:
            new = AudioSegment.from_mono_audiosegments(silent, file[:len(file)])
        else:
            return
        play(new)
        mqtt.send_message(
            "signalling/audio/played",
            {"file": filename, "audio": filetype, "platform": platform}
            )
        logging.info("Finished playing %s", filename)

    def loop(self):
        """! Perform the loop - check if the queue is empty, if not play the audio """
        if not self.audio_queueaudio_queue.empty():
            filename, filetype, left, right = self.audio_queueaudio_queue.get()
            self.play_fileplay_file(filename, filetype, left, right)

audio = AudioHandler()
```


-------------------------------

Updated on 2022-11-18 at 16:49:24 +0000
