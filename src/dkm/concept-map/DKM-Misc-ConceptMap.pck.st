'From Cuis7.9 [latest update: #8266] on 7 October 2026 at 3:42:32 pm'!
'Description '!
!provides: 'DKM-Misc-ConceptMap' 1 1!
!requires: 'DKM-Core' 1 18 nil!
SystemOrganization addCategory: #'DKM-Misc-ConceptMap'!


!classDefinition: #ConceptMap category: #'DKM-Misc-ConceptMap'!
DKMPresenter subclass: #ConceptMap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Misc-ConceptMap'!
!classDefinition: 'ConceptMap class' category: #'DKM-Misc-ConceptMap'!
ConceptMap class
	instanceVariableNames: ''!


!ConceptMap methodsFor: 'DKM' stamp: 'hlsf 7/Oct/2026, 1:20:07 pm (UTC)'!
title
	^ 'Concept map' translated! !
