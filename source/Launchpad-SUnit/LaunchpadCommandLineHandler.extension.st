Extension { #name : 'LaunchpadCommandLineHandler' }

{ #category : '*Launchpad-SUnit' }
LaunchpadCommandLineHandler class >> activateWithArguments: arguments [

	^ self activateWith: ( CommandLineArguments withArguments: arguments )
]
