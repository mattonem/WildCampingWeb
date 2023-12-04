Class {
	#name : #CSIndexWebApp,
	#superclass : #WCComponentApp,
	#category : #CampingWebApp
}

{ #category : #accessing }
CSIndexWebApp class >> appClasses [

	<pharoJsSkip>
	^ super appClasses , { CampingSite }
]

{ #category : #accessing }
CSIndexWebApp class >> rootComponentClass [

	^ CSIndexComponent
]

{ #category : #accessing }
CSIndexWebApp class >> staticComponentSerialized [

	<jsLiteralGenerator>
	^ component asPhxJsonString
]

{ #category : #accessing }
CSIndexWebApp class >> staticFoldersToExpose [

	<pharoJsSkip>
	^ { (#ressources -> (self repositoryPath / 'build' / 'ressources')).
	(#data -> (self repositoryPath / 'build' / 'data')) }
		  asDictionary
]

{ #category : #accessing }
CSIndexWebApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'.
	root stylesheet url:
		'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css'.
	root javascript url:
		'https://unpkg.com/leaflet@1.9.4/dist/leaflet.js'
]
