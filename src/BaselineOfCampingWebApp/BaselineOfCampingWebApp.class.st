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

		spec baseline: 'Seaside3' with: [
			spec
				loads: #( 'Seaside-Canvas' );
				repository: 'github://SeasideSt/Seaside:master/repository' ].
		spec package: #Leafletjs with: [ spec requires: #( PharoJS ) ].
		spec
			package: #CampingWebApp
			with: [ spec requires: #( Camping Cryptography ) ] ]
]
