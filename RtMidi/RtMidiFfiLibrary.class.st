Class {
	#name : #RtMidiFfiLibrary,
	#superclass : #FFILibrary,
	#category : #RtMidi
}

{ #category : #initialization }
RtMidiFfiLibrary class >> resetUniqueInstance [
	<script>
	uniqueInstance := nil
]

{ #category : #'library path' }
RtMidiFfiLibrary >> callbackRunningStrategy [

	^ TFWorker default
]

{ #category : #'library path' }
RtMidiFfiLibrary >> ffiLibraryName [
	^ 'rtmidi'
]

{ #category : #'accessing - platform' }
RtMidiFfiLibrary >> macLibraryName [
	^ 'libclntsh.dylib'
]

{ #category : #receiveAlarms }
RtMidiFfiLibrary >> onReceiveInApplication:  appNumber do:  aBlock [
	"	self MidiSetRcvAlarm: appNumber
		with: aBlock"

	
]

{ #category : #'library path' }
RtMidiFfiLibrary >> win32ModuleName [
	   
	^ 'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Release\rtmidi.dll'
]
