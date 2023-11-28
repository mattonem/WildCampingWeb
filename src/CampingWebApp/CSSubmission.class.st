Class {
	#name : #CSSubmission,
	#superclass : #Object,
	#instVars : [
		'id',
		'campsite',
		'type'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CSSubmission >> campsite [

	^ campsite
]

{ #category : #accessing }
CSSubmission >> campsite: anObject [

	campsite := anObject
]

{ #category : #accessing }
CSSubmission >> id [

	^ id
]

{ #category : #accessing }
CSSubmission >> initialize [ 
	super initialize .
	id := WCUUIDGeneratorWrapper next
]

{ #category : #accessing }
CSSubmission >> type [

	^ type
]

{ #category : #accessing }
CSSubmission >> type: anObject [

	type := anObject
]
