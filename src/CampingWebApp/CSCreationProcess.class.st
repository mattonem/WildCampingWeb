Class {
	#name : #CSCreationProcess,
	#superclass : #WCComponent,
	#traits : 'InstanceComponentHolder',
	#classTraits : 'InstanceComponentHolder classTrait',
	#category : #CampingWebApp
}

{ #category : #rendering }
CSCreationProcess >> renderHtmlOn: html [

	html div
		id: 'main';
		style: 'display: contents;';
		with: [ self addComponent: (CSCreationForm new) named: #form on: html  ]
]

{ #category : #rendering }
CSCreationProcess >> start [

	super start.
	self initializeComponentHolder.
	(self componentNamed: #form)
		addEventListener: #submitted
		block: [ :e |
			self
				addComponent: (CSCreationSubmitted new
						 submission: (e js_at: #submission);
						 yourself)
				in: (self getElementById: #main) ]
]
