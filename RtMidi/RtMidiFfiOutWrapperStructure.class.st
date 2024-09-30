Class {
	#name : 'RtMidiFfiOutWrapperStructure',
	#superclass : 'RtMidiFfiWrapperStructure',
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'api' }
RtMidiFfiOutWrapperStructure >> rtMidiFree [
	"releases this object - only call once!"
	RtMidiFfi rtMidiOutFree: self
]

{ #category : 'api' }
RtMidiFfiOutWrapperStructure >> sendMessage: msg [

	RtMidiFfi rtMidiOutSendMessage: self message: msg
]

{ #category : 'api' }
RtMidiFfiOutWrapperStructure >> sendRandom3MsNoteOnAndOff [

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
