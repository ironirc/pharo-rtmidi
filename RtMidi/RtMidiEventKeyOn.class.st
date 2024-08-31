"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOn,
	#superclass : #RtMidiEventNoteAbstract,
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
RtMidiEventKeyOn >> asByteArray [

	^ {
		  (16r90 bitOr: self channel).
		  self pitch.
		  self velocity } asByteArray 
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
