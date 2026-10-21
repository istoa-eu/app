'From Cuis7.9 [latest update: #8276] on 21 October 2026 at 7:01:16 pm'!
'Description '!
!provides: 'DKM-Misc-ConceptMap' '1.15.0'!
!requires: 'DKM-Core' '1.18.0' '1.*.*'!
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
	instanceVariableNames: 'source target model width'
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
	instanceVariableNames: 'model'
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
- model, a ConceptNode instance!

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

!ConceptMap methodsFor: 'as yet unclassified' stamp: 'hlsf 20/Oct/2026, 8:57:17 pm (UTC)'!
openView
	view canvas updateCanvas.
	^ self view! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 20/Oct/2026, 9:00:45 pm (UTC)'!
codeSample
	^ 'ConceptMap title: ''Les quadrilatères'' ::
	concept: ''Quadrilatère'' description: ''Quadrilatère quelconque'';
	concept: ''Parallélogramme'' description: ''Quadrilatère dont les côtés opposés sont parallèles et isométriques. Ses diagonales se coupent en leur milieu.'';
	concept: ''Losange'' description: ''Quadrilatère dont les côtés opposés sont parallèles, ses quatres côtés sont isométriques. Ses diagonales se coupent en leur milieu et sont perpendiculaires.'';
	concept: ''Rectangle'' description: ''Quadrilatère dont les côtés opposés sont parallèles, les angles de ses quatre sommets sont droits. Ses diagonales se coupent en leur milieu et sont isométriques.'';
	concept: ''Carré'' description: ''Quadrilatère dont les côtés opposés sont parallèles, ses quatres côtés sont isométriques et les angles de ses quatre sommets sont droits. Ses diagonales se coupent en leur milieu perpendiculairement et sont isométriques.'';
	concept: ''Fer de lance''  description: ''concave, diagonales perpendiculaires'';
	concept: ''Cerf-volant'';
	relationFrom: ''Quadrilatère'' to: ''Parallélogramme'' labeled: ''côtés opposés parallèles'';
	relationFrom: ''Quadrilatère'' to: ''Fer de lance'';
	relationFrom: ''Quadrilatère'' to: ''Cerf-volant'' labeled: ''convexe, diagonales perpendiculaires'';
	relationFrom: ''Parallélogramme'' to: ''Rectangle'' labeled: ''quatre angles droits'';
	relationFrom: ''Parallélogramme'' to: ''Losange'' labeled: ''côtés isométriques'';
	relationFrom: ''Losange'' to: ''Carré'' labeled: ''quatre angles droits'';
	relationFrom: ''Rectangle'' to: ''Carré'' labeled: ''côtés isométriques'';
	color: Color blue;
	openView'! !

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

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 20/Oct/2026, 8:53:52 pm (UTC)'!
codeSample3
	^ 'ConceptMap title: ''Chronologie des 20 grandes batailles d''''Alexandre le Grand'' ::
    concept: ''Bataille de Chéronée (338 av. J.-C.)'' description: ''Victoire décisive de Philippe II et du jeune Alexandre contre la coalition grecque (Athènes et Thèbes).'';
    concept: ''Campagne des Balkans (335 av. J.-C.)'' description: ''Expédition au nord de la Macédoine contre les Thraces, Triballes et Illyriens pour sécuriser les frontières.'';
    concept: ''Siège de Thèbes (335 av. J.-C.)'' description: ''Saccage et destruction de la cité de Thèbes révoltée avant de partir en Asie.'';
    concept: ''Bataille du Granique (334 av. J.-C.)'' description: ''Première victoire majeure contre les satrapes perses en Asie Mineure.'';
    concept: ''Siège de Milet (334 av. J.-C.)'' description: ''Prise de la cité ionienne et dissolution temporaire de la flotte macédonienne.'';
    concept: ''Siège d''''Halicarnasse (334 av. J.-C.)'' description: ''Siège complexe contre les forces perses et le mercenaire Memnon de Rhodes.'';
    concept: ''Bataille d''''Issos (333 av. J.-C.)'' description: ''Premier affrontement direct contre Darius III en Cilicie, fuite du roi perse.'';
    concept: ''Siège de Tyr (332 av. J.-C.)'' description: ''Siège de 7 mois d''''une cité insulaire phénicienne grâce à la construction d''''une digue.'';
    concept: ''Siège de Gaza (332 av. J.-C.)'' description: ''Prise de la forteresse clé ouvrant l''''accès direct à l''''Égypte.'';
    concept: ''Bataille de Gaugamèles (331 av. J.-C.)'' description: ''Victoire tactique magistrale détruisant définitivement l''''empire achéménide de Darius III.'';
    concept: ''Bataille des Portes Persiques (330 av. J.-C.)'' description: ''Passage forcé des gorges défendues par Ariobarzane pour atteindre Persépolis.'';
    concept: ''Bataille du Polytimète (328 av. J.-C.)'' description: ''Seul revers macédonien de la campagne, venge plus tard par Alexandre contre Spitamenès.'';
    concept: ''Siège de la Roche Sogdienne (327 av. J.-C.)'' description: ''Prise d''''une forteresse réputée inexpugnable grâce à des escaladeurs d''''élite.'';
    concept: ''Siège d''''Aornos (327 av. J.-C.)'' description: ''Capture d''''un piton rocheux mythique dans le nord de l''''Inde.'';
    concept: ''Siège de Massaga (327 av. J.-C.)'' description: ''Victoire difficile contre les Assakéniens au début de la campagne indienne.'';
    concept: ''Bataille de l''''Hydaspe (326 av. J.-C.)'' description: ''Affrontement majeur contre le roi Poros et ses éléphants de guerre dans le Pendjab.'';
    concept: ''Siège de Sangala (326 av. J.-C.)'' description: ''Dernière grande bataille rangée en Inde contre les Cathéens.'';
    concept: ''Campagne contre les Malliens (326 av. J.-C.)'' description: ''Siège d''''une ville indienne où Alexandre est grièvement blessé par une flèche au poumon.'';
    concept: ''Conquête de la vallée de l''''Indus (325 av. J.-C.)'' description: ''Soumission des peuples du sud de l''''Indus jusqu''''à l''''océan Indien.'';
    concept: ''Traversée du désert de Gédrosie (325 av. J.-C.)'' description: ''Retraite éprouvante de l''''armée macédonienne vers la Perse.'';

    relationFrom: ''Bataille de Chéronée (338 av. J.-C.)'' to: ''Campagne des Balkans (335 av. J.-C.)'' labeled: ''Sacre d''''Alexandre (336)'';
    relationFrom: ''Campagne des Balkans (335 av. J.-C.)'' to: ''Siège de Thèbes (335 av. J.-C.)'' labeled: ''Révolte en Grèce'';
    relationFrom: ''Siège de Thèbes (335 av. J.-C.)'' to: ''Bataille du Granique (334 av. J.-C.)'' labeled: ''Invasion de la Perse'';
    relationFrom: ''Bataille du Granique (334 av. J.-C.)'' to: ''Siège de Milet (334 av. J.-C.)'' labeled: ''Avancée en Ionie'';
    relationFrom: ''Siège de Milet (334 av. J.-C.)'' to: ''Siège d''''Halicarnasse (334 av. J.-C.)'' labeled: ''Campagne de Carie'';
    relationFrom: ''Siège d''''Halicarnasse (334 av. J.-C.)'' to: ''Bataille d''''Issos (333 av. J.-C.)'' labeled: ''Marche vers la Cilicie'';
    relationFrom: ''Bataille d''''Issos (333 av. J.-C.)'' to: ''Siège de Tyr (332 av. J.-C.)'' labeled: ''Sécurisation de la côte'';
    relationFrom: ''Siège de Tyr (332 av. J.-C.)'' to: ''Siège de Gaza (332 av. J.-C.)'' labeled: ''Route de l''''Égypte'';
    relationFrom: ''Siège de Gaza (332 av. J.-C.)'' to: ''Bataille de Gaugamèles (331 av. J.-C.)'' labeled: ''Marche vers la Mésopotamie'';
    relationFrom: ''Bataille de Gaugamèles (331 av. J.-C.)'' to: ''Bataille des Portes Persiques (330 av. J.-C.)'' labeled: ''Route de Persépolis'';
    relationFrom: ''Bataille des Portes Persiques (330 av. J.-C.)'' to: ''Bataille du Polytimète (328 av. J.-C.)'' labeled: ''Poursuite en Sogdiane'';
    relationFrom: ''Bataille du Polytimète (328 av. J.-C.)'' to: ''Siège de la Roche Sogdienne (327 av. J.-C.)'' labeled: ''Pacification de l''''Asie Centrale'';
    relationFrom: ''Siège de la Roche Sogdienne (327 av. J.-C.)'' to: ''Siège de Massaga (327 av. J.-C.)'' labeled: ''Début de l''''Invasion de l''''Inde'';
    relationFrom: ''Siège de Massaga (327 av. J.-C.)'' to: ''Siège d''''Aornos (327 av. J.-C.)'' labeled: ''Poursuite de la campagne indienne'';
    relationFrom: ''Siège d''''Aornos (327 av. J.-C.)'' to: ''Bataille de l''''Hydaspe (326 av. J.-C.)'' labeled: ''Traversée de l''''Indus'';
    relationFrom: ''Bataille de l''''Hydaspe (326 av. J.-C.)'' to: ''Siège de Sangala (326 av. J.-C.)'' labeled: ''Progression vers l''''Est'';
    relationFrom: ''Siège de Sangala (326 av. J.-C.)'' to: ''Campagne contre les Malliens (326 av. J.-C.)'' labeled: ''Mutinerie sur l''''Hyphase & descente'';
    relationFrom: ''Campagne contre les Malliens (326 av. J.-C.)'' to: ''Conquête de la vallée de l''''Indus (325 av. J.-C.)'' labeled: ''Descente du fleuve Indus'';
    relationFrom: ''Conquête de la vallée de l''''Indus (325 av. J.-C.)'' to: ''Traversée du désert de Gédrosie (325 av. J.-C.)'' labeled: ''Retour vers Babylone'';
    color: Color red;
    openView'! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 10/Oct/2026, 9:57:20 am (UTC)'!
description
	^ 'Visualize relationships between concepts, ideas, and scientific processes.' translated! !

!ConceptMap class methodsFor: 'DKM' stamp: 'hlsf 18/Oct/2026, 2:13:58 pm (UTC)'!
svgIcon
	^ '<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><g><rect fill="none" height="24" width="24"/></g><g><polygon points="15,16 15,17.26 9,14.26 9,11.09 11.7,8 16,8 16,2 10,2 10,6.9 7.3,10 3,10 3,16 8,16 15,19.5 15,22 21,22 21,16"/></g></svg>'! !

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

!ConceptMapModel methodsFor: 'accessing' stamp: 'hlsf 20/Oct/2026, 8:54:30 pm (UTC)'!
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

!ConceptRelationView methodsFor: 'drawing' stamp: 'hlsf 21/Oct/2026, 4:56:18 pm (UTC)'!
drawOn: canvas
	| sourcePosition targetPosition center extent angle color |
	color := owner color.
	sourcePosition := source externalize: source morphCenter.
	targetPosition := target externalize: target morphCenter.
	center := sourcePosition - targetPosition / 3.0.
	angle := center degrees. 
	extent := self externalizeDistance: 10.
	center := center + targetPosition.
	canvas line: sourcePosition to: targetPosition width: self width color: color.
	canvas line: center to: center + (Point  r: extent degrees: angle + 30) width: 2 + self width color: color.
	canvas line: center to: center + (Point  r: extent degrees: angle - 30) width: 2 + self width color: color.
	model label ifNotNil: [:label |
		center := sourcePosition + targetPosition / 2.0 .	
		extent := self externalizeDistance: (
			(owner labelFont widthOfString: label) @ (owner labelFont pointSize + 5)).
		canvas 
			fillRectangle:  (center - ( extent x // 2 @ 0) extent: extent)
			color: (Color white alpha: 0.8).
		canvas 
			drawString: label 
			atCenterX: center
			font: owner labelFont 
			color: `Color black`]! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:30:59 pm (UTC)'!
model
	^ model! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:04 pm (UTC)'!
model: anObject
	model := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 4:27:01 pm (UTC)'!
source
	^ source! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:09 pm (UTC)'!
source: anObject
	source := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:31:15 pm (UTC)'!
target: anObject
	target := anObject! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 3:33:26 pm (UTC)'!
width
	^ width ifNil: [width := 1]! !

!ConceptRelationView methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 4:30:12 pm (UTC)'!
width: integer
	 width := integer.
	self redrawNeeded ! !

!ConceptRelationView methodsFor: 'testing' stamp: 'hlsf 21/Oct/2026, 3:30:21 pm (UTC)'!
is: aSymbol
	^ aSymbol == #ConceptRelationView or: [super is: aSymbol]! !

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

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 20/Oct/2026, 8:55:22 pm (UTC)'!
presenter: aPresenter
	super presenter: aPresenter.
"	presenter model when: #changedConceptMap send: #updateCanvas to: self."! !

!ConceptMapCanvas methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 4:26:50 pm (UTC)'!
relationViewsWithSource: nodeView
	^ submorphs select: [:each | 
		(each is: #ConceptRelationView)
		and: [each source == nodeView]]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 20/Oct/2026, 8:50:24 pm (UTC)'!
adjustPosition: nodeView around: center at: distance with: angle
" We ensure this nodeView does not overlap existing morph "
	| newAngle newDistance checkBlock|
	
	checkBlock :=  [:anAngle :aDistance |
		nodeView morphCenter: center + (Point r: aDistance degrees: anAngle ).
		nodeView isOverlapping ifFalse: [^ Array with: aDistance with: anAngle ]].
	
	" Try shifting the angle "
	angle + self angleStep to: 360 by: self angleStep do: [:anAngle | 
		checkBlock value: anAngle value: distance].
	
	" Try intermediate angle and further distance "
	newDistance := distance.
	5 timesRepeat: [
		newAngle := self angleStep  / 2.
		newDistance := newDistance + distance * 0.5.
		newAngle to: 360 by: self angleStep do: [:anAngle | 
			checkBlock value: anAngle value: newDistance ]].
	"We do not view an empty space, return to original position "
	nodeView morphCenter: center + (Point r: distance degrees: angle).
	^ nil
		! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 20/Oct/2026, 9:49:18 pm (UTC)'!
insertTargets: nodes from: remainingNodes centeredAt: center 
	| nodeToInsert nodePosition nodeAngle view nodeDistance array |
	nodeAngle := 0.
	nodeDistance := self nodeDistance.
	nodes withIndexDo: [:node :index |
		nodeToInsert := remainingNodes remove: node ifAbsent: [nil].
		nodeToInsert ifNotNil: [
			nodePosition := center + (Point r: nodeDistance degrees: nodeAngle).
			view := self nodeViewFor: node at: nodePosition.
			view isOverlapping 
				ifTrue: [
					array := self adjustPosition: view around: center at: nodeDistance with: nodeAngle.
					array ifNotNil: [
						nodeDistance := array first.
						nodeAngle := array second] ].
			nodeAngle := nodeAngle + self angleStep .
			(self model relationsWithSource: node) ifNotEmpty: [:relations |.
				self 
					insertTargets: (relations collect: #target) 
					from: remainingNodes 
					centeredAt:  nodePosition ] ] ]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 17/Oct/2026, 12:29:52 pm (UTC)'!
nodeView: aNode
	^ submorphs 
		detect: [:aMorph | (aMorph is: #ConceptNodeView) and: [aMorph model == aNode]] 
		ifNone: [nil]! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 20/Oct/2026, 5:41:40 pm (UTC)'!
nodeViewFor: node
" 	Create the view of this node, when it exists, return its view instance "
	| view |
	view := ConceptNodeView contents: node label ::	
		model: node;
		borderColor: self color;
		color: self color veryMuchLighter ;
		setBalloonText: node balloonText .
		view morphExtent: view minimumExtent.
		view shrink.
	^ view! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 20/Oct/2026, 5:42:19 pm (UTC)'!
nodeViewFor: node at: position
" 	Create the view of this node, when it exists, return its view instance "
	| view |
	view := self nodeView: node.
	view ifNil: [
		view := self nodeViewFor: node.
		self addMorph: view.
		view shrink .
		view morphCenter: position].
	^ view! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 21/Oct/2026, 5:01:02 pm (UTC)'!
updateCanvas
	| topNodes node view center nodeAngle nodeDistance array |
	self removeAllMorphs.
	center := extent // 2.
	nodeAngle := 0.
	nodeDistance := self nodeDistance.
	" Top nodes strategies. First nodes with a hight source rate
	topNodes := self model topNodes."
	topNodes := self model nodes asOrderedCollection .
	[topNodes notEmpty] whileTrue: [
		node := topNodes removeAt: 1.
		view := self nodeViewFor: node at: center + (Point r: nodeDistance degrees: nodeAngle).
		view isOverlapping 
			ifTrue: [
				array := self adjustPosition: view around: center at: nodeDistance with: nodeAngle.
				array ifNotNil: [
					nodeDistance := array first.
					nodeAngle := array second] ].
		nodeAngle := nodeAngle + self angleStep.
		(self model relationsWithSource: node) ifNotEmpty: [:relations |
			self 
				insertTargets: (relations collect: #target)
				from:  topNodes
				centeredAt: center]].
	""
	self model relations do: [:relation |
		view := ConceptRelationView 
			source: (self nodeView: relation source) 
			target: (self nodeView: relation target) ::
			model: relation.
		self addMorphBack: view].
	self setExtent.! !

!ConceptMapCanvas methodsFor: 'updating' stamp: 'hlsf 18/Oct/2026, 1:54:25 pm (UTC)'!
updateColor
	submorphs 
		select: [:each | each is: #ConceptNodeView] 
		thenDo: [:view  | view borderColor: self color; color: self color veryMuchLighter ]! !

!ConceptMapCanvas methodsFor: 'initialization' stamp: 'hlsf 14/Oct/2026, 7:46:50 pm (UTC)'!
initialize
	super initialize.
	self morphExtent: 2000@2000.
	! !

!ConceptMapCanvas methodsFor: 'geometry' stamp: 'hlsf 21/Oct/2026, 4:41:45 pm (UTC)'!
angleStep
	^ 30! !

!ConceptMapCanvas methodsFor: 'geometry' stamp: 'hlsf 21/Oct/2026, 4:40:34 pm (UTC)'!
nodeDistance
	^ 400! !

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

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 3:17:12 pm (UTC)'!
canvas
	^ owner! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:51 pm (UTC)'!
model
	^ model! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 17/Oct/2026, 3:29:55 pm (UTC)'!
model: anObject
	model := anObject! !

!ConceptNodeView methodsFor: 'accessing' stamp: 'hlsf 21/Oct/2026, 4:26:39 pm (UTC)'!
thickness: integer
	self borderWidth: integer.
	(owner relationViewsWithSource: self) do: [:relationView | relationView width: integer]! !

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

!ConceptNodeView methodsFor: 'testing' stamp: 'hlsf 21/Oct/2026, 3:17:21 pm (UTC)'!
isOverlapping
"Am I overlapping other morph ?"
	| myBounds |
	myBounds := self fullBoundsInOwner.
	self canvas  nodeViews do: [:morph| 
		(morph ~= self 
		and: [myBounds intersects: morph fullBoundsInOwner ]) ifTrue: [ ^true]].
	^ false! !

!ConceptNodeView methodsFor: 'event handling testing' stamp: 'hlsf 17/Oct/2026, 1:47:55 pm (UTC)'!
handlesMouseDown: event
	^ true
! !

!ConceptNodeView methodsFor: 'event handling testing' stamp: 'hlsf 21/Oct/2026, 3:11:14 pm (UTC)'!
handlesMouseOver: event
	^ true! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 18/Oct/2026, 2:00:57 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition
	self removeProperty: #prevPosition! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 21/Oct/2026, 4:47:10 pm (UTC)'!
mouseEnter: event
	self thickness: 4! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 21/Oct/2026, 3:12:08 pm (UTC)'!
mouseLeave: event
	self thickness: 1! !

!ConceptNodeView methodsFor: 'events' stamp: 'hlsf 21/Oct/2026, 3:17:28 pm (UTC)'!
mouseMove: event localPosition: localPosition
	| prevPosition newPos|
	event mouseButton1Pressed not ifTrue: [^ self ].
	newPos := self externalize: localPosition.
	prevPosition := self valueOfProperty: #prevPosition.
	prevPosition 
		ifNotNil: [self morphPosition: self morphPosition + newPos - prevPosition].
	self setProperty: #prevPosition toValue: newPos.	
	self canvas setExtent;
		redrawNeeded ! !
