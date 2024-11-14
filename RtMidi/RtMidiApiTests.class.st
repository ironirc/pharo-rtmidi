Class {
	#name : 'RtMidiApiTests',
	#superclass : 'TestCase',
	#instVars : [
		'api'
	],
	#category : 'RtMidi-tests',
	#package : 'RtMidi',
	#tag : 'tests'
}

{ #category : 'running' }
RtMidiApiTests >> inputPortNameThatLoopsBack [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file instead of isMacOS/isWindows"
	OSPlatform current isMacOS ifTrue: [ ^'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^'loopMIDI Port 1 2' ].
	^self error: 'you need to configure something here'

]

{ #category : 'running' }
RtMidiApiTests >> outputPortNameThatLoopsBack [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file instead of isMacOS/isWindows"
	OSPlatform current isMacOS ifTrue: [ ^ 'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^ 'loopMIDI Port 1 3' ].
	^ self error: 'you need to configure something here'
]

{ #category : 'private' }
RtMidiApiTests >> sendRandom3MsNoteOnAndOffOnOut: out [

	| p |
	p := 32 atRandom + 48.
	out sendMessage: {
			144.
			p.
			70 } asByteArray.
	3 milliSeconds wait.
	out sendMessage: {
			128.
			p.
			70 } asByteArray
]

{ #category : 'running' }
RtMidiApiTests >> setUp [

	api := RtMidiApi "convenience"
]

{ #category : 'running' }
RtMidiApiTests >> tearDown [

]

{ #category : 'tests' }
RtMidiApiTests >> testInputPortOpenAndClose [

	| in |
	in := api inputPortNamed: self inputPortNameThatLoopsBack.
	in open.
	self assert: in isOpen.
	in close.
	self assert: in isOpen not
]

{ #category : 'tests' }
RtMidiApiTests >> testOutputPortOpenAndClose [

	| out |
	out := api outputPortNamed: self outputPortNameThatLoopsBack.
	out open.
	self assert: out isOpen.
	out close.
	self assert: out isOpen not
]

{ #category : 'tests' }
RtMidiApiTests >> testPortNames [

	self assert:
		(api inputPortNames includes: self inputPortNameThatLoopsBack).
	self assert:
		(api outputPortNames includes: self outputPortNameThatLoopsBack)
]

{ #category : 'tests' }
RtMidiApiTests >> testSendAndReceive [

	| events times out in |
	events := 0.
	times := 100.
	out := RtMidiApi outputPortNamed: self outputPortNameThatLoopsBack.
	out open.
	in := RtMidiApi inputPortNamed: self inputPortNameThatLoopsBack.
	in onMessageReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ self sendRandom3MsNoteOnAndOffOnOut: out ].
	5 milliSeconds wait.
	self assert: events equals: times * 2.
	out close.
	in close
]

{ #category : 'tests' }
RtMidiApiTests >> testSendAndReceiveSysex [

	| received out in sendResult msg |
	out := api outputPortNamed: self outputPortNameThatLoopsBack.
	out open.
	in := api inputPortNamed: self inputPortNameThatLoopsBack.
	in onMessageReceiveDo: [ :ev | received := ev ].
	msg := #[16rF0 10 11 12 13 14 15 16 17 18 19 20 16rF7]. 
	sendResult := out sendMessage: msg.
	10 	milliSeconds wait.
	self assert: received notNil.
	self assert: received asByteArray equals: msg .
	out close.
	in close
]
