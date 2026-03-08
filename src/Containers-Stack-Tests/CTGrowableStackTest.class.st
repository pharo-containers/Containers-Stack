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
