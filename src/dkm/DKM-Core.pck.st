'From Cuis7.9 [latest update: #8266] on 10 October 2026 at 1:25:18 pm'!
'Description '!
!provides: 'DKM-Core' 1 20!
SystemOrganization addCategory: #'DKM-Core'!


!classDefinition: #DKMPresenter category: #'DKM-Core'!
Object subclass: #DKMPresenter
	instanceVariableNames: 'model view'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMPresenter class' category: #'DKM-Core'!
DKMPresenter class
	instanceVariableNames: ''!

!classDefinition: #DKMCanvasPresenter category: #'DKM-Core'!
DKMPresenter subclass: #DKMCanvasPresenter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMCanvasPresenter class' category: #'DKM-Core'!
DKMCanvasPresenter class
	instanceVariableNames: ''!

!classDefinition: #DKMCanvasModel category: #'DKM-Core'!
ActiveModel subclass: #DKMCanvasModel
	instanceVariableNames: 'title'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMCanvasModel class' category: #'DKM-Core'!
DKMCanvasModel class
	instanceVariableNames: ''!

!classDefinition: #DKMCanvas category: #'DKM-Core'!
BoxMorph subclass: #DKMCanvas
	instanceVariableNames: 'presenter prevPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMCanvas class' category: #'DKM-Core'!
DKMCanvas class
	instanceVariableNames: ''!

!classDefinition: #DKMContainer category: #'DKM-Core'!
ColoredBoxMorph subclass: #DKMContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMContainer class' category: #'DKM-Core'!
DKMContainer class
	instanceVariableNames: ''!

!classDefinition: #DKMCanvasView category: #'DKM-Core'!
FormLayoutMorph subclass: #DKMCanvasView
	instanceVariableNames: 'canvas presenter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Core'!
!classDefinition: 'DKMCanvasView class' category: #'DKM-Core'!
DKMCanvasView class
	instanceVariableNames: ''!


!DKMPresenter commentStamp: 'hlsf 15/Feb/2026 11:48:14' prior: 0!
An abstract Presenter each new DKM's presenter must inherit from.
See class side too.

Implement the class methods pragmaMneu and menu: to add specific entries in the Annotator morph. See Timeline class for an example.!

!DKMCanvasPresenter commentStamp: '<historical>' prior: 0!
An abstract Presenter for DKM handling a canvas!

!DKMCanvasModel commentStamp: '<historical>' prior: 0!
An abstract Model for DKM handling a canvas!

!DKMCanvas commentStamp: '<historical>' prior: 0!
I am canvas to be used with DKM with a canvas view!

!DKMContainer commentStamp: '<historical>' prior: 0!
I am a container for a canvas view. 
The canvas view can be panned or zoomed inside me.
!

!DKMCanvasView commentStamp: '<historical>' prior: 0!
An abstract View for DKM handling a canvas
In this kind of DKM view a canvas can be panned/zoomed around.
The model is displayed in the canvas view.!

!DKMPresenter methodsFor: 'events' stamp: 'hlsf 9/Mar/2026, 7:20:34 pm (UTC)'!
haloAdded
" get notified my Annotator halo shows up, my subclass may want to do something"
	'Notified, halo added' print! !

!DKMPresenter methodsFor: 'events' stamp: 'hlsf 9/Mar/2026, 7:20:49 pm (UTC)'!
haloRemoved
" get notified my Annotator halo is removed, my subclass may want to do something"
	'Notified, halo removed' print! !

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025, 8:02:00 am (UTC)'!
model
	^ model! !

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025, 8:02:07 am (UTC)'!
view
	^ view! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 28/May/2026, 7:37:16 pm (UTC)'!
AI_PromptFor: aPresenter
" Read *DKM-Core methohd category in Object "
	^ self promptTemplate format: (Array 
		with: aPresenter title 
		with: aPresenter description 
		with: aPresenter codeSampleForAI
		with: (self header format: {
			'<title>' . 
			'<description>' . 
			aPresenter dkmUser.
			aPresenter printString})
	)! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 29/Mar/2026, 11:56:53 am (UTC)'!
promptTemplate
	^ '# Introduction
I am teacher using the application iStoa (http://istoa.eu) and its library of DKM (Dynamic Knowledge Model) to build pedagogical
content to use in front of student. The content is described with a script written in the Smalltalk programming language (Cuis-Smalltalk
implementation), when executed in the iStoa application, a visual simulation is then constructed.

Now, I am using one of the iStoa DKM to build {1} ({2})

When generating the script, add first its header, in Smalltalk comment, with metadata set for <title>, <description> , <category> and at least one <tag>:
{4}

In the next section, I show the complete DSL API specific to this DKM. Please learn from it for the next questions I will ask you.
Be brief in your comments, avoid unnecessary compliments.

# DSL API for {1}
{3}
'! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 28/May/2026, 7:42:26 pm (UTC)'!
promptTemplateFr
	^ '# Introduction
Je suis un enseignant utilisant l''application iStoa (http://istoa.eu) et sa bibliothèque de DKM (Dynamic Knowledge Model ou Modèle Dynamique de Connaissance)
pour construire du contenu pédagogique à utiliser devant les étudiants. Le contenu est décrit avec un script écrit dans le langage de programmation Smalltalk
(implementation Cuis-Smalltalk), lorsqu''il est exécuté dans l''application iStoa application, une simulation visuelle est alors construite.

Maintenant, j''utilise un DKM spécifique de iStoa pour {1} ({2})

Lors de la génération d''un script, ajoute en premier son entête, dans un commentaire en Smalltalk, avec des valeurs de metadonnées pour <title>, <description> , <category> et au moins un <tag>:
{4}

Dans la section suivante, je montre l''API du DSL de ce DKM. Merci de l''apprendre et de l''utiliser pour les questions suivantes que je vais te poser.

# DSL API pour {1}
{3}
'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:36:30 pm (UTC)'!
codeSample
	self subclassResponsibility ! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 6/Oct/2026, 9:29:48 am (UTC)'!
codeSampleWithHeaderFor: aPresenter
" Read the Object '*DKM-Core' method category "
	^ String streamContents: [:str |
		str nextPutAll: (self header format: {
			aPresenter title . 
			aPresenter description . 
			aPresenter dkmUser . 
			aPresenter printString});
			lf;
			nextPutAll: aPresenter codeSample ]! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:36:34 pm (UTC)'!
description
	self subclassResponsibility 
	"^ 'A dynamic knowledge model covering one specific teaching domain.'"! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 28/May/2026, 7:57:00 pm (UTC)'!
header
"	Metadata template to describe a DKM instance. 
	The user edits this template along the DKM script "
^ '"@title: {1}
@description: {2}
@category: <category>
@tags: <tag1> ; <tag2>
@author: {3}
@class: {4}"'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:36:39 pm (UTC)'!
svgIcon
"	Poo icon, subclasses are strongly suggested to set a different icon!! "
	^'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!!--!!Font Awesome Free v5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M451.4 369.1C468.7 356 480 335.4 480 312c0-39.8-32.2-72-72-72h-14.1c13.4-11.7 22.1-28.8 22.1-48 0-35.3-28.7-64-64-64h-5.9c3.6-10.1 5.9-20.7 5.9-32 0-53-43-96-96-96-5.2 0-10.2.7-15.1 1.5C250.3 14.6 256 30.6 256 48c0 44.2-35.8 80-80 80h-16c-35.3 0-64 28.7-64 64 0 19.2 8.7 36.3 22.1 48H104c-39.8 0-72 32.2-72 72 0 23.4 11.3 44 28.6 57.1C26.3 374.6 0 404.1 0 440c0 39.8 32.2 72 72 72h368c39.8 0 72-32.2 72-72 0-35.9-26.3-65.4-60.6-70.9zM192 256c17.7 0 32 14.3 32 32s-14.3 32-32 32-32-14.3-32-32 14.3-32 32-32zm159.5 139C341 422.9 293 448 256 448s-85-25.1-95.5-53c-2-5.3 2-11 7.8-11h175.4c5.8 0 9.8 5.7 7.8 11zM320 320c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"/></svg>'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:36:44 pm (UTC)'!
title
	self subclassResponsibility 
	"^ 'Model title'"! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026, 6:52:50 pm (UTC)'!
dslCategory
" The method category of the DSL "
	^ 'DSL'! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 11/Jan/2026, 5:42:41 pm (UTC)'!
evaluateSample
" Evaluate the sample and present it to the world "
	| view |
	view := Compiler evaluate: self codeSample.
	view openInHand! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025, 8:54:54 am (UTC)'!
presentInWorkspace
" Present the code sample of the DKM in a Workspace "
	| codeSample |
	codeSample := Text streamContents: [:str |
		str nextPut: $"; nextPutAll: self description italic black ; lf; space; lf.
		str nextPutAll: 'Below a sample of a DKM script, experiment variants by editing its code.
- To play the DKM, select all code (Ctrl-A) and print it (Ctrl-P),
- To learn the DKM programming interface, select its name '.
		str nextPutAll: (self name subStrings: ' ') first bold.
		str nextPutAll: ' and browse (Ctrl-B) its DSL hierarchy."' ; lf; lf.
		str nextPutAll: self codeSample; lf; lf].
	Workspace new
		contents: codeSample;
		openLabel: self title! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026, 6:53:37 pm (UTC)'!
presenterClass
" The class of the real presenter, if different "
	^ self! !

!DKMCanvasPresenter methodsFor: 'DSL' stamp: 'hlsf 7/Oct/2026, 3:00:02 pm (UTC)'!
color: aColor
	view borderColor: aColor! !

!DKMCanvasPresenter methodsFor: 'DSL' stamp: 'hlsf 7/Oct/2026, 3:00:48 pm (UTC)'!
width: aColor
	view borderWidth: aColor! !

!DKMCanvasPresenter methodsFor: 'callback ui' stamp: 'hlsf 7/Oct/2026, 3:13:13 pm (UTC)'!
moveOXAction: increment
	| canvas myIncr |
	canvas := view canvas.
	myIncr := 0.
	increment > 0 
		ifTrue: [ " Move to the right as long as canvas ox zero is lower than container right border (extent x) "
			(canvas externalize: 0@0) x < view container morphExtent x ifTrue: [myIncr := increment ] ]
		ifFalse: [ " Move to the left as long as canvas width on ox is greater thant container left obrder (0) "
			(canvas externalize: view canvas morphExtent x@0) x > 0 ifTrue: [myIncr := increment ] ].
	myIncr isZero ifFalse: [
		myIncr := myIncr * view canvas morphExtent x / 4000.
		canvas morphPosition: canvas morphPosition x + myIncr  @ canvas morphPosition y]! !

!DKMCanvasPresenter methodsFor: 'callback ui' stamp: 'hlsf 10/Oct/2026, 10:50:15 am (UTC)'!
moveOYAction: increment
	| canvas myIncr |
	canvas := view canvas.
	myIncr := 0.
	increment > 0 
		ifTrue: [ " Move to the bottom as long as canvas oy zero is lower than container bottom border (extent y) "
			(canvas externalize: 0@0) y < view container morphExtent y ifTrue: [myIncr := increment ] ]
		ifFalse: [ " Move to the top as long as canvas height on oy is greater thant container top obrder (0) "
			(canvas externalize: 0@view canvas morphExtent y) y > 0 ifTrue: [myIncr := increment ] ].
	myIncr isZero ifFalse: [
		myIncr := myIncr * view canvas morphExtent y / 4000.
		canvas morphPosition: canvas morphPosition x @ (canvas morphPosition y + myIncr) ]! !

!DKMCanvasPresenter methodsFor: 'callback ui' stamp: 'hlsf 7/Oct/2026, 3:01:09 pm (UTC)'!
zoomAction: increment
	self zoomAction: increment at: view container fullBoundsInOwner center! !

!DKMCanvasPresenter methodsFor: 'callback ui' stamp: 'hlsf 7/Oct/2026, 3:01:09 pm (UTC)'!
zoomAction: increment at: referencePoint
	| canvas center |
	canvas := view canvas.
	center := canvas internalize: referencePoint.
	canvas scale: (canvas scale - increment min: 2 max: 0.1).
	center := canvas externalize: center.
	canvas morphPosition: canvas morphPosition - center + referencePoint .! !

!DKMCanvasPresenter class methodsFor: 'instance creation' stamp: 'hlsf 7/Oct/2026, 3:04:25 pm (UTC)'!
title: aText
	| canvasPresenter |
	canvasPresenter := self new.
	canvasPresenter model title: aText.
	^ canvasPresenter ! !

!DKMCanvasModel methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 3:05:15 pm (UTC)'!
title
	^ title! !

!DKMCanvasModel methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 3:05:10 pm (UTC)'!
title: aText
	title := aText! !

!DKMCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:44:34 pm (UTC)'!
color
	^ self mainView borderColor ! !

!DKMCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:44:34 pm (UTC)'!
container
	^ owner! !

!DKMCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:44:34 pm (UTC)'!
mainView
	^ self container owner! !

!DKMCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:45:11 pm (UTC)'!
model
	^ presenter model! !

!DKMCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:46:51 pm (UTC)'!
presenter: aPresenter
	presenter := aPresenter! !

!DKMCanvas methodsFor: 'event handling testing' stamp: 'hlsf 7/Oct/2026, 2:45:02 pm (UTC)'!
handlesMouseDown: event
	^ true
! !

!DKMCanvas methodsFor: 'event handling testing' stamp: 'hlsf 7/Oct/2026, 2:45:06 pm (UTC)'!
handlesMouseScroll: scrollEvent
	^ true! !

!DKMCanvas methodsFor: 'events' stamp: 'hlsf 7/Oct/2026, 2:45:33 pm (UTC)'!
mouseButton1Up: event localPosition: localPosition
	prevPosition := nil! !

!DKMCanvas methodsFor: 'events' stamp: 'hlsf 7/Oct/2026, 2:45:44 pm (UTC)'!
mouseMove: event localPosition: localPosition
	| pos |
	event mouseButton1Pressed not ifTrue: [^ self ].
	prevPosition 
		ifNotNil:  [
			pos := self externalize: localPosition.
			self morphPosition: self morphPosition + pos - prevPosition.
			prevPosition := pos]
		ifNil: [prevPosition := self externalize: localPosition]! !

!DKMCanvas methodsFor: 'geometry testing' stamp: 'hlsf 7/Oct/2026, 2:47:16 pm (UTC)'!
requiresVectorCanvas
	^ true ! !

!DKMContainer methodsFor: 'geometry testing' stamp: 'hlsf 29/Sep/2025, 7:35:40 pm (UTC)'!
clipsSubmorphs
	^ true ! !

!DKMContainer methodsFor: 'initialization' stamp: 'hlsf 4/Oct/2025, 3:08:58 pm (UTC)'!
defaultColor
	^ Color white slightlyDarker ! !

!DKMContainer methodsFor: 'event handling testing' stamp: 'hlsf 11/Oct/2025, 4:39:01 pm (UTC)'!
handlesMouseDown: aMouseButtonEvent
	^ true ! !

!DKMContainer class methodsFor: 'instance creation' stamp: 'hlsf 29/Sep/2025, 7:48:29 pm (UTC)'!
for: aTimelineCanvas
	^ self new
		addMorph: aTimelineCanvas position: 0@0! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:35:25 pm (UTC)'!
adoptWidgetsColor: paneColor
	! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:35:35 pm (UTC)'!
borderColor: aColor
	super borderColor: aColor.
	canvas updateColor! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:35:43 pm (UTC)'!
borderWidth: anInteger
	super borderWidth: anInteger.
	canvas updateWidth ! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:35:48 pm (UTC)'!
canvas
	^ canvas! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:35:54 pm (UTC)'!
container
	^ canvas owner! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:37:54 pm (UTC)'!
model
	^ presenter model! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:38:13 pm (UTC)'!
presenter
	^ presenter! !

!DKMCanvasView methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 1:38:18 pm (UTC)'!
presenter: aPresenter
	presenter := aPresenter ! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 1:36:01 pm (UTC)'!
defaultBorderColor 
	^ Color blue! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 1:36:05 pm (UTC)'!
defaultBorderWidth 
	^ 2! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 1:36:09 pm (UTC)'!
defaultColor
	^ Color transparent! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 1:37:46 pm (UTC)'!
initialize
	super initialize.
	self morphExtent: 700@500.
	self installView.
	self when: #enterAnnotator send: #showTools to: self.
	self when: #leaveAnnotator send: #hideTools to: self! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 2:44:19 pm (UTC)'!
installView
	self subclassResponsibility ! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 10/Oct/2026, 11:21:43 am (UTC)'!
installViewWith: widgets
	| wHeight wWidth |
	wHeight := Theme current wheelHeight rounded.
	wWidth := Theme current wheelWidth rounded.
	canvas := TimelineCanvas new presenter: presenter.
	self addMorph: (DKMContainer for: canvas)
		layoutSpec: (LayoutEdgesSpec 
			tlEdgesWeight: 0@0 offset: 0@0 
			brEdgesWeight: 1@1 offset: wWidth negated asPoint).
	(widgets includes: #zWheel) ifTrue: [
		self	addMorph: self zoomWheel
			layoutSpec: (LayoutEdgesSpec 
				tlEdgesWeight: 1@0 offset: (wWidth @ 0 ) negated
				brEdgesWeight: 1@0 offset: 0 @ wHeight ) ].
	(widgets includes: #xWheel) ifTrue: [
		self addMorph: self horizontalWheel 
			layoutSpec: (LayoutEdgesSpec 
				tlEdgesWeight: 1@1 offset: (wHeight + wWidth @ wWidth ) negated 
				brEdgesWeight: 1 @1 offset: (wWidth @ 0 ) negated) ].
	(widgets includes: #yWheel) ifTrue: [
		self addMorph: self verticalWheel 
			layoutSpec: (LayoutEdgesSpec 
				tlEdgesWeight: 1@1 offset: (wWidth @ (wHeight + wWidth) ) negated
				brEdgesWeight: 1 @1 offset: (0 @ wWidth) negated) ]! !

!DKMCanvasView methodsFor: 'initialization' stamp: 'hlsf 7/Oct/2026, 1:38:08 pm (UTC)'!
noteNewOwner: aMorph
	  UISupervisor whenUIinSafeState: [canvas morphPosition: canvas owner morphExtent - canvas morphExtent // 2]! !

!DKMCanvasView methodsFor: 'drawing' stamp: 'hlsf 7/Oct/2026, 1:36:32 pm (UTC)'!
drawOn: aCanvas ! !

!DKMCanvasView methodsFor: 'widget' stamp: 'hlsf 7/Oct/2026, 1:36:47 pm (UTC)'!
hideTools
	submorphs select: [:each | each is: #WheelMorph] thenDo: [:wheel | wheel hide]! !

!DKMCanvasView methodsFor: 'widget' stamp: 'hlsf 10/Oct/2026, 10:54:22 am (UTC)'!
horizontalWheel 
	^ (WheelMorph target: presenter actionSelector: #moveOXAction:)
		beHorizontal; 
		factor: 2; 
		setBalloonText: 'Scroll the view to the left or the right.' translated;
		borderWidth: 3;
		color: Color orange;
		borderColor: Color black;
		yourself! !

!DKMCanvasView methodsFor: 'widget' stamp: 'hlsf 7/Oct/2026, 1:38:23 pm (UTC)'!
showTools
	submorphs select: [:each | each is: #WheelMorph] thenDo: [:wheel | wheel show]! !

!DKMCanvasView methodsFor: 'widget' stamp: 'hlsf 10/Oct/2026, 11:23:14 am (UTC)'!
verticalWheel 
	^ (WheelMorph target: presenter actionSelector: #moveOYAction:)
		beVertical ; 
		factor: -2; 
		setBalloonText: 'Scroll the view to the top or the bottom.' translated;
		borderWidth: 3;
		color: Color orange;
		borderColor: Color black;
		yourself! !

!DKMCanvasView methodsFor: 'widget' stamp: 'hlsf 7/Oct/2026, 1:38:31 pm (UTC)'!
zoomWheel
	^ (WheelMorph target: presenter actionSelector: #zoomAction:)
		beVertical ;		
		factor: 0.01 ;
		setBalloonText: 'Zoom in or out the timeline' translated;
		borderWidth: 3;
		color: Color gray;
		borderColor: Color black;
		yourself! !

!DKMCanvasView class methodsFor: 'instance creation' stamp: 'hlsf 7/Oct/2026, 1:38:44 pm (UTC)'!
presenter: aPresenter
	^ self basicNew
		presenter: aPresenter;
		initialize;
		yourself! !

!Object methodsFor: '*DKM-Core' stamp: 'hlsf 28/May/2026, 7:37:07 pm (UTC)'!
dkmUser
	^(self  respondsTo: #dyboUser) 
		ifTrue: [self dyboUser] 
		ifFalse: ['<author>'].! !

!Object class methodsFor: '*DKM-Core' stamp: 'hlsf 22/Mar/2026, 10:32:30 am (UTC)'!
AI_Prompt
	^DKMPresenter AI_PromptFor: self! !

!Object class methodsFor: '*DKM-Core' stamp: 'hlsf 22/Mar/2026, 9:41:32 am (UTC)'!
AI_PromptFor
	^DKMPresenter AI_PromptFor: self! !

!Object class methodsFor: '*DKM-Core' stamp: 'hlsf 6/Oct/2026, 9:36:26 am (UTC)'!
codeSampleForAI
"	A default choice, subclasses should override it with the complete DSL API

	Working code sample exposing ALL the DSL with working code sample.
	Subclasses should overide this method with the COMPLETE DSL API exposed.
	It is different to the #codeSample message which only provides a working example
	of a script for a given DKM 
"
	^ self codeSample! !

!Object class methodsFor: '*DKM-Core' stamp: 'hlsf 15/Feb/2026, 10:42:20 am (UTC)'!
codeSampleWithHeader
	^DKMPresenter codeSampleWithHeaderFor: self! !
