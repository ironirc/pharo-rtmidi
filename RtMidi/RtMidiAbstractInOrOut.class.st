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

{ #category : 'private' }
RtMidiAbstractInOrOut >> ensureOpen [

	handle ifNotNil: [ ^ self ].
	self open
]

{ #category : 'accessing' }
RtMidiAbstractInOrOut >> interface [  

	^RtMidiFfi
]

{ #category : 'testing' }
RtMidiAbstractInOrOut >> isOpen [

	^ handle notNil and: [ handle isNull not ]
]

{ #category : 'api' }
RtMidiAbstractInOrOut >> open [

	self subclassResponsibility
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
