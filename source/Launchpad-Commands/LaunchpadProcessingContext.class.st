Class {
	#name : 'LaunchpadProcessingContext',
	#superclass : 'Object',
	#instVars : [
		'commandLine',
		'output'
	],
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'instance creation' }
LaunchpadProcessingContext class >> handling: aCommandLine [

	^ self handling: aCommandLine writingTo: String new writeStream
]

{ #category : 'instance creation' }
LaunchpadProcessingContext class >> handling: aCommandLine writingTo: outputStream [

	^ self new initializeHandling: aCommandLine writingTo: outputStream
]

{ #category : 'testing' }
LaunchpadProcessingContext class >> isAbstract [

	<ignoreForCoverage>
	^ self = LaunchpadProcessingContext
]

{ #category : 'converting' }
LaunchpadProcessingContext >> asDryRunContext [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
LaunchpadProcessingContext >> commandLine [

	^ commandLine
]

{ #category : 'accessing' }
LaunchpadProcessingContext >> configurationProviderChainedWith: aConfigurationProvider [

	^ ConfigurationFromCommandLineProvider over: commandLine chainedWith: aConfigurationProvider
]

{ #category : 'utilities' }
LaunchpadProcessingContext >> emitErrorAndExit: message [

	LogRecord emitError: message.
	self exitFailure
]

{ #category : 'utilities' }
LaunchpadProcessingContext >> exitFailure [

	Exit signalFailure
]

{ #category : 'utilities' }
LaunchpadProcessingContext >> exitSuccess [

	Exit signalSuccess
]

{ #category : 'initialize' }
LaunchpadProcessingContext >> initializeHandling: aCommandLine writingTo: outputStream [

	commandLine := aCommandLine.
	output := ZnNewLineWriterStream on: outputStream
]

{ #category : 'accessing' }
LaunchpadProcessingContext >> nextCommandLineArgumentIfNone: aFailBlock [

	commandLine withFirstArgument: [ :argument | 
		commandLine := commandLine copySubcommand.
		^ argument
		].
	^ aFailBlock value
]

{ #category : 'enumerating' }
LaunchpadProcessingContext >> outputStreamDo: aBlock [

	aBlock value: output
]

{ #category : 'running' }
LaunchpadProcessingContext >> run: startupBlock [

	^ self subclassResponsibility
]

{ #category : 'configuration' }
LaunchpadProcessingContext >> usePlatformLineEnding [

	output forPlatformLineEnding
]
