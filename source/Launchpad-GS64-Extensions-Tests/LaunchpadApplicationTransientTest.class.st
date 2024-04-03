"
That class tests the API given by AbstractUserInput. Since that class is obviously abstract, it can't be instantiated, the tests are running on CommandLine (which inherits from AbstractUserInput)
"
Class {
	#name : #LaunchpadApplicationTransientTest,
	#superclass : #TestCase,
	#instVars : [	],
	#category : #'Launchpad-GS64-Extensions-Tests'
}

{ #category : #tests }
LaunchpadApplicationTransientTest >> testAccessingRunningApplication [
	| application |

	application := LaunchpadBrokenApplication
		               runningIn: DebuggingApplicationMode new
		               configuredBy: NullConfigurationProvider new
		               controlledBy: NullCommandServer new.

	LaunchpadApplication setAsCurrentlyRunning: application.
	System abortTransaction.
	self assert: LaunchpadApplication currentlyRunning equals: application
]

{ #category : #running }
LaunchpadApplicationTransientTest >> tearDown [

	CurrentlyRunningLaunchpadApplication new resetCurrentlyRunning
	super tearDown.
]
