"
I expose a simple api for easy use. (uniform with PortMidiApi in the Pharo-sound repo)
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

	^ RtMidiInputPort new
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

	^ RtMidiOutputPort new
		  portName: aName;
		  yourself
]

{ #category : 'private' }
RtMidiApi class >> outputPortNames [

	^self interface rtMidiOutputPortNames
]
