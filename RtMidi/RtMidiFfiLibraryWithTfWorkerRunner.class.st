Class {
	#name : #RtMidiFfiLibraryWithTfWorkerRunner,
	#superclass : #FFILibrary,
	#category : #'RtMidi-uffi'
}

{ #category : #initialization }
RtMidiFfiLibraryWithTfWorkerRunner class >> resetUniqueInstance [
	<script>
	uniqueInstance := nil
]

{ #category : #'library path' }
RtMidiFfiLibraryWithTfWorkerRunner >> ffiLibraryName [
	^ 'rtmidi'
]

{ #category : #'accessing - platform' }
RtMidiFfiLibraryWithTfWorkerRunner >> macLibraryName [
	^ '/System/Volumes/Data/opt/homebrew/Cellar/rtmidi/6.0.0/lib/librtmidi.7.dylib'
]

{ #category : #receiveAlarms }
RtMidiFfiLibraryWithTfWorkerRunner >> runner [

	^ TFWorker default
]

{ #category : #'library path' }
RtMidiFfiLibraryWithTfWorkerRunner >> win32ModuleName [
	   
	^ 'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Release\rtmidi.dll'
]
