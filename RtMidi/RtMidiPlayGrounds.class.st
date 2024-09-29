Class {
	#name : 'RtMidiPlayGrounds',
	#superclass : 'Object',
	#category : 'RtMidi-dev',
	#package : 'RtMidi',
	#tag : 'dev'
}

{ #category : 'playgrounds' }
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
([1000 timesRepeat: [out sendRandom3MsNoteOnAndOff  ]] timeToRun asMilliSeconds / 1000) asFloat .
out ok.
out msgString.

in := RtMidiFfi rtMidiInCreateDefault.
in portNames.
in rtMidiPortCount.
in rtMidiOpenPortNumber: 3 portName: 'Hello'.
in ok. 
in rtMidiFree.
in onMessageReceiveDo: [:msg | out sendRandom3MsNoteOnAndOff    ].

out := RtMidiFfi rtMidiOutCreateDefault.
out rtMidiOpenPortNumber: 4 portName: ''.
in := RtMidiFfi rtMidiInCreateDefault.
in rtMidiOpenPortNumber: 2 portName: 'SlGrand'.
in onMessageReceiveDo: [:msg |  out sendMessage: msg ].
in rtMidiCancelCallback.

]
