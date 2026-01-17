'From Cuis7.7 [latest update: #7791] on 17 January 2026 at 11:10:47 pm'!
'Description '!
!provides: 'DKM-Math-Geometry' 1 3!
!requires: 'DrGeoCore' 1 18 nil!
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

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 17/Jan/2026 23:09:47'!
svgIcon
	^ '<svg width="75" height="75" version="1.1" xmlns="http://www.w3.org/2000/svg"><!!-- GPL Copyright 2010 2026 Hilaire Fernandes--><rect x="1.7783" y="1.6735" width="71.772" height="71.99" rx="7.5" ry="7.5" fill="#aaa" opacity=".96" stroke="#000" stroke-linecap="square" stroke-linejoin="round" stroke-width="3"/><g fill-opacity=".75" fill-rule="evenodd" stroke-linejoin="round"><path d="m29.785 12.675 26.734 40.359-39.146-0.28027 12.412-40.078z" fill="#fff" stroke="#000" stroke-width="3"/><path d="m36.333 5.0316v57.093 6.2641" fill="#0121fd" stroke="#333" stroke-width="2.2075"/><path d="m5.961 26.742 61.64 21.176" fill="#e6e6e6" stroke="#333" stroke-width="2.2075"/></g><path d="m64.499 19.444-56.457 35.549" fill="none" stroke="#333" stroke-linejoin="round" stroke-width="2.2075"/><ellipse transform="matrix(1.1192 0 0 1.1843 31.646 -7.3558)" cx="4.626" cy="37.303" rx="23.13" ry="22.146" fill="none" stroke="#808080" stroke-linecap="square" stroke-linejoin="round" stroke-width="1.7372"/></svg>'! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:28:37'!
title
	^ 'Interactive geometry' translated! !

!InteractiveGeometry class methodsFor: 'as yet unclassified' stamp: 'hlsf 12/Jan/2026 20:54:03'!
dslCategory
	^ 'DSL point' ! !

!InteractiveGeometry class methodsFor: 'as yet unclassified' stamp: 'hlsf 12/Jan/2026 20:53:52'!
presenterClass
	^ DrGeoSketch ! !
