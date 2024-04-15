"
A LaunchpadDemoRunnerApplicationTest is a test class for testing the behavior of LaunchpadDemoRunnerApplication
"
Class {
	#name : #LaunchpadHTTPServerDemoApplicationTest,
	#superclass : #TestCase,
	#category : #'Launchpad-Configuration-Tests'
}

{ #category : #tests }
LaunchpadHTTPServerDemoApplicationTest >> testStartingApplicationWithDebugAndPort [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'HTTPServerDemo' '--log-requests=true' '--port=8081').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { true. 8081} forTest: self
]

{ #category : #tests }
LaunchpadHTTPServerDemoApplicationTest >> testStartingApplicationWithDebugDefaultPort [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'HTTPServerDemo' '--log-requests=true').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { true. 8181} forTest: self
]

{ #category : #tests }
LaunchpadHTTPServerDemoApplicationTest >> testStartingApplicationWithDefaults [

	| commandLine testContext |
	
	commandLine := CommandLineArguments withArguments: #('start' 'HTTPServerDemo').
	testContext := LaunchpadTestProcessingContext handling: commandLine.
   LaunchpadCommandLineHandler activateInContext: testContext.

	testContext assertRunWithArguments: { false. 8181} forTest: self
]
