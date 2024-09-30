Class {
	#name : 'RtMidiFfi',
	#superclass : 'Object',
	#pools : [
		'RtMidiFfiApiEnumeration'
	],
	#category : 'RtMidi-uffi',
	#package : 'RtMidi',
	#tag : 'uffi'
}

{ #category : 'accessing' }
RtMidiFfi class >> ffiLibrary [

	^ RtMidiFfiLibrary "RtMidiFfiLibraryWithTfWorkerRunner"
]

{ #category : 'accessing' }
RtMidiFfi class >> getApiDisplayNames [

	<script: 'self getApiDisplayNames inspect'>
	^ (0 to: 8) collect: [ :e | e -> (self rtMidiApiDisplayName: e) ]
]

{ #category : 'accessing' }
RtMidiFfi class >> getApiNames [

	<script: 'self getApiNames inspect'>
	^ (0 to: 8) collect: [ :e | e -> (self rtMidiApiName: e) ]
]

{ #category : 'accessing' }
RtMidiFfi class >> getCompiledApi [
	<script: 'self getCompiledApi inspect'>
	| arr |
	arr := (FFIArray newArrayTypeOf: RtMidiFfiApiEnumeration size: 10) new.
	self rtMidiGetCompiledApi: arr arrayLen: 10.
	^ arr asArray select: [ :e | e ~= RTMIDI_API_UNSPECIFIED ]
]

{ #category : 'accessing' }
RtMidiFfi class >> getPortName: device portNumber: portNumberBase1 [

	| maxNameSize buffer result  |
	"if needed/desired: first call with null buffer to get length.
	length := LcUIntValue new. (make own version of class LcUIntValue => RtIntValue) 
	self
		rtMidiGetPortName: device
		portNumber: portNumber
		bufout: ExternalAddress null
		buflen: length tfPointerAddress.
	length := length value."
	maxNameSize := 100.
	buffer := FFIArray externalNewType: #char size: maxNameSize.
	result := [
	          self
		          rtMidiGetPortName: device
		          portNumber: portNumberBase1 - 1
		          bufout: buffer tfPointerAddress
		          buflen: maxNameSize.
	          buffer tfPointerAddress bytesFromCString utf8Decoded ]
		          ensure: [ buffer free ].

	^ result
]

{ #category : 'accessing' }
RtMidiFfi class >> getVersion [

	<script: 'self rtMidiGetVersion inspect'>
	^ self rtMidiGetVersion
]

{ #category : 'accessing' }
RtMidiFfi class >> openPort: device portNumber: portNumberBase1 portName: portName [

	portNumberBase1 ifNil: [ self error: 'no port number supplied' ].
	self
		rtMidiOpenPort: device
		portNumber: portNumberBase1 - 1
		portName: portName
]

{ #category : 'accessing' }
RtMidiFfi class >> reportToTranscript [

	<script>
	Transcript clear.
	
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiApiDisplayName: api [

	^ self
		  ffiCall: #( char * rtmidi_api_display_name 
			     #( int api ) )
		
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiApiName: api [

	^ self
		  ffiCall: #( char * rtmidi_api_name
			     #( int api ) )
		  
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiClosePort: device [

	^ self ffiCall: #( void rtmidi_close_port #( void * device ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiGetCompiledApi: array arrayLen: arrayLen [

	^ self ffiCall:
		  #( void rtmidi_get_compiled_api #( void * array , int arrayLen ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiGetPortCount: device [

	^ self
		  ffiCall: #( int rtmidi_get_port_count #( void * device ) )
		  module:
		  'C:\Users\Ivo\source\repos\rtmidi\msw\x64\Release\Debug\rtmidi.dll'
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiGetPortName: device portNumber: portNumber bufout: bufout buflen: buflen [

	^ self ffiCall:
		  #( int rtmidi_get_port_name #( void * device , int portNumber
		        , char * bufout , int * buflen ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiGetVersion [

	^ self ffiCall: #( char * rtmidi_get_version #(  ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiInCancelCallback: device [

	^ self ffiCall: #( void rtmidi_in_cancel_callback #( void * device ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiInCreateDefault [

	^ self ffiCall: #( #RtMidiFfiInWrapperStructure  * rtmidi_in_create_default
		     #(  ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiInFree: device [

	^ self ffiCall: #( void rtmidi_in_free #( void * device ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiInGetCurrentApi: aDevice [

	^ self ffiCall: #( #RtMidiFfiApiEnumeration rtmidi_in_get_current_api #( void * device ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiInSetCallback: device callback: callback data: data [

	^ self ffiCall:
		  #( void rtmidi_in_set_callback  #( void * device, FFICallback callback , void * data ) )
]

{ #category : 'driver communication' }
RtMidiFfi class >> rtMidiInputPortNames [
	<script: 'self rtMidiInputPortNames inspect'>
	| in |
	in := self rtMidiInCreateDefault.
	^ [ in portNames ] ensure: [ self rtMidiInFree: in. ]
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiOpenPort: device portNumber: portNumber portName: portName [

	^ self ffiCall:
		  #( void rtmidi_open_port #( void * device , uint portNumber
		        , char * portName ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiOutCreateDefault [

	^ self ffiCall: #( #RtMidiFfiOutWrapperStructure * rtmidi_out_create_default
		     #(  ) )
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiOutFree: device [

	^ self ffiCall: #( void rtmidi_out_free  #(void * device ) )
]

{ #category : 'accessing' }
RtMidiFfi class >> rtMidiOutSendMessage: device message: message [

	message pinInMemory.
	self
		rtMidiOutSendMessage: device
		message: message
		length: message size.
	message unpinInMemory
]

{ #category : 'ffi calls' }
RtMidiFfi class >> rtMidiOutSendMessage: device message: message length: length [

	 self ffiCall: #( void rtmidi_out_send_message  #( void * device, void * message, int length ) )
]

{ #category : 'driver communication' }
RtMidiFfi class >> rtMidiOutputPortNames [

	<script: 'self rtMidiOutputPortNames inspect'>
	| out |
	out := self rtMidiOutCreateDefault.
	^ [ out portNames ] ensure: [ self rtMidiInFree: out ]
]

{ #category : 'accessing' }
RtMidiFfi class >> rtMidiPortNumberForInputPortNamed: aName [

	self rtMidiInputPortNames keysAndValuesDo: [ :idx :pn |
		pn = aName ifTrue: [ ^ idx - 1 ] ].
	^ nil
]

{ #category : 'accessing' }
RtMidiFfi class >> rtMidiPortNumberForOutputPortNamed: aName [
	"return zero based portnumber"
	self rtMidiOutputPortNames keysAndValuesDo: [ :idx :pn |
		pn = aName ifTrue: [ ^ idx - 1 ] ].
	^ nil
]
