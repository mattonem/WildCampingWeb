Class {
	#name : #CampingSite,
	#superclass : #Object,
	#instVars : [
		'id',
		'coordinates',
		'attributes',
		'description'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CampingSite >> asDataModel [

	^ self asDataModelV2
]

{ #category : #accessing }
CampingSite >> asDataModelV2 [

	^ CampingSiteDataModelV2 new
		  id: id;
		  description: description;
		  coordinates: coordinates
]

{ #category : #accessing }
CampingSite >> attributes [

	^ attributes
]

{ #category : #accessing }
CampingSite >> attributes: anObject [

	attributes := anObject
]

{ #category : #accessing }
CampingSite >> coordinates [

	^ coordinates
]

{ #category : #accessing }
CampingSite >> coordinates: anObject [

	coordinates := anObject
]

{ #category : #accessing }
CampingSite >> description [

	^ description
]

{ #category : #accessing }
CampingSite >> description: anObject [

	description := anObject
]

{ #category : #accessing }
CampingSite >> fromDataModelV1: anObject [

	id := anObject id.
	coordinates := anObject coordinates.
	description := anObject description.

]

{ #category : #accessing }
CampingSite >> fromDataModelV2: anObject [

	id := anObject id.
	coordinates := anObject coordinates.
	description := anObject description
]

{ #category : #accessing }
CampingSite >> id [

	^ id
]

{ #category : #accessing }
CampingSite >> id: anObject [

	id := anObject
]

{ #category : #accessing }
CampingSite >> initialize [

	attributes := Set new.
	id := WCUUIDGeneratorWrapper next
]
