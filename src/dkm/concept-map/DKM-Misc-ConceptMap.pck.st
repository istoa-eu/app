'From Cuis7.9 [latest update: #8266] on 15 October 2026 at 10:22:52 pm'!
'Description '!
!provides: 'DKM-Misc-ConceptMap' 1 7!
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

!classDefinition: #ConceptRelationView category: #'DKM-Misc-ConceptMap'!
Morph subclass: #ConceptRelationView
	instanceVariableNames: 'start end model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptRelationView class' category: #'DKM-Misc-ConceptMap'!
ConceptRelationView class
	instanceVariableNames: ''!

!classDefinition: #ConceptMapCanvas category: #'DKM-Misc-ConceptMap'!
DKMCanvas subclass: #ConceptMapCanvas
	instanceVariableNames: 'labelFont'
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

!classDefinition: #ConceptNodeView category: #'DKM-Misc-ConceptMap'!
SqueezeLabelMorph subclass: #ConceptNodeView
	instanceVariableNames: 'model angle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptNodeView class' category: #'DKM-Misc-ConceptMap'!
ConceptNodeView class
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

!ConceptNodeView commentStamp: '<historical>' prior: 0!
A view of a node in the map.
- model, a ConceptNode instance
- angle, the angle as seen from my top node 
(the one I am a target and ranked highter as topNode, 
see ConcepMapModel>topNodes)!

!ConceptMap methodsFor: 'DSL' stamp: 'hlsf 15/Oct/2026, 7:46:12 pm (UTC)'!
concept: aString
	^ self concept: aString description: nil! !

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

!ConceptMap methodsFor: 'initialization' stamp: 'hlsf 10/Oct/2026, 10:40:21 am (UTC)'!
initialize
	super initialize.
	model := ConceptMapModel new.
	view := ConceptMapView presenter: self! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 15/Oct/2026, 8:02:01 pm (UTC)'!
codeSample
	^ 'ConceptMap title: ''Les quadrilatères'' ::
	concept: ''Quadrilatère'' description: ''Quadrilatère quelconque'';
	concept: ''Parallélogramme'' description: ''Quadrilatère dont les côtés opposés sont parallèles et isométriques. Ses diagonales se coupent en leur milieu.'';
	concept: ''Losange'' description: ''Quadrilatère dont les côtés opposés sont parallèles, ses quatres côtés sont isométriques. Ses diagonales se coupent en leur milieu et sont perpendiculaires.'';
	concept: ''Rectangle'' description: ''Quadrilatère dont les côtés opposés sont parallèles, les angles de ses quatre sommets sont droits. Ses diagonales se coupent en leur milieu et sont isométriques.'';
	concept: ''Carré'' description: ''Quadrilatère dont les côtés opposés sont parallèles, ses quatres côtés sont isométriques et les angles de ses quatre sommets sont droits. Ses diagonales se coupent en leur milieu perpendiculairement et sont isométriques.'';
	concept: ''Fer de lance'';
	concept: ''Cerf-volant'';
	relationFrom: ''Quadrilatère'' to: ''Parallélogramme'' labeled: ''côtés opposés parallèles'';
	relationFrom: ''Quadrilatère'' to: ''Fer de lance'' labeled: ''concave et diagonale perpendiculaire'';
	relationFrom: ''Quadrilatère'' to: ''Cerf-volant'' labeled: ''convexe et diagonale perpendiculaire'';
	relationFrom: ''Parallélogramme'' to: ''Rectangle'' labeled: ''quatre angles droits'';
	relationFrom: ''Parallélogramme'' to: ''Losange'' labeled: ''côtés isométriques'';
	relationFrom: ''Losange'' to: ''Carré'' labeled: ''quatre angles droits'';
	relationFrom: ''Rectangle'' to: ''Carré'' labeled: ''côtés isométriques'';
	color: Color blue;
	view'! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 15/Oct/2026, 7:44:53 pm (UTC)'!
codeSample2
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

!ConceptNode methodsFor: 'printing' stamp: 'hlsf 15/Oct/2026, 7:54:23 pm (UTC)'!
balloonText
	^ Text streamContents: [:str |
		str nextPutAll: label bold;
			nextPut: Character lf.
			description ifNotNil: [str nextPutAll: description justified italic] ]! !

!ConceptNode methodsFor: 'printing' stamp: 'hlsf 14/Oct/2026, 7:56:18 pm (UTC)'!
printOn: stream
	stream nextPutAll: label! !

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

!ConceptMapModel methodsFor: 'queries' stamp: 'hlsf 13/Oct/2026, 7:37:59 pm (UTC)'!
relationsWithSource: aNode
	^ relations select: [:each | each source == aNode ]! !

!ConceptMapModel methodsFor: 'queries' stamp: 'hlsf 14/Oct/2026, 7:38:38 pm (UTC)'!
topNodes
"	Sort the nodes according to their occurence as source in relations
 	Top nodes should be central in the view
"
	^ nodes asOrderedCollection sort: [:nodeA :nodeB | 
		(self relationsWithSource: nodeA) size > (self relationsWithSource: nodeB) size]! !

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

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:20:13 pm (UTC)'!
drawOn: canvas
	canvas line: start to: end width: 1 color: `Color black`.
	canvas drawString: model label atCenterX: start + end / 2.0 font: owner labelFont color: Color blue! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:15:21 pm (UTC)'!
end: anObject
	"Set the value of end"

	end := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:15:21 pm (UTC)'!
model: anObject
	"Set the value of model"

	model := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:15:21 pm (UTC)'!
start: anObject
	"Set the value of start"

	start := anObject! !

!ConceptRelationView class methodsFor: 'as yet unclassified' stamp: 'hlsf 15/Oct/2026, 8:16:16 pm (UTC)'!
start: point1 end: point2
	^ self new
		start: point1;
		end: point2;
		yourself ! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:20:45 pm (UTC)'!
labelFont
	^ labelFont ifNil: [
		labelFont := FontFamily familyName: FontFamily defaultFamilyName pointSize: 8]
! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:42:59 am (UTC)'!
presenter: aPresenter
	super presenter: aPresenter.
	presenter model when: #changedConceptMap send: #updateCanvas to: self.! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 15/Oct/2026, 7:55:12 pm (UTC)'!
insertTarget: nodes from: remainingNodes centeredAt: center withAperture: angleInterval
	| relations nodeToInsert nodePosition nodeAngle view |

	nodes withIndexDo: [:node :index |
		nodeToInsert := remainingNodes remove: node ifAbsent: [nil].
		nodeToInsert ifNotNil: [
			nodeAngle := angleInterval at: index.
			nodePosition := center + (Point r: 200 degrees: nodeAngle).
			view := self viewFor: node at: nodePosition .
			
			relations := self model relationsWithSource: node.
			relations ifNotEmpty: [
				view angle:  (nodeAngle - 60 to: nodeAngle + 60 by: 120 / relations size).
				self 
					insertTarget: (relations collect: #target) 
					from: remainingNodes 
					centeredAt:  nodePosition 
					withAperture: view angle ] ] ]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 15/Oct/2026, 7:55:02 pm (UTC)'!
updateCanvas
	| topNodes node relations interval view position |
	self removeAllMorphs.
	position := extent // 2.
	topNodes := self model topNodes.
	[topNodes notEmpty] whileTrue: [
		node := topNodes removeAt: 1.
		view := self viewFor: node at: position.
		relations := self model relationsWithSource: node.
		relations isEmpty ifTrue: [^ self].
		interval := 0 to: 359 by: 360 / relations size.
		view angle: interval.
		self 
			insertTarget: (relations collect: #target)
			from:  topNodes
			centeredAt:  extent // 2
			withAperture: interval.
		position := position - (200@0).
	]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 14/Oct/2026, 8:39:59 pm (UTC)'!
updateColor
"	submorphs 
		select: [:each | each is: #ConceptNodeView] 
		thenDo: [:nodeView  | nodeView borderColor: self color]"! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 14/Oct/2026, 8:32:41 pm (UTC)'!
viewFor: aNode at: position
" 	Return the view of this nodes, 
	When it does not exist, create it and add it to the canvas "
	| view |
	view := self viewOf: aNode.
	view ifNil: [
		view := ConceptNodeView contents: aNode label ::	
			setBalloonText: aNode balloonText .
		view morphExtent: view minimumExtent.
		self addMorph: view.
		view morphCenter: position].
	^ view! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 14/Oct/2026, 8:13:53 pm (UTC)'!
viewOf: aNode
	^ submorphs 
		detect: [:aMorph | (aMorph is: #ConceptNodeView) and: [aMorph model == aNode]] 
		ifNone: [nil]! !

!ConceptMapCanvas methodsFor: 'drawing' stamp: 'hlsf 15/Oct/2026, 8:09:05 pm (UTC)'!
drawOn: canvas 
	canvas fillRectangle: self localBounds color: Color white.
	self model relations do: [:relation |
		canvas 
			line: (self viewOf: relation source) morphCenter
			to:  (self viewOf: relation target ) morphCenter
			width:  1
			color: Color black
		]! !

!ConceptMapCanvas methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 7:46:50 pm (UTC)'!
initialize
	super initialize.
	self morphExtent: 2000@2000.
	! !

!ConceptMapView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 7:37:46 pm (UTC)'!
installView
	canvas := ConceptMapCanvas new presenter: presenter.
	self installViewWith: #(zWheel).! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 13/Oct/2026, 8:20:14 pm (UTC)'!
angle
	"Answer the value of angle"

	^ angle! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 13/Oct/2026, 8:20:14 pm (UTC)'!
angle: anObject
	"Set the value of angle"

	angle := anObject! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 13/Oct/2026, 8:20:14 pm (UTC)'!
model
	"Answer the value of model"

	^ model! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 13/Oct/2026, 8:20:14 pm (UTC)'!
model: anObject
	"Set the value of model"

	model := anObject! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 8:37:54 pm (UTC)'!
defaultBorderColor
	^ Color red! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 8:31:35 pm (UTC)'!
defaultBorderWidth
	^ 1 ! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 8:33:20 pm (UTC)'!
defaultPadding
	^ 2@2 ! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 8:38:19 pm (UTC)'!
initialize
	super initialize.
	self minCharsToShow: 20.
	self borderColor: self defaultBorderColor ! !

!ConceptNodeView methodsFor: 'testing' stamp: 'hlsf 14/Oct/2026, 5:15:46 pm (UTC)'!
is: aSymbol
	^ aSymbol == #ConceptNodeView or: [super is: aSymbol]! !
