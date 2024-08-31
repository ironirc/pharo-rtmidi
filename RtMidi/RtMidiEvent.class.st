"
Missing comment
"
Class {
	#name : #RtMidiEvent,
	#superclass : #Object,
	#instVars : [
		'port',
		'channel',
		'isConsumed'
	],
	#classInstVars : [
		'eventType',
		'selectorForDoubleDispatch'
	],
	#category : #RtMidi
}

{ #category : #private }
RtMidiEvent class >> concreteClassForEventTypeNumber:  eventTypeNumber [
	^ self allSubclasses
		detect: [: cl |  cl eventTypeNumber =  eventTypeNumber]
		ifNone: [ self]
]

{ #category : #private }
RtMidiEvent class >> concreteClassForEventTypeSymbol:  eventTypeSymbol [
	^ self allSubclasses
		detect: [: cl |  cl eventTypeSymbol =  eventTypeSymbol]
		ifNone:
			[ Error
				signal:
					'no concrete class for eventTypeSymbol: #' ,  eventTypeSymbol]
]

{ #category : #constants }
RtMidiEvent class >> eventTypeNumber [


	^ self subclassResponsibility 
	"eventType.
		ifNil: [ eventType :=  self interface perform:  self eventTypeSymbol ""#typeKeyOn""]"
]

{ #category : #constants }
RtMidiEvent class >> eventTypeSymbol [
	^#Generic
]

{ #category : #constants }
RtMidiEvent class >> fromByteArray: ba [

	^self fromByteStream: ba readStream
]

{ #category : #constants }
RtMidiEvent class >> fromByteStream: rs [

	| firstByte statusNibble |
	firstByte := rs peek.
	statusNibble := 16rF0 bitAnd: firstByte.
	statusNibble = 16r90 ifTrue: [
		^ RtMidiEventKeyOn new initFromByteStream: rs ].
	statusNibble = 16r80 ifTrue: [
		^ RtMidiEventKeyOff new initFromByteStream: rs ].
	self error: 'unknown'
]

{ #category : #private }
RtMidiEvent class >> interface [
	^ MshFfi
]

{ #category : #'instance creation' }
RtMidiEvent class >> newOfType:  eventTypeSymbol forSystem:  system [
	^(( self concreteClassForEventTypeSymbol:  eventTypeSymbol) basicNew)
		system:  system;
		yourself
]

{ #category : #'instance creation' }
RtMidiEvent class >> newOfTypeNumber:  eventTypeNumber forSystem:  system [
	^(( self concreteClassForEventTypeNumber:  eventTypeNumber) basicNew)
		system:  system;
		yourself
]

{ #category : #constants }
RtMidiEvent class >> selectorForDoubleDispatch [
	^ selectorForDoubleDispatch
		ifNil:
			[|  ws  rs |
			 ws :=  WriteStream on: ( String new: 20).
			 rs :=  self class eventTypeSymbol.
			 ws :=  ws
				nextPutAll: 'receiveEvent';
				nextPut:  rs next asUppercase;
				nextPutAll:  rs upToEnd.
			 selectorForDoubleDispatch :=  ws contents asSymbol]
]

{ #category : #accessing }
RtMidiEvent >> channel [
	^channel
]

{ #category : #accessing }
RtMidiEvent >> channel: aChannel [

	channel := aChannel
]

{ #category : #services }
RtMidiEvent >> copyDo: aBlock [

	| ev |
	ev := self copy.
	aBlock value: ev
]

{ #category : #private }
RtMidiEvent >> interface [
	^ self class interface
]

{ #category : #testing }
RtMidiEvent >> isActiveSense [

	^ false
]

{ #category : #accessing }
RtMidiEvent >> isConsumed [
	^ isConsumed == true
]

{ #category : #accessing }
RtMidiEvent >> isConsumed:  anObject [
	 isConsumed :=  anObject
]

{ #category : #private }
RtMidiEvent >> msbAndLsbFrom:  value [
	^ Array
		with: ( value bitAnd: 127)
		with: (( value bitShift: -7) bitAnd: 127)
]

{ #category : #accessing }
RtMidiEvent >> port [
	^ self portZeroBased + 1
]

{ #category : #accessing }
RtMidiEvent >> port:  port [
	 self portZeroBased:  port - 1
]

{ #category : #accessing }
RtMidiEvent >> portZeroBased [
	^ port
]

{ #category : #accessing }
RtMidiEvent >> portZeroBased: aPort [

	port := aPort
]

{ #category : #services }
RtMidiEvent >> sendTo:  receiver [
	"Error raiseSignal: 'unimplemented event type'"

	
]

{ #category : #constants }
RtMidiEvent >> type [
	^nil
]

{ #category : #private }
RtMidiEvent >> valueFromMsb:  msb lsb:  lsb [
	^(( msb bitAnd: 127) bitShift: 7) + ( lsb bitAnd: 127)
]
