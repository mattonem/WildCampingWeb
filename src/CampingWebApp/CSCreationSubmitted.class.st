Class {
	#name : #CSCreationSubmitted,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#instVars : [
		'submission'
	],
	#classInstVars : [
		'staticComponents',
		'ressourcePrefix'
	],
	#category : #CampingWebApp
}

{ #category : #accessing }
CSCreationSubmitted class >> getRessourcePrefix [

	<javascript: 'return this.pj_getSerializePrefix()'>
	^ '.'
]

{ #category : #accessing }
CSCreationSubmitted class >> getSerializePrefix [

	
	<jsLiteralGenerator>
	^ ressourcePrefix 
]

{ #category : #accessing }
CSCreationSubmitted class >> ressourcePrefix [

	^ ressourcePrefix ifNil: [ ressourcePrefix := self getRessourcePrefix ]
]

{ #category : #accessing }
CSCreationSubmitted class >> ressourcePrefix: anObject [

	ressourcePrefix := anObject
]

{ #category : #rendering }
CSCreationSubmitted >> renderHtmlOn: html [

	html image
		url: (self urlForRessourceNamed: #'check-circle.svg');
		style: 'max-width: 200px;'.

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

	console log: self class ressourcePrefix.
	^ self class ressourcePrefix , '/ressources/' , aRessourceName
]
