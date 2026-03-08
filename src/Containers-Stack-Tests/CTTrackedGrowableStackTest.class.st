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
