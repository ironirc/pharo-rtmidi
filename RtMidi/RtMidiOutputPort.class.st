Class {
	#name : 'RtMidiOutputPort',
	#superclass : 'RtMidiAbstractPort',
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiOutputPort >> close [

	self isOpen ifTrue: [ self interface rtMidiOutFree: handle ].
	handle := nil
]

{ #category : 'api' }
RtMidiOutputPort >> open [

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
RtMidiOutputPort >> sendMessage: aMessage [

	handle sendMessage: aMessage
]
