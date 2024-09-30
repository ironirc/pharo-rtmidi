"
I expose a simple api for easy use. (uniform with Pharo-sound PortMidi)
"
Class {
	#name : 'RtMidiApi',
	#superclass : 'Object',
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'private' }
RtMidiApi class >> inputPortNamed: aName [

	^ RtMidiInput new
		  portName: aName;
		  yourself
]

{ #category : 'private' }
RtMidiApi class >> inputPortNames [

	^self interface rtMidiInputPortNames
]

{ #category : 'private' }
RtMidiApi class >> interface [  

	^RtMidiFfi
]

{ #category : 'private' }
RtMidiApi class >> outputPortNamed: aName [

	^ RtMidiOutput new
		  portName: aName;
		  yourself
]

{ #category : 'private' }
RtMidiApi class >> outputPortNames [

	^self interface rtMidiOutputPortNames
]
