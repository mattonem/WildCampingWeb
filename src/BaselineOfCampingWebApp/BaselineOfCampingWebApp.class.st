Class {
	#name : #BaselineOfCampingWebApp,
	#superclass : #BaselineOf,
	#category : #BaselineOfCampingWebApp
}

{ #category : #baselines }
BaselineOfCampingWebApp >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Cryptography'
			with: [
			spec repository: 'github://pharo-contributions/Cryptography' ].
		spec
			baseline: 'Camping'
			with: [ spec repository: 'github://mattonem/WildCamping' ].
			spec
			baseline: 'PjHttpClient'
			with: [ spec repository: 'github://mattonem/RestClientApp:master' ].
		spec
			package: #CampingWebApp
			with: [ spec requires: #( Camping Cryptography PjHttpClient ) ] ]
]
