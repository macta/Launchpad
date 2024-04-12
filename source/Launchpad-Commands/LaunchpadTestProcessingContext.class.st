"
I provide a convenient way to test Launchpad command handling.

e.g.

	commandLine := CommandLineArguments withArguments: #('start' 'MyApp' '--log-requests=true').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { true } forTest: self
"
Class {
	#name : #LaunchpadTestProcessingContext,
	#superclass : #LaunchpadCommandLineProcessingContext,
	#instVars : [
		'runArguments'
	],
	#category : #'Launchpad-Commands'
}

{ #category : #'instance creation' }
LaunchpadTestProcessingContext class >> handling: aCommandLine [

	^ self handling: aCommandLine  writingTo: (WriteStream on: '')
]

{ #category : #'testing - support' }
LaunchpadTestProcessingContext >> assertRunWithArguments: aCollection forTest: aTest [

	aTest assertCollection: aCollection hasSameElements: runArguments
]

{ #category : #'testing - support' }
LaunchpadTestProcessingContext >> run: aBlock withArguments: aCollection [
	runArguments := aCollection 
]
