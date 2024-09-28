Class {
	#name : #RtMidiStressTestMemLeakTest,
	#superclass : #TestCase,
	#instVars : [
		'out',
		'in'
	],
	#category : #'RtMidi-tests'
}

{ #category : #accessing }
RtMidiStressTestMemLeakTest class >> defaultTimeLimit [

	^ 24 hours
]

{ #category : #running }
RtMidiStressTestMemLeakTest >> pleaseConfigureALoopBackMidiInputPort [
	"To run this tests you need a midi port that loops the midi back"
	"IAC-besturingsbestand Bus 1"
	^ 'loopMIDI Port 1 2'
]

{ #category : #running }
RtMidiStressTestMemLeakTest >> pleaseConfigureALoopBackMidiOutputPort [
	"To run this tests you need a midi port that loops the midi back"
	"IAC-besturingsbestand Bus 1"
	^ 'loopMIDI Port 1 3'
]

{ #category : #running }
RtMidiStressTestMemLeakTest >> setUp [

	out := RtMidiFfi openNewDefaultOutOnPortNamed:
		       self pleaseConfigureALoopBackMidiOutputPort.
	in := RtMidiFfi openNewDefaultInOnPortNamed:
		      self pleaseConfigureALoopBackMidiInputPort
]

{ #category : #running }
RtMidiStressTestMemLeakTest >> tearDown [ 

	out rtMidiFree.
	in rtMidiFree
]

{ #category : #tests }
RtMidiStressTestMemLeakTest >> test1 [

	| events times |
	events := 0.
	times := 10000.
	in onEventReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2
]
