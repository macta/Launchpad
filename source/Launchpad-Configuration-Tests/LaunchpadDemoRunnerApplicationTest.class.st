"
A LaunchpadDemoRunnerApplicationTest is a test class for testing the behavior of LaunchpadDemoRunnerApplication
"
Class {
	#name : #LaunchpadDemoRunnerApplicationTest,
	#superclass : #TestCase,
	#category : #'Launchpad-Configuration-Tests'
}

{ #category : #tests }
LaunchpadDemoRunnerApplicationTest >> testStartingApplicationWithDebugAndPort [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'DemoRunner' '--log-requests=true' '--port=8081').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { true. 8081} forTest: self
]

{ #category : #tests }
LaunchpadDemoRunnerApplicationTest >> testStartingApplicationWithDebugDefaultPort [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'DemoRunner' '--log-requests=true').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { true. 8181} forTest: self
]

{ #category : #tests }
LaunchpadDemoRunnerApplicationTest >> testStartingApplicationWithDefaults [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'DemoRunner').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { false. 8181} forTest: self
]
