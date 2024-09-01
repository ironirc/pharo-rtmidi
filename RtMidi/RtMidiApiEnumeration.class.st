Class {
	#name : #RtMidiApiEnumeration,
	#superclass : #FFIEnumeration,
	#classVars : [
		'RTMIDI_API_ANDROID',
		'RTMIDI_API_LINUX_ALSA',
		'RTMIDI_API_MACOSX_CORE',
		'RTMIDI_API_NUM',
		'RTMIDI_API_RTMIDI_DUMMY',
		'RTMIDI_API_UNIX_JACK',
		'RTMIDI_API_UNSPECIFIED',
		'RTMIDI_API_WEB_MIDI_API',
		'RTMIDI_API_WINDOWS_MM',
		'RTMIDI_API_WINDOWS_UWP'
	],
	#category : #'RtMidi-uffi'
}

{ #category : #accessing }
RtMidiApiEnumeration class >> doc [ 
"
RTMIDI_API_UNSPECIFIED 	
Search for a working compiled API.

RTMIDI_API_MACOSX_CORE 	
Macintosh OS-X CoreMIDI API.

RTMIDI_API_LINUX_ALSA 	
The Advanced Linux Sound Architecture API.

RTMIDI_API_UNIX_JACK 	
The Jack Low-Latency MIDI Server API.

RTMIDI_API_WINDOWS_MM 	
The Microsoft Multimedia MIDI API.

RTMIDI_API_RTMIDI_DUMMY 	
A compilable but non-functional API.

RTMIDI_API_WEB_MIDI_API 	
W3C Web MIDI API.

RTMIDI_API_WINDOWS_UWP 	
The Microsoft Universal Windows Platform MIDI API.

RTMIDI_API_ANDROID 	
The Android MIDI API.

RTMIDI_API_NUM 	
Number of values in this enum.
"
]

{ #category : #constants }
RtMidiApiEnumeration class >> enumDecl [
"self initialize"
^ #(
RTMIDI_API_UNSPECIFIED 0
RTMIDI_API_MACOSX_CORE 1
RTMIDI_API_LINUX_ALSA 2
RTMIDI_API_UNIX_JACK 3
RTMIDI_API_WINDOWS_MM 4
RTMIDI_API_RTMIDI_DUMMY 5
RTMIDI_API_WEB_MIDI_API 6
RTMIDI_API_WINDOWS_UWP 7
RTMIDI_API_ANDROID 7
RTMIDI_API_NUM 8
)

]
