Class {
	#name : 'CTGrowableStackTest',
	#superclass : 'TestCase',
	#instVars : [
		'stack'
	],
	#category : 'Containers-Stack-Tests',
	#package : 'Containers-Stack-Tests'
}

{ #category : 'running' }
CTGrowableStackTest >> setUp [
	super setUp.
	stack := CTGrowableStack new
]

{ #category : 'tests' }
CTGrowableStackTest >> testExplicitCapacityDoubling [
	
	| internalCollection |
	
	stack := CTGrowableStack new.
	internalCollection := OrderedCollection new: 4.
	stack instVarNamed: 'elements' put: internalCollection.

	1 to: 4 do: [ :i | stack push: i ].
	self assert: internalCollection capacity equals: 4.

	stack push: 5.

	self assert: (stack instVarNamed: 'elements') capacity equals: 8.
	self assert: stack size equals: 5.
]

{ #category : 'tests' }
CTGrowableStackTest >> testInternalCapacityDoubling [
	
	| internalCollection |
	
	internalCollection := stack instVarNamed: 'elements'.
	
	1 to: 100 do: [ :i | stack push: i ].

	self assert: stack size equals: 100.
	self assert: internalCollection capacity >= 100.
]

{ #category : 'tests' }
CTGrowableStackTest >> testInternalGrowth [

	1 to: 20 do: [ :i | stack push: i ].
	
	self assert: stack size equals: 20.
	self assert: stack top equals: 20.
]

{ #category : 'tests' }
CTGrowableStackTest >> testIsEmpty [
	self assert: stack isEmpty.
	
	stack push: 'x'.
	self deny: stack isEmpty.
	
	stack pop.
	self assert: stack isEmpty.
]

{ #category : 'tests' }
CTGrowableStackTest >> testPop [
	stack push: 'first'.
	stack push: 'second'.
	
	self assert: stack pop equals: 'second'.
	self assert: stack size equals: 1.
	self assert: stack pop equals: 'first'.
	self assert: stack isEmpty.
]

{ #category : 'tests' }
CTGrowableStackTest >> testPush [
	stack push: 'a'.
	
	self assert: stack size equals: 1.
	self deny: stack isEmpty.
	self assert: stack top equals: 'a'.
]
