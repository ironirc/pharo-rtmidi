Class {
	#name : 'RtMidiInWrapperStructure',
	#superclass : 'RtMidiWrapperStructure',
	#instVars : [
		'callback'
	],
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'api' }
RtMidiInWrapperStructure >> onMessageReceiveDo: aBlock [

	callback := RtMidiFfiLibrary uniqueInstance
		            newCallbackWithSignature:
			            #( void #( double timeStamp #, void #* message #, ulong
			                  messageSize #, void #* userData ) )
		            block: [ :timeStamp :message :messageSize :userData |
			            aBlock value: (message copyFrom: 1 to: messageSize).
			            Processor activeProcess terminate "not sure about this, just a wild guess in order to try to avoid mem leak"].
	RtMidiFfi rtMidiInSetCallback: self callback: callback data: nil
]

{ #category : 'api' }
RtMidiInWrapperStructure >> rtMidiCancelCallback [

	RtMidiFfi rtMidiInCancelCallback: self
]

{ #category : 'api' }
RtMidiInWrapperStructure >> rtMidiFree [
	"releases this object - only call once!"
	RtMidiFfi rtMidiInFree: self
]
