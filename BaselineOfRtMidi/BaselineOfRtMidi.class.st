Class {
	#name : #BaselineOfRtMidi,
	#superclass : #BaselineOf,
	#category : #BaselineOfRtMidi
}

{ #category : #baselines }
BaselineOfRtMidi >> baseline: spec [
	<baseline>

	self compatibility: spec.
		
	spec for: #'common' do: [
		spec postLoadDoIt: #'postload:package:'.
		self 
			prerequisites: spec;		
			packages: spec;
			groups: spec	
	]
]

{ #category : #'private - accessing' }
BaselineOfRtMidi >> compatibility: spec [

	"Define a 'Compatibility' group that can be used as a dependency later to overcome differences in Pharo releases"

	
]

{ #category : #'private - accessing' }
BaselineOfRtMidi >> groups: spec [

]

{ #category : #'private - accessing' }
BaselineOfRtMidi >> packages: spec [

	spec package: 'RtMidi' with: [  ].
]

{ #category : #baselines }
BaselineOfRtMidi >> postload: aLoader package: aPackageSpec [
	
]

{ #category : #'private - accessing' }
BaselineOfRtMidi >> prerequisites: spec [

	
]
