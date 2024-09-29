Class {
	#name : 'RtMidiInWrapperStructure',
	#superclass : 'RtMidiWrapperStructure',
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'as yet unclassified' }
RtMidiInWrapperStructure >> rtMidiInGetCurrentApi [

	^ RtMidiFfi rtMidiInGetCurrentApi: self
]
