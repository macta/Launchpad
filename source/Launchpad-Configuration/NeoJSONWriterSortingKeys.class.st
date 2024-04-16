Class {
	#name : 'NeoJSONWriterSortingKeys',
	#superclass : 'NeoJSONWriter',
	#category : 'Launchpad-Configuration',
	#package : 'Launchpad-Configuration'
}

{ #category : 'writing' }
NeoJSONWriterSortingKeys >> writeMap: keyValueCollection [

	self writeMapStreamingDo: [ :jsonMapWriter | 
		keyValueCollection keys sorted do: [ :key | 
			jsonMapWriter writeKey: key value: ( keyValueCollection at: key ) ]
		]
]
