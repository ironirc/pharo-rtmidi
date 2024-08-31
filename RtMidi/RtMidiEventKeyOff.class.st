"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOff,
	#superclass : #RtMidiEventNoteAbstract,
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

{ #category : #services }
RtMidiEventKeyOff >> asByteArray [

	^ {
		  (16r80 bitOr: self channel).
		  self pitch.
		  self velocity } asByteArray 
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

{ #category : #services }
RtMidiEventKeyOff >> sendTo:  receiver [
	 receiver receiveKeyOff:  self
]
