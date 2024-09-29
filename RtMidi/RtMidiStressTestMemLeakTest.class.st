Class {
	#name : 'RtMidiStressTestMemLeakTest',
	#superclass : 'TestCase',
	#instVars : [
		'out',
		'in'
	],
	#category : 'RtMidi-tests',
	#package : 'RtMidi',
	#tag : 'tests'
}

{ #category : 'accessing' }
RtMidiStressTestMemLeakTest class >> defaultTimeLimit [

	^ 24 hours
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> inputPortNameThatLoopsBack [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file"
	OSPlatform current isMacOS ifTrue: [ ^'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^'loopMIDI Port 1 2' ].
	^self error: 'you to configure something here'

]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> outputPortNameThatLoopsBack [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file"
	OSPlatform current isMacOS ifTrue: [ ^ 'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^ 'loopMIDI Port 1 3' ].
	^ self error: 'you to configure something here'
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> setUp [

	out := RtMidiApi outputPortNamed: self outputPortNameThatLoopsBack.
	out open.
	in := RtMidiApi inputPortNamed: self inputPortNameThatLoopsBack.
	in open. 
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> tearDown [

	out ifNotNil: [
		out close.
		out := nil ].
	in ifNotNil: [
		in close.
		in := nil ]
]

{ #category : 'tests' }
RtMidiStressTestMemLeakTest >> test1 [

	| events times |
	events := 0.
	times := 100. "100000 is doable... second run makes the system crash"
	in onMessageReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2
]
