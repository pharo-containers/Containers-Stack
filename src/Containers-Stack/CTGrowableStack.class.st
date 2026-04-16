Class {
	#name : 'CTGrowableStack',
	#superclass : 'Object',
	#instVars : [
		'elements'
	],
	#category : 'Containers-Stack',
	#package : 'Containers-Stack'
}

{ #category : 'initialization' }
CTGrowableStack >> initialize [
	super initialize.
	elements := OrderedCollection new
]

{ #category : 'testing' }
CTGrowableStack >> isEmpty [
	^ elements isEmpty
]

{ #category : 'removing' }
CTGrowableStack >> pop [
	self isEmpty ifTrue: [ self error: 'Stack is empty' ].
	^ elements removeLast
]

{ #category : 'adding' }
CTGrowableStack >> push: anObject [
	elements addLast: anObject.
	^ self
]

{ #category : 'accessing' }
CTGrowableStack >> size [
	^ elements size
]

{ #category : 'accessing' }
CTGrowableStack >> top [
	self isEmpty ifTrue: [ self error: 'Stack is empty' ].
	^ elements last
]
