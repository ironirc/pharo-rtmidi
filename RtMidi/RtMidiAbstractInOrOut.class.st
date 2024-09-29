Class {
	#name : 'RtMidiAbstractInOrOut',
	#superclass : 'Object',
	#instVars : [
		'portName',
		'handle'
	],
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiAbstractInOrOut >> close [

	handle ifNotNil: [
		self interface rtMidiInFree: handle.
		handle := nil ]
]

{ #category : 'accessing' }
RtMidiAbstractInOrOut >> interface [  

	^RtMidiFfi
]

{ #category : 'instance creation' }
RtMidiAbstractInOrOut >> isOpen [

	^ handle notNil
]

{ #category : 'accessing' }
RtMidiAbstractInOrOut >> portName [
	"relying on portname rather than on indexes"
	^ portName
]

{ #category : 'accessing' }
RtMidiAbstractInOrOut >> portName: anObject [

	portName := anObject
]
