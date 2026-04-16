Class {
	#name : 'CTTrackedGrowableStack',
	#superclass : 'CTGrowableStack',
	#instVars : [
		'maxDepth'
	],
	#category : 'Containers-Stack',
	#package : 'Containers-Stack'
}

{ #category : 'initialization' }
CTTrackedGrowableStack >> initialize [
	super initialize.
	maxDepth := 0
]

{ #category : 'accessing' }
CTTrackedGrowableStack >> maxDepth [
	^ maxDepth
]

{ #category : 'adding' }
CTTrackedGrowableStack >> push: anObject [
	super push: anObject.
	maxDepth := maxDepth max: self size.
	^ self
]
