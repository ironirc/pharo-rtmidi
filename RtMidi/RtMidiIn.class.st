Class {
	#name : 'RtMidiIn',
	#superclass : 'RtMidiAbstractInOrOut',
	#instVars : [
		'callback'
	],
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'api' }
RtMidiIn >> close [

	self interface rtMidiInCancelCallback: handle.
	super close.
]

{ #category : 'api' }
RtMidiIn >> onMessageReceiveDo: aBlock [

	callback := RtMidiFfiLibrary uniqueInstance
		            newCallbackWithSignature:
			            #( void #( double timeStamp #, void #* message #, ulong
			                  messageSize #, void #* userData ) )
		            block: [ :timeStamp :message :messageSize :userData |
			            aBlock value: (message copyFrom: 1 to: messageSize).
			            Processor activeProcess terminate "not sure about this, just a wild guess in order to try to avoid mem leak"].
	RtMidiFfi rtMidiInSetCallback: handle callback: callback data: nil
]

{ #category : 'api' }
RtMidiIn >> open [

	| in pn |
	handle ifNotNil: [ self error: 'this port is already open' ].
	in := self interface rtMidiInCreateDefault. "default means with default os driver like Windows MultiMedia, CoreMidi, ..."
	pn := self interface rtMidiPortNumberForInputPortNamed: self portName.

	self interface
		rtMidiOpenPort: in
		portNumber: pn
		portName: ''.
	handle := in
]

{ #category : 'api' }
RtMidiIn >> rtMidiCancelCallback [

	RtMidiFfi rtMidiInCancelCallback: self
]
