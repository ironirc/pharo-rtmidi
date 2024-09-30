Class {
	#name : 'RtMidiFfiInWrapperStructure',
	#superclass : 'RtMidiFfiWrapperStructure',
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'as yet unclassified' }
RtMidiFfiInWrapperStructure >> rtMidiInGetCurrentApi [

	^ RtMidiFfi rtMidiInGetCurrentApi: self
]
