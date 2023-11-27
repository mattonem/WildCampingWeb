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

	html preformatted  with: submission id asString
]

{ #category : #rendering }
CSCreationSubmitted >> submission:anObject [
submission := anObject
]
