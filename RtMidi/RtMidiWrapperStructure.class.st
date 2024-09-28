Class {
	#name : #RtMidiWrapperStructure,
	#superclass : #FFIStructure,
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_MSG',
		'OFFSET_OK',
		'OFFSET_PTR'
	],
	#category : 'RtMidi-uffi'
}

{ #category : #'field definition' }
RtMidiWrapperStructure class >> fieldsDesc [ 
"void *	ptr	 The wrapped RtMidi object.
void *	data	
bool	ok	True when the last function call was OK.
const char *	msg 	If an error occurred (ok != true), set to an error message."
	"self rebuildFieldAccessors"
^ #(
void * 	ptr;
void *	data;
bool	ok;
char *	 msg	;
)

]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> msg [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MSG) type: ExternalType char asPointerType
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> msg: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MSG put: anObject getHandle.
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> msgString [

	^self msg bytesFromCString utf8Decoded.
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> ok [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_OK
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> ok: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_OK put: anObject
]

{ #category : #api }
RtMidiWrapperStructure >> portNames [

	^ (1 to: self rtMidiPortCount) collect: [ :i |
		  self rtMidiPortName: i ]
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType void asPointerType
]

{ #category : #'accessing - structure variables' }
RtMidiWrapperStructure >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : #api }
RtMidiWrapperStructure >> rtMidiOpenPortNumber: portNumberBase1 portName: portName [

	RtMidiFfi
		openPort: self
		portNumber: portNumberBase1
		portName: portName.

]

{ #category : #api }
RtMidiWrapperStructure >> rtMidiPortCount [

	^ RtMidiFfi rtMidiGetPortCount: self
]

{ #category : #api }
RtMidiWrapperStructure >> rtMidiPortName: portNumberOneBased [

	^ RtMidiFfi getPortName: self portNumber: portNumberOneBased
]
