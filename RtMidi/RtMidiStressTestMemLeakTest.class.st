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
RtMidiStressTestMemLeakTest >> pleaseConfigureALoopBackMidiInputPort [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file"
	OSPlatform current isMacOS ifTrue: [ ^'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^'loopMIDI Port 1 2' ].
	^self error: 'you to configure something here'

]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> pleaseConfigureALoopBackMidiOutputPort [
	"To run this tests you need a midi port that loops the midi back"
	"maybe better to depend on an environment file"
	OSPlatform current isMacOS ifTrue: [ ^ 'IAC-besturingsbestand Bus 1' ].
	OSPlatform current isWindows ifTrue: [ ^ 'loopMIDI Port 1 3' ].
	^ self error: 'you to configure something here'
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> setUp [

	out := RtMidiFfi openNewDefaultOutOnPortNamed:
		       self pleaseConfigureALoopBackMidiOutputPort.
	in := RtMidiFfi openNewDefaultInOnPortNamed:
		      self pleaseConfigureALoopBackMidiInputPort
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> tearDown [

	out ifNotNil: [ out rtMidiFree ].
	in ifNotNil: [ in rtMidiFree ]
]

{ #category : 'tests' }
RtMidiStressTestMemLeakTest >> test1 [

	| events times |
	events := 0.
	times := 100000.
	in onMessageReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2
]
