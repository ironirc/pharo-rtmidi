Class {
	#name : 'RtMidiOut',
	#superclass : 'RtMidiAbstractInOrOut',
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiOut >> open [

	| out pn |
	handle ifNotNil: [ self error: 'this port is already open' ].
	out := self interface rtMidiOutCreateDefault. "default means with default os driver WINMM, Core"
	pn := self interface rtMidiPortNumberForOutputPortNamed:
		      self portName.
	self interface
		rtMidiOpenPort: out
		portNumber: pn
		portName: ''.
	handle := out
]

{ #category : 'api' }
RtMidiOut >> sendRandom3MsNoteOnAndOff [

	| p |
	p := 32 atRandom + 48.
	handle sendMessage: {
			144.
			p.
			70 } asByteArray.
	3 milliSeconds wait.
	handle sendMessage: {
			128.
			p.
			70 } asByteArray
]
