"
Missing comment
"
Class {
	#name : #RtMidiEventCtrlChange14b,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventCtrlChange14b class >> eventTypeNumber [

	
	^ 131
	
]

{ #category : #constants }
RtMidiEventCtrlChange14b class >> eventTypeSymbol [
	^#typeCtrl14b
]

{ #category : #services }
RtMidiEventCtrlChange14b >> sendTo:  receiver [
	"discard for now....rarely implemented????"

	
]
