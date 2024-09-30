Pharo UFFI binding with the rtmidi library. (https://github.com/thestk/rtmidi)  
A set of C++ classes that provide a common API for realtime MIDI input/output across Linux (ALSA & JACK), Macintosh OS X (CoreMIDI & JACK), Windows (Multimedia Library & UWP), Web MIDI, iOS and Android.

## Install in Pharo (11, 12, ...)
```Smalltalk
Metacello new
   baseline: 'RtMidi';
   repository: 'github://ironirc/pharo-rtmidi:main';
   load
```

## On Mac you can install rtmidi with homebrew:
brew install rtmidi

## To run tests you need a port that loops back the midi messages.
On Mac:
Open Audio MIDI Setup:
Go to Finder → Applications → Utilities → Audio MIDI Setup.
Open MIDI Studio:
In the menu bar, click on Window → Show MIDI Studio. A new window with various MIDI devices will appear.
Enable IAC Driver:
Double-click on the IAC Driver icon in the MIDI Studio window. If you don’t see it, it might be disabled. Enable it by checking the box next to "Device is online."
Add a Bus:
In the IAC Driver window, you’ll see a list of buses. Click the + button at the bottom to add a new MIDI bus.
You can name the bus and add more buses if needed.
Save the Settings:
Close the window, and your new IAC bus will now be available in your MIDI applications.

Configure the port name in the testcase(s) 
