'From Cuis7.9 [latest update: #8266] on 7 October 2026 at 5:21:32 pm'!
'Description '!
!provides: 'DKM-Physics-GasSimulation' 1 41!
!requires: 'DKM-Core' 1 17 nil!
SystemOrganization addCategory: #'DKM-Physics-GasSimulation'!


!classDefinition: #GasSimulation category: #'DKM-Physics-GasSimulation'!
DKMPresenter subclass: #GasSimulation
	instanceVariableNames: 'playing state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'GasSimulation class' category: #'DKM-Physics-GasSimulation'!
GasSimulation class
	instanceVariableNames: ''!

!classDefinition: #GasSimulationModel category: #'DKM-Physics-GasSimulation'!
Object subclass: #GasSimulationModel
	instanceVariableNames: 'molecules walls simulationStep reinject idealGas pixelExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'GasSimulationModel class' category: #'DKM-Physics-GasSimulation'!
GasSimulationModel class
	instanceVariableNames: ''!

!classDefinition: #Molecule category: #'DKM-Physics-GasSimulation'!
Object subclass: #Molecule
	instanceVariableNames: 'position velocity force'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'Molecule class' category: #'DKM-Physics-GasSimulation'!
Molecule class
	instanceVariableNames: ''!

!classDefinition: #Wall category: #'DKM-Physics-GasSimulation'!
Object subclass: #Wall
	instanceVariableNames: 'extremity1 extremity2 normal director heating bounced speedT'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'Wall class' category: #'DKM-Physics-GasSimulation'!
Wall class
	instanceVariableNames: ''!

!classDefinition: #MoleculeMorph category: #'DKM-Physics-GasSimulation'!
Morph subclass: #MoleculeMorph
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'MoleculeMorph class' category: #'DKM-Physics-GasSimulation'!
MoleculeMorph class
	instanceVariableNames: ''!

!classDefinition: #WallMorph category: #'DKM-Physics-GasSimulation'!
PlacedMorph subclass: #WallMorph
	instanceVariableNames: 'model heating'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'WallMorph class' category: #'DKM-Physics-GasSimulation'!
WallMorph class
	instanceVariableNames: ''!

!classDefinition: #GasSimulationCanvas category: #'DKM-Physics-GasSimulation'!
ColoredBoxMorph subclass: #GasSimulationCanvas
	instanceVariableNames: 'presenter sensorArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'GasSimulationCanvas class' category: #'DKM-Physics-GasSimulation'!
GasSimulationCanvas class
	instanceVariableNames: ''!

!classDefinition: #GasSimulationView category: #'DKM-Physics-GasSimulation'!
LinearLayoutMorph subclass: #GasSimulationView
	instanceVariableNames: 'presenter canvas temperatureViews'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'GasSimulationView class' category: #'DKM-Physics-GasSimulation'!
GasSimulationView class
	instanceVariableNames: ''!

!classDefinition: #TemperatureSensor category: #'DKM-Physics-GasSimulation'!
LinearLayoutMorph subclass: #TemperatureSensor
	instanceVariableNames: 'presenter measuredArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-GasSimulation'!
!classDefinition: 'TemperatureSensor class' category: #'DKM-Physics-GasSimulation'!
TemperatureSensor class
	instanceVariableNames: ''!


!GasSimulation commentStamp: '<historical>' prior: 0!
Copyright 2025-2026 Hilaire Fernandes

The presenter of the Gas Simulation to handle the DSL, the controllers and associated callbacks.

(GasSimulation new
	fenceOrigin: 0@0 corner: 300@200;
	addWallFrom: 100@0 to: 80@85;
	addWallFrom: 100@200 to: 80@105;
	addMolecules: 50 ;
	view) openInWorld!

!GasSimulationModel commentStamp: '<historical>' prior: 0!
I simulate idea gas in a fence. Additional inside wall can be added.
Temperature of the walls and fence can be adjusted during the simulation.

Real gas can be simulated, adding inter-molecules potential interactions.

- walls, a collection of wall models
- molecules, a collection of moleculte model (here just argon atom, not really molecule...)
- simulationStep, time interval between two step of the simulation
!

!Molecule commentStamp: '<historical>' prior: 0!
Model of a molecule in a gas simulation
!

!Wall commentStamp: '<historical>' prior: 0!
A wall modelised as a thick line between extremitoes 1 and 2.!

!MoleculeMorph commentStamp: '<historical>' prior: 0!
A view of a molecule in a simulation
 - model, a Molecule instance!

!WallMorph commentStamp: '<historical>' prior: 0!
A view of a wall in a simulation
 - model, a Wall instance!

!GasSimulationCanvas commentStamp: '<historical>' prior: 0!
This is where is represented and displayed the simulation.
No panne nor zoom in this simple canvas!

!GasSimulationView commentStamp: '<historical>' prior: 0!
The gas simulation view. My extent is computed depending on the installed walls in the simulation.
It comes with:
- a collection of buttons to pause/play the simulation
- a canvas to hold the simulation!

!GasSimulation methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:06:36 pm (UTC)'!
view
	^ view ifNil: [view := GasSimulationView presenter: self]! !

!GasSimulation methodsFor: 'DSL' stamp: 'hlsf 19/Nov/2025, 2:15:45 pm (UTC)'!
addMolecules: quantity
	model addMolecules: quantity at: nil! !

!GasSimulation methodsFor: 'DSL' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
addMolecules: quantity at: aPoint
	model addMolecules: quantity at: (aPoint ifNotNil: [GasSimulation pixelToModel: aPoint])! !

!GasSimulation methodsFor: 'DSL' stamp: 'hlsf 7/Dec/2025, 10:02:21 pm (UTC)'!
addWallFrom: extremity1 to: extremity2
"	Shift the wall position of the half width of the wall "
	model addWall: (Array 
		with: (GasSimulation pixelToModel: extremity1 +  (WallMorph thickness / 2.0) )
		with: (GasSimulation pixelToModel: extremity2 + (WallMorph thickness / 2.0) ) 
		)! !

!GasSimulation methodsFor: 'DSL' stamp: 'hlsf 7/Dec/2025, 9:13:16 pm (UTC)'!
fenceOrigin: origin corner: corner
	self addWallFrom: origin to: corner x @ origin y;
		addWallFrom: corner x @origin y to: corner;
		addWallFrom: corner to: origin x @ corner y;
		addWallFrom: origin x @ corner y to: origin! !

!GasSimulation methodsFor: 'initialization' stamp: 'hlsf 10/Dec/2025, 1:36:01 pm (UTC)'!
initialize
	model := GasSimulationModel new.
	playing := false.
	self simulationState ! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 11/Dec/2025, 8:46:22 am (UTC)'!
addTemperatureSensor
	self setSensorState.
	view canvas walls do: #lock.! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 11/Dec/2025, 8:35:02 am (UTC)'!
hideMeasuredArea
	self simulationState .
	view canvas sensorArea: nil.
	view canvas redrawNeeded ! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 19/Nov/2025, 2:31:36 pm (UTC)'!
playStopSimulation
	playing ifTrue: [view stopStepping] ifFalse: [view startStepping].
	playing := playing not.
	self changed: #isPlaying! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 11/Dec/2025, 8:37:22 am (UTC)'!
showMeasuredArea: measuredArea
" 	In world coordinates "
	self setSensorState.
	view canvas sensorArea: (GasSimulation rectModelToPixel: measuredArea).
	view canvas redrawNeeded ! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 4/Dec/2025, 9:03:07 am (UTC)'!
toggleIdealGas
	model idealGas: model idealGas not! !

!GasSimulation methodsFor: 'callback' stamp: 'hlsf 4/Dec/2025, 8:06:58 am (UTC)'!
toggleReinjecting
	model reinject: model reinject not! !

!GasSimulation methodsFor: 'testing' stamp: 'hlsf 4/Dec/2025, 9:02:48 am (UTC)'!
isIdealGas
	^ model idealGas ! !

!GasSimulation methodsFor: 'testing' stamp: 'hlsf 19/Nov/2025, 2:29:43 pm (UTC)'!
isPlaying
	^ playing ! !

!GasSimulation methodsFor: 'testing' stamp: 'hlsf 4/Dec/2025, 8:06:29 am (UTC)'!
isReinjecting
	^ model reinject! !

!GasSimulation methodsFor: 'testing' stamp: 'hlsf 10/Dec/2025, 1:35:23 pm (UTC)'!
isStateSetSensor
	^ state = #setSensor! !

!GasSimulation methodsFor: 'state' stamp: 'hlsf 10/Dec/2025, 1:34:57 pm (UTC)'!
setSensorState
	state := #setSensor! !

!GasSimulation methodsFor: 'state' stamp: 'hlsf 10/Dec/2025, 1:35:09 pm (UTC)'!
simulationState
	state := #simulation! !

!GasSimulation methodsFor: 'as yet unclassified' stamp: 'hlsf 11/Dec/2025, 8:48:58 am (UTC)'!
newSensorIn: rectangle
	view canvas walls do: #unlock.
	self simulationState.
	rectangle extent > (10@10) ifTrue: [view addSensorIn: rectangle]! !

!GasSimulation class methodsFor: 'DKM' stamp: 'hlsf 24/Dec/2025, 10:06:14 pm (UTC)'!
codeSample
	^ 'GasSimulation new
	fenceOrigin: 0@0 corner: 300@200;
	addWallFrom: 100@0 to: 80@85;
	addWallFrom: 100@200 to: 80@105;
	addMolecules: 50 ;
	view'! !

!GasSimulation class methodsFor: 'DKM' stamp: 'hlsf 23/Jan/2026, 12:15:26 pm (UTC)'!
description
	^ 'A simulation of ideal gas or real gas. The simulation takes place in a rectangular fence. Additional arbitrary walls can be arranged inside this fence. At running time, the user can adjust the temperature of each wall, including the fence, by consecutive mouse clics.' translated! !

!GasSimulation class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 9:47:56 pm (UTC)'!
svgIcon
	^'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!!--!!Font Awesome Free v5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M156.7 256H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h142.2c15.9 0 30.8 10.9 33.4 26.6 3.3 20-12.1 37.4-31.6 37.4-14.1 0-26.1-9.2-30.4-21.9-2.1-6.3-8.6-10.1-15.2-10.1H81.6c-9.8 0-17.7 8.8-15.9 18.4 8.6 44.1 47.6 77.6 94.2 77.6 57.1 0 102.7-50.1 95.2-108.6C249 291 205.4 256 156.7 256zM16 224h336c59.7 0 106.8-54.8 93.8-116.7-7.6-36.2-36.9-65.5-73.1-73.1-55.4-11.6-105.1 24.9-114.9 75.5-1.9 9.6 6.1 18.3 15.8 18.3h32.8c6.7 0 13.1-3.8 15.2-10.1C325.9 105.2 337.9 96 352 96c19.4 0 34.9 17.4 31.6 37.4-2.6 15.7-17.4 26.6-33.4 26.6H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16zm384 32H243.7c19.3 16.6 33.2 38.8 39.8 64H400c26.5 0 48 21.5 48 48s-21.5 48-48 48c-17.9 0-33.3-9.9-41.6-24.4-2.9-5-8.7-7.6-14.5-7.6h-33.8c-10.9 0-19 10.8-15.3 21.1 17.8 50.6 70.5 84.8 129.4 72.3 41.2-8.7 75.1-41.6 84.7-82.7C526 321.5 470.5 256 400 256z"/></svg>'! !

!GasSimulation class methodsFor: 'DKM' stamp: 'hlsf 23/Jan/2026, 12:12:28 pm (UTC)'!
title 
	^ 'Gas simulation' translated! !

!GasSimulation class methodsFor: 'convert' stamp: 'hlsf 4/Dec/2025, 7:42:00 am (UTC)'!
modelToPixel: aPosition
	^ aPosition / self scale! !

!GasSimulation class methodsFor: 'convert' stamp: 'hlsf 4/Dec/2025, 7:41:53 am (UTC)'!
pixelToModel: aPoint
	^ aPoint * self scale! !

!GasSimulation class methodsFor: 'convert' stamp: 'hlsf 10/Dec/2025, 7:09:53 pm (UTC)'!
rectModelToPixel: rect
	^ rect scaledBy: 1 / self scale! !

!GasSimulation class methodsFor: 'convert' stamp: 'hlsf 10/Dec/2025, 7:10:15 pm (UTC)'!
rectPixelToModel: rect
	^ rect scaledBy: self scale! !

!GasSimulation class methodsFor: 'convert' stamp: 'hlsf 7/Dec/2025, 9:19:58 pm (UTC)'!
scale
"	Length of one pixel in meter "
	^ 3e-11! !

!GasSimulationModel methodsFor: 'geometry' stamp: 'hlsf 16/Nov/2025, 9:45:43 am (UTC)'!
bounds
	^ Rectangle encompassing: self wallVertices :: encompass: 0@0! !

!GasSimulationModel methodsFor: 'geometry' stamp: 'hlsf 30/Nov/2025, 9:47:20 pm (UTC)'!
centerBounds
	| bounds |
	bounds := self bounds.
	^ bounds topLeft + bounds bottomRight / 2! !

!GasSimulationModel methodsFor: 'geometry' stamp: 'hlsf 6/Dec/2025, 1:06:24 pm (UTC)'!
isValidPosition: aPoint
" Does aPoint overlap any wall? "
	| realPositon minDist |
	realPositon := GasSimulation pixelToModel: aPoint.
	minDist := GasSimulationModel delta * 1.1.
	^ (walls noneSatisfy: [:aWall | aWall isOverlappedBy: aPoint ])
		and: [molecules noneSatisfy: [:aMolecule | (aMolecule position dist: realPositon) < minDist ] ]
			! !

!GasSimulationModel methodsFor: 'geometry' stamp: 'hlsf 6/Dec/2025, 1:11:11 pm (UTC)'!
pixelExtent
	^ pixelExtent ifNil: [pixelExtent := (GasSimulation modelToPixel: self bounds extent) rounded]! !

!GasSimulationModel methodsFor: 'geometry' stamp: 'hlsf 16/Nov/2025, 9:39:38 am (UTC)'!
wallVertices
	^ (walls collect: [:aWall | aWall vertices]) flatten! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
addMolecules: quantity at: aPosition
	| position |
	walls ifEmpty: [self error: 'Set the walls of the simulation first'].
	quantity timesRepeat: [
		position := aPosition ifNil: [self suitablePositionForMolecule].
		molecules add: (Molecule new position: (GasSimulation pixelToModel: position) ) ]! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 3:50:40 pm (UTC)'!
addWall: array
	walls add: (Wall new vertices: array)! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 4/Dec/2025, 9:01:35 am (UTC)'!
idealGas
	^ idealGas ! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:08:24 pm (UTC)'!
idealGas: boolean
	idealGas := boolean! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 17/Nov/2025, 8:14:23 pm (UTC)'!
molecules
	^ molecules ! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 4/Dec/2025, 8:01:48 am (UTC)'!
reinject
" Some molecule may escape de the fence, do we reinject them within the fence "
	^ reinject ! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 4/Dec/2025, 8:01:57 am (UTC)'!
reinject: boolean
	reinject := boolean ! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 30/Nov/2025, 12:37:26 pm (UTC)'!
simulationStep
	^ simulationStep! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 4:15:14 pm (UTC)'!
simulationStep: float
	simulationStep := float! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:10:45 pm (UTC)'!
suitablePositionForMolecule
	| position |
	[position := self pixelExtent x atRandom @ self pixelExtent y atRandom.
	self isValidPosition: position ] whileFalse.
	^ position! !

!GasSimulationModel methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 10:38:02 am (UTC)'!
walls
	^ walls! !

!GasSimulationModel methodsFor: 'initialization' stamp: 'hlsf 6/Dec/2025, 1:08:16 pm (UTC)'!
initialize
	walls := OrderedCollection new.
	molecules := OrderedCollection new.
	reinject := true.
	simulationStep := 1.0e-14.
	idealGas := true! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 10/Dec/2025, 5:26:16 pm (UTC)'!
energy
	^ self energyOf: molecules! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 10/Dec/2025, 5:26:03 pm (UTC)'!
energyOf: someMolecules
	^ someMolecules inject: 0 into: [: theEnergy :aMolecule| 
		theEnergy + (0.5 * Molecule mass * (aMolecule velocity dotProduct: aMolecule velocity) )]! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 6/Dec/2025, 1:06:24 pm (UTC)'!
forcesOn: aMolecule
	| r rVector val e24 potentialMolecules cutOff |
	cutOff := GasSimulationModel cutOff squared.
	e24 := GasSimulationModel E₀ * 24.
	potentialMolecules := molecules select: [:anotherMolecule | | dist |
		dist := aMolecule position squaredDistanceTo: anotherMolecule position.
		anotherMolecule ~= aMolecule 
			and: [dist < cutOff
			and: [dist ~= 0] ] ].
	^ potentialMolecules inject: 0@0 into: [:subForces :nextMolecule | 
		rVector := aMolecule position - nextMolecule position.
		r := rVector r.
		val := (GasSimulationModel delta / r) raisedToInteger: 6. 
		subForces + ((e24 / r) *val * (2 * val -1) * rVector / r) ]
	! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 6/Dec/2025, 1:06:24 pm (UTC)'!
temperature
	^ self energy / (GasSimulationModel kb * molecules size)! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 10/Dec/2025, 7:29:49 pm (UTC)'!
temperatureIn: aRectangle
	| moleculesInArea |
	moleculesInArea := molecules select: [:molecule | aRectangle containsPoint: molecule position].
	^ moleculesInArea 
		ifEmpty: [0]  
		ifNotEmpty: [ 
			(self energyOf: moleculesInArea) / (GasSimulationModel kb * moleculesInArea size)]! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 8/Dec/2025, 7:55:01 pm (UTC)'!
updateIdealGasSimulation
	| bounds |
	walls do: #reset.
	bounds := self bounds.
	molecules do: [:molecule | | newPosition |
		newPosition := molecule forwardPosition: simulationStep.
		walls 
			detect:  [:aWall | aWall collidedByTrajectory: molecule position to: newPosition]
			ifFound: [:collidedWall | collidedWall bounce: molecule over: newPosition with: simulationStep]
			ifNone: [molecule position: newPosition].
		(reinject and: [(bounds containsPoint: molecule position) not]) 
			ifTrue: [molecule position: (GasSimulation pixelToModel: self suitablePositionForMolecule) ] ]
! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 6/Dec/2025, 1:18:48 pm (UTC)'!
updateRealGas: molecule
"
	v1 : v(t + δt / 2)
"
	| v1 a |
	a := molecule force / Molecule mass.
	v1 := molecule velocity +  (a * simulationStep / 2).
	molecule position: molecule position + (v1 * simulationStep).
	molecule force: (self forcesOn: molecule).
	a := molecule force / Molecule mass.
	molecule velocity: v1 + (a * simulationStep / 2)
	
	! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 8/Dec/2025, 8:03:37 pm (UTC)'!
updateRealGasSimulation
	| bounds |
	walls do: #reset.
	bounds := self bounds.
	molecules do: [:molecule | | newPosition |
		newPosition := molecule forwardPosition: simulationStep.
		walls 
			detect:  [:aWall | aWall collidedByTrajectory: molecule position to: newPosition]
			ifFound: [:collidedWall | collidedWall bounce: molecule over: newPosition with: simulationStep]
			ifNone: [	self updateRealGas: molecule].
		(reinject and: [(bounds containsPoint: molecule position) not]) 
			ifTrue: [ " likely got creazy, calm it down if needed "
				molecule velocity r > 500 ifTrue: [molecule initialize].
				molecule position: (GasSimulation pixelToModel: self suitablePositionForMolecule) ] ]
	
	
	! !

!GasSimulationModel methodsFor: 'model' stamp: 'hlsf 4/Dec/2025, 9:02:10 am (UTC)'!
updateSimulation
	idealGas 
		ifFalse: [self updateRealGasSimulation]
		ifTrue: [self updateIdealGasSimulation ]
	
	! !

!GasSimulationModel class methodsFor: 'constants' stamp: 'hlsf 3/Dec/2025, 8:02:48 pm (UTC)'!
E₀ 
"	ε : depth of the potential well "
	^ 1.66e-21! !

!GasSimulationModel class methodsFor: 'constants' stamp: 'hlsf 4/Dec/2025, 7:50:50 am (UTC)'!
cutOff
"	Cut off distance, potential is considered zero over that distance ≈ 10e-9 m  "
	^ 3 * self delta 
! !

!GasSimulationModel class methodsFor: 'constants' stamp: 'hlsf 30/Nov/2025, 9:39:29 am (UTC)'!
delta
"	δ : distance at which the molecule-molecule potential energy is zero "
	^ 3.4e-10! !

!GasSimulationModel class methodsFor: 'constants' stamp: 'hlsf 30/Nov/2025, 9:39:23 am (UTC)'!
epsilon
"	ε : depth of the potential well "
	^ 1.66e-21! !

!GasSimulationModel class methodsFor: 'constants' stamp: 'hlsf 27/Nov/2025, 7:29:30 pm (UTC)'!
kb
" Boltzmann constant "
	^ 1.3806e-23! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 3/Dec/2025, 8:22:44 pm (UTC)'!
force
	^ force! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 3/Dec/2025, 9:15:26 pm (UTC)'!
force: aVector
"force print."
	force := aVector .! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 2:24:05 pm (UTC)'!
position
	^ position! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 2:23:32 pm (UTC)'!
position: aPoint
	position := aPoint ! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 22/Nov/2025, 8:15:25 am (UTC)'!
velocity 
	^ velocity ! !

!Molecule methodsFor: 'accessing' stamp: 'hlsf 30/Nov/2025, 8:20:04 pm (UTC)'!
velocity: aVector
	velocity := aVector ! !

!Molecule methodsFor: 'initialization' stamp: 'hlsf 5/Dec/2025, 10:24:57 pm (UTC)'!
initialize
	| a |
	a := Random next * Float twoPi.
	velocity := (a cos @ a sin) * (340 + (0.5 - Random next * 20)). 
	force := 0@0.! !

!Molecule methodsFor: 'printing' stamp: 'hlsf 22/Nov/2025, 8:14:58 am (UTC)'!
printOn: aStream
	aStream nextPutAll: 'Molecule :: ('.
	position x printOn: aStream fractionDigits: 1.
	aStream nextPutAll: ' ; '.
	position y printOn: aStream fractionDigits: 1.
	aStream nextPutAll: ') v=('.
	velocity x printOn: aStream fractionDigits: 1.
	aStream nextPutAll: ' ; '.
	velocity y printOn: aStream fractionDigits: 1.
	aStream nextPut: $).! !

!Molecule methodsFor: 'model' stamp: 'hlsf 22/Nov/2025, 8:20:33 am (UTC)'!
forwardPosition: t
	^ velocity * t + position! !

!Molecule methodsFor: 'model' stamp: 'hlsf 22/Nov/2025, 8:18:26 am (UTC)'!
updatePositionAt: t from: aPosition
	position := t * velocity + aPosition ! !

!Molecule class methodsFor: 'constants' stamp: 'hlsf 5/Dec/2025, 8:43:16 pm (UTC)'!
mass
" Argon atom mass kg "
	^  6.6335e-26! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 23/Nov/2025, 9:19:14 am (UTC)'!
bounced
	^ bounced! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 10:46:01 am (UTC)'!
extremity1
	^ extremity1 ! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 10:46:03 am (UTC)'!
extremity2
	^ extremity2! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 22/Nov/2025, 7:48:24 am (UTC)'!
heating
	^ heating! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:06:24 pm (UTC)'!
heating: index
	heating := index.
	speedT := (2 * GasSimulationModel kb * self temperature / Molecule mass) sqrt! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 27/Nov/2025, 8:59:05 am (UTC)'!
incrHeating
"	heating ∈ [1 ; 5]. 
	Cycle in this interval "
	self heating: heating \\ 5 + 1! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 27/Nov/2025, 8:32:09 am (UTC)'!
temperature
	^ self temperatures at: heating! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 10:44:43 am (UTC)'!
vertices
	^ Array with: extremity1 with: extremity2! !

!Wall methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 5:42:51 pm (UTC)'!
vertices: array
	extremity1 := array first.
	extremity2 := array second.
	director := (extremity2 - extremity1) normalized.
	normal := director y negated @ director x! !

!Wall methodsFor: 'testing' stamp: 'hlsf 16/Nov/2025, 5:03:08 pm (UTC)'!
collidedByTrajectory: position1 to: position2
	^ extremity1 to: extremity2 intersects: position1 to: position2 ! !

!Wall methodsFor: 'testing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
isOverlappedBy: aPoint
" 	Checking done in the screen coordinates system (pixels) "
	^ aPoint 
		onLineFrom: (GasSimulation modelToPixel: extremity1)
		to: (GasSimulation modelToPixel: extremity2)
		within: WallMorph thickness + MoleculeMorph radius! !

!Wall methodsFor: 'helpers' stamp: 'hlsf 16/Nov/2025, 5:11:05 pm (UTC)'!
lineEquationParameters: point along: direction
" Given a point and a direction (vector) determine the cartesian equation parameter 
of the line going through a point and in a direction
Returns the parameters a, b and c of the equation ax + by + c = 0"
	^ Array 
		with: direction y 
		with: 0 - direction x 
		with: point y * direction x - (point x * direction y)! !

!Wall methodsFor: 'helpers' stamp: 'hlsf 30/Nov/2025, 6:52:52 pm (UTC)'!
linesIntersectionOf: para1 and: para2
" Intersection between two lines charactersized by their equation parameters ax + by + c = 0 "
	| det |
	det := para2 first * para1 second - (para1 first * para2 second).
	(det  - 0) abs < 1e-100 ifTrue: [ ^ nil].
	^ Point
		x: para1 third  * para2 second - (para1 second * para2 third) / det
		y: para1 first * para2 third - (para1 third * para2 first) / det! !

!Wall methodsFor: 'model' stamp: 'hlsf 30/Nov/2025, 8:10:28 pm (UTC)'!
bounce: molecule over: newPosition with: timeInterval
	| collision t1 |
	collision := self intersectionWithTrajectory: molecule position to: newPosition. 
	collision ifNil: [^ molecule velocity: molecule velocity * (0.8@1.1)].
	bounced := true.
	t1 := (collision - molecule position) r / molecule velocity r.
	self diffuseBouncingVelocity: molecule.
	molecule updatePositionAt: timeInterval - t1 from: collision
! !

!Wall methodsFor: 'model' stamp: 'hlsf 27/Nov/2025, 5:23:34 pm (UTC)'!
diffuseBouncingVelocity: molecule
	| a b myNormal newVelocity |
	myNormal := (molecule velocity dotProduct: normal) < 0 
		ifTrue: [normal negated] 
		ifFalse: [normal].
	a := (Random next ln negated) sqrt * (Float twoPi * Random next) cos * speedT.
	b := (Random next ln negated) sqrt * speedT.
	newVelocity  := a * director - (b * myNormal ).
	molecule velocity: newVelocity ! !

!Wall methodsFor: 'model' stamp: 'hlsf 18/Nov/2025, 7:35:55 pm (UTC)'!
intersectionWithTrajectory: position1 to: position2
	^ self 
		linesIntersectionOf: (self lineEquationParameters: extremity1 along: extremity2 - extremity1)
		and: (self lineEquationParameters: position1 along: position2 - position1)! !

!Wall methodsFor: 'model' stamp: 'hlsf 27/Nov/2025, 8:39:21 am (UTC)'!
stupidBouncingVelocity: molecule
	| a b newVelocity |
	a := molecule velocity dotProduct: director.
	b := molecule velocity dotProduct: normal.
	newVelocity  := a * director - (b * normal).
"	Make the direction to fluctuate of 10 degrees maximum"
	newVelocity := Point r: newVelocity r degrees: newVelocity degrees + (20 atRandom -10).
"	Apply the energy transfer "
	newVelocity := newVelocity * (1 + (heating * 2  / 10)).
"	Velocity remains below 500m/s "
	(newVelocity dotProduct: newVelocity) > `500 squared` 
		ifTrue: [ newVelocity := newVelocity normalized * 500].
	molecule velocity: newVelocity ! !

!Wall methodsFor: 'model' stamp: 'hlsf 27/Nov/2025, 9:05:46 am (UTC)'!
temperatures
	^ `Array 
		with:  273.15 + (-273)
		with:  273.15 + (-100)
		with:  273.15 + (0)
		with:  273.15 + (20)
		with: 273.15 + (50)`! !

!Wall methodsFor: 'initialization' stamp: 'hlsf 27/Nov/2025, 8:55:58 am (UTC)'!
initialize
	self heating: 3.
	bounced := false! !

!Wall methodsFor: 'initialization' stamp: 'hlsf 23/Nov/2025, 9:17:06 am (UTC)'!
reset
	bounced := false! !

!Wall methodsFor: 'printing' stamp: 'hlsf 27/Nov/2025, 7:13:44 pm (UTC)'!
printOn: aStream
	aStream nextPutAll: 'Wall :: '.
	extremity1 printOn: aStream.
	aStream nextPutAll: ' → '.
	extremity2 printOn: aStream .
	aStream nextPutAll: ', T = '.
	self temperature printOn: aStream .
	aStream nextPutAll: 'K'.
	! !

!MoleculeMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 17/Nov/2025, 8:10:35 pm (UTC)'!
model: aMolecule
	model := aMolecule ! !

!MoleculeMorph methodsFor: 'drawing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
drawOn: canvas
	canvas 
		ellipseCenter: (GasSimulation modelToPixel: model position) 
		radius: MoleculeMorph radius 
		borderWidth: 0 
		borderColor: nil 
		fillColor: Color green! !

!MoleculeMorph class methodsFor: 'as yet unclassified' stamp: 'hlsf 30/Nov/2025, 8:54:36 am (UTC)'!
radius
	^ 3! !

!WallMorph methodsFor: 'drawing' stamp: 'hlsf 5/Dec/2025, 10:27:23 pm (UTC)'!
drawOn: canvas
	canvas line: self extremity1 to: self extremity2 width: WallMorph thickness color: ((self colors at: model heating) alpha: 0.8).
	model bounced ifTrue: [
		canvas line: self extremity1 to: self extremity2 width: 1 color: (self bounceColors at: model heating)]! !

!WallMorph methodsFor: 'accessing' stamp: 'hlsf 23/Nov/2025, 9:21:53 am (UTC)'!
bounceColors
	^ `Array 
		with: Color blue muchLighter 
		with: Color blue 
		with: Color white
		with: Color red 
		with: Color red muchLighter `! !

!WallMorph methodsFor: 'accessing' stamp: 'hlsf 24/Dec/2025, 10:03:43 am (UTC)'!
colors
	^ `Array 
		with: Color blue 
		with: Color blue muchLighter 
		with: Color gray muchLighter
		with:  Color red muchLighter 
		with: Color red`! !

!WallMorph methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
extremity1
	^ GasSimulation modelToPixel: model extremity1 ! !

!WallMorph methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
extremity2
	^ GasSimulation modelToPixel: model extremity2! !

!WallMorph methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 10:39:48 am (UTC)'!
model: wall
	model := wall ! !

!WallMorph methodsFor: 'event handling testing' stamp: 'hlsf 22/Nov/2025, 7:43:25 am (UTC)'!
handlesMouseDown:  event 
	^ true! !

!WallMorph methodsFor: 'initialization' stamp: 'hlsf 22/Nov/2025, 7:47:33 am (UTC)'!
initialize
	super initialize.
	heating := 0! !

!WallMorph methodsFor: 'events' stamp: 'hlsf 22/Nov/2025, 7:56:01 am (UTC)'!
mouseButton1Down: aEvent localPosition: aPosition 
"mouse click on the wall increase the heating parameter "
	model incrHeating.
	self redrawNeeded ! !

!WallMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 11/Dec/2025, 8:43:46 am (UTC)'!
is: aSymbol
	^ aSymbol == #WallMorph or: [super is: aSymbol ]! !

!WallMorph class methodsFor: 'as yet unclassified' stamp: 'hlsf 30/Nov/2025, 8:55:18 am (UTC)'!
thickness
	^ 10! !

!GasSimulationCanvas methodsFor: 'accessing' stamp: 'hlsf 10/Dec/2025, 7:41:08 pm (UTC)'!
initialize
	super initialize.
	self color: Color black.
	sensorArea := nil! !

!GasSimulationCanvas methodsFor: 'accessing' stamp: 'hlsf 10/Dec/2025, 1:22:51 pm (UTC)'!
presenter: aPresenter
	presenter := aPresenter ! !

!GasSimulationCanvas methodsFor: 'accessing' stamp: 'hlsf 11/Dec/2025, 8:34:06 am (UTC)'!
sensorArea: aRectangle
" 	In pixel coordinates "
	sensorArea := aRectangle ! !

!GasSimulationCanvas methodsFor: 'accessing' stamp: 'hlsf 11/Dec/2025, 8:49:25 am (UTC)'!
walls
	^ submorphs select: [:m | m is: #WallMorph]! !

!GasSimulationCanvas methodsFor: 'drawing' stamp: 'hlsf 10/Dec/2025, 7:41:16 pm (UTC)'!
drawOn: canvas
	super drawOn: canvas.
	 (presenter isStateSetSensor and: [sensorArea notNil])
		ifTrue: [canvas frameRectangle: sensorArea borderWidth: 2 color: Color white]! !

!GasSimulationCanvas methodsFor: 'event handling testing' stamp: 'hlsf 10/Dec/2025, 1:33:42 pm (UTC)'!
handlesMouseDown: aMouseButtonEvent
	^ presenter isStateSetSensor ! !

!GasSimulationCanvas methodsFor: 'events' stamp: 'hlsf 10/Dec/2025, 7:52:26 pm (UTC)'!
mouseButton1Down: event localPosition: localPosition 
	sensorArea := localPosition corner: localPosition ! !

!GasSimulationCanvas methodsFor: 'events' stamp: 'hlsf 11/Dec/2025, 8:48:55 am (UTC)'!
mouseButton1Up: event localPosition: localPosition 
	presenter isStateSetSensor ifFalse: [^ self].
	sensorArea := Rectangle origin: sensorArea origin corner: localPosition.
	presenter newSensorIn: sensorArea.
	sensorArea := nil.
	self redrawNeeded ! !

!GasSimulationCanvas methodsFor: 'events' stamp: 'hlsf 10/Dec/2025, 7:50:47 pm (UTC)'!
mouseMove: event localPosition: localPosition
	(event anyButtonPressed and: [presenter isStateSetSensor]) ifFalse: [^ self].
	sensorArea := Rectangle origin: sensorArea origin corner: localPosition.
	self redrawNeeded ! !

!GasSimulationCanvas class methodsFor: 'as yet unclassified' stamp: 'hlsf 10/Dec/2025, 1:22:32 pm (UTC)'!
presenter: aPresenter
	^ self basicNew
		presenter: aPresenter;
		initialize;
		yourself! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 1:05:59 pm (UTC)'!
bounds
	| modelBounds |
	modelBounds := self model bounds.
	^ Rectangle 
		origin: (GasSimulation modelToPixel: modelBounds origin)
		corner: (GasSimulation modelToPixel: modelBounds corner)! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 11/Dec/2025, 8:27:54 am (UTC)'!
canvas
	^ canvas! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 19/Nov/2025, 2:06:03 pm (UTC)'!
defaultBorderWidth
	^ 10 ! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 9:25:50 am (UTC)'!
model
	^ presenter model! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 6/Dec/2025, 3:06:57 pm (UTC)'!
presenter
	^ presenter! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 16/Nov/2025, 9:21:12 am (UTC)'!
presenter: aPresenter
	presenter := aPresenter ! !

!GasSimulationView methodsFor: 'accessing' stamp: 'hlsf 11/Dec/2025, 8:10:59 am (UTC)'!
temperatureString
	^ String streamContents: [:str |
		str nextPutAll: 'Temperature: '.
		self model temperature rounded printOn: str.
		str nextPutAll: ' K']! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 10/Dec/2025, 7:28:57 pm (UTC)'!
addSensorIn: rectangle
	| temperatureView |
	temperatureView := TemperatureSensor presenter: presenter.
	temperatureView measuredArea: (GasSimulation rectPixelToModel: rectangle).
	temperatureViews addMorph: temperatureView ! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 3/Aug/2026, 1:06:47 pm (UTC)'!
defaultColor
	^ Theme current paneBackgroundFrom: self defaultBorderColor ! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 3/Aug/2026, 1:27:53 pm (UTC)'!
initialize
	super initialize.
	self beRow.
	self padding: 4@5; gap: 10.
	self addMorph: self simulationView ;
		addMorph: self temperatureViews layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0)! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 8/Dec/2025, 8:58:32 pm (UTC)'!
installButtons
	| row |
	row := LayoutMorph newRow.
	row
		addMorph: (PluggableButtonMorph model: presenter stateGetter: #isReinjecting action: #toggleReinjecting label: 'Re-inject');
		addMorph: (PluggableButtonMorph model: presenter stateGetter: #isIdealGas action: #toggleIdealGas label: 'Ideal Gas');
		addMorph: (PluggableButtonMorph model: presenter stateGetter: #isPlaying action: #playStopSimulation label: 'Play').
	^ row
	! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 10/Dec/2025, 1:24:09 pm (UTC)'!
simulationView
	| view |
	canvas := GasSimulationCanvas presenter: presenter ::
		morphExtent: self bounds corner + WallMorph thickness - 2.
	view := LayoutMorph newColumn.
	view 
		addMorph: canvas layoutSpec: LayoutSpec keepMorphExtent;
		addMorph: self installButtons layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0).
	self model molecules do: [:aMolecule | canvas addMorph: (MoleculeMorph new model: aMolecule) ].
	self model walls do: [:aWall | canvas addMorph: (WallMorph new model: aWall)].
	^ view! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 9/Dec/2025, 4:46:33 pm (UTC)'!
temperatureSensorAt: aRectangle! !

!GasSimulationView methodsFor: 'initialization' stamp: 'hlsf 11/Dec/2025, 8:57:16 am (UTC)'!
temperatureViews
	| label row btn |
	temperatureViews := LayoutMorph newColumn.
	row := LayoutMorph newRow.
	label := UpdatingLabelMorph new
		target: self;
		getSelector: #temperatureString;
		emphasis: 1;
		stepTime: 1000.
	btn := PluggableButtonMorph model: presenter action:  #addTemperatureSensor ::
		setBalloonText: 'Add a temperature sensor for a designated rectangular area.' translated;
		icon: Theme current listAddIcon;
		buttonStyle: #none.
	row gap: 5;
		addMorph: btn layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0);
		addMorphUseAll: label.
	temperatureViews addMorph: row.
	^ temperatureViews! !

!GasSimulationView methodsFor: 'stepping' stamp: 'hlsf 3/Dec/2025, 7:22:19 pm (UTC)'!
step
	self model updateSimulation.
	self redrawNeeded ! !

!GasSimulationView methodsFor: 'stepping' stamp: 'hlsf 5/Dec/2025, 9:17:31 pm (UTC)'!
stepTime
" Update the view every 100 millisecond, 0.1 s "
	^ 10! !

!GasSimulationView class methodsFor: 'instance creation' stamp: 'hlsf 16/Nov/2025, 9:20:42 am (UTC)'!
presenter: aPresenter
	^ self basicNew
		presenter: aPresenter;
		initialize;
		yourself! !

!TemperatureSensor methodsFor: 'accessing' stamp: 'hlsf 9/Dec/2025, 4:57:36 pm (UTC)'!
measuredArea: aRectangle
" 	In model coordinates "
	measuredArea := aRectangle ! !

!TemperatureSensor methodsFor: 'accessing' stamp: 'hlsf 9/Dec/2025, 4:54:19 pm (UTC)'!
presenter: aPresenter
	presenter := aPresenter ! !

!TemperatureSensor methodsFor: 'accessing' stamp: 'hlsf 10/Dec/2025, 7:04:59 pm (UTC)'!
simulationModel
	^ presenter model! !

!TemperatureSensor methodsFor: 'accessing' stamp: 'hlsf 10/Dec/2025, 7:14:58 pm (UTC)'!
temperatureString
	^ String streamContents: [:str |
		str nextPutAll: 'temperature: '.
		(self simulationModel temperatureIn: measuredArea) rounded printOn: str.
		str nextPutAll: ' K']! !

!TemperatureSensor methodsFor: 'callback' stamp: 'hlsf 11/Dec/2025, 8:56:13 am (UTC)'!
removeSensor
	| theColumn |
	theColumn := owner.
	owner removeMorph: self.
	theColumn morphExtent: theColumn minimumExtent ! !

!TemperatureSensor methodsFor: 'initialization' stamp: 'hlsf 11/Dec/2025, 8:21:03 am (UTC)'!
initialize
	| deleteBtn |
	super initialize.
	self beRow;
		gap: 4.
	deleteBtn := PluggableButtonMorph model: self action: #removeSensor :: 
		icon: Theme current deleteIcon ;
		buttonStyle: #none;
		setBalloonText: 'Remove this temperature sensor.' translated.
	self addMorphUseAll: self temperatureLabel;
		addMorph: deleteBtn layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0)! !

!TemperatureSensor methodsFor: 'initialization' stamp: 'hlsf 11/Dec/2025, 8:37:08 am (UTC)'!
temperatureLabel
	| label |

	label := UpdatingLabelMorph new
		target: self;
		getSelector: #temperatureString;
		stepTime: 1000.
	label setProperty: #'handlesMouseOver:' toValue: true.
	label setProperty: #'mouseEnter:' toValue: [:event | presenter showMeasuredArea: measuredArea].
	label setProperty: #'mouseLeave:' toValue: [:event | presenter hideMeasuredArea].
	^ label ! !

!TemperatureSensor class methodsFor: 'as yet unclassified' stamp: 'hlsf 9/Dec/2025, 4:53:42 pm (UTC)'!
presenter: aPresenter
	^ self basicNew 
		presenter: aPresenter;
		initialize;
		yourself! !
