Class {
	#name : #RtMidiFfiLibrary,
	#superclass : #FFILibrary,
	#instVars : [
		'runner'
	],
	#category : 'RtMidi-uffi'
}

{ #category : #initialization }
RtMidiFfiLibrary class >> resetUniqueInstance [
	<script>
	uniqueInstance := nil
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> callbackRunningStrategy [
	"executed once when callback is registered"
	^ TFCallbackSameProcessRunStrategy uniqueInstance crTrace "WORKS"
	"^ TFCallbackForkRunStrategy new crTrace" "WORKS is superclass default"
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> calloutAPIClass [

	^ TFCalloutAPI
]

{ #category : #'library path' }
RtMidiFfiLibrary >> ffiLibraryName [
	^ 'rtmidi'
]

{ #category : #'accessing - platform' }
RtMidiFfiLibrary >> macLibraryName [
	"^ '/System/Volumes/Data/opt/homebrew/Cellar/rtmidi/6.0.0/lib/librtmidi.7.dylib'"
	
^'/Users/ivo/Documents/rtmidi/rtmidi/librtmidi_debug.dylib'	
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> runner [
	"executed once when callback is registered"
	"^ TFWorker default crTrace"  "Works"
	"^TFMainThreadRunner uniqueInstance crTrace" "CRASH"
	"^ TFSameThreadRunner uniqueInstance crTrace" "CRASH is super implementation"
	runner ifNil: [ runner := TFWorker named: 'rtmidirunner' ].
	^runner
]

{ #category : #'library path' }
RtMidiFfiLibrary >> win32ModuleName [
	   
	^ 'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Release\rtmidi.dll'
]
