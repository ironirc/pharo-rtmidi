"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOn,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventKeyOn class >> eventTypeNumber [

	^ 1
]

{ #category : #constants }
RtMidiEventKeyOn class >> eventTypeSymbol [
	^#typeKeyOn
]

{ #category : #printing }
RtMidiEventKeyOn >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[keyOn p: ';
		nextPutAll:  self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll:  self channel displayString;
		nextPutAll: ' - pitch: ';
		nextPutAll:  self pitch displayString;
		nextPutAll: ' - vel: ';
		nextPutAll:  self velocity displayString;
		nextPutAll: ']'.
	^ ws contents
]

{ #category : #acessing }
RtMidiEventKeyOn >> pitch [
	^ self interface
		MidiGetField:  cPointer
		with: 0
]

{ #category : #acessing }
RtMidiEventKeyOn >> pitch:  pitch [
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  pitch
]

{ #category : #services }
RtMidiEventKeyOn >> sendTo:  receiver [
	 receiver receiveKeyOn:  self
]

{ #category : #services }
RtMidiEventKeyOn >> transpose:  aNumber [
	 self pitch:  self pitch +  aNumber
]

{ #category : #acessing }
RtMidiEventKeyOn >> velocity [
	^ self interface
		MidiGetField:  cPointer
		with: 1
]

{ #category : #acessing }
RtMidiEventKeyOn >> velocity:  velocity [
	 self interface
		MidiSetField:  cPointer
		with: 1
		with:  velocity
]
