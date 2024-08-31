"
Missing comment
"
Class {
	#name : #RtMidiEventKeyPress,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventKeyPress class >> eventTypeNumber [

	
	^ 3
	
]

{ #category : #constants }
RtMidiEventKeyPress class >> eventTypeSymbol [
	^#typeKeyPress
]

{ #category : #services }
RtMidiEventKeyPress >> sendTo:  receiver [
	"	receiver receiveKeyPress: self"

	
]
