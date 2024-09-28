Class {
	#name : #RtMidiOutWrapperStructure,
	#superclass : #RtMidiWrapperStructure,
	#category : 'RtMidi-uffi'
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
RtMidiOutWrapperStructure >> sendRandom3MsNoteOnAndOff [

	| p |
	p := 32 atRandom + 48.
	self sendMessage: {
			144.
			p.
			70 } asByteArray.
	3 milliSeconds wait.
	self sendMessage: {
			128.
			p.
			70 } asByteArray
]
