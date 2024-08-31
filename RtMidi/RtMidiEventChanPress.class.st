"
Missing comment
"
Class {
	#name : #RtMidiEventChanPress,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventChanPress class >> eventTypeNumber [

	
	^ 6
	
]

{ #category : #constants }
RtMidiEventChanPress class >> eventTypeSymbol [
	^#typeChanPress
]

{ #category : #services }
RtMidiEventChanPress >> sendTo:  receiver [
	 receiver receiveChanPress:  self
]

{ #category : #constants }
RtMidiEventChanPress >> type [
	^#chanPress
]

{ #category : #acessing }
RtMidiEventChanPress >> value [
	^ self interface
		MidiGetField:  cPointer
		with: 0
]

{ #category : #acessing }
RtMidiEventChanPress >> value:  value [
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  value
]
