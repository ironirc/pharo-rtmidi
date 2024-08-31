"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOff,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventKeyOff class >> eventTypeNumber [

	
	^2
	
]

{ #category : #constants }
RtMidiEventKeyOff class >> eventTypeSymbol [
	^#typeKeyOff
]

{ #category : #printing }
RtMidiEventKeyOff >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[keyOff p: ';
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
RtMidiEventKeyOff >> pitch [
	^ self interface
		MidiGetField:  cPointer
		with: 0
]

{ #category : #acessing }
RtMidiEventKeyOff >> pitch:  pitch [
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  pitch
]

{ #category : #services }
RtMidiEventKeyOff >> sendTo:  receiver [
	 receiver receiveKeyOff:  self
]

{ #category : #acessing }
RtMidiEventKeyOff >> transpose:  aNumber [
	 self pitch:  self pitch +  aNumber
]

{ #category : #acessing }
RtMidiEventKeyOff >> velocity [
	^ self interface
		MidiGetField:  cPointer
		with: 1
]

{ #category : #acessing }
RtMidiEventKeyOff >> velocity:  velocity [
	 self interface
		MidiSetField:  cPointer
		with: 1
		with:  velocity
]
