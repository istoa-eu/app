'From Cuis7.9 [latest update: #8266] on 10 October 2026 at 1:25:25 pm'!
'Description '!
!provides: 'DKM-Misc-ConceptMap' 1 2!
!requires: 'DKM-Core' 1 18 nil!
SystemOrganization addCategory: #'DKM-Misc-ConceptMap'!


!classDefinition: #ConceptMap category: #'DKM-Misc-ConceptMap'!
DKMCanvasPresenter subclass: #ConceptMap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptMap class' category: #'DKM-Misc-ConceptMap'!
ConceptMap class
	instanceVariableNames: ''!

!classDefinition: #ConceptNode category: #'DKM-Misc-ConceptMap'!
Object subclass: #ConceptNode
	instanceVariableNames: 'label description'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptNode class' category: #'DKM-Misc-ConceptMap'!
ConceptNode class
	instanceVariableNames: ''!

!classDefinition: #ConceptRelation category: #'DKM-Misc-ConceptMap'!
Object subclass: #ConceptRelation
	instanceVariableNames: 'source target label'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptRelation class' category: #'DKM-Misc-ConceptMap'!
ConceptRelation class
	instanceVariableNames: ''!

!classDefinition: #ConceptMapModel category: #'DKM-Misc-ConceptMap'!
DKMCanvasModel subclass: #ConceptMapModel
	instanceVariableNames: 'nodes relations'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptMapModel class' category: #'DKM-Misc-ConceptMap'!
ConceptMapModel class
	instanceVariableNames: ''!

!classDefinition: #ConceptMapCanvas category: #'DKM-Misc-ConceptMap'!
DKMCanvas subclass: #ConceptMapCanvas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptMapCanvas class' category: #'DKM-Misc-ConceptMap'!
ConceptMapCanvas class
	instanceVariableNames: ''!

!classDefinition: #ConceptMapView category: #'DKM-Misc-ConceptMap'!
DKMCanvasView subclass: #ConceptMapView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptMapView class' category: #'DKM-Misc-ConceptMap'!
ConceptMapView class
	instanceVariableNames: ''!


!ConceptNode commentStamp: '<historical>' prior: 0!
- label, a string, title of the node
- description, an optional string describing the node!

!ConceptRelation commentStamp: '<historical>' prior: 0!
- source, the source node
- target, the target node
- label, an optional string, to name the relation
!

!ConceptMapModel commentStamp: '<historical>' prior: 0!
The model with:
- nodes, a collection of node model
- relations, a collection of relation model between two nodes!

!ConceptMap methodsFor: 'DSL' stamp: 'hlsf 10/Oct/2026, 10:28:56 am (UTC)'!
concept: aString description: descText
	| node |
	node := ConceptNode label: aString description: descText.
	^ model addNode: node! !

!ConceptMap methodsFor: 'DSL' stamp: 'hlsf 10/Oct/2026, 10:30:01 am (UTC)'!
relationFrom: sourceLabel to: targetLabel
	^ self relationFrom: sourceLabel to: targetLabel labeled: nil! !

!ConceptMap methodsFor: 'DSL' stamp: 'hlsf 10/Oct/2026, 10:29:35 am (UTC)'!
relationFrom: sourceLabel to: targetLabel labeled: relationLabel
	| relation |
	relation := ConceptRelation new
		source: (model node: sourceLabel) ;
		target: (model node: targetLabel) ;
		label: relationLabel.
	^ model addRelation: relation! !

!ConceptMap methodsFor: 'as yet unclassified' stamp: 'hlsf 10/Oct/2026, 10:40:21 am (UTC)'!
initialize
	super initialize.
	model := ConceptMapModel new.
	view := ConceptMapView presenter: self! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 10/Oct/2026, 10:39:29 am (UTC)'!
codeSample
	^ 'ConceptMap title: ''Photosynthesis'' ::
	concept: ''Light'' description: ''Solar energy source'';
	concept: ''Chloroplasts'' description: ''Cellular organelle'';
	concept: ''Glucose'' description: ''Energy storage molecule'';
	relationFrom: ''Light'' to: ''Chloroplasts'' labeled: ''drives'';
	relationFrom: ''Chloroplasts'' to: ''Glucose'' labeled: ''produces'';
	color: Color blue;
	view'! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 10/Oct/2026, 9:57:20 am (UTC)'!
description
	^ 'Visualize relationships between concepts, ideas, and scientific processes.' translated! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 10/Oct/2026, 9:15:10 am (UTC)'!
title
	^ 'Concept map' translated! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:02:56 am (UTC)'!
description
	"Answer the value of description"

	^ description! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:02:56 am (UTC)'!
description: anObject
	"Set the value of description"

	description := anObject! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:02:56 am (UTC)'!
label
	"Answer the value of label"

	^ label! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:02:56 am (UTC)'!
label: anObject
	"Set the value of label"

	label := anObject! !

!ConceptNode methodsFor: 'comparing' stamp: 'hlsf 10/Oct/2026, 10:19:05 am (UTC)'!
= aNode
	^ self == aNode
	or: [label = aNode label]! !

!ConceptNode methodsFor: 'comparing' stamp: 'hlsf 10/Oct/2026, 10:13:38 am (UTC)'!
hash
	^ label hash! !

!ConceptNode class methodsFor: 'instance creation' stamp: 'hlsf 10/Oct/2026, 10:00:42 am (UTC)'!
label: aString description: aText
	^ self new
		label: aString;
		description: aText;
		yourself! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
label
	"Answer the value of label"

	^ label! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
label: anObject
	"Set the value of label"

	label := anObject! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
source
	"Answer the value of source"

	^ source! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
source: anObject
	"Set the value of source"

	source := anObject! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
target
	"Answer the value of target"

	^ target! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:20:02 am (UTC)'!
target: anObject
	"Set the value of target"

	target := anObject! !

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:24:18 am (UTC)'!
addNode: aNode
	nodes add: aNode.
	self triggerEvent: #changedConceptMap.
	^ aNode! !

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:24:12 am (UTC)'!
addRelation: aRelation
	relations add: aRelation.
	self triggerEvent: #changedConceptMap.
	^ aRelation ! !

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:27:08 am (UTC)'!
node: aNodeLabel
	^ nodes detect: [:each | each label = aNodeLabel ]! !

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:21:34 am (UTC)'!
nodes
	^ nodes! !

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:21:39 am (UTC)'!
relations
	^ relations ! !

!ConceptMapModel methodsFor: 'initialization' stamp: 'hlsf 10/Oct/2026, 10:21:12 am (UTC)'!
initialize 
	super initialize.
	nodes := Set new.
	relations := OrderedCollection new.! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:42:59 am (UTC)'!
presenter: aPresenter
	super presenter: aPresenter.
	presenter model when: #changedConceptMap send: #updateCanvas to: self.! !

!ConceptMapView methodsFor: 'as yet unclassified' stamp: 'hlsf 10/Oct/2026, 11:10:18 am (UTC)'!
installView
! !
