"
Missing comment
"
Class {
	#name : #RtMidiEventProgChange,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventProgChange class >> eventTypeNumber [

	^5
]

{ #category : #constants }
RtMidiEventProgChange class >> eventTypeSymbol [
	^#typeProgChange
]

{ #category : #printing }
RtMidiEventProgChange >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[progCh p: ';
		nextPutAll:  self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll:  self channel displayString;
		nextPutAll: ' - val: ';
		nextPutAll:  self value displayString;
		nextPutAll: ']'.
	^ ws contents
]

{ #category : #services }
RtMidiEventProgChange >> sendTo:  receiver [
	 receiver receiveProgChange:  self
]

{ #category : #acessing }
RtMidiEventProgChange >> value [
	^ self interface
		MidiGetField:  cPointer
		with: 0
]

{ #category : #acessing }
RtMidiEventProgChange >> value:  value [
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  value
]
