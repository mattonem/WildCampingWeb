Class {
	#name : #CampingSite,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'coordinates',
		'attributes',
		'description'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CampingSite >> asDataModel [
	^ self asDataModelV1
]

{ #category : #accessing }
CampingSite >> asDataModelV1 [

	^ CampingSiteDataModelV1 new id: id; description: description; name: name; coordinates: coordinates 
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
CampingSite >> fromDataModelV1:anObject [

	id := anObject id.
	coordinates  := anObject  coordinates.
	description := anObject description. 
	name := anObject name. 
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

{ #category : #accessing }
CampingSite >> name [

	^ name
]

{ #category : #accessing }
CampingSite >> name: anObject [

	name := anObject
]
