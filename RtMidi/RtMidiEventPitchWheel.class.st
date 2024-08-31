"
Missing comment
"
Class {
	#name : #RtMidiEventPitchWheel,
	#superclass : #RtMidiEvent,
	#category : #RtMidi
}

{ #category : #constants }
RtMidiEventPitchWheel class >> eventTypeNumber [

	^7
]

{ #category : #constants }
RtMidiEventPitchWheel class >> eventTypeSymbol [
	^#typePitchWheel
]

{ #category : #services }
RtMidiEventPitchWheel >> sendTo:  receiver [
	 receiver receivePitchWheel:  self
]

{ #category : #constants }
RtMidiEventPitchWheel >> type [
	^#pitchWheel
]

{ #category : #acessing }
RtMidiEventPitchWheel >> value [
	|  val |
	 val :=  self
		valueFromMsb:
			( self interface
				MidiGetField:  cPointer
				with: 1)
		lsb:
			( self interface
				MidiGetField:  cPointer
				with: 0).	"	Transcript
		show: 'msb:';
		show: (self interface MidiGetField: cPointer with: 1) displayString;
		show: 'lsb:';
		show: (self interface MidiGetField: cPointer with: 0) displayString;
		show: 'val:';
		show: val displayString;
		cr."
	^ val
]

{ #category : #acessing }
RtMidiEventPitchWheel >> value:  value [
	|  msbAndLsb |
	 msbAndLsb :=  self msbAndLsbFrom:  value.
	 self interface
		MidiSetField:  cPointer
		with: 0
		with:  msbAndLsb first.
	 self interface
		MidiSetField:  cPointer
		with: 1
		with:  msbAndLsb last
]
