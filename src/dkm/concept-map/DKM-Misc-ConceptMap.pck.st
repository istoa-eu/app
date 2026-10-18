'From Cuis7.9 [latest update: #8266] on 18 October 2026 at 1:41:42 pm'!
'Description '!
!provides: 'DKM-Misc-ConceptMap' 1 10!
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
	instanceVariableNames: 'source target model'
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
TextParagraphMorph subclass: #ConceptNodeView
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

!ConceptRelationView commentStamp: '<historical>' prior: 0!
- model, a ConceptRelation insance
- source, target: ConceptNodeView instance!

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

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 17/Oct/2026, 1:01:19 pm (UTC)'!
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
	relationFrom: ''Quadrilatère'' to: ''Fer de lance'' labeled: ''concave, diagonales perpendiculaires'';
	relationFrom: ''Quadrilatère'' to: ''Cerf-volant'' labeled: ''convexe, diagonales perpendiculaires'';
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

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:03 pm (UTC)'!
description
	^ description! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:09 pm (UTC)'!
description: anObject
	description := anObject! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:15 pm (UTC)'!
label
	^ label! !

!ConceptNode methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:20 pm (UTC)'!
label: anObject
	label := anObject! !

!ConceptNode methodsFor: 'comparing' stamp: 'hlsf 17/Oct/2026, 3:28:48 pm (UTC)'!
= aNode
	^ self == aNode or: [label = aNode label]! !

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

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:24 pm (UTC)'!
label
	^ label! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:29 pm (UTC)'!
label: anObject
	label := anObject! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:34 pm (UTC)'!
source
	^ source! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:39 pm (UTC)'!
source: anObject
	source := anObject! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:43 pm (UTC)'!
target
	^ target! !

!ConceptRelation methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:47 pm (UTC)'!
target: anObject
	target := anObject! !

!ConceptMapModel methodsFor: 'queries' stamp: 'hlsf 13/Oct/2026, 7:37:59 pm (UTC)'!
relationsWithSource: aNode
	^ relations select: [:each | each source == aNode ]! !

!ConceptMapModel methodsFor: 'queries' stamp: 'hlsf 17/Oct/2026, 3:28:37 pm (UTC)'!
topNodes
"	Sort the nodes according to their occurence as source in relations
 	Top nodes should be central in the view "
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

!ConceptRelationView methodsFor: 'drawing' stamp: 'hlsf 17/Oct/2026, 3:25:30 pm (UTC)'!
drawOn: canvas
	| sourcePosition targetPosition center extent angle |
	sourcePosition := source externalize: source morphCenter.
	targetPosition := target externalize: target morphCenter.
	center := sourcePosition - targetPosition / 4.0.
	angle := center degrees. 
	extent := self externalizeDistance: 10.
	center := center + targetPosition.
	canvas line: sourcePosition to: targetPosition width: 1 color: `Color black`.
	canvas line: center to: center + (Point  r: extent degrees: angle + 30) width: 2 color: `Color black`.
	canvas line: center to: center + (Point  r: extent degrees: angle - 30) width: 2 color: `Color black`.
	center := sourcePosition + targetPosition / 2.0 .	
	extent := self externalizeDistance: ((owner labelFont widthOfString: model label) @ (owner labelFont pointSize + 5)).
	canvas 
		fillRectangle:  (center - ( extent x // 2 @ 0) extent: extent)
		color: (Color white alpha: 0.8).
	canvas 
		drawString: model label 
		atCenterX: center
		font: owner labelFont 
		color: Color blue.! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:59 pm (UTC)'!
model
	^ model! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:04 pm (UTC)'!
model: anObject
	model := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:09 pm (UTC)'!
source: anObject
	source := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:15 pm (UTC)'!
target: anObject
	target := anObject! !

!ConceptRelationView class methodsFor: 'instance creation' stamp: 'hlsf 17/Oct/2026, 12:22:30 pm (UTC)'!
source: sourceView target: targetView
	^ self new
		source: sourceView ;
		target: targetView ;
		yourself! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 15/Oct/2026, 8:20:45 pm (UTC)'!
labelFont
	^ labelFont ifNil: [
		labelFont := FontFamily familyName: FontFamily defaultFamilyName pointSize: 8]
! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 18/Oct/2026, 11:26:23 am (UTC)'!
nodeViews
	^ submorphs select: [:each | each is: #ConceptNodeView]! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 10/Oct/2026, 10:42:59 am (UTC)'!
presenter: aPresenter
	super presenter: aPresenter.
	presenter model when: #changedConceptMap send: #updateCanvas to: self.! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 17/Oct/2026, 3:27:43 pm (UTC)'!
insertTarget: nodes from: remainingNodes centeredAt: center withAperture: angleInterval
	| relations nodeToInsert nodePosition nodeAngle view |
	nodes withIndexDo: [:node :index |
		nodeToInsert := remainingNodes remove: node ifAbsent: [nil].
		nodeToInsert ifNotNil: [
			nodeAngle := angleInterval at: index.
			nodePosition := center + (Point r: 200 degrees: nodeAngle).
			view := self nodeViewFor: node at: nodePosition .
			relations := self model relationsWithSource: node.
			relations ifNotEmpty: [
				view angle:  (nodeAngle - 60 to: nodeAngle + 60 by: 120 / relations size).
				self 
					insertTarget: (relations collect: #target) 
					from: remainingNodes 
					centeredAt:  nodePosition 
					withAperture: view angle ] ] ]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 17/Oct/2026, 12:29:52 pm (UTC)'!
nodeView: aNode
	^ submorphs 
		detect: [:aMorph | (aMorph is: #ConceptNodeView) and: [aMorph model == aNode]] 
		ifNone: [nil]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 17/Oct/2026, 3:27:53 pm (UTC)'!
nodeViewFor: node at: position
" 	Create the view of this node, when it exists, return its view instance "
	| view |
	view := self nodeView: node.
	view ifNil: [
		view := ConceptNodeView contents: node label ::	
			model: node;
			setBalloonText: node balloonText .
		view morphExtent: view minimumExtent.
		self addMorph: view.
		view shrink .
		view morphCenter: position].
	^ view! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 18/Oct/2026, 11:35:42 am (UTC)'!
updateCanvas
	| topNodes node relations interval view position |
	self removeAllMorphs.
	position := extent // 2.
	topNodes := self model topNodes.
	[topNodes notEmpty] whileTrue: [
		node := topNodes removeAt: 1.
		view := self nodeViewFor: node at: position.
		relations := self model relationsWithSource: node.
		relations isEmpty ifTrue: [^ self].
		interval := 0 to: 359 by: 360 / relations size.
		view angle: interval.
		self 
			insertTarget: (relations collect: #target)
			from:  topNodes
			centeredAt:  extent // 2
			withAperture: interval.
		position := position - (200@0)	].
	self model relations do: [:relation |
		view := ConceptRelationView 
			source: (self nodeView: relation source) 
			target: (self nodeView: relation target) ::
			model: relation.
		self addMorphBack: view].
	self setExtent.! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 17/Oct/2026, 3:28:09 pm (UTC)'!
updateColor
! !

!ConceptMapCanvas methodsFor: 'drawing' stamp: 'hlsf 17/Oct/2026, 12:33:09 pm (UTC)'!
drawOn: canvas 
	canvas fillRectangle: self localBounds color: Color white! !

!ConceptMapCanvas methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 7:46:50 pm (UTC)'!
initialize
	super initialize.
	self morphExtent: 2000@2000.
	! !

!ConceptMapCanvas methodsFor: 'geometry' stamp: 'hlsf 18/Oct/2026, 11:37:40 am (UTC)'!
setExtent
	| fullbounds |
	fullbounds := self nodeViews 
		inject: (Rectangle origin: 0@0 extent: 0@0) 
		into: [:rect :node | rect merge: node fullBoundsInOwner].
	fullbounds := fullbounds expandBy: 100. 
	self morphExtent: fullbounds extent.
	self nodeViews do: [:each | each morphPosition: each morphPosition - fullbounds origin]! !

!ConceptMapView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 7:37:46 pm (UTC)'!
installView
	canvas := ConceptMapCanvas new presenter: presenter.
	self installViewWith: #(zWheel).! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:41 pm (UTC)'!
angle
	^ angle! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:47 pm (UTC)'!
angle: anObject
	angle := anObject! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:51 pm (UTC)'!
model
	^ model! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:55 pm (UTC)'!
model: anObject
	model := anObject! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 17/Oct/2026, 1:22:17 pm (UTC)'!
defaultBorderColor
	^ `Color black`! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 8:31:35 pm (UTC)'!
defaultBorderWidth
	^ 1 ! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 17/Oct/2026, 3:30:04 pm (UTC)'!
defaultColor
	^ `Color gray muchLighter`! !

!ConceptNodeView methodsFor: 'initialization' stamp: 'hlsf 17/Oct/2026, 1:22:31 pm (UTC)'!
defaultPadding
	^ `4@4`! !

!ConceptNodeView methodsFor: 'testing' stamp: 'hlsf 14/Oct/2026, 5:15:46 pm (UTC)'!
is: aSymbol
	^ aSymbol == #ConceptNodeView or: [super is: aSymbol]! !

!ConceptNodeView methodsFor: 'event handling testing' stamp: 'hlsf 17/Oct/2026, 1:47:55 pm (UTC)'!
handlesMouseDown: event
	^ true
! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 17/Oct/2026, 2:38:40 pm (UTC)'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	self removeProperty: #prevPosition! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 18/Oct/2026, 11:39:11 am (UTC)'!
mouseMove: event localPosition: localPosition
	| prevPosition newPos|
	event mouseButton1Pressed not ifTrue: [^ self ].
	newPos := self externalize: localPosition.
	prevPosition := self valueOfProperty: #prevPosition.
	prevPosition 
		ifNotNil: [self morphPosition: self morphPosition + newPos - prevPosition].
	self setProperty: #prevPosition toValue: newPos.	
	owner setExtent;
		redrawNeeded ! !
