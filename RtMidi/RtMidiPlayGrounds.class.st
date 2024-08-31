Class {
	#name : #RtMidiPlayGrounds,
	#superclass : #Object,
	#category : #RtMidi
}

{ #category : #playgrounds }
RtMidiPlayGrounds class >> pg_2024_08_31 [

| out in |
Smalltalk vm unloadModule: RtMidiFfi ffiLibrary uniqueInstance libraryName.
RtMidiFfi ffiLibrary resetUniqueInstance.
out := RtMidiFfi rtMidiOutCreateDefault.
RtMidiFfi getApiDisplayNames.
out rtMidiPortCount.
out portNames.
out rtMidiOpenPortNumber: 1 portName: ''.
out rtMidiFree.
([1000 timesRepeat: [out sendNoteOn  ]] timeToRun asMilliSeconds / 1000) asFloat .
out ok.
out msgString.

in := RtMidiFfi rtMidiInCreateDefault.
in portNames.
in rtMidiPortCount.
in rtMidiOpenPortNumber: 3 portName: 'Hello'.
in ok. 
in rtMidiFree.
in onEventReceiveDo: [ out sendNoteOn    ]

]
