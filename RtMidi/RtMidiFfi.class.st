Class {
	#name : #RtMidiFfi,
	#superclass : #Object,
	#pools : [
		'RtMidiApiEnumeration'
	],
	#category : #'RtMidi-uffi'
}

{ #category : #accessing }
RtMidiFfi class >> ffiLibrary [

	^ RtMidiFfiLibrary "RtMidiFfiLibraryWithTfWorkerRunner"
]

{ #category : #accessing }
RtMidiFfi class >> getApiDisplayNames [

	<script: 'self getApiDisplayNames inspect'>
	^ (0 to: 8) collect: [ :e | e -> (self rtMidiApiDisplayName: e) ]
]

{ #category : #accessing }
RtMidiFfi class >> getApiNames [

	<script: 'self getApiNames inspect'>
	^ (0 to: 8) collect: [ :e | e -> (self rtMidiApiName: e) ]
]

{ #category : #accessing }
RtMidiFfi class >> getCompiledApi [
	<script: 'self getCompiledApi inspect'>
	| arr |
	arr := (FFIArray newArrayTypeOf: RtMidiApiEnumeration size: 10) new.
	self rtMidiGetCompiledApi: arr arrayLen: 10.
	^ arr asArray select: [ :e | e ~= RTMIDI_API_UNSPECIFIED ]
]

{ #category : #accessing }
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

{ #category : #accessing }
RtMidiFfi class >> getVersion [

	<script: 'self rtMidiGetVersion inspect'>
	^ self rtMidiGetVersion
]

{ #category : #accessing }
RtMidiFfi class >> openPort: device portNumber: portNumberBase1 portName: portName [

	self
		rtMidiOpenPort: device
		portNumber: portNumberBase1 - 1
		portName: portName
]

{ #category : #accessing }
RtMidiFfi class >> reportToTranscript [

	<script>
	Transcript clear.
	
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiApiDisplayName: api [

	^ self
		  ffiCall: #( char * rtmidi_api_display_name 
			     #( int api ) )
		
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiApiName: api [

	^ self
		  ffiCall: #( char * rtmidi_api_name
			     #( int api ) )
		  
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiClosePort: device [

	^ self ffiCall: #( void rtmidi_close_port #( void * device ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiGetCompiledApi: array arrayLen: arrayLen [

	^ self ffiCall:
		  #( void rtmidi_get_compiled_api #( void * array , int arrayLen ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiGetPortCount: device [

	^ self
		  ffiCall: #( int rtmidi_get_port_count #( void * device ) )
	
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiGetPortName: device portNumber: portNumber bufout: bufout buflen: buflen [

	^ self ffiCall:
		  #( int rtmidi_get_port_name #( void * device , int portNumber
		        , char * bufout , int * buflen ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiGetVersion [

	^ self ffiCall: #( char * rtmidi_get_version #(  ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiInCancelCallback: device [

	^ self ffiCall: #( void rtmidi_in_cancel_callback #( void * device ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiInCreateDefault [

	^ self ffiCall: #( RtMidiInWrapperStructure  * rtmidi_in_create_default
		     #(  ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiInFree: device [

	^ self ffiCall: #( void rtmidi_in_free #( void * device ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiInSetCallback: device callback: callback data: data [

	^ self ffiCall:
		  #( void rtmidi_in_set_callback  #( void * device, FFICallback callback , void * data ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiOpenPort: device portNumber: portNumber portName: portName [

	^ self ffiCall:
		  #( void rtmidi_open_port #( void * device , uint portNumber
		        , char * portName ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiOutCreateDefault [

	^ self ffiCall: #( RtMidiOutWrapperStructure * rtmidi_out_create_default
		     #(  ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiOutFree: device [

	^ self ffiCall: #( void rtmidi_out_free  #(void * device ) )
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiOutSendMessage: device message: message [

	^ self
		  rtMidiOutSendMessage: device
		  message: message
		  length: message size
]

{ #category : #accessing }
RtMidiFfi class >> rtMidiOutSendMessage: device message: message length: length [

	^ self ffiCall: #( void rtmidi_out_send_message  #( void * device, void * message, int length ) )
]
