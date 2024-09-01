Class {
	#name : #RtMidiEventNoteAbstract,
	#superclass : #RtMidiEvent,
	#instVars : [
		'velocity',
		'pitch'
	],
	#category : #'RtMidi-events'
}

{ #category : #accessing }
RtMidiEventNoteAbstract >> pitch [

	^ byteArray at: 2
]

{ #category : #accessing }
RtMidiEventNoteAbstract >> pitch: aPitch [

	byteArray at: 2 put: aPitch
]

{ #category : #services }
RtMidiEventNoteAbstract >> transpose:  aNumber [
	 self pitch:  self pitch +  aNumber
]

{ #category : #acessing }
RtMidiEventNoteAbstract >> velocity [
	^byteArray at: 3
]

{ #category : #acessing }
RtMidiEventNoteAbstract >> velocity:  aValue [
	 byteArray at: 3 put: aValue
]
