Class {
	#name : 'NullConfigurationProvider',
	#superclass : 'ConfigurationProvider',
	#category : 'Launchpad-Configuration',
	#package : 'Launchpad-Configuration'
}

{ #category : 'initialization' }
NullConfigurationProvider >> reloadConfiguration [

	
]

{ #category : 'resolving' }
NullConfigurationProvider >> valueFor: aConfigurationParameter ifFound: aFoundBlock ifNone: aFailBlock [

	^ aFailBlock value
]
