"
Missing comment
"
Class {
	#name : #RtMidiEventProgChange,
	#superclass : #RtMidiEvent,
	#instVars : [
		'value'
	],
	#category : #'RtMidi-events'
}

{ #category : #constants }
RtMidiEventProgChange class >> eventTypeNumber [

	^5
]

{ #category : #constants }
RtMidiEventProgChange class >> eventTypeSymbol [
	^#typeProgChange
]

{ #category : #constants }
RtMidiEventProgChange class >> messageSize [

	^ 2
]

{ #category : #constants }
RtMidiEventProgChange class >> statusByte [

	^ 16rC0
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
	^value
]

{ #category : #acessing }
RtMidiEventProgChange >> value: aValue [

	value := aValue
]
