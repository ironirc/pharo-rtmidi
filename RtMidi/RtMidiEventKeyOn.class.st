"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOn,
	#superclass : #RtMidiEventNoteAbstract,
	#category : 'RtMidi-events'
}

{ #category : #constants }
RtMidiEventKeyOn class >> eventTypeNumber [

	^ 1
]

{ #category : #constants }
RtMidiEventKeyOn class >> eventTypeSymbol [
	^#typeKeyOn
]

{ #category : #constants }
RtMidiEventKeyOn class >> statusByte [

	^ 16r90
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

{ #category : #services }
RtMidiEventKeyOn >> sendTo:  receiver [
	 receiver receiveKeyOn:  self
]
