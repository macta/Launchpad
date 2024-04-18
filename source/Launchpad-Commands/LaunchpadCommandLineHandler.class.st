Class {
	#name : #LaunchpadCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'Launchpad-Commands'
}

{ #category : #'instance creation' }
LaunchpadCommandLineHandler class >> activateInContext: aProcessingContext [

	^ self new
		commandLine: aProcessingContext commandLine;
		activateWithContext: aProcessingContext
]

{ #category : #'instance creation' }
LaunchpadCommandLineHandler class >> activateWith: aCommandLine [

	^ self activateInContext: (self defaultContextForCommandLine:
			   (self prepareSubcommand: aCommandLine))
]

{ #category : #accessing }
LaunchpadCommandLineHandler class >> commandName [

	^ LaunchpadRootCommand commandName
]

{ #category : #'instance creation' }
LaunchpadCommandLineHandler class >> defaultContextForCommandLine: commandLine [

	^ (LaunchpadCommandLineProcessingContext
		   		handling: commandLine
		   		writingTo: Stdio stdout)
		  usePlatformLineEnding;
		  yourself
]

{ #category : #accessing }
LaunchpadCommandLineHandler class >> description [

	^ LaunchpadRootCommand summary
]

{ #category : #activation }
LaunchpadCommandLineHandler >> activate [
	"shouldn't really be called anymore, divert to #activateWithContext:"
	
	self activateWithContext: (self class defaultContextForCommandLine: self commandLine)
]

{ #category : #activation }
LaunchpadCommandLineHandler >> activateWithContext: context [

	Processor activeProcess name: 'Launchpad CLI'.

	StandardStreamLogger onStandardOutput startFor:
		( LogRecord where: [ :record | record isInformational ] ).
	StandardStreamLogger onStandardError startFor:
		( LogRecord where: [ :record | record isInformational not ] ).

	LogRecord emitInfo: 'Launchpad processing command line parameters'.
	
	LaunchpadRootCommand new evaluateWithin: context
]
