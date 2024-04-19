Class {
	#name : 'LaunchpadApplicationStartingContext',
	#superclass : 'LaunchpadApplicationContext',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'converting' }
LaunchpadApplicationStartingContext >> asDryRunContext [

	^ LaunchpadApplicationDryRunContext handling: commandLine writingTo: output
]

{ #category : 'running' }
LaunchpadApplicationStartingContext >> run: startUpBlock [

	startUpBlock value
]
