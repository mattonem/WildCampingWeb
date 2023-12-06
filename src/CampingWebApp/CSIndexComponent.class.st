Class {
	#name : #CSIndexComponent,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#instVars : [
		'db'
	],
	#category : #CampingWebApp
}

{ #category : #rendering }
CSIndexComponent >> _getLocationHash [

	<javascript: 'return window.location.hash'>
	
]

{ #category : #'initialize-release' }
CSIndexComponent >> calculate [

	| region regions ghs |
	region := (self componentNamed: #map) getBounds.
	regions := WCGeoHash divideRegion: region.
	ghs := WCGeoHash hashesCoverRegion: region precision: 9.
	(self componentNamed: #map) removeAllLayers.
	ghs do: [ :aGh |
		db getObjectsIn: aGh do: [ :object |
			| marker  |
			marker := (self componentNamed: #map)
				          addMarker: (object at: #coordinates)
				         .

			marker bindPopup: (object at: #id) ] ]
]

{ #category : #'initialize-release' }
CSIndexComponent >> calculateCurrentSelection: aUuid [

	| region regions ghs |
	region := (self componentNamed: #map) getBounds.
	regions := WCGeoHash divideRegion: region.
	ghs := WCGeoHash hashesCoverRegion: region precision: 9.
	(self componentNamed: #map) removeAllLayers.
	ghs do: [ :aGh |
		db getObjectsIn: aGh do: [ :object |
			| marker color |
			color := object id = aUuid
				         ifTrue: [ '#e642f5' ]
				         ifFalse: [ '#4287f5' ].
			marker := (self componentNamed: #map)
				          addMarker: (object at: #coordinates)
				          with: { (#color -> color) } asJsObject.

			marker bindPopup: (object at: #id) ] ]
]

{ #category : #rendering }
CSIndexComponent >> defaultCoordinates [
	^ 48.85071003048404 @ 2.3634338378906254
]

{ #category : #rendering }
CSIndexComponent >> getCamsiteUUID [

	^ self _getLocationHash allButFirst
]

{ #category : #rendering }
CSIndexComponent >> goToGps [
	navigator geolocation getCurrentPosition: [ :position |
		| lat lng |
		lat := position coords latitude.
		lng := position coords longitude.
		(self componentNamed: #map) setView: lat @ lng ]
]

{ #category : #rendering }
CSIndexComponent >> renderHtmlOn: html [ 
	self addComponent: WCCMap new named: #map on: html.
]

{ #category : #rendering }
CSIndexComponent >> start [

	super start.
	self initializeComponentHolder.

	db := WCGeoHashHttpRetriver new baseUrl:
		      (WCUrl new addToPath: './data').

	
	(self componentNamed: #map)
		on: #moveend
		do: [ :e | self calculateCurrentSelection: self getCamsiteUUID ].

	self getCamsiteUUID isEmpty ifTrue: [ (self componentNamed: #map) setView: self defaultCoordinates. ] ifFalse: [ 
		db getObjectAtId: self getCamsiteUUID do: [ :object |
			(self componentNamed: #map) setView:
				(CampingSite fromDataModel: object) coordinates ] ]
]
