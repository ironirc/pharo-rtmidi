Class {
	#name : 'RtMidiFfiInWrapperStructure',
	#superclass : 'RtMidiFfiWrapperStructure',
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'as yet unclassified' }
RtMidiFfiInWrapperStructure >> rtMidiInGetCurrentApi [
"not used currently"
	^ RtMidiFfi rtMidiInGetCurrentApi: self
]
