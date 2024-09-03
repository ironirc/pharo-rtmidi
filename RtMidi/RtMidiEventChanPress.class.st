"
Missing comment
"
Class {
	#name : #RtMidiEventChanPress,
	#superclass : #RtMidiEvent,
	#category : #'RtMidi-events'
}

{ #category : #constants }
RtMidiEventChanPress class >> eventTypeNumber [

	
	^ 6
	
]

{ #category : #constants }
RtMidiEventChanPress class >> eventTypeSymbol [
	^#typeChanPress
]

{ #category : #constants }
RtMidiEventChanPress class >> messageSize [

	^ 2
]

{ #category : #constants }
RtMidiEventChanPress class >> statusByte [

	^ 16rD0
]

{ #category : #services }
RtMidiEventChanPress >> sendTo:  receiver [
	 receiver receiveChanPress:  self
]

{ #category : #constants }
RtMidiEventChanPress >> type [
	^#chanPress
]

{ #category : #accessing }
RtMidiEventChanPress >> value [

	^ byteArray at: 2
]

{ #category : #accessing }
RtMidiEventChanPress >> value: anObject [

	byteArray at: 2 put: anObject
]
