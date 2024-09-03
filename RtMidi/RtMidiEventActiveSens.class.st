"
Missing comment
"
Class {
	#name : #RtMidiEventActiveSens,
	#superclass : #RtMidiEvent,
	#category : #'RtMidi-events'
}

{ #category : #constants }
RtMidiEventActiveSens class >> eventTypeNumber [

	
	^ 15
	
]

{ #category : #constants }
RtMidiEventActiveSens class >> eventTypeSymbol [
	^#typeActiveSens
]

{ #category : #constants }
RtMidiEventActiveSens class >> messageSize [

	^ 1
]

{ #category : #constants }
RtMidiEventActiveSens class >> statusByte [

	^ 16rFE
]

{ #category : #testing }
RtMidiEventActiveSens >> isActiveSense [

	^ true
]

{ #category : #services }
RtMidiEventActiveSens >> sendTo:  receiver [
		receiver receiveActiveSens: self

	
]

{ #category : #constants }
RtMidiEventActiveSens >> type [
	^#activeSens
]
