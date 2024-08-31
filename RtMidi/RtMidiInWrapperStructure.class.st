Class {
	#name : #RtMidiInWrapperStructure,
	#superclass : #RtMidiWrapperStructure,
	#instVars : [
		'receiveAlarmThunk'
	],
	#category : #RtMidi
}

{ #category : #api }
RtMidiInWrapperStructure >> onEventReceiveDo: aBlock [

	receiveAlarmThunk := FFICallback
		                     signature:
		                     #( void #( double timeStamp , uchar * message
		                           , void * userData ) )
		                     block: [ :timeStamp :message :userData |
			                     aBlock
				                     cull: timeStamp
				                     cull: message
				                     cull: userData nil ].
	receiveAlarmThunk ffiLibrary:
		RtMidiFfiLibrary"WithTfWorkerRunner" uniqueInstance.
	"receiveAlarmThunk backendCallback runStrategy: TFCallbackSameProcessRunStrategy uniqueInstance."
	"receiveAlarmThunk backendCallback runner: TFWorker default."
	RtMidiFfi
		rtMidiInSetCallback: self
		callback: receiveAlarmThunk thunk asExternalAddress
		data: nil
]

{ #category : #api }
RtMidiInWrapperStructure >> rtMidiFree [
	"releases this object - only call once!"
	RtMidiFfi rtMidiInFree: self
]
