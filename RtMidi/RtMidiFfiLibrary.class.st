Class {
	#name : #RtMidiFfiLibrary,
	#superclass : #FFILibrary,
	#category : #'RtMidi-uffi'
}

{ #category : #initialization }
RtMidiFfiLibrary class >> resetUniqueInstance [
	<script>
	uniqueInstance := nil
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> callbackRunningStrategy [
	"executed once when callback is registered"
	"^ TFCallbackSameProcessRunStrategy uniqueInstance crTrace" "WORKS"
	^ TFCallbackForkRunStrategy new crTrace "WORKS is superclass default"
]

{ #category : #'library path' }
RtMidiFfiLibrary >> ffiLibraryName [
	^ 'rtmidi'
]

{ #category : #'accessing - platform' }
RtMidiFfiLibrary >> macLibraryName [
	^ '/System/Volumes/Data/opt/homebrew/Cellar/rtmidi/6.0.0/lib/librtmidi.7.dylib'
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> runner [
	"executed once when callback is registered"
	^ TFWorker default crTrace  "Works"
	"^TFMainThreadRunner uniqueInstance crTrace" "CRASH"
	"^ TFSameThreadRunner uniqueInstance crTrace" "CRASH is super implementation"
]

{ #category : #'library path' }
RtMidiFfiLibrary >> win32ModuleName [
	   
	^ 'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Release\rtmidi.dll'
]
