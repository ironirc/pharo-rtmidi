Class {
	#name : 'RtMidiAbstractPort',
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
RtMidiAbstractPort >> close [

	self subclassResponsibility
]

{ #category : 'private' }
RtMidiAbstractPort >> ensureOpen [

	handle ifNotNil: [ ^ self ].
	self open
]

{ #category : 'accessing' }
RtMidiAbstractPort >> interface [  

	^RtMidiFfi
]

{ #category : 'testing' }
RtMidiAbstractPort >> isOpen [

	^ handle notNil and: [ handle isNull not ]
]

{ #category : 'api' }
RtMidiAbstractPort >> open [

	self subclassResponsibility
]

{ #category : 'accessing' }
RtMidiAbstractPort >> portName [
	"relying on portname rather than on indexes"
	^ portName
]

{ #category : 'accessing' }
RtMidiAbstractPort >> portName: anObject [

	portName := anObject
]
