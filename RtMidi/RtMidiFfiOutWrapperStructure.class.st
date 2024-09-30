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
