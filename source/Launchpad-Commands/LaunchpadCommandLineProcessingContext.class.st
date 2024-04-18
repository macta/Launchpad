Class {
	#name : 'LaunchpadCommandLineProcessingContext',
	#superclass : 'LaunchpadProcessingContext',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'converting' }
LaunchpadCommandLineProcessingContext >> asDryRunContext [

	^ LaunchpadDryRunProcessingContext handling: commandLine writingTo: output
]

{ #category : 'running' }
LaunchpadCommandLineProcessingContext >> run: startUpBlock [

	startUpBlock value
]
