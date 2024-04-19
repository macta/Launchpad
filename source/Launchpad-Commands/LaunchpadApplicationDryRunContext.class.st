Class {
	#name : 'LaunchpadApplicationDryRunContext',
	#superclass : 'LaunchpadApplicationContext',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'converting' }
LaunchpadApplicationDryRunContext >> asDryRunContext [

	^ self
]

{ #category : 'running' }
LaunchpadApplicationDryRunContext >> run: startupBlock [

	self exitSuccess
]
