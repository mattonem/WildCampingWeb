Class {
	#name : #CSCreateWebApp,
	#superclass : #WCComponentApp,
	#classInstVars : [
		'ressourcePrefix'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CSCreateWebApp class >> db [

	<pharoJsSkip>
	^ WCGeoHashDB new
		  rootFolder: self repository location / 'build' / 'data';
		  coords: #coordinates;
		  precision: 9;
		  ids: #id;
		  yourself
]

{ #category : #'as yet unclassified' }
CSCreateWebApp class >> deleteIndex [
<pharoJsSkip>
	self db deleteIndex
]

{ #category : #accessing }
CSCreateWebApp class >> getRessourcePrefix [

	<javascript: 'return this.pj_getSerializePrefix()'>
	^ '.'
]

{ #category : #accessing }
CSCreateWebApp class >> getSerializePrefix [

	<jsLiteralGenerator>
	^ ressourcePrefix
]

{ #category : #accessing }
CSCreateWebApp class >> makeIndex [

	<pharoJsSkip>
	| db  |
	db := self db.
	db createIndex
]

{ #category : #accessing }
CSCreateWebApp class >> ressourcePrefix [

	^ ressourcePrefix ifNil: [
		  ressourcePrefix := self getRessourcePrefix ]
]

{ #category : #accessing }
CSCreateWebApp class >> ressourcePrefix: anObject [

	ressourcePrefix := anObject
]

{ #category : #accessing }
CSCreateWebApp class >> rootComponentClass [

	^ CSCreationProcess
]

{ #category : #accessing }
CSCreateWebApp class >> staticComponentSerialized [

	<jsLiteralGenerator>
	^ component asPhxJsonString 
]

{ #category : #'as yet unclassified' }
CSCreateWebApp class >> staticFoldersToExpose [

	<pharoJsSkip>
	^ { (#ressources -> (self repositoryPath / 'build' / 'ressources')) }
		  asDictionary
]

{ #category : #'as yet unclassified' }
CSCreateWebApp class >> updateDataModel [

	<pharoJsSkip>
	self db allObjectsDo: [ :anObject | |csdm|
		csdm := CampingSite new fromDataModelV1: anObject.
		self db write: csdm asDataModel. ]
]

{ #category : #accessing }
CSCreateWebApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'.
	root stylesheet url:
		'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css'.
	root javascript url:
		'https://unpkg.com/leaflet@1.9.4/dist/leaflet.js'
]

{ #category : #accessing }
CSCreateWebApp class >> writeObjectFromString: string [

	<pharoJsSkip>
	| db csdm |
	db := self db.
	csdm := (PhxJsonReader readFromString: string) data.

	db write: csdm.
	db deleteIndex
]
