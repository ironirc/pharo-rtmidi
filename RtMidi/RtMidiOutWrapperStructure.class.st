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
RtMidiOutWrapperStructure >> sendMessage: msg [

	RtMidiFfi rtMidiOutSendMessage: self message: msg
]

{ #category : #api }
RtMidiOutWrapperStructure >> sendTestNoteOnAndOff [

	self sendMessage: #[ 144 64 70 ].
	100 milliSeconds wait.
	self sendMessage: #[ 128 64 110 ]
]
