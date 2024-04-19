"
A LaunchpadApplicationDryRunContextTest is a test class for testing the behavior of LaunchpadApplicationDryRunContext
"
Class {
	#name : 'LaunchpadApplicationDryRunContextTest',
	#superclass : 'TestCase',
	#category : 'Launchpad-Commands-Tests',
	#package : 'Launchpad-Commands-Tests'
}

{ #category : 'tests' }
LaunchpadApplicationDryRunContextTest >> testConverting [

	| context |

	context := LaunchpadApplicationDryRunContext handling: ( CommandLineArguments withArguments: #(  ) ).

	self assert: context asDryRunContext equals: context
]
