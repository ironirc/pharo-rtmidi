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
	^self error: 'you to configure something here'

]

{ #category : 'running' }
RtMidiApiTests >> outputPortNameThatLoopsBack [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file instead of isMacOS/isWindows"
	OSPlatform current isMacOS ifTrue: [ ^ 'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^ 'loopMIDI Port 1 3' ].
	^ self error: 'you to configure something here'
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
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2.
	out close.
	in close
]
