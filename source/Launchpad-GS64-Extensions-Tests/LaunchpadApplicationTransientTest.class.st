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

	CurrentlyRunningLaunchpadApplication new resetCurrentlyRunning.
	super tearDown
]
