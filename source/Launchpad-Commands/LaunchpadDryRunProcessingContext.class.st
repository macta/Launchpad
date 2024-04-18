Class {
	#name : 'LaunchpadDryRunProcessingContext',
	#superclass : 'LaunchpadProcessingContext',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'converting' }
LaunchpadDryRunProcessingContext >> asDryRunContext [

	^ self
]

{ #category : 'running' }
LaunchpadDryRunProcessingContext >> run: startupBlock [

	self exitSuccess
]
