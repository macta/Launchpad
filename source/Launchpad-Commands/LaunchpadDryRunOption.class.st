Class {
	#name : 'LaunchpadDryRunOption',
	#superclass : 'LaunchpadOption',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'evaluating' }
LaunchpadDryRunOption >> evaluateWithin: context handling: argument [

	^ context asDryRunContext
]

{ #category : 'accessing' }
LaunchpadDryRunOption >> name [

	^ 'dry-run'
]

{ #category : 'accessing' }
LaunchpadDryRunOption >> summary [

	^ 'Perform a dry run of the application. All the configuration will be loaded (and validated), but the application will not perform any changes.'
]
