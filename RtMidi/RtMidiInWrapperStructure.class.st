Class {
	#name : #RtMidiInWrapperStructure,
	#superclass : #RtMidiWrapperStructure,
	#instVars : [
		'callback'
	],
	#category : #'RtMidi-uffi'
}

{ #category : #api }
RtMidiInWrapperStructure >> onEventReceiveDo: aBlock [

	self onMessageReceiveDo: [ :ba |
		aBlock value: (RtMidiEvent newForByteArray: ba) ]
]

{ #category : #api }
RtMidiInWrapperStructure >> onMessageReceiveDo: aBlock [

	callback := FFICallback
		            signature:
			            #( void #( double timeStamp , void * message , ulong
			                  messageSize , void * userData ) )
		            block: [ :timeStamp :message :messageSize :userData |
			            aBlock value: (message copyFrom: 1 to: messageSize) ].
	callback ffiLibrary: RtMidiFfiLibrary uniqueInstance.
	RtMidiFfi rtMidiInSetCallback: self callback: callback data: nil
]

{ #category : #api }
RtMidiInWrapperStructure >> rtMidiCancelCallback [

	RtMidiFfi rtMidiInCancelCallback: self
]

{ #category : #api }
RtMidiInWrapperStructure >> rtMidiFree [
	"releases this object - only call once!"
	RtMidiFfi rtMidiInFree: self
]
