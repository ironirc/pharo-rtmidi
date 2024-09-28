Class {
	#name : 'RtMidiStressTestMemLeakTest',
	#superclass : 'TestCase',
	#instVars : [
		'out',
		'in'
	],
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> pleaseConfigureALoopBackMidiPort [
	"To run this tests you need a midi port that loops the midi back"

	^ 'IAC-besturingsbestand Bus 1'
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> setUp [

	out := RtMidiFfi openNewDefaultOutOnPortNamed:
		       self pleaseConfigureALoopBackMidiPort.
	in := RtMidiFfi openNewDefaultInOnPortNamed:
		      self pleaseConfigureALoopBackMidiPort
]

{ #category : 'running' }
RtMidiStressTestMemLeakTest >> tearDown [ 

	out rtMidiFree.
	in rtMidiFree
]

{ #category : 'tests' }
RtMidiStressTestMemLeakTest >> test1 [

	| events times |
	events := 0.
	times := 100000.
	in onEventReceiveDo: [ :ev | events := events + 1 ].
	times timesRepeat: [ out sendRandom3MsNoteOnAndOff ].
	20 milliSeconds wait.
	self assert: events equals: times * 2
]
