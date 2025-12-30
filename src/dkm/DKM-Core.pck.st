'From Cuis7.5 [latest update: #7739] on 25 December 2025 at 11:06:15 am'!
'Description '!
!provides: 'DKM-Core' 1 2!
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


!DKMPresenter commentStamp: '<historical>' prior: 0!
An abstract Presenter each new DKM's presenter must inherit from.
See class side too.!

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025 10:02:00'!
model
	^ model! !

!DKMPresenter methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2025 10:02:07'!
view
	^ view! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:30'!
codeSample
	self subclassResponsibility ! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:34'!
description
	self subclassResponsibility 
	"^ 'A dynamic knowledge model covering one specific teaching domain.'"! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:54'!
menu: menuBuilder
"	Set an unique symbol to identify menu pragma, see menu: method 
	<myDynamicKnowldgeModelMenu>
"
	
! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:48'!
pragmaMenu
"	Set an unique symbol to identify menu pragma, see menu: method "
	#myDynamicKnowldgeModelMenu
! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:39'!
svgIcon
"	Poo icon, subclasses are strongly suggested to set a different icon!! "
	^'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!!--!!Font Awesome Free v5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M451.4 369.1C468.7 356 480 335.4 480 312c0-39.8-32.2-72-72-72h-14.1c13.4-11.7 22.1-28.8 22.1-48 0-35.3-28.7-64-64-64h-5.9c3.6-10.1 5.9-20.7 5.9-32 0-53-43-96-96-96-5.2 0-10.2.7-15.1 1.5C250.3 14.6 256 30.6 256 48c0 44.2-35.8 80-80 80h-16c-35.3 0-64 28.7-64 64 0 19.2 8.7 36.3 22.1 48H104c-39.8 0-72 32.2-72 72 0 23.4 11.3 44 28.6 57.1C26.3 374.6 0 404.1 0 440c0 39.8 32.2 72 72 72h368c39.8 0 72-32.2 72-72 0-35.9-26.3-65.4-60.6-70.9zM192 256c17.7 0 32 14.3 32 32s-14.3 32-32 32-32-14.3-32-32 14.3-32 32-32zm159.5 139C341 422.9 293 448 256 448s-85-25.1-95.5-53c-2-5.3 2-11 7.8-11h175.4c5.8 0 9.8 5.7 7.8 11zM320 320c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"/></svg>'! !

!DKMPresenter class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025 18:36:44'!
title
	self subclassResponsibility 
	"^ 'Model title'"! !

!DKMPresenter class methodsFor: 'user interface' stamp: 'hlsf 24/Dec/2025 20:16:42'!
evaluateSample
" Evaluate the sample and present it to the world "
	| evaluateAndOpen |
	evaluateAndOpen := String streamContents: [:str |
			str nextPut: $(;
				nextPutAll: self codeSample;
				nextPutAll: ') openInHand'].
	Compiler evaluate: evaluateAndOpen ! !

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
