Class {
	#name : #RtMidiEventNoteAbstract,
	#superclass : #RtMidiEvent,
	#instVars : [
		'velocity',
		'pitch'
	],
	#category : #RtMidi
}

{ #category : #services }
RtMidiEventNoteAbstract >> initFromByteStream: rs [


	self channel: (16r0F bitAnd: rs next).
	self pitch: rs next.
	self velocity: rs next
]

{ #category : #accessing }
RtMidiEventNoteAbstract >> pitch [

	^ pitch
]

{ #category : #accessing }
RtMidiEventNoteAbstract >> pitch: anObject [

	pitch := anObject
]

{ #category : #services }
RtMidiEventNoteAbstract >> transpose:  aNumber [
	 self pitch:  self pitch +  aNumber
]

{ #category : #acessing }
RtMidiEventNoteAbstract >> velocity [
	^velocity
]

{ #category : #acessing }
RtMidiEventNoteAbstract >> velocity:  aValue [
	 velocity := aValue
]
