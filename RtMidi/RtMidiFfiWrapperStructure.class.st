Class {
	#name : 'RtMidiFfiWrapperStructure',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_MSG',
		'OFFSET_OK',
		'OFFSET_PTR'
	],
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'field definition' }
RtMidiFfiWrapperStructure class >> fieldsDesc [ 
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

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> msg [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MSG) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> msg: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MSG put: anObject getHandle.
]

{ #category : 'accessing' }
RtMidiFfiWrapperStructure >> msgString [

	^self msg bytesFromCString utf8Decoded.
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> ok [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_OK
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> ok: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_OK put: anObject
]

{ #category : 'api' }
RtMidiFfiWrapperStructure >> portNames [

	^ (1 to: self rtMidiPortCount) collect: [ :i |
		  self rtMidiPortName: i ]
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
RtMidiFfiWrapperStructure >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : 'api' }
RtMidiFfiWrapperStructure >> rtMidiPortCount [

	^ RtMidiFfi rtMidiGetPortCount: self
]

{ #category : 'api' }
RtMidiFfiWrapperStructure >> rtMidiPortName: portNumberOneBased [

	^ RtMidiFfi getPortName: self portNumber: portNumberOneBased
]
