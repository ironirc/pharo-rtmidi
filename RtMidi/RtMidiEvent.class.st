"
Missing comment
"
Class {
	#name : 'RtMidiEvent',
	#superclass : 'Object',
	#instVars : [
		'port',
		'byteArray',
		'isConsumed'
	],
	#classInstVars : [
		'statusByteDict'
	],
	#category : 'RtMidi-events',
	#package : 'RtMidi',
	#tag : 'events'
}

{ #category : 'private' }
RtMidiEvent class >> concreteClassForEventTypeNumber:  eventTypeNumber [
	^ self allSubclasses
		detect: [: cl |  cl eventTypeNumber =  eventTypeNumber]
		ifNone: [ self]
]

{ #category : 'private' }
RtMidiEvent class >> concreteClassForEventTypeSymbol:  eventTypeSymbol [
	^ self allSubclasses
		detect: [: cl |  cl eventTypeSymbol =  eventTypeSymbol]
		ifNone:
			[ Error
				signal:
					'no concrete class for eventTypeSymbol: #' ,  eventTypeSymbol]
]

{ #category : 'private' }
RtMidiEvent class >> concreteClassForStatusByte: statusByte [

	self allSubclasses do: [ :cl |
		cl statusByte = statusByte ifTrue: [ ^ cl ] ].
	Error signal:
		'no concrete class for status byte ' , statusByte hexString
]

{ #category : 'constants' }
RtMidiEvent class >> eventTypeNumber [


	^ self subclassResponsibility 
	"eventType.
		ifNil: [ eventType :=  self interface perform:  self eventTypeSymbol ""#typeKeyOn""]"
]

{ #category : 'constants' }
RtMidiEvent class >> eventTypeSymbol [
	^#Generic
]

{ #category : 'private' }
RtMidiEvent class >> initializeStatusByteDict [

	statusByteDict := Dictionary new.
	self allSubclassesDo: [ :sc |
		sc statusByte ifNotNil: [ statusByteDict at: sc statusByte put: sc ] ]
]

{ #category : 'private' }
RtMidiEvent class >> interface [

	^ RtMidiFfi
]

{ #category : 'constants' }
RtMidiEvent class >> messageSize [

	self subclassResponsibility
]

{ #category : 'constants' }
RtMidiEvent class >> newForByteArray: ba [

	| firstByte statusNibble  |
	firstByte := ba at: 1.
	firstByte = RtMidiEventActiveSens statusByte ifTrue: [
		^ RtMidiEventActiveSens new ].
	statusNibble := 16rF0 bitAnd: firstByte. "retaining only 4 most significant bits"
	
	^ (self newForStatusByte: statusNibble)
		  byteArray: ba
]

{ #category : 'constants' }
RtMidiEvent class >> newForStatusByte: statusByte [

	^ (self concreteClassForStatusByte: statusByte) basicNew
]

{ #category : 'instance creation' }
RtMidiEvent class >> newOfType:  eventTypeSymbol forSystem:  system [
	^(( self concreteClassForEventTypeSymbol:  eventTypeSymbol) basicNew)
		system:  system;
		yourself
]

{ #category : 'instance creation' }
RtMidiEvent class >> newOfTypeNumber:  eventTypeNumber forSystem:  system [
	^(( self concreteClassForEventTypeNumber:  eventTypeNumber) basicNew)
		system:  system;
		yourself
]

{ #category : 'private' }
RtMidiEvent class >> statusByte [

	^ nil
]

{ #category : 'accessing' }
RtMidiEvent >> byteArray [

	^ byteArray
]

{ #category : 'accessing' }
RtMidiEvent >> byteArray: anObject [

	byteArray := anObject
]

{ #category : 'accessing' }
RtMidiEvent >> channel [

	^ ((byteArray at: 1) bitAnd: 16r0F) + 1
]

{ #category : 'accessing' }
RtMidiEvent >> channel: aChannel [

	^ byteArray at: 1 put: (self class statusByte bitOr: aChannel - 1)
]

{ #category : 'services' }
RtMidiEvent >> copyDo: aBlock [

	| ev |
	ev := self copy.
	aBlock value: ev
]

{ #category : 'initialize-release' }
RtMidiEvent >> initialize [

	super initialize.
	byteArray := ByteArray new: self class messageSize.
]

{ #category : 'private' }
RtMidiEvent >> interface [
	^ self class interface
]

{ #category : 'testing' }
RtMidiEvent >> isActiveSense [

	^ false
]

{ #category : 'accessing' }
RtMidiEvent >> isConsumed [
	^ isConsumed == true
]

{ #category : 'accessing' }
RtMidiEvent >> isConsumed:  anObject [
	 isConsumed :=  anObject
]

{ #category : 'private' }
RtMidiEvent >> msbAndLsbFrom:  value [

	^ Array
		with: ( value bitAnd: 127)
		with: (( value bitShift: -7) bitAnd: 127)
]

{ #category : 'accessing' }
RtMidiEvent >> port [

	^ port
]

{ #category : 'accessing' }
RtMidiEvent >> port: anObject [

	port := anObject
]

{ #category : 'services' }
RtMidiEvent >> sendTo:  receiver [
	"Error raiseSignal: 'unimplemented event type'"

	
]

{ #category : 'constants' }
RtMidiEvent >> type [
	^nil
]

{ #category : 'private' }
RtMidiEvent >> valueFromMsb:  msb lsb:  lsb [
	^(( msb bitAnd: 127) bitShift: 7) + ( lsb bitAnd: 127)
]
