Class {
	#name : #CSCreationProcess,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#category : #CampingWebApp
}

{ #category : #rendering }
CSCreationProcess >> createFormComponent [

	^ CSUpdateForm new submission: (CSSubmission new
	type: #create;
			   campsite: CampingSite new;
			   yourself)
]

{ #category : #rendering }
CSCreationProcess >> renderHtmlOn: html [

	html div
		id: 'main';
		style: 'display: contents;';
		with: [ self addComponent: self createFormComponent named: #form on: html ]
]

{ #category : #rendering }
CSCreationProcess >> start [

	super start.
	self initializeComponentHolder.
	(self componentNamed: #form)
		addEventListener: #submitted
		block: [ :e | (self componentNamed: #form) remove.
			(self submittedComponent: e submission)  addComponentIn: (self getElementById: #main) ]
]

{ #category : #rendering }
CSCreationProcess >> submittedComponent: aSubmission [
	^ CSCreationSubmitted new submission: aSubmission. 
]
