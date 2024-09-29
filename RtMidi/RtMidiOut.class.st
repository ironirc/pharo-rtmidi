Class {
	#name : 'RtMidiOut',
	#superclass : 'RtMidiAbstractInOrOut',
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiOut >> close [

	self isOpen ifTrue: [ self interface rtMidiOutFree: handle ].
	handle := nil
]

{ #category : 'api' }
RtMidiOut >> open [

	| out pn |
	self isOpen ifTrue: [ self error: 'this port is already open' ].
	pn := self interface rtMidiPortNumberForOutputPortNamed:
		      self portName.
	pn ifNil: [ ^ self ].
	out := self interface rtMidiOutCreateDefault. "default means with default os driver WINMM, Core"
	self interface rtMidiOpenPort: out portNumber: pn portName: ''.
	handle := out
]

{ #category : 'api' }
RtMidiOut >> sendMessage: aMessage [

	handle sendMessage: aMessage
]

{ #category : 'api' }
RtMidiOut >> sendRandom3MsNoteOnAndOff [
	"Silly method to support a test case"
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
