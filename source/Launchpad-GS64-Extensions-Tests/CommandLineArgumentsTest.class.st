Class {
	#name : #CommandLineArgumentsTest,
	#superclass : #TestCase,
	#instVars : [
		'commandLine'
	],
	#category : #'Launchpad-GS64-Extensions-Tests'
}

{ #category : #accessing }
CommandLineArgumentsTest >> commandLine [
	^ commandLine
]

{ #category : #accessing }
CommandLineArgumentsTest >> parameters [
	^ #('noOpt1' 'noOpt2.txt' 'noOpt3.avi' '--option1' 'opt11' 'opt12.txt' 'opt13.avi' '--option2' '--option3' 'opt31.st' 'opt32' '--option4' '--option5=option5Value' '-o' 'oValue')
]

{ #category : #running }
CommandLineArgumentsTest >> setUp [
	super setUp.
	commandLine := CommandLineArguments withArguments: self parameters
]

{ #category : #tests }
CommandLineArgumentsTest >> testAllParameters [
	self assertCollection: self commandLine arguments equals: self parameters
]

{ #category : #tests }
CommandLineArgumentsTest >> testHasOption [
	self assert: (self commandLine hasOption: #option1).
	self assert: (self commandLine hasOption: #option4).
	self assert: (self commandLine hasOption: #option5).
	self assert: (self commandLine hasOption: #o).
	self deny: (self commandLine hasOption: #foo).
	self deny: (self commandLine hasOption: #option5Value)
]

{ #category : #tests }
CommandLineArgumentsTest >> testHasParameters [
	self assert: (self commandLine hasArguments)
]

{ #category : #tests }
CommandLineArgumentsTest >> testOptionAt [
	self should: [ self commandLine optionAt: #option1 ] raise: Error.
	self should: [ self commandLine optionAt: #option4 ] raise: Error.

	self assert: (self commandLine optionAt: #option5) equals: 'option5Value'.
	self should: [ self commandLine optionAt: #foo ] raise: Error.

	self assert: (self commandLine optionAt: #o) equals: 'oValue'.
	self should: [ self commandLine optionAt: #x ] raise: Error
]

{ #category : #tests }
CommandLineArgumentsTest >> testOptionAtifAbsent [
	self assert: (self commandLine optionAt: #option1 ifAbsent: [ nil ]) equals: nil.
	self assert: (self commandLine optionAt: #option4 ifAbsent: [ nil ]) equals: nil.
	self assert: (self commandLine optionAt: #option5) equals: 'option5Value'.
	self assert: (self commandLine optionAt: #foo ifAbsent: [ nil ]) equals: nil.
	self assert: (self commandLine optionAt: #o) equals: 'oValue'.
	self assert: (self commandLine optionAt: #x ifAbsent: [ nil ]) equals: nil
]

{ #category : #tests }
CommandLineArgumentsTest >> testParameterAt [
	self assert: (self commandLine argumentAt: 1) equals: 'noOpt1'.
	self assert: (self commandLine argumentAt: 4) equals: '--option1'.
	self deny: (self commandLine argumentAt: 5) equals: 'foo'.
	self deny: (self commandLine argumentAt: 1) isNil
]
