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

{ #category : #'initialize-release' }
CSIndexComponent >> calculate [

	| lon lat region regions  ghs |

	region := (self componentNamed: #map) getBounds.
	regions := WCGeoHash divideRegion: region.
	ghs := WCGeoHash hashesCoverRegion: region precision: 9.
	(self componentNamed: #map) removeAllLayers.
	ghs do: [ :aGh |
		db getObjectsIn: aGh do: [ :object |
			| marker |
			marker := (self componentNamed: #map) addMarker:
				          (object at: #coordinates).
			marker bindPopup: (object at: #data) ].
		 ]
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
	console log: (WCUrl new addToPath: './data') asString.

	(self componentNamed: #map)
		on: #moveend
		do: [ :e | self calculate ].
	navigator geolocation getCurrentPosition: [ :position |
		| lat lng |
		lat := position coords latitude.
		lng := position coords longitude.
		(self componentNamed: #map) setView: lat @ lng ]
]
