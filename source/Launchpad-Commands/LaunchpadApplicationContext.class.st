Class {
	#name : 'LaunchpadApplicationContext',
	#superclass : 'Object',
	#instVars : [
		'commandLine',
		'output'
	],
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'instance creation' }
LaunchpadApplicationContext class >> handling: aCommandLine [

	^ self handling: aCommandLine writingTo: String new writeStream
]

{ #category : 'instance creation' }
LaunchpadApplicationContext class >> handling: aCommandLine writingTo: outputStream [

	^ self new initializeHandling: aCommandLine writingTo: outputStream
]

{ #category : 'testing' }
LaunchpadApplicationContext class >> isAbstract [

	<ignoreForCoverage>
	^ self = LaunchpadApplicationContext
]

{ #category : 'converting' }
LaunchpadApplicationContext >> asDryRunContext [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
LaunchpadApplicationContext >> commandLine [

	^ commandLine
]

{ #category : 'accessing' }
LaunchpadApplicationContext >> configurationProviderChainedWith: aConfigurationProvider [

	^ ConfigurationFromCommandLineProvider over: commandLine chainedWith: aConfigurationProvider
]

{ #category : 'utilities' }
LaunchpadApplicationContext >> emitErrorAndExit: message [

	LogRecord emitError: message.
	self exitFailure
]

{ #category : 'utilities' }
LaunchpadApplicationContext >> exitFailure [

	Exit signalFailure
]

{ #category : 'utilities' }
LaunchpadApplicationContext >> exitSuccess [

	Exit signalSuccess
]

{ #category : 'initialize' }
LaunchpadApplicationContext >> initializeHandling: aCommandLine writingTo: outputStream [

	commandLine := aCommandLine.
	output := ZnNewLineWriterStream on: outputStream
]

{ #category : 'accessing' }
LaunchpadApplicationContext >> nextCommandLineArgumentIfNone: aFailBlock [

	commandLine withFirstArgument: [ :argument | 
		commandLine := commandLine copySubcommand.
		^ argument
		].
	^ aFailBlock value
]

{ #category : 'enumerating' }
LaunchpadApplicationContext >> outputStreamDo: aBlock [

	aBlock value: output
]

{ #category : 'running' }
LaunchpadApplicationContext >> run: startupBlock [

	^ self subclassResponsibility
]

{ #category : 'configuration' }
LaunchpadApplicationContext >> usePlatformLineEnding [

	output forPlatformLineEnding
]
