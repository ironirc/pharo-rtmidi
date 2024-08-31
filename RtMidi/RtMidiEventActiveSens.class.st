"
Missing comment
"
Class {
	#name : #RtMidiEventActiveSens,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventActiveSens class >> eventTypeNumber [

	
	^ 15
	
]

{ #category : #constants }
RtMidiEventActiveSens class >> eventTypeSymbol [
	^#typeActiveSens
]

{ #category : #testing }
RtMidiEventActiveSens >> isActiveSense [

	^ true
]

{ #category : #services }
RtMidiEventActiveSens >> sendTo:  receiver [
	"	receiver receiveActiveSens: self"

	
]

{ #category : #constants }
RtMidiEventActiveSens >> type [
	^#activeSens
]
