'From Cuis7.9 [latest update: #8266] on 10 October 2026 at 1:25:22 pm'!
'Description '!
!provides: 'DKM-History-Timeline' 1 23!
!requires: 'UI-Widgets' 1 75 nil!
!requires: 'DKM-Core' 1 17 nil!
SystemOrganization addCategory: #'DKM-History-Timeline'!


!classDefinition: #Timeline category: #'DKM-History-Timeline'!
DKMCanvasPresenter subclass: #Timeline
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'Timeline class' category: #'DKM-History-Timeline'!
Timeline class
	instanceVariableNames: ''!

!classDefinition: #TimelineEntry category: #'DKM-History-Timeline'!
Object subclass: #TimelineEntry
	instanceVariableNames: 'date description position image imageUrl'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineEntry class' category: #'DKM-History-Timeline'!
TimelineEntry class
	instanceVariableNames: ''!

!classDefinition: #TimelineGraduation category: #'DKM-History-Timeline'!
Object subclass: #TimelineGraduation
	instanceVariableNames: 'interval'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineGraduation class' category: #'DKM-History-Timeline'!
TimelineGraduation class
	instanceVariableNames: ''!

!classDefinition: #TimelineModel category: #'DKM-History-Timeline'!
DKMCanvasModel subclass: #TimelineModel
	instanceVariableNames: 'entries graduation subGraduation ppd temporalGaps shrink'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineModel class' category: #'DKM-History-Timeline'!
TimelineModel class
	instanceVariableNames: ''!

!classDefinition: #TimelineConnector category: #'DKM-History-Timeline'!
PlacedMorph subclass: #TimelineConnector
	instanceVariableNames: 'entryView'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineConnector class' category: #'DKM-History-Timeline'!
TimelineConnector class
	instanceVariableNames: ''!

!classDefinition: #TimelineCanvas category: #'DKM-History-Timeline'!
DKMCanvas subclass: #TimelineCanvas
	instanceVariableNames: 'font drawnGrads'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineCanvas class' category: #'DKM-History-Timeline'!
TimelineCanvas class
	instanceVariableNames: ''!

!classDefinition: #TimelineView category: #'DKM-History-Timeline'!
DKMCanvasView subclass: #TimelineView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineView class' category: #'DKM-History-Timeline'!
TimelineView class
	instanceVariableNames: ''!

!classDefinition: #TimelineEntryView category: #'DKM-History-Timeline'!
LinearLayoutMorph subclass: #TimelineEntryView
	instanceVariableNames: 'model date description position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-History-Timeline'!
!classDefinition: 'TimelineEntryView class' category: #'DKM-History-Timeline'!
TimelineEntryView class
	instanceVariableNames: ''!


!Timeline commentStamp: '<historical>' prior: 0!
Copyright 2025-2026 Hilaire Fernandes

The presenter of the Timeline to handle the controllers and associated callbacks.

(Timeline title: 'History of Book' ::
	event: 'Spain. Angela Ruiz Robles prototyped the first electronic book device with film rolls.China. Gong Xuanyi first known printer with a wood printing device on paper.' on: '480.1.1';
	event: 'Germany. Gutemberg printing press with metal mobile blocks.' on: '1450.1.1';
	event: 'Spain. Angela Ruiz Robles prototyped the first electronic book device with film rolls.' on: '1949.12.7';
	view) openInWorld.

((Timeline title: 'History of Book' ::
	event: 'Spain. Angela Ruiz Robles prototyped the first electronic book device with film rolls.China. Gong Xuanyi first known printer with a wood printing device on paper.' on: '480.1.1';
	event: 'Germany. Gutemberg printing press with metal mobile blocks.' on: '1450.1.1';
	event: 'Spain. Angela Ruiz Robles prototyped the first electronic book device with film rolls.' on: '1949.12.7';
	view) embeddedInMorphicWindowLabeled: 'History of Book') openInWorld!

!TimelineEntry commentStamp: '<historical>' prior: 0!
A model of an entry in the timeline!

!TimelineGraduation commentStamp: '<historical>' prior: 0!
A graduation on the timeline. 
- interval: a duration, the time distance between two consecutive tick on the timeline!

!TimelineModel commentStamp: '<historical>' prior: 0!
- entries, a collection of models (timeline entry)
- temporalGaps: indexes of event with temporal gap with its chronologically previous event!

!TimelineCanvas commentStamp: '<historical>' prior: 0!
The place where is effectively drawn the timeline. 
Its extent covers the whole area of the timeline. Therefore it may be larger than its owner or the screen. It is scrolled or zoomed appropriately with two wheel handles.
!

!TimelineView commentStamp: '<historical>' prior: 0!
Timeline view, it comes with:
- two wheels to move and to zoom the timeline
- a representation of the timeline!

!TimelineEntryView commentStamp: '<historical>' prior: 0!
A view of a timeline entry.
- model, a timeline entry
- date, a label morph
- description, a text paragraph morph
- position, a symbol (#above #below), indicating my positionning to the time line!

!Timeline methodsFor: 'DSL' stamp: 'hlsf 10/Oct/2026, 10:36:25 am (UTC)'!
event: aText on: aStringDate
	^ self event: aText on: aStringDate image: nil! !

!Timeline methodsFor: 'DSL' stamp: 'hlsf 10/Oct/2026, 10:36:19 am (UTC)'!
event: aText on: aStringDate image: anUrl
" aStringDate, preferably expressed as YYYY-MM-DD YYYY.MM.DD YYYY/MM/DD   "
	| entry |
	entry := TimelineEntry new
		description: aText;
		imageUrl: anUrl;
		date: aStringDate asDate.
	^ model addEntry: entry
	! !

!Timeline methodsFor: 'DSL' stamp: 'hlsf 9/Oct/2025, 8:22:33 am (UTC)'!
shrink
" Timeline spaning over long periods of time can be shrinked.
  These periods are then represented as dots in the timeline."
	model shrink ! !

!Timeline methodsFor: 'DSL' stamp: 'hlsf 9/Oct/2025, 8:22:43 am (UTC)'!
unshrink
" Timeline spaning over long periods of time can be shrinked.
  These periods are then represented as dots in the timeline."
	model unshrink ! !

!Timeline methodsFor: 'initialization' stamp: 'hlsf 24/Dec/2025, 10:25:22 am (UTC)'!
initialize
	model := TimelineModel new.
	view := TimelineView presenter: self! !

!Timeline class methodsFor: 'AI' stamp: 'hlsf 10/Oct/2026, 10:36:57 am (UTC)'!
codeSampleForAI 
	^'| myTimeline |
myTimeline := Timeline title: ''History of Book''.
myTimeline 
	event: ''China. Gong Xuanyi first known printer with a wood printing device on paper.'' on: ''480.1.1'';
	event: ''Germany. Gutemberg printing press with metal mobile blocks.'' on: ''1450.1.1'';
	color: Color blue.
"To shrink too long timeline"
myTimeline shrink.
"To not shrink timeline"
myTimeline unshrink.
myTimeline view'
! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 10/Oct/2026, 10:36:40 am (UTC)'!
codeSample
	^'Timeline title: ''History of Book'' ::
	event: ''China. Gong Xuanyi first known printer with a wood printing device on paper.'' on: ''480.1.1'';
	event: ''Germany. Gutemberg printing press with metal mobile blocks.'' on: ''1450.1.1'';
	event: ''Spain. Angela Ruiz Robles prototyped the first electronic book device with film rolls.'' on: ''1949.12.7'';
	shrink;
	color: Color black;
	view'! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 12/Oct/2025, 10:36:21 am (UTC)'!
description
	^ 'Design historical timeline with a collection of events. Each event contains a date and a textual description.'  translated! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:25:52 pm (UTC)'!
menu: menuBuilder
	<timeline>
"	Set the right model, menuBuilder is initialized with the view as a model, 
	commands handled by presenter "
	menuBuilder model: menuBuilder model presenter.
	menuBuilder newEntry: #shrink ::
		label: 'Shrink timeline' translated;
		selector: #shrink;
		order: 10.
	menuBuilder newEntry: #unshrink ::
		label: 'Expand timeline' translated;
		selector: #unshrink;
		order: 20! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 29/Nov/2025, 4:10:06 pm (UTC)'!
pragmaMenu
	^ #timeline! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 12/Oct/2025, 10:33:14 am (UTC)'!
svgIcon
	^'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!!--!!Font Awesome Free v7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M160 169.3c28.3-12.3 48-40.5 48-73.3 0-44.2-35.8-80-80-80S48 51.8 48 96c0 32.8 19.7 61 48 73.3l0 54.7-64 0c-17.7 0-32 14.3-32 32s14.3 32 32 32l224 0 0 54.7c-28.3 12.3-48 40.5-48 73.3 0 44.2 35.8 80 80 80s80-35.8 80-80c0-32.8-19.7-61-48-73.3l0-54.7 224 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0 0-54.7c28.3-12.3 48-40.5 48-73.3 0-44.2-35.8-80-80-80s-80 35.8-80 80c0 32.8 19.7 61 48 73.3l0 54.7-256 0 0-54.7z"/></svg>'! !

!Timeline class methodsFor: 'DKM' stamp: 'hlsf 12/Oct/2025, 10:33:50 am (UTC)'!
title
	^ 'Timeline' translated! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 10:56:06 am (UTC)'!
date
	^ date! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 10:56:11 am (UTC)'!
date: anObject
	date := anObject! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 10:58:10 am (UTC)'!
description
	"Answer the value of description"

	^ description! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 10:58:19 am (UTC)'!
description: aText
	description := aText ! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 11:29:13 am (UTC)'!
image
	^ image! !

!TimelineEntry methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 11:28:59 am (UTC)'!
imageUrl: anUrl
" Fetch the image at the given url "

	imageUrl := anUrl ! !

!TimelineEntry methodsFor: 'printing' stamp: 'hlsf 5/Oct/2025, 12:24:27 pm (UTC)'!
balloonText
	^ Text streamContents: [:str | 
		str nextPutAll: date printString bold;
			nextPut: Character lf;
			nextPutAll: description justified italic]! !

!TimelineEntry methodsFor: 'printing' stamp: 'hlsf 2/Oct/2025, 8:14:07 am (UTC)'!
printOn: stream
	stream nextPutAll: (date printFormat: #(3 2 1 $. 1 1 2));
		nextPutAll: ' - ';
		nextPutAll: (description truncateWithElipsisTo: 20)! !

!TimelineEntry methodsFor: 'comparing' stamp: 'hlsf 10/Oct/2026, 10:16:35 am (UTC)'!
= anEntry
	^ self == anEntry
	or: [date = anEntry date]! !

!TimelineEntry methodsFor: 'comparing' stamp: 'hlsf 5/Oct/2025, 2:18:45 pm (UTC)'!
hash
	^ date hash! !

!TimelineGraduation methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 2:15:31 pm (UTC)'!
interval
	^ interval! !

!TimelineGraduation methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 2:15:47 pm (UTC)'!
interval: aDuration
	interval := aDuration ! !

!TimelineGraduation methodsFor: 'printing' stamp: 'hlsf 2/Oct/2025, 7:36:49 am (UTC)'!
printOn: stream
	stream nextPutAll: 'Tick every '.
	interval years printOn: stream.
	stream nextPutAll: ' years'! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 9/Oct/2025, 8:17:41 am (UTC)'!
addEntry: aTimelineEntry
	| newEntry |
	ppd := nil.
	temporalGaps := nil.
	newEntry := entries add: aTimelineEntry.
	self updateGraduation ;
		updateSubGraduation.
	self triggerEvent: #changedTimeline.
	^ newEntry ! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 1/Oct/2025, 12:22:53 pm (UTC)'!
entries
	^ entries! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 5/Oct/2025, 7:49:10 pm (UTC)'!
entryAt: aDate
	^ entries detect: [:anEntry | anEntry date = aDate] ifNone: nil! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 5/Oct/2025, 7:51:47 pm (UTC)'!
entryIndexAt: aDate
	1 to: entries size do: [:i |
		(entries at: i) date = aDate ifTrue: [^i] ].
	^ 0! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 5/Oct/2025, 8:23:04 pm (UTC)'!
entryIndexBefore: aDate
	1 to: entries size -1 do: [:i |
		((entries at: i) date < aDate 
		and: [(entries at: i + 1) date >= aDate ]) ifTrue: [^i] ].
	^ self lastEvent date < aDate
		ifTrue: [entries size] 
		ifFalse: [0]! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 2/Oct/2025, 8:23:55 am (UTC)'!
firstEvent
	^ entries at: 1 ifAbsent: [nil]! !

!TimelineModel methodsFor: 'accessing event' stamp: 'hlsf 2/Oct/2025, 8:39:56 am (UTC)'!
lastEvent
	^ entries at: entries size ifAbsent: [nil]! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2025, 7:53:59 pm (UTC)'!
canvasWidth
" Canvas width may depend on timeline shrinked or not  and existing temportal gaps "
	^ entries 
		ifEmpty: [0] 
		ifNotEmpty: [ (self abscissaAt: entries last date) - (self abscissaAt: entries first date) 
			+ TimelineEntryView extent x]
	
	
"	 Former calculus, not taking in consideration shrinked timeline with temporal gaps
	(self ppd * self span days rounded) + TimelineEntryView extent x
"! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 2:20:06 pm (UTC)'!
graduation
	^ graduation ! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 9/Oct/2025, 8:18:12 am (UTC)'!
shrink
	shrink := true.
	temporalGaps := nil.
	self triggerEvent: #changedTimeline! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 28/Sep/2025, 2:20:12 pm (UTC)'!
subGraduation
	^ subGraduation ! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 5/Oct/2025, 8:37:44 pm (UTC)'!
temporalGaps
" 	Temporal gaps, between two consecutive events, spaning over 
	the temporal threshold could be cut at user preference "
	^ temporalGaps ifNil: [
		temporalGaps := OrderedCollection new.
		entries allButLast withIndexDo: [:each :index |
			(self distance: (entries at: index + 1) date to: each date) > self temporalThreshold 
				ifTrue: [temporalGaps add: index + 1 " we have a gap to go to the (index+1)th entry "] ].
		temporalGaps]
		! !

!TimelineModel methodsFor: 'accessing' stamp: 'hlsf 9/Oct/2025, 8:18:23 am (UTC)'!
unshrink
	shrink := false.
	self triggerEvent: #changedTimeline! !

!TimelineModel methodsFor: 'initialization' stamp: 'hlsf 16/Nov/2025, 1:57:44 pm (UTC)'!
initialize
	entries := SortedCollection sortBlock: [:entryA :entryB | entryA date < entryB date].
	graduation := TimelineGraduation new interval: 1 millenniums.
	subGraduation := TimelineGraduation new interval: 100 years.
	self shrink! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 8/Feb/2026, 11:15:07 am (UTC)'!
abscissaAt: aDate
"	An entry is positionned on the timeline according to its date, convert the date to a pixel position 
	Zero pixel is at left "
	^ self isShrunk 
		ifTrue: [self shrinkedAbscissaAt: aDate] 
		ifFalse: [self unshrinkedAbscissaAt: aDate]! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 5/Oct/2025, 1:07:50 pm (UTC)'!
distance: date1 to: date2
" 	We may want to know the pixel distance, 
	in the timeline, between two events
"
	^ (date1 - date2 ) days abs * self ppd
	! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 12/Oct/2025, 10:17:52 am (UTC)'!
ppd
" 	pixels per day
	The density of timeline depends on entry view width and time interval"
	| timeInteval |
	timeInteval := self timeInterval.
	timeInteval isZero ifTrue: [timeInteval := 1 months].
	^ ppd ifNil: [
		ppd := (TimelineEntryView extent x // 2 + 20 / timeInteval days) asFloat min: 0.5 max: 0.001]! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 9/Oct/2025, 8:25:13 am (UTC)'!
shrinkedAbscissaAt: aDate
	| index anotherDate | 
	index := self entryIndexAt: aDate.
	index = 1 
		ifTrue: [^ TimelineEntryView extent x // 2]
		ifFalse: [
			index = 0 
				ifTrue: [ "It is not a date of an event, search the one right before "
					index := self entryIndexBefore: aDate.
					index = 0 ifTrue: [^ self unshrinkedAbscissaAt: aDate].
					anotherDate := (entries at: index) date.
					^ (self shrinkedAbscissaAt: (entries at: index) date) 
					+ (self distance: anotherDate to: aDate)]
				ifFalse: [	" it is a date of an event, is it subject to a temporal gap? "
					anotherDate := (entries at: index - 1) date.
					(self temporalGaps includes: index) 
					ifTrue:  [^ (self shrinkedAbscissaAt: anotherDate)
							+ TimelineEntryView extent x]
					ifFalse: [	^ (self shrinkedAbscissaAt: anotherDate)
							+ (self distance: anotherDate to: aDate) ]
					]
				]
			! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 1/Oct/2025, 2:25:15 pm (UTC)'!
span
" 	We want to know the span of the events (distance between oldest and newer events) 
	to set the graduation approriately "
	^ entries 
		ifEmpty:  [Duration zero]
		ifNotEmpty: [entries last date - entries first date]! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 5/Oct/2025, 9:06:15 am (UTC)'!
temporalThreshold
" 	When two consecutive events are too far from each other (in screen pixel unit), 
	we may decide to cut the timeline with ellipsis to shorten it
"
	^ 1000! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 28/Sep/2025, 2:02:59 pm (UTC)'!
timeInterval
"	We want to know the shortest duration between two events,
	so we pick up the appropriate sub graduation "
	| interval |
	interval := self span.
	1 to: entries size - 1 do: [:i | |dist |
		dist := (entries at: i + 1) date - (entries at: i) date.
		dist < interval ifTrue: [interval := dist] ].
	^ interval ! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 5/Oct/2025, 2:08:46 pm (UTC)'!
unshrinkedAbscissaAt: aDate
	^ ((aDate - entries first date) days * self ppd + (TimelineEntryView extent x / 2)) rounded! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 9/Oct/2025, 8:29:49 am (UTC)'!
updateGraduation
	| span |
	span := self span.
	span > 10 millenniums ifTrue: [^ graduation interval: 1 millenniums].
	(span between: 2 millenniums and: 10 millenniums) ifTrue: [^ graduation interval: 200 years].
	(span between: 200 years and: 2 millenniums) ifTrue: [^ graduation interval: 100 years].
	(span between: Duration zero and: 200 years) ifTrue: [^ graduation interval: 10 years]! !

!TimelineModel methodsFor: 'metrics' stamp: 'hlsf 4/Oct/2025, 3:32:46 pm (UTC)'!
updateSubGraduation
	| timeInterval |
	timeInterval := self timeInterval.
	timeInterval <= 1 years ifTrue: [^ subGraduation interval: 1 years].
	(timeInterval between: 1 years and: 100 years) ifTrue: [^ subGraduation interval: 10 years ].
	(timeInterval between: 100 years and: 1 millenniums ) ifTrue: [^ subGraduation interval: 50 years].
	(timeInterval between: 1 millenniums and: 10 millenniums ) ifTrue: [^ subGraduation interval: 2 millenniums ].! !

!TimelineModel methodsFor: 'testing' stamp: 'hlsf 8/Feb/2026, 6:36:48 pm (UTC)'!
inTemporalGap: aDate
"Is aDate in a temporal gap ? Always false when not shrunk "
	^ shrink and: [
		temporalGaps anySatisfy: [:eventIndex | 
			aDate between: (entries at: eventIndex - 1) date and: (entries at: eventIndex) date ] ]! !

!TimelineModel methodsFor: 'testing' stamp: 'hlsf 8/Feb/2026, 11:15:20 am (UTC)'!
isShrunk
" Shrunk timeline skips temporal gap above the temporal threshold "
	^ shrink! !

!TimelineModel methodsFor: 'testing' stamp: 'hlsf 7/Oct/2025, 7:38:02 pm (UTC)'!
isTemporalGap: eventIndex
	^ self temporalGaps includes: eventIndex ! !

!TimelineConnector methodsFor: 'as yet unclassified' stamp: 'hlsf 1/Oct/2025, 12:59:06 pm (UTC)'!
entryView: aView
	entryView := aView ! !

!TimelineConnector methodsFor: 'drawing' stamp: 'hlsf 3/Oct/2025, 8:40:37 pm (UTC)'!
drawOn: canvas
	| toLine anchor color |
	color := entryView borderColor.
	anchor := entryView externalize:  entryView anchor.
	toLine := anchor +
		(entryView isAboveTimeline ifTrue: [0@TimelineConnector height] ifFalse: [(0@TimelineConnector height) negated]).
	canvas line: toLine to: anchor width: entryView borderWidth color: color.
	canvas fillColor: color do: [canvas ellipseCenter: toLine radius: 4@4]! !

!TimelineConnector class methodsFor: 'accessing' stamp: 'hlsf 2/Oct/2025, 8:29:16 pm (UTC)'!
height
	^ 50! !

!TimelineCanvas methodsFor: 'accessing' stamp: 'hlsf 9/Oct/2025, 8:58:00 am (UTC)'!
entryWidth
	^ self mainView borderWidth ! !

!TimelineCanvas methodsFor: 'accessing' stamp: 'hlsf 1/Oct/2025, 3:44:44 pm (UTC)'!
positions
	^ `Array with: #above with: #below`! !

!TimelineCanvas methodsFor: 'accessing' stamp: 'hlsf 7/Oct/2026, 2:47:01 pm (UTC)'!
presenter: aPresenter
	super presenter: aPresenter.
	presenter model when: #changedTimeline send: #updateCanvas to: self! !

!TimelineCanvas methodsFor: 'geometry' stamp: 'hlsf 4/Oct/2025, 2:55:39 pm (UTC)'!
setExtent
	self morphExtent: self model canvasWidth @ TimelineCanvas height! !

!TimelineCanvas methodsFor: 'updating' stamp: 'hlsf 9/Oct/2025, 8:58:39 am (UTC)'!
updateCanvas
	| views view |
	self setExtent.
	self removeAllMorphs.
	views := OrderedCollection new.
	self model entries withIndexDo: [:entry :i | 
		view := TimelineEntryView on: entry.
		" We alternate the position #above #below the timeline "
		view position: (self positions atWrap: i);
			abscissa: (self model abscissaAt: entry date) - (TimelineEntryView extent x // 2);
			borderColor: self mainView borderColor;
			borderWidth: self mainView borderWidth .		
		views add: view.
		view := TimelineConnector new entryView: view; yourself.
		views add: view].
	self addAllMorphs: views;
		scale: 1.
	self morphPosition: self container morphExtent - extent // 2! !

!TimelineCanvas methodsFor: 'updating' stamp: 'hlsf 9/Oct/2025, 9:13:17 am (UTC)'!
updateColor
	submorphs 
		select: [:each | each is: #TimelineEntryView] 
		thenDo: [:eventView  | eventView borderColor: self color]! !

!TimelineCanvas methodsFor: 'updating' stamp: 'hlsf 9/Oct/2025, 9:14:23 am (UTC)'!
updateWidth
	submorphs 
		select: [:each | each is: #TimelineEntryView] 
		thenDo: [:eventView  | eventView borderWidth: self entryWidth]! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 7:12:54 pm (UTC)'!
drawFullOn: canvas
	| start end timelineY model endGrad |
	model := presenter model.
	canvas fillRectangle: self localBounds color: Color white.
	canvas drawString: model title atCenterX: extent x // 2 @ 0 font: self titleFont color: self color.
	timelineY := TimelineCanvas topMargin + TimelineEntryView extent y + TimelineConnector height.
	endGrad := extent x - 11.
"	Axe and right arrow "
	canvas strokeWidth: self entryWidth color: self color do: [
		canvas moveTo: 1@ timelineY ;
			lineTo: (extent x - 1) @ timelineY;
			rel_LineTo: -10@-6;
			rel_MoveTo: 0@12;
			rel_LineTo: 10@-6].
	
" 	First level graduation "
	start := (model firstEvent ifNil: [^ self]) date roundDownTo: model graduation interval.
	end := (model lastEvent date roundUpTo: model graduation interval).
	self drawOn: canvas graduationAt: timelineY -10 from: start to: end hardStop: endGrad.	
" 	Sub graduation "
	model graduation interval days = model subGraduation interval days ifTrue: [^ self].
	self drawOn: canvas subGraduationAt: timelineY - 5 from: start + model subGraduation interval to: end hardStop: endGrad 

! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 7:17:16 pm (UTC)'!
drawGapsOn: canvas
	| start end timelineY model entries endGrad |
	model := presenter model.
	entries := model entries.
	canvas fillRectangle: self localBounds color: Color white.
	canvas drawString: model title atCenterX: extent x // 2 @ 0 font: self titleFont color: self color.
	timelineY := TimelineCanvas topMargin + TimelineEntryView extent y + TimelineConnector height.
	endGrad := extent x - 11.
	
"	Plain axe to first event --|"
	canvas strokeWidth: self entryWidth color: self color do: [
		canvas moveTo: 1@ timelineY ;
			lineTo: (model abscissaAt: entries first date) @ timelineY].
		
"	Axe from first event to the end with its temporal gaps --|....|--...--|--|--|..."
	1 to: model entries size - 1 do: [:index | | dash |
		dash := (model isTemporalGap: index + 1) ifTrue: [2r10000000] ifFalse: [255].
		canvas strokeWidth: self entryWidth color: self color dashedStrokeBits: dash do: [
			canvas moveTo: (model abscissaAt: (entries at: index) date) @ timelineY;
				lineTo: (model abscissaAt: (entries at: index + 1) date) @ timelineY]].
"	Axe from last event to right canvas then right arrow -->"
	canvas strokeWidth: self entryWidth color: self color do: [
		canvas moveTo: (model abscissaAt: entries last date) @ timelineY;
			lineTo: (extent x - 1) @ timelineY;
			rel_LineTo: -10@-6;
			rel_MoveTo: 0@12;
			rel_LineTo: 10@-6].
	
	" First level graduation "
	start := (model firstEvent ifNil: [^ self]) date roundDownTo: model graduation interval.
	end := (model lastEvent date roundUpTo: model graduation interval).
	self 	drawOn: canvas graduationAt: timelineY - 10 from: start to: end hardStop: endGrad.
	
	" Sub graduation "
	model graduation interval days = model subGraduation interval days ifTrue: [^ self].
	"start := (model firstEvent date roundDownTo: model graduation interval) - model subGraduation interval."
	self drawOn: canvas subGraduationAt: timelineY - 5 from: start to: end hardStop: endGrad! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 11:15:07 am (UTC)'!
drawOn: canvas
	(self model isShrunk and: [self model temporalGaps notEmpty])
		ifTrue: [self drawGapsOn: canvas]
		ifFalse: [self drawFullOn: canvas]! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 7:03:05 pm (UTC)'!
drawOn: canvas graduationAt: posY from: start to: end hardStop: endGrad
	| model pos  |
	" First level graduation "
	model := presenter model.
	start at1stJanuary to: end by: model graduation interval do: [:aDate |
		( (self model inTemporalGap: aDate) not
		and: [(aDate between: start and: end)
		and: [pos := (model abscissaAt: aDate) @ posY.  pos x between: 0 and: endGrad ]])  ifTrue: [
			canvas strokeWidth: self entryWidth color: self color do: [canvas moveTo: pos; rel_LineTo: 0 @ 20].
			canvas drawString: aDate yearNumber asString atCenterX: pos + (0@25) font: self gradFont color: self color] ]
! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 7:08:45 pm (UTC)'!
drawOn: canvas subGraduationAt: posY from: start to: end hardStop: endGrad
	| model pos |
	" Sub graduation "
	model := presenter model.
	canvas strokeWidth: self entryWidth - 1 color: self color do: [
		start at1stJanuary to: end by: model subGraduation interval do: [:aDate |
			((aDate roundDownTo: model graduation interval) ~= aDate 
			and: [(self model inTemporalGap: aDate) not
			and: [pos := (model abscissaAt: aDate) @ posY. pos x between: 0 and: endGrad] ]) ifTrue: [
				canvas moveTo: pos; rel_LineTo: 0 @ 10]] ] ! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 9:10:02 am (UTC)'!
gradFont
	^ font ifNil: [
		font := FontFamily familyName: FontFamily defaultFamilyName pointSize: 8]
! !

!TimelineCanvas methodsFor: 'drawing' stamp: 'hlsf 8/Feb/2026, 9:09:05 am (UTC)'!
titleFont
	^ (FontFamily familyName: FontFamily defaultFamilyName pointSize: 16) emphasized: 7! !

!TimelineCanvas methodsFor: 'events' stamp: 'hlsf 4/Oct/2025, 2:59:38 pm (UTC)'!
mouseScroll: evt localPosition: localEventPosition
	evt direction == #down
		ifTrue: [ presenter zoomAction: -0.02 at: (self externalize:  localEventPosition) ].
	evt direction == #up
		ifTrue: [ presenter zoomAction: 0.02 at: (self externalize: localEventPosition) ].
! !

!TimelineCanvas class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/Oct/2025, 10:54:42 am (UTC)'!
bottomMargin
	^ 50! !

!TimelineCanvas class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/Oct/2025, 10:56:41 am (UTC)'!
height
	^ TimelineEntryView extent y + TimelineConnector height * 2 + self verticalMargin! !

!TimelineCanvas class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/Oct/2025, 10:54:29 am (UTC)'!
topMargin
	^ 100! !

!TimelineCanvas class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/Oct/2025, 10:54:59 am (UTC)'!
verticalMargin
" top and bottom margin "
	^ self topMargin + self bottomMargin ! !

!TimelineView methodsFor: 'initialization' stamp: 'hlsf 10/Oct/2026, 11:24:56 am (UTC)'!
installView
	self installViewWith: #(xWheel zWheel).
	canvas setExtent.
	canvas morphPosition: 10@10
! !

!TimelineEntryView methodsFor: 'initialization' stamp: 'hlsf 1/Oct/2025, 7:54:50 pm (UTC)'!
defaultColor
	^ Color white! !

!TimelineEntryView methodsFor: 'initialization' stamp: 'hlsf 8/Feb/2026, 11:06:37 am (UTC)'!
initialize
	| scroll |
	super initialize.
	self beColumn.
	date := LabelMorph contents: (model date printFormat: #(1 2 3 $/ 1 1 1))  fontSize: 12 emphasis: 1.
	date setBalloonText: model balloonText.
	description := TextParagraphMorph contents: (model description justified italic pointSize: 10):: 
		color: Color white ;
		setHeightOnContent ;
		lock: true;
		borderWidth: 0.
	self addMorph:  date layoutSpec: LayoutSpec keepMorphExtent ;
		addMorphUseAll: (scroll := PluggableScrollPane new 
			layoutSpec: LayoutSpec useAll;
			setBalloonText: model balloonText;
			color: Color white;
			scroller: description);
		morphExtent: TimelineEntryView extent.
	scroll adoptWidgetsColor: self defaultColor.
	scroll verticalScrollBar morphWidth: 6! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 1/Oct/2025, 7:28:18 pm (UTC)'!
abscissa: x
" the view is computed from its date (ox) and its position relative to the timeline (ox) "
	self morphPosition: x @ self ordinate ! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 1/Oct/2025, 3:25:32 pm (UTC)'!
anchor
	^ self isAboveTimeline 
		ifTrue: [self localBounds bottomCenter]
		ifFalse: [self localBounds topCenter] " #below timeline" 
	! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 5/Oct/2025, 10:04:15 am (UTC)'!
borderColor: aColor 
	super borderColor: aColor.
	self color: aColor.
	date color: (aColor luminance > 0.5 ifTrue: [Color black] ifFalse: [Color white]).
	description color: aColor muchLighter.
	description owner color: aColor muchLighter.
	description owner verticalScrollBar color: aColor! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 30/Sep/2025, 6:03:08 pm (UTC)'!
model: timelineEntry
	model := timelineEntry ! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 4/Oct/2025, 10:55:26 am (UTC)'!
ordinate
	" its is constrained by its position relatively to the timeline "
	^ self isAboveTimeline 
		ifTrue: [TimelineCanvas topMargin]
		ifFalse: [TimelineCanvas topMargin + TimelineEntryView extent y + (TimelineConnector height * 2)]
		! !

!TimelineEntryView methodsFor: 'accessing' stamp: 'hlsf 1/Oct/2025, 3:46:10 pm (UTC)'!
position: aSymbol
	position := aSymbol ! !

!TimelineEntryView methodsFor: 'geometry' stamp: 'hlsf 1/Oct/2025, 12:45:13 pm (UTC)'!
morphPosition: aPoint 
	location withTranslation: aPoint.! !

!TimelineEntryView methodsFor: 'testing' stamp: 'hlsf 9/Oct/2025, 9:07:04 am (UTC)'!
is: aSymbol
	^ aSymbol == #TimelineEntryView or: [super is: aSymbol]! !

!TimelineEntryView methodsFor: 'testing' stamp: 'hlsf 1/Oct/2025, 3:46:16 pm (UTC)'!
isAboveTimeline
	^ position == #above! !

!TimelineEntryView class methodsFor: 'instance creation' stamp: 'hlsf 30/Sep/2025, 6:02:53 pm (UTC)'!
on: timelineEntry
	^ self basicNew
		model: timelineEntry;
		initialize! !

!TimelineEntryView class methodsFor: 'accessing' stamp: 'hlsf 5/Oct/2025, 10:10:09 am (UTC)'!
extent
" expressed in pixels "
	^ 120@150! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 5/Oct/2025, 8:22:03 pm (UTC)'!
<= anotherDate
	^ (self > anotherDate) not! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 5/Oct/2025, 8:20:25 pm (UTC)'!
>= anotherDate
	^ (self < anotherDate) not! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 8/Feb/2026, 3:34:56 pm (UTC)'!
at1stJanuary
	^ Date year: self yearNumber month: 1 day: 1.! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 8/Feb/2026, 10:03:31 am (UTC)'!
between: min and: max 
	^self >= min and: [self <= max]! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 18/Jan/2026, 5:00:23 pm (UTC)'!
roundDownTo: aDuration
	^ Date 
		year:  (self yearNumber roundDownTo: aDuration years)
		month: self monthIndex 
		day: 1! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 18/Jan/2026, 5:00:29 pm (UTC)'!
roundUpTo: aDuration
	^ Date 
		year:  (self yearNumber roundUpTo: aDuration years)
		month: self monthIndex 
		day: 1! !

!Date methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 4/Oct/2025, 11:37:48 am (UTC)'!
to: endDate by: aDuration do: block
" 	Use with caution, because argument to block convert to a Date, 
	so you may have repeated identical data if duration is smaller than a day "
	| currentDateAndTime endDateAndTime |
	currentDateAndTime := DateAndTime date: self time: Time now.
	endDateAndTime := DateAndTime date: endDate time: Time now.
	[currentDateAndTime <= endDateAndTime ] whileTrue: [
		block value: currentDateAndTime date.
		currentDateAndTime := currentDateAndTime + aDuration ]! !

!Duration methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 28/Sep/2025, 1:46:15 pm (UTC)'!
millenniums
	^ (self days / 365.25 / 1000) rounded! !

!Duration methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 28/Sep/2025, 1:46:52 pm (UTC)'!
years
	" Just to get an approximation , to the closest "
	^ (self days / 365.25) rounded! !

!Number methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 28/Sep/2025, 1:39:49 pm (UTC)'!
millenniums
" An approximation "
	^ (self * 1000) years! !

!Number methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 28/Sep/2025, 2:35:51 pm (UTC)'!
months
" An approximation "
	^ Duration days: self * 30.4375! !

!Number methodsFor: '*DKM-History-Timeline' stamp: 'hlsf 28/Sep/2025, 1:38:42 pm (UTC)'!
years
" An approximation "
	^ Duration days: self * 365.25! !
