Class {
	#name : 'RtMidiStressTestMemLeakTest',
	#superclass : 'RtMidiApiTests',
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
RtMidiStressTestMemLeakTest >> setUp [
	super setUp. 
	out := api outputPortNamed: self outputPortNameThatLoopsBack.
	out open.
	in := api inputPortNamed: self inputPortNameThatLoopsBack.
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
	times := 100. "100k is doable once... second 100k run makes the system crash eventually"
	in onMessageReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2
]
