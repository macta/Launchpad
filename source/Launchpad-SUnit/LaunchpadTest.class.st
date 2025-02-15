Class {
	#name : 'LaunchpadTest',
	#superclass : 'TestCase',
	#instVars : [
		'runningApplication',
		'loggingAsserter'
	],
	#category : 'Launchpad-SUnit',
	#package : 'Launchpad-SUnit'
}

{ #category : 'testing' }
LaunchpadTest class >> isAbstract [

	^ self = LaunchpadTest
]

{ #category : 'private' }
LaunchpadTest >> assertLogRecordsMatch: expectedLogEntries [

	loggingAsserter assertLogRecordsMatch: expectedLogEntries 
]

{ #category : 'private' }
LaunchpadTest >> assertThereAreNoLogRecords [

	self assertLogRecordsMatch: #(  )
]

{ #category : 'private' }
LaunchpadTest >> dryRun: aLaunchpadApplication withAll: arguments [

	self runMemoryLoggerDuring: [
		[
		runningApplication := LaunchpadCommandLineHandler activateWithArguments: {
				                      'start'.
				                      '--debug-mode'.
				                      '--dry-run'.
				                      aLaunchpadApplication commandName } , arguments
		]
			on: Exit
			do: [ :exit | exit resume ]
		]
]

{ #category : 'running' }
LaunchpadTest >> runCase [

	self shouldnt: [ super runCase ] raise: Exit
]

{ #category : 'private' }
LaunchpadTest >> runMemoryLoggerDuring: aBlock [

	loggingAsserter runMemoryLoggerDuring: aBlock
]

{ #category : 'private' }
LaunchpadTest >> runMemoryLoggerDuring: aBlock assertingLogRecordsMatch: expectedLogEntries [

	self
		runMemoryLoggerDuring: aBlock;
		assertLogRecordsMatch: expectedLogEntries
]

{ #category : 'running' }
LaunchpadTest >> setUp [

	super setUp.
	loggingAsserter := LoggingAsserter on: self
]

{ #category : 'private' }
LaunchpadTest >> start: aLaunchpadApplication withAll: arguments [

	self runMemoryLoggerDuring: [
		runningApplication := LaunchpadCommandLineHandler activateWithArguments: {
				                      'launchpad'.
				                      'start'.
				                      '--debug-mode'.
				                      aLaunchpadApplication commandName } , arguments
		]
]

{ #category : 'running' }
LaunchpadTest >> tearDown [

	loggingAsserter stopLoggers.
	runningApplication ifNotNil: [:application | application stop].
	LaunchpadApplication resetCurrentlyRunning.
	super tearDown
]
