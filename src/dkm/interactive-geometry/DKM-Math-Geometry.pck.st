'From Cuis7.7 [latest update: #7791] on 11 January 2026 at 8:31:35 pm'!
'Description '!
!provides: 'DKM-Math-Geometry' 1 1!
!requires: 'DrGeoCore' 1 10 nil!
SystemOrganization addCategory: #'DKM-Math-Geometry'!


!classDefinition: #InteractiveGeometry category: #'DKM-Math-Geometry'!
DKMPresenter subclass: #InteractiveGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Math-Geometry'!
!classDefinition: 'InteractiveGeometry class' category: #'DKM-Math-Geometry'!
InteractiveGeometry class
	instanceVariableNames: ''!


!InteractiveGeometry methodsFor: 'DSL' stamp: 'hlsf 11/Jan/2026 19:47:02'!
readMe
"
Browse the class DrGeoSketch (Ctrl-B) for the complet protocol.

"! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:37:39'!
codeSample
	^'| sketch triangle ourRandom m n p |
sketch := DrGeoSketch new.
triangle := [:p1 :p2 :p3 |
	sketch segment: p1 to: p2.
	sketch segment: p2 to: p3.
	sketch segment: p3 to: p1].
""
ourRandom := [6 - 11 atRandom].
""
m := sketch point: ourRandom value @ 0.
n := sketch point: 5 @ 0.
p := sketch point:  ourRandom value @ 3.
triangle value: m value: n value: p.
sketch view'! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:28:29'!
description
	^'Describe a geometric sketch with dedicated instructions. The result is a geometric sketch you can interactively manipulate.' translated! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:28:37'!
title
	^ 'Interactive geometry' translated! !
