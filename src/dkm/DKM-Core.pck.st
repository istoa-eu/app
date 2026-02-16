'From Cuis7.7 [latest update: #7839] on 15 February 2026 at 8:16:06 pm'!
'Description '!
!provides: 'DKM-Core' 1 11!
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


!DKMPresenter commentStamp: 'hlsf 15/Feb/2026 11:48:14' prior: 0!
An abstract Presenter each new DKM's presenter must inherit from.
See class side too.

Implement the class methods pragmaMneu and menu: to add specific entries in the Annotator morph. See Timeline class for an example.!

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025 10:02:00'!
model
	^ model! !

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025 10:02:07'!
view
	^ view! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 18/Jan/2026 17:48:20'!
codeSampleForAI
" Working code sample exposing all the DSL with working code sample.
Subclasses should overide this method with the full DSL API exposed "
	^ self codeSample! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 18/Jan/2026 18:38:59'!
promptForAI
	^ self promptTemplate format: (Array with: self title with: self description with: self codeSampleForAI)! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 23/Jan/2026 14:18:24'!
promptTemplate
	^ '# Introduction
I am teacher using the application iStoa (http://istoa.eu) and its library of DKM (Dynamic Knowledge Model) to build pedagogical
content to use in front of student. The content is described with a script written in the Smalltalk programming language (Cuis-Smalltalk
implementation), when executed in the iStoa application, a visual simulation is then constructed.

Now, I am using one of the iStoa DKM to build {1} ({2})

In the next section, I show the complete DSL API specific to this DKM. Please learn from it for the next questions I will ask you.

# DSL API for {1}
{3}
'! !

!DKMPresenter class methodsFor: 'AI' stamp: 'hlsf 29/Jan/2026 22:44:04'!
promptTemplateFr
	^ '# Introduction
Je suis un enseignant utilisant l''application iStoa (http://istoa.eu) et sa bibliothèque de DKM (Dynamic Knowledge Model ou Modèle Dynamique de Connaissance)
pour construire du contenu pédagogique à utiliser devant les étudiants. Le contenu est décrit avec un script écrit dans le langage de programmation Smalltalk
(implementation Cuis-Smalltalk), lorsqu''il est exécuté dans l''application iStoa application, une simulation visuelle est alors construite.

Maintenant, j''utilise un DKM spécifique de iStoa pour {1} ({2})

Dans la section suivante, je montre l''API du DSL de ce DKM. Merci de l''apprendre et de l''utiliser pour les questions suivantes que je vais te poser.

# DSL API pour {1}
{3}
'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:30'!
codeSample
	self subclassResponsibility ! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 15/Feb/2026 12:36:24'!
codeSampleWithHeaderFor: aPresenter
	^ String streamContents: [:str |
			str nextPutAll: (self header format: {aPresenter title . aPresenter description . aPresenter printString});
				lf;
				nextPutAll: aPresenter codeSample ]! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:34'!
description
	self subclassResponsibility 
	"^ 'A dynamic knowledge model covering one specific teaching domain.'"! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 15/Feb/2026 19:50:03'!
header
"	Metadata template to describe a DKM instance. 
	The user edits this template along the DKM script "
^ '"@title: {1}
@description: {2}
@category: <category>
@tags: tag1 ; tag2 ; tag3
@author: eric.dupont@edu.eu
@class: {3}"'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:39'!
svgIcon
"	Poo icon, subclasses are strongly suggested to set a different icon!! "
	^'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!!--!!Font Awesome Free v5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M451.4 369.1C468.7 356 480 335.4 480 312c0-39.8-32.2-72-72-72h-14.1c13.4-11.7 22.1-28.8 22.1-48 0-35.3-28.7-64-64-64h-5.9c3.6-10.1 5.9-20.7 5.9-32 0-53-43-96-96-96-5.2 0-10.2.7-15.1 1.5C250.3 14.6 256 30.6 256 48c0 44.2-35.8 80-80 80h-16c-35.3 0-64 28.7-64 64 0 19.2 8.7 36.3 22.1 48H104c-39.8 0-72 32.2-72 72 0 23.4 11.3 44 28.6 57.1C26.3 374.6 0 404.1 0 440c0 39.8 32.2 72 72 72h368c39.8 0 72-32.2 72-72 0-35.9-26.3-65.4-60.6-70.9zM192 256c17.7 0 32 14.3 32 32s-14.3 32-32 32-32-14.3-32-32 14.3-32 32-32zm159.5 139C341 422.9 293 448 256 448s-85-25.1-95.5-53c-2-5.3 2-11 7.8-11h175.4c5.8 0 9.8 5.7 7.8 11zM320 320c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"/></svg>'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:44'!
title
	self subclassResponsibility 
	"^ 'Model title'"! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026 20:52:50'!
dslCategory
" The method category of the DSL "
	^ 'DSL'! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 11/Jan/2026 19:42:41'!
evaluateSample
" Evaluate the sample and present it to the world "
	| view |
	view := Compiler evaluate: self codeSample.
	view openInHand! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 10:54:54'!
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

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026 20:53:37'!
presenterClass
" The class of the real presenter, if different "
	^ self! !

!Object class methodsFor: '*DKM-Core' stamp: 'hlsf 15/Feb/2026 12:42:20'!
codeSampleWithHeader
	^DKMPresenter codeSampleWithHeaderFor: self! !
