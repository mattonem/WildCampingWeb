Class {
	#name : #CSSubmission,
	#superclass : #Object,
	#instVars : [
		'id',
		'data',
		'type',
		'email'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CSSubmission >> campsite: anObject [

	data := anObject asDataModel
]

{ #category : #accessing }
CSSubmission >> data [ 	
	^ data
]

{ #category : #accessing }
CSSubmission >> email: anObject [

	email := anObject
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
