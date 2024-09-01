Class {
	#name : #RtMidiInWrapperStructure,
	#superclass : #RtMidiWrapperStructure,
	#instVars : [
		'receiveAlarmThunk'
	],
	#category : #'RtMidi-uffi'
}

{ #category : #api }
RtMidiInWrapperStructure >> onEventReceiveDo: aBlock [

	self onMessageReceiveDo: [ :ts :msg :data |
		aBlock value: (RtMidiEvent newForByteArray: msg) ]
]

{ #category : #api }
RtMidiInWrapperStructure >> onMessageReceiveDo: aBlock [

	receiveAlarmThunk := FFICallback
		                     signature:
			                     #( void #( double timeStamp , void * message
			                           , ulong messageSize , void * userData ) )
		                     block: [ :timeStamp :message :messageSize :userData |
			                     | ba |
			                     ba := message copyFrom: 1 to: messageSize.
			                     aBlock cull: timeStamp cull: ba cull: userData.
			                     nil ].
	receiveAlarmThunk ffiLibrary:
		RtMidiFfiLibraryWithTfWorkerRunner uniqueInstance.
	"receiveAlarmThunk backendCallback runStrategy: TFCallbackSameProcessRunStrategy uniqueInstance."
	"receiveAlarmThunk backendCallback runner: TFWorker default."
	RtMidiFfi
		rtMidiInSetCallback: self
		callback: receiveAlarmThunk thunk asExternalAddress
		data: 0
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
