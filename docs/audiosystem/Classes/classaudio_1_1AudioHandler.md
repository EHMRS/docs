---
title: audio::AudioHandler
summary: Audio handler class. 

---

# audio::AudioHandler



Audio handler class. 

## Public Functions

|                | Name           |
| -------------- | -------------- |
| def | **[init](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#function-init)**(self self)<br>Initialise the class.  |
| def | **[queue_audio](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#function-queue-audio)**(self self, audio_type audio_type, left left, right right)<br>Queue an audio file for playing.  |
| def | **[play_file](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#function-play-file)**(self self, filename filename, filetype filetype, left left, right right)<br>Actually play an audio file.  |
| def | **[loop](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#function-loop)**(self self)<br>Perform the loop - check if the queue is empty, if not play the audio.  |

## Public Attributes

|                | Name           |
| -------------- | -------------- |
| list | **[directories](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-directories)**  |
| dictionary | **[audio_files](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-audio-files)**  |
| dictionary | **[audio_counters](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-audio-counters)**  |
| dictionary | **[audio_count](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-audio-count)**  |
| | **[root](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-root)**  |
| | **[audio_queue](/SignallingSystem-doc/audiosystem/Classes/classaudio_1_1AudioHandler/#variable-audio-queue)**  |

## Public Functions Documentation

### function init

```python
def init(
    self self
)
```

Initialise the class. 

### function queue_audio

```python
def queue_audio(
    self self,
    audio_type audio_type,
    left left,
    right right
)
```

Queue an audio file for playing. 

### function play_file

```python
def play_file(
    self self,
    filename filename,
    filetype filetype,
    left left,
    right right
)
```

Actually play an audio file. 

### function loop

```python
def loop(
    self self
)
```

Perform the loop - check if the queue is empty, if not play the audio. 

## Public Attributes Documentation

### variable directories

```python
static list directories =  [];
```


### variable audio_files

```python
static dictionary audio_files =  {};
```


### variable audio_counters

```python
static dictionary audio_counters =  {};
```


### variable audio_count

```python
static dictionary audio_count =  {};
```


### variable root

```python
static root =  os.path.dirname(__file__);
```


### variable audio_queue

```python
static audio_queue =  queue.Queue();
```


-------------------------------

Updated on 2022-11-18 at 16:18:58 +0000