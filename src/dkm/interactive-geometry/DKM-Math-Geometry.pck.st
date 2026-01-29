'From Cuis7.7 [latest update: #7819] on 29 January 2026 at 12:05:40 pm'!
'Description '!
!provides: 'DKM-Math-Geometry' 1 9!
!requires: 'DrGeoCore' 1 18 nil!
!requires: 'DKM-Core' 1 6 nil!
!requires: 'DrGeoFrench' 1 17 nil!
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

!classDefinition: #GeometrieInteractive category: #'DKM-Math-Geometry'!
InteractiveGeometry subclass: #GeometrieInteractive
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Math-Geometry'!
!classDefinition: 'GeometrieInteractive class' category: #'DKM-Math-Geometry'!
GeometrieInteractive class
	instanceVariableNames: ''!


!InteractiveGeometry methodsFor: 'DSL' stamp: 'hlsf 11/Jan/2026 19:47:02'!
readMe
"
Browse the class DrGeoSketch (Ctrl-B) for the complet protocol.

"! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 29/Jan/2026 10:02:35'!
codeSample
	^'| sketch triangle ourRandom m n p |
sketch := DrGeoSketch new.
triangle := [:p1 :p2 :p3 |
	sketch segment: p1 to: p2.
	sketch segment: p2 to: p3.
	sketch segment: p3 to: p1].

ourRandom := [6 - 11 atRandom].

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

!InteractiveGeometry class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026 20:54:03'!
dslCategory
	^ 'DSL point' ! !

!InteractiveGeometry class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026 20:53:52'!
presenterClass
	^ DrGeoSketch ! !

!InteractiveGeometry class methodsFor: 'AI' stamp: 'hlsf 29/Jan/2026 11:59:38'!
codeSampleForAI
	^ '| mySketch point anotherPoint mobile dependent segment line circle arc ray locus value angle polygon ruler vector |
"## Creating a new sketch instance"
"By default grid and axes are off"
mySketch := DrGeoSketch new.
"## Manipulating sketch"
mySketch centerTo: 15@20.
"scale: integer
Change the scale of the sketch
-integer: the number of pixels used to represent one unit.
The larger this number, the larger the sketch."
mySketch scale: 15.
mySketch axesOn;
	gridOn.
"## Point and straight line"	
point := mySketch point: 5 @ (1/3).
"The default shape of a point is round"
point cross; round; square.
point color: Color blue; name: ''A''.
segment := mySketch segment: point to: 15@-5.
segment large; color: Color red; name: ''AB''.
"Different way to mark a segment in its middle, only one is visible at a time"
segment circleMark; discMark; simpleMark ;doubleMark ; tripleMark .
mySketch middleOf: segment .
line := mySketch line: -4@1 to: 8@-2.
line dashed; small; color: Color orange; name: ''Δ''.
mySketch intersectionOf: line and: segment.
ray := mySketch ray: 0@0 to: point.
ray dotted.
mySketch parallel: line at: point.
mySketch perpendicular: ray at: point.
mySketch perpendicularBisector: segment.
line := mySketch perpendicularBisector: point to: 0@0.
mySketch angleBisectorSummit: 0@0 side1: 8@-1 side2: point.
"## Curved line"
"arc: start to: aPoint to: end
Arc of circle defined by three points
-start: starting point of the arc
-aPoint: a point the arc is passing through
-end: ending point of the arc"
mySketch arc: -8.5@2 to: point to: 12@-4.
"arcCenter: center from: start to: end
Oriented arc of circle (anti-clockwised) defined by its center and two points
-center: a point, center of the circle
-start: starting point of the arc
-end: ending point of the arc"
arc := mySketch arcCenter: 0@0 from: 0@5 to: 12@-2.
arc color: Color magenta.
circle := mySketch circleCenter: 0@0 radius: 10.
circle filled; translucent.
mySketch intersectionOf: circle and: line.
mySketch altIntersectionOf: circle and: line.
mySketch circleCenter: point segment: segment.
mySketch circleCenter: 0@0 to: point.
"## Point and locus"
"pointOnLine: line at: abscissa 
Point mobile on a line
-line: straight or curved line (see DSL line, DSL line curved)
-abscissa: a number in the interval [0 ; 1]"
mobile := mySketch pointOnLine: circle at: 0.5.
mobile name: ''move me!!''; round; large.
dependent := mySketch middleOf: 10@5 and: mobile.
dependent cross; small; color: Color black.
"locusOf: dependent when: mobile
Locus of a point given another point
-mobile: a point mobile on a line (straight or curved)
-dependent: a point dependent by construction on the mobile point"
locus := mySketch locusOf: dependent when: mobile.
"## Plotting a function"
"plot: f from: x0 to: x1
Plot the curve of a one argument function in the x interval [x0 ; x1]
-f: block of code to compute the function. ex: [:x | x + (10 * x) cos]
-x0: minimun abscissa to plot the function
-x1: maximum abscissa"
locus := mySketch plot: [:x | x raisedToInteger: 3] from: -10 to: 10.
locus color: Color blue; name: ''Cf''.
"## Point advanced"
"point: block parent: drgeoItem
Point defined by a block of code
-block: a block of code with a MathItem argument. 
   The block returns a Smalltalk point
-drgeoItem: the Item whose MathItem is passed as argument to the block.
   See DrGMathItem class hierarchy"
anotherPoint := mySketch point: [:aSegment | (aSegment extremity1 * 2 + aSegment extremity2) / 3] parent: segment.
anotherPoint large; color: Color purple; name: ''Barycentric point''.
anotherPoint := (mySketch 
	point: [:aSegment :aPoint | ( (aSegment extremity1 + aSegment extremity2) / 2  + aPoint point) / 2] 
	parents: {segment . point }) color: Color blue.
anotherPoint large; color: Color cyan; name: ''point computed from two other objects''.
"## Value"
mySketch abscissaOf: point.
mySketch ordinateOf: point.
"lengthOf: finitCurve
Length of a curve
-finitCurve: a segment, circle, arc, polygon or vector"
mySketch lengthOf: circle.
mySketch slopeOf: line.
mySketch distance: line to: point.
value := mySketch value: Float pi.
value name: ''π''.
mySketch value: Float pi at: 5@5.
value := mySketch value: [10 atRandom].
value color: Color red; name: ''random number''.
value := mySketch value: [:aCircle | aCircle radius] parent: circle.
value name: ''radius''.
"Distance from a point to a circle"
value := mySketch value: [:aCircle :aPoint | ((aCircle center dist: aPoint point) - aCircle radius) abs]
	 parents: {circle . point } 
	at: 10@10.
value color: Color purple darker; name: ''distance to circle''.
"## Polygon"
polygon := mySketch polygon: {0@0. point. 4@-5/3}.
polygon filled; translucent; color: Color yellow.
value := mySketch value: [(3 to: 10) atRandom].
polygon := mySketch regularPolygonCenter: 0@0 vertex: point sides: value.
polygon large; color: Color red.
"## Angle"
"angle: vertex to: point1 to: point2
Oriented angle in [0 ; 360[ defined by three points
-vertex: a point, vertex of the angle
-point1: a point in one side of the angle
-point2: a point  in the other side of the angle"
angle := mySketch angle: 0@0 to: point to: 0@5.
angle color: Color red; name: ''AOB''.
"geometricAngle: summit to: point1 to: point2
Geometric angle in [0 ; 180] defined by three points
-vertex: a point, vertex of the angle
-point1: a point in one side of the angle
-point2: a point in the other side of the angle"
mySketch geometricAngle: 0@0 to: 1@0 to: 0@-1. 
"angle: vector1 to: vector2
Oriented angle defined by two vectors
-vector1: a point or DrGeo vector
-vector2: a point or DrGeo vector"
mySketch angle: 1@0 to: 0@1. "90 degrees"
"## Geometric transformation"
mySketch reflect: polygon axis: line.
mySketch symmetry: polygon center: 0@0.
value := mySketch value: [(0 to: Float halfPi by: Float pi / 20) atRandom].
mySketch rotate: polygon center: point angle: value.
mySketch rotate: polygon center: 5@5 angle: angle.
ruler := mySketch integer: 10 at: 0@10 from: 1 to: 60 name:''angle'' showValue: true.
mySketch rotate: polygon center: 0@0 angleDegrees: ruler.
ruler := mySketch float: 1.1 at: 0@15 from: -3 to: 3 name: ''factor'' showValue: true.
value := mySketch value: ruler.
polygon := mySketch scale: polygon center: 0@0 factor: value.
vector := mySketch vector: 0.5@0.2.
mySketch translate: polygon vector: vector.
mySketch translate: polygon vector: -0.5@-0.2.
"## Free text"
mySketch text: ''This sketch illustrates the Inteactive geometry DSL API''.
mySketch view. '! !

!GeometrieInteractive class methodsFor: 'as yet unclassified' stamp: 'hlsf 29/Jan/2026 10:00:53'!
codeSample
	^'| figure triangle auHasard m n p |
figure := DrGeoFigure new.
triangle := [:p1 :p2 :p3 |
	figure segmentDe: p1 à: p2.
	figure segmentDe: p2 à: p3.
	figure segmentDe: p3 à: p1].

auHasard := [6 - 11 auHasard ].

m := figure point: auHasard valeur @ 0.
n := figure point: 5 @ 0.
p := figure point:  auHasard valeur @ 3.
triangle valeur: m valeur: n valeur: p.
figure vue'! !

!GeometrieInteractive class methodsFor: 'as yet unclassified' stamp: 'hlsf 29/Jan/2026 10:04:01'!
description
	^'Décrire une figure géométrique avec des instructions. La figure géométrique résultante peut être manipulée interactivement.'! !

!GeometrieInteractive class methodsFor: 'as yet unclassified' stamp: 'hlsf 29/Jan/2026 10:04:55'!
presenterClass
	^ DrGeoFigure ! !

!GeometrieInteractive class methodsFor: 'as yet unclassified' stamp: 'hlsf 29/Jan/2026 10:03:14'!
title
	^ 'Géométre interactive'! !
