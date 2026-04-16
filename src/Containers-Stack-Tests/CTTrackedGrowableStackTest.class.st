Class {
	#name : 'CTTrackedGrowableStackTest',
	#superclass : 'TestCase',
	#instVars : [
		'stack'
	],
	#category : 'Containers-Stack-Tests',
	#package : 'Containers-Stack-Tests'
}

{ #category : 'running' }
CTTrackedGrowableStackTest >> setUp [
	super setUp.
	stack := CTTrackedGrowableStack new
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testErrorHandlingDoesNotAffectMaxDepth [
	self should: [ stack pop ] raise: Error.
	self assert: stack maxDepth equals: 0.
	
	stack push: 'temp'.
	stack pop.
	
	self should: [ stack pop ] raise: Error.
	self assert: stack maxDepth equals: 1.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testInitialMaxDepth [
	self assert: stack maxDepth equals: 0.
	self assert: stack isEmpty.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testMaxDepthAfterPop [
	stack push: 'apple'.
	stack push: 'banana'.
	self assert: stack maxDepth equals: 2.
	
	stack pop. 
	
	self assert: stack size equals: 1.
	self assert: stack maxDepth equals: 2. 
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testMaxDepthDuringInternalGrowth [
	
	1 to: 50 do: [ :i | stack push: i ].
	self assert: stack maxDepth equals: 50.
	self assert: stack size equals: 50.
	
	1 to: 25 do: [ :i | stack pop ].
	self assert: stack maxDepth equals: 50.
	self assert: stack size equals: 25.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testMaxDepthWithExplicitInternalGrowth [

	| internalCollection |
	stack := CTTrackedGrowableStack new.
	internalCollection := OrderedCollection new: 4.
	stack instVarNamed: 'elements' put: internalCollection.

	1 to: 4 do: [ :i | stack push: i ].
	self assert: stack maxDepth equals: 4.
	self assert: internalCollection capacity equals: 4.

	stack push: 5.

	self assert: stack maxDepth equals: 5.
	self assert: (stack instVarNamed: 'elements') capacity equals: 8.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testMaxDepthWithFluctuations [
	stack push: 1.
	stack push: 2.
	stack pop.
	stack pop. 
	
	stack push: 3.
	stack push: 4.
	stack push: 5. 
	
	self assert: stack maxDepth equals: 3.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testMaxDepthWithLargeDataset [
	1 to: 100 do: [ :i | stack push: i ].
	
	self assert: stack maxDepth equals: 100.
	self assert: stack size equals: 100.
	
	1 to: 50 do: [ :i | stack pop ].
	
	self assert: stack maxDepth equals: 100. 
	self assert: stack size equals: 50.
]

{ #category : 'tests' }
CTTrackedGrowableStackTest >> testTopDoesNotAffectMaxDepth [
	stack push: 'hello'.
	self assert: stack maxDepth equals: 1.
	
	self assert: stack top equals: 'hello'.
	self assert: stack maxDepth equals: 1.
	self assert: stack size equals: 1.
]
