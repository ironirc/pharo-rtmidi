"
Missing comment
"
Class {
	#name : 'RtMidiEventCtrlChange',
	#superclass : 'RtMidiEvent',
	#instVars : [
		'number',
		'value'
	],
	#category : 'RtMidi-events',
	#package : 'RtMidi',
	#tag : 'events'
}

{ #category : 'constants' }
RtMidiEventCtrlChange class >> eventTypeNumber [

	
	^ 4
	
]

{ #category : 'constants' }
RtMidiEventCtrlChange class >> eventTypeSymbol [
	^#typeCtrlChange
]

{ #category : 'constants' }
RtMidiEventCtrlChange class >> messageSize [

	^ 3
]

{ #category : 'constants' }
RtMidiEventCtrlChange class >> statusByte [

	^ 16rB0
]

{ #category : 'printing' }
RtMidiEventCtrlChange >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[p: ';
		nextPutAll:  self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll:  self channel displayString;
		nextPutAll: ' - ctrlCh: ';
		nextPutAll:  self number displayString;
		nextPutAll: ' - val: ';
		nextPutAll:  self value displayString;
		nextPutAll: ']'.
	^ ws contents
]

{ #category : 'accessing' }
RtMidiEventCtrlChange >> number [

	^ byteArray at: 2
]

{ #category : 'accessing' }
RtMidiEventCtrlChange >> number: aValue [

	byteArray at: 2 put: aValue
]

{ #category : 'services' }
RtMidiEventCtrlChange >> sendTo:  receiver [
	 receiver receiveCtrlChange:  self
]

{ #category : 'constants' }
RtMidiEventCtrlChange >> type [
	^#ctrlChange
]

{ #category : 'accessing' }
RtMidiEventCtrlChange >> value [

	^ byteArray at: 3
]

{ #category : 'accessing' }
RtMidiEventCtrlChange >> value: aValue [

	byteArray at: 3 put: aValue
]
