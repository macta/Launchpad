"
A LaunchpadCommandLineHandlerTest is a test class for testing the behavior of LaunchpadCommandLineHandler
"
Class {
	#name : 'LaunchpadCommandLineHandlerTest',
	#superclass : 'LaunchpadTest',
	#category : 'Launchpad-Commands-Tests',
	#package : 'Launchpad-Commands-Tests'
}

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testApplicationConfiguration [

	self dryRun: LaunchpadGreeterApplication withAll: #( '--name=John' ).

	self
		assert: runningApplication configuration name equals: 'John';
		assert: runningApplication configuration title isEmpty.

	self dryRun: LaunchpadGreeterApplication withAll: #( '--name=John' '--title=Dr.' ).

	self
		assert: runningApplication configuration name equals: 'John';
		assert: runningApplication configuration title equals: 'Dr.'
]

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testDescription [

	self assert: LaunchpadCommandLineHandler description
		equals: 'A minimal application launcher'
]

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testDryRunApplication [

	self
		should: [
			LaunchpadCommandLineHandler activateWithArguments:
				#( 'launchpad' 'start' '--dry-run' 'greeter' '--name=John' )
			]
		raise: Exit
		withExceptionDo: [ :exit | self assert: exit isSuccess ] 

	"When a mandatory argument is missing the dry-run option makes the application exit with error".
	self
		should: [
		LaunchpadCommandLineHandler activateWithArguments: #( 'launchpad' 'start' '--dry-run' 'greeter' ) ]
		raise: Exit
		withExceptionDo: [ :exit | self deny: exit isSuccess ]
]

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testDryRunBrokenApplication [

	"Starting an application that will fail in dry-run mode, but not missing any configuration shouldn't fail"

	self
		should: [
		LaunchpadCommandLineHandler activateWithArguments: #( 'launchpad' 'start' '--dry-run' 'broken' ) ]
		raise: Exit
		withExceptionDo: [ :exit | self assert: exit isSuccess ]
]

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testHandlingHelpOption [

	self
		should: [ LaunchpadCommandLineHandler activateWithArguments: #( 'launchpad' '--help' ) ]
		raise: Exit
		withExceptionDo: [ :exit | self assert: exit isSuccess ]
]

{ #category : 'tests' }
LaunchpadCommandLineHandlerTest >> testStartingApplication [

	self
		should: [
			LaunchpadCommandLineHandler activateWithArguments:
				#( 'launchpad' 'start' 'greeter' '--name=John' ) ]
		raise: Exit
		withExceptionDo: [ :exit | self assert: exit isSuccess ].

	self
		should: [ self start: LaunchpadGreeterApplication withAll: #(  ) ]
		raise: RequiredConfigurationNotFound
]
