Class {
	#name : #LaunchpadDemoRunnerApplication,
	#superclass : #LaunchpadApplication,
	#category : #'Launchpad-Examples'
}

{ #category : #accessing }
LaunchpadDemoRunnerApplication class >> commandName [

	^ 'DemoRunner'
]

{ #category : #'private - accessing' }
LaunchpadDemoRunnerApplication class >> configurationParameters [

^ { OptionalConfigurationParameter
      named: #'log-requests'
      describedBy: 'Log http requests'
      defaultingTo: false.

	OptionalConfigurationParameter
      named: #'port'
      describedBy: 'Server port'
      defaultingTo: 8181 }
]

{ #category : #accessing }
LaunchpadDemoRunnerApplication class >> description [

	^ 'Launchpad demo http app'
]

{ #category : #example }
LaunchpadDemoRunnerApplication class >> startServer [
	<script>
	"This would really be in its own class, but here to demonstrate a simple example of a running application to start via the command line.
	When using: launchpad start DemoRunner --log-requests=true"
	
	self startServerOn: 8181 debug: true
]

{ #category : #example }
LaunchpadDemoRunnerApplication class >> startServerOn: port debug: debug [
	"This would really be in its own class, but here to demonstrate a simple example"
	
	| server |
	server := (ZnServer defaultOn: port).
	debug ifTrue: [ server logToTranscript ].
	server start.
	
]

{ #category : #example }
LaunchpadDemoRunnerApplication class >> stopServer [
	<script>
	"This would really be in its own class, but here to demonstrate a simple example"
	
	ZnServer default stop
	
]

{ #category : #accessing }
LaunchpadDemoRunnerApplication class >> version [

	^ 'v1.0.0'
]

{ #category : #'private - activation' }
LaunchpadDemoRunnerApplication >> basicStartWithin: context [
	"This is an example of a launcher using a testable #run:withArguments: pattern. See the example test "
	
	context outputStreamDo: [ :stream | 
		
		stream
			nextPutAll: 'Launching ', self class commandName.
		
		context 
			run: [ :debug :port | 
				"This would be something to call in your own application class"
				
				LaunchpadDemoRunnerApplication startServerOn: port debug: debug ]
			withArguments: { 
				(self configuration valueAt: #'log-requests') asBoolean.
				(self configuration valueAt: #'port') asInteger }
	].
	
]

{ #category : #'error handling' }
LaunchpadDemoRunnerApplication >> stackTraceDumper [

	^ StackTraceDumper new
]
