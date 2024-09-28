"
Missing comment
"
Class {
	#name : #RtMidiEventSysEx,
	#superclass : #RtMidiEvent,
	#category : 'RtMidi-events'
}

{ #category : #constants }
RtMidiEventSysEx class >> eventTypeNumber [

	^17
]

{ #category : #constants }
RtMidiEventSysEx class >> eventTypeSymbol [
	^#typeSysEx
]

{ #category : #constants }
RtMidiEventSysEx class >> messageSize [
	"we don't know yet"

	^ 1
]

{ #category : #constants }
RtMidiEventSysEx class >> statusByte [

	^ 16rF0
]

{ #category : #printing }
RtMidiEventSysEx >> displayString [

	| ws |
	ws := WriteStream on: String new.
	ws
		nextPutAll: '[sysex:  p: ';
		nextPutAll: self port displayString;
		nextPutAll: ' - ch: ';
		nextPutAll: self channel displayString;
		nextPutAll: ' - size: ';
		nextPutAll: self byteArray size displayString;
		nextPutAll: ' - bytes: ';
		nextPutAll: self byteArray printString;
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
