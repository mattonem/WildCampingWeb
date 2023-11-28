Class {
	#name : #CSUpdateForm,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#instVars : [
		'campsite'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CSUpdateForm >> campsite [

	^ campsite
]

{ #category : #accessing }
CSUpdateForm >> campsite: anObject [

	campsite := anObject
]

{ #category : #rendering }
CSUpdateForm >> key [
	"
	| k key d |
	k := 'key' asByteArray.
	key := #( 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23
	          16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67
	          16r89 16rAB 16rCD 16rEF ) asByteArray.
	d := TripleDES key: key.
	(d encryptBlock: k).
	(String streamContents: [:s | k do: [:each | s << each hex asString] separatedBy: [s << ' ']]) .	
"

	<jsLiteralGenerator>
	| s key d |
	s := #( 16r6A 16rA4 16r9F 16rA2 16r18 16r5B 16r7F 16rB6 16r72 16r6C
	        16r69 16r7A 16r79 16r54 16r78 16r56 16r72 16r4C 16r43 16r32
	        16r68 16r45 ) asByteArray.
	key := #( 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23
	          16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67
	          16r89 16rAB 16rCD 16rEF ) asByteArray.
	d := TripleDES key: key.
	d decryptBlock: s.
	^ s asString
]

{ #category : #rendering }
CSUpdateForm >> renderHtmlOn: html [

	self addComponent: WCCMap new named: #map on: html.
	html div
		class: 'form-group';
		with: [
			html label
				for: 'name';
				with: 'Campsite name'.
			html textInput
				class: 'form-control';
				placeholder: 'An awesome campsite';
				id: 'name' ].
	html div
		class: 'form-group';
		with: [
			html label
				for: 'lat';
				with: 'Latitude'.
			html textInput
				class: 'form-control';
				placeholder: '0';
				id: 'lat'.
			html label
				for: 'lng';
				with: 'Longitude'.
			html textInput
				class: 'form-control';
				placeholder: '0';
				id: 'lng' ].
	html div
		class: 'form-group';
		with: [
			html label
				for: 'description';
				with: 'Description'.
			html textArea
				class: 'form-control';
				id: #description;
				rows: 5;
				with: '' ].
	html div
		class: 'form-group';
		with: [
			html label
				for: 'name';
				with: 'Your email address'.
			html textInput
				class: 'form-control';
				placeholder: '';
				id: 'email' ].
	self
		addComponent: (WCCButton new
				 label: 'submit';
				 yourself)
		named: #submit
		on: html
]

{ #category : #rendering }
CSUpdateForm >> sendSubmission [

	| event submission |
	(self componentNamed: #submit) disable.
	submission := CSSubmission new
		              type: #post;
		              campsite: (campsite
				               name: (self getElementById: #name) value;
				               description:
					               (self getElementById: #description) value;
				               coordinates:
					               (self getElementById: #lat) value asNumber
					               @ (self getElementById: #lng) value asNumber;
				               yourself).
	submission email: (self getElementById: #email) value.
	PjHttpClient new
		getUrl:
			'https://maker.ifttt.com/trigger/WCContrib/with/key/' , self key
			, '?value1=' , submission asPhxJsonString
		do: [
			event := Event new: 'submitted'.
			event js_at: #submission put: submission.
			self dispatchEvent: event ]
]

{ #category : #rendering }
CSUpdateForm >> start [

	super start.
	self initializeComponentHolder.

	navigator geolocation getCurrentPosition: [ :position |
		| lat lng marker |
		lat := position coords latitude.
		lng := position coords longitude.
		(self componentNamed: #map) setView: lat @ lng.
		marker := (self componentNamed: #map)
			          addMarker: (self componentNamed: #map) center
			          with: { (#draggable -> true) } asJsObject.
		self updateCoordinate: marker.
		(self componentNamed: #map)
			on: 'contextmenu'
			do: [ :e |
				marker setLatLng: e latlng.
				self updateCoordinate: marker ].
		marker
			on: 'drag'
			do: [ :e | self updateCoordinate: marker ] ].
	(self componentNamed: #submit) onClick: [ :e | self sendSubmission ]
]

{ #category : #rendering }
CSUpdateForm >> updateCoordinate: marker [

	| markerPos |
	markerPos := marker getLatLng.
	(self getElementById: #lng) value: markerPos lng asString.
	^ (self getElementById: #lat) value: markerPos lat asString
]
