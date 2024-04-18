Class {
	#name : 'CommandServer',
	#superclass : 'Object',
	#category : 'Launchpad-Commands',
	#package : 'Launchpad-Commands'
}

{ #category : 'controlling' }
CommandServer >> start [

	self subclassResponsibility
]

{ #category : 'controlling' }
CommandServer >> stop [

	self subclassResponsibility
]
