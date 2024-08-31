Class {
	#name : #RtMidiFfiLibraryWithTfWorkerRunner,
	#superclass : #FFILibrary,
	#category : #RtMidi
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
	^ 'libclntsh.dylib'
]

{ #category : #receiveAlarms }
RtMidiFfiLibraryWithTfWorkerRunner >> runner [

	^ TFWorker default
]

{ #category : #'library path' }
RtMidiFfiLibraryWithTfWorkerRunner >> win32ModuleName [
	   
	^ 'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Release\rtmidi.dll'
]
