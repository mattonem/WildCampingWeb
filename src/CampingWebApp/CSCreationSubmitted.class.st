Class {
	#name : #CSCreationSubmitted,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#instVars : [
		'submission'
	],
	#category : #CampingWebApp
}

{ #category : #rendering }
CSCreationSubmitted >> renderHtmlOn: html [

	html image url: (self urlForRessourceNamed: #'check-circle-svgrepo-com.svg').
	
	html heading
		level: 1;
		id: #main;
		with: 'Thanks for your contribution'.
	html paragraph with: 'Your contribution id is: '.
	html preformatted with: submission id asString.
	html paragraph with:
		'Your contribution has been submitted. It will be reviewed very shortly.'.
	html paragraph with:
		'You can email <nil>, refering you contribution id, if you have any further query regarding this contribution.'
]

{ #category : #rendering }
CSCreationSubmitted >> submission:anObject [
submission := anObject
]

{ #category : #rendering }
CSCreationSubmitted >> urlForRessourceNamed: aRessourceName [

	^ './ressources/', aRessourceName
]
