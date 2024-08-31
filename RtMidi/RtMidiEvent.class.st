"
Missing comment
"
Class {
	#name : #RtMidiEvent,
	#superclass : #Object,
	#instVars : [
		'system',
		'cPointer',
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

{ #category : #private }
RtMidiEvent class >> interface [
	^ MshFfi
]

{ #category : #'instance creation' }
RtMidiEvent class >> new [
	^ self shouldNotImplement
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

{ #category : #restricted }
RtMidiEvent >> cPointer [
	^ cPointer
]

{ #category : #restricted }
RtMidiEvent >> cPointer:  anObject [
	 cPointer :=  anObject	"self class registerForFinalization: self"
]

{ #category : #accessing }
RtMidiEvent >> channel [
	^( self cPointer memberAt: #chan) + 1
]

{ #category : #accessing }
RtMidiEvent >> channel:  chan [
	 self cPointer
		memberAt: #chan
		put:  chan - 1
]

{ #category : #services }
RtMidiEvent >> copy [
	^ super copy cPointer: ( self interface MidiCopyEv:  cPointer)
]

{ #category : #services }
RtMidiEvent >> copyDo:  aBlock [
	|  ev |
	 ev :=  self copy.
	 ev ifNotNil: [[ aBlock value:  ev] ensure: [ ev freeExternal]]
]

{ #category : #restricted }
RtMidiEvent >> createExternal [
	|  evInfo  evInfoNote |
	 self flag: 'this is specific for notes'.
	 cPointer :=  self interface MidiNewEv:  self class eventTypeNumber.
	 cPointer
		date: 0;
		refNum: 0;
		port: 0;
		chan: 0.
	 evInfo :=  cPointer info.
	 evInfoNote :=  evInfo note.
	 evInfoNote
		pitch: 70;
		vel: 100;
		dur: 4.
	 evInfo
		note:  evInfoNote.
	 cPointer
		info:  evInfo
]

{ #category : #finalization }
RtMidiEvent >> freeExternal [
	 self interface MidiFreeEv:  cPointer
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
	^ self cPointer memberAt: #port
]

{ #category : #accessing }
RtMidiEvent >> portZeroBased:  port [
	 self cPointer
		memberAt: #port
		put:  port
]

{ #category : #services }
RtMidiEvent >> sendTo:  receiver [
	"Error raiseSignal: 'unimplemented event type'"

	
]

{ #category : #restricted }
RtMidiEvent >> system [
	^ system
]

{ #category : #restricted }
RtMidiEvent >> system:  anObject [
	 system :=  anObject
]

{ #category : #constants }
RtMidiEvent >> type [
	^nil
]

{ #category : #private }
RtMidiEvent >> valueFromMsb:  msb lsb:  lsb [
	^(( msb bitAnd: 127) bitShift: 7) + ( lsb bitAnd: 127)
]
