Class {
	#name : 'RtMidiInput',
	#superclass : 'RtMidiAbstractPort',
	#instVars : [
		'callback'
	],
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiInput >> close [

	self isOpen ifTrue: [
		"callback ifNotNil: [ self interface rtMidiInCancelCallback: handle ]. Guessing this happens implicitly with rtMidiInFree:"
		self interface rtMidiInFree: handle ].
	callback := nil.
	handle := nil
]

{ #category : 'api' }
RtMidiInput >> onMessageReceiveDo: aBlock [

	self ensureOpen.
	self isOpen ifFalse: [ ^ self ].
	callback := RtMidiFfiLibrary uniqueInstance
		            newCallbackWithSignature:
			            #( void #( double timeStamp #, void #* message #, ulong
			                  messageSize #, void #* userData ) )
		            block: [ :timeStamp :message :messageSize :userData |
			            aBlock value: (message copyFrom: 1 to: messageSize).
			            Processor activeProcess terminate "not sure about this, just a wild guess in order to try to avoid mem leak" ].
	RtMidiFfi rtMidiInSetCallback: handle callback: callback data: nil
]

{ #category : 'api' }
RtMidiInput >> open [

	| in pn |
	self isOpen ifTrue: [ self error: 'this port is already open' ].
	pn := self interface rtMidiPortNumberForInputPortNamed: self portName.
	pn ifNil: [ ^ self ].
	in := self interface rtMidiInCreateDefault. "default means with default os driver like Windows MultiMedia, CoreMidi, ..."
	self interface rtMidiOpenPort: in portNumber: pn portName: ''.
	handle := in
]
