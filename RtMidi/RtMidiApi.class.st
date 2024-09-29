Class {
	#name : 'RtMidiApi',
	#superclass : 'Object',
	#category : 'RtMidi-api',
	#package : 'RtMidi',
	#tag : 'api'
}

{ #category : 'private' }
RtMidiApi class >> inputPortNamed: aName [

	^ RtMidiIn new
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

	^ RtMidiOut new
		  portName: aName;
		  yourself
]

{ #category : 'private' }
RtMidiApi class >> outputPortNames [

	^self interface rtMidiOutputPortNames
]
