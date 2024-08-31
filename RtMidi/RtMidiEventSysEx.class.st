"
Missing comment
"
Class {
	#name : #RtMidiEventSysEx,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventSysEx class >> eventTypeNumber [

	^17
]

{ #category : #constants }
RtMidiEventSysEx class >> eventTypeSymbol [
	^#typeSysEx
]

{ #category : #acessing }
RtMidiEventSysEx >> arrayOfFieldValues [
	^((0 to:  self countFields - 1)
		collect:
			[: index | 
			 self interface
				MidiGetField:  cPointer
				with:  index]) asArray
]

{ #category : #acessing }
RtMidiEventSysEx >> arrayOfFieldValues:  values [
	 values
		do:
			[: each | 
			 self interface
				MidiAddField:  cPointer
				with:  each]
]

{ #category : #acessing }
RtMidiEventSysEx >> countFields [
	^ self interface MidiCountFields:  cPointer
]

{ #category : #services }
RtMidiEventSysEx >> createExternal [
	 cPointer :=  self interface MidiNewEv:  self class eventTypeNumber.
	 cPointer
		memberAt: #date
			put: 0;
		memberAt: #refNum
			put: 0;
		memberAt: #port
			put: 0;
		memberAt: #chan
			put: 0
]

{ #category : #printing }
RtMidiEventSysEx >> displayString [
	|  ws |
	 ws :=  WriteStream on:  String new.
	 ws
		nextPutAll: '[sysex:  p: ';
		nextPutAll:  self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll:  self channel displayString;
		nextPutAll: ' - size: ';
		nextPutAll:  self countFields displayString;
		nextPutAll: ' - bytes: ';
		nextPutAll: '(' ,  self arrayOfFieldValues printString , ')';
		nextPutAll: ']'.
	^ ws contents
]

{ #category : #services }
RtMidiEventSysEx >> sendTo:  receiver [
	 receiver receiveSysEx:  self
]

{ #category : #constants }
RtMidiEventSysEx >> type [
	^#sysEx
]
