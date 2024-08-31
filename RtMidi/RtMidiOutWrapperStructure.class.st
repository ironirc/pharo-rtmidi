Class {
	#name : #RtMidiOutWrapperStructure,
	#superclass : #RtMidiWrapperStructure,
	#category : #RtMidi
}

{ #category : #api }
RtMidiOutWrapperStructure >> rtMidiFree [
	"releases this object - only call once!"
	RtMidiFfi rtMidiOutFree: self
]

{ #category : #api }
RtMidiOutWrapperStructure >> sendNoteOn [

	RtMidiFfi
		rtMidiOutSendMessage: self
		message: #[ 144 64 70  ]
		length: 3.
 100 milliSeconds wait.
	RtMidiFfi
		rtMidiOutSendMessage: self
		message: #[ 128 64 110 ]
		length: 3
]
