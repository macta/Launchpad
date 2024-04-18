"
A LaunchpadDryRunProcessingContextTest is a test class for testing the behavior of LaunchpadDryRunProcessingContext
"
Class {
	#name : 'LaunchpadDryRunProcessingContextTest',
	#superclass : 'TestCase',
	#category : 'Launchpad-Commands-Tests',
	#package : 'Launchpad-Commands-Tests'
}

{ #category : 'tests' }
LaunchpadDryRunProcessingContextTest >> testConverting [

	| context |

	context := LaunchpadDryRunProcessingContext handling: ( CommandLineArguments withArguments: #(  ) ).

	self assert: context asDryRunContext equals: context
]
