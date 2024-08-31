"
Missing comment
"
Class {
	#name : #RtMidiEventCtrlChange,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventCtrlChange class >> eventTypeNumber [

	
	^ 4
	
]

{ #category : #constants }
RtMidiEventCtrlChange class >> eventTypeSymbol [
	^#typeCtrlChange
]

{ #category : #printing }
RtMidiEventCtrlChange >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[p: ';
		nextPutAll:  self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll:  self channel displayString;
		nextPutAll: ' - ctrlCh: ';
		nextPutAll:  self number displayString;
		nextPutAll: ' - val: ';
		nextPutAll:  self value displayString;
		nextPutAll: ']'.
	^ ws contents
]

{ #category : #acessing }
RtMidiEventCtrlChange >> number [
	^ self interface
		MidiGetField:  cPointer
		with: 0
]

{ #category : #acessing }
RtMidiEventCtrlChange >> number:  number [
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  number
]

{ #category : #services }
RtMidiEventCtrlChange >> sendTo:  receiver [
	 receiver receiveCtrlChange:  self
]

{ #category : #constants }
RtMidiEventCtrlChange >> type [
	^#ctrlChange
]

{ #category : #acessing }
RtMidiEventCtrlChange >> value [
	^ self interface
		MidiGetField:  cPointer
		with: 1
]

{ #category : #acessing }
RtMidiEventCtrlChange >> value:  value [
	 self interface
		MidiSetField:  cPointer
		with: 1
		with:  value
]
