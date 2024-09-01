"
Missing comment
"
Class {
	#name : #RtMidiEventKeyOff,
	#superclass : #RtMidiEventNoteAbstract,
	#category : #'RtMidi-events'
}

{ #category : #constants }
RtMidiEventKeyOff class >> eventTypeNumber [

	
	^2
	
]

{ #category : #constants }
RtMidiEventKeyOff class >> eventTypeSymbol [
	^#typeKeyOff
]

{ #category : #constants }
RtMidiEventKeyOff class >> statusByte [

	^ 16r80
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
