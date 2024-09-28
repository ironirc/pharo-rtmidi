"
Missing comment
"
Class {
	#name : 'RtMidiEventPitchWheel',
	#superclass : 'RtMidiEvent',
	#instVars : [
		'lsb',
		'msb'
	],
	#category : 'RtMidi-events',
	#package : 'RtMidi',
	#tag : 'events'
}

{ #category : 'constants' }
RtMidiEventPitchWheel class >> eventTypeNumber [

	^7
]

{ #category : 'constants' }
RtMidiEventPitchWheel class >> eventTypeSymbol [
	^#typePitchWheel
]

{ #category : 'constants' }
RtMidiEventPitchWheel class >> messageSize [

	^ 3
]

{ #category : 'constants' }
RtMidiEventPitchWheel class >> statusByte [

	^ 16rE0
]

{ #category : 'accessing' }
RtMidiEventPitchWheel >> lsb [

	^ byteArray at: 2
]

{ #category : 'accessing' }
RtMidiEventPitchWheel >> lsb: aByte [

	byteArray at: 2 put: aByte
]

{ #category : 'accessing' }
RtMidiEventPitchWheel >> msb [

	^ byteArray at: 3
]

{ #category : 'accessing' }
RtMidiEventPitchWheel >> msb: aByte [

	byteArray at: 3 put: aByte
]

{ #category : 'services' }
RtMidiEventPitchWheel >> sendTo:  receiver [
	 receiver receivePitchWheel:  self
]

{ #category : 'constants' }
RtMidiEventPitchWheel >> type [
	^#pitchWheel
]

{ #category : 'constants' }
RtMidiEventPitchWheel >> value [

	| val |
	val := self valueFromMsb: self msb lsb: self lsb.
	^ val
]

{ #category : 'constants' }
RtMidiEventPitchWheel >> value: value [

	| msbAndLsb |
	msbAndLsb := self msbAndLsbFrom: value.
	self msb: msbAndLsb first.
	self lsb: msbAndLsb last
]
