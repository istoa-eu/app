'From Cuis7.5 [latest update: #7739] on 25 December 2025 at 11:06:26 am'!
'Description '!
!provides: 'iStoaApp' 1 3!
!requires: 'DKM-Physics-GasSimulation' 1 33 nil!
!requires: 'Commander' 1 9 nil!
!requires: 'DKM-History-Timeline' 1 6 nil!
SystemOrganization addCategory: #iStoaApp!


!classDefinition: #Stoa category: #iStoaApp!
Object subclass: #Stoa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'iStoaApp'!
!classDefinition: 'Stoa class' category: #iStoaApp!
Stoa class
	instanceVariableNames: ''!


!Stoa class methodsFor: 'command' stamp: 'hlsf 24/Dec/2025 20:45:56'!
history: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #history forDKM: Timeline in: #timeline with: menuBuilder 
			! !

!Stoa class methodsFor: 'command' stamp: 'hlsf 25/Dec/2025 10:38:57'!
newEntryIn: parentEntry forDKM: aDKMPresenter in: dkmMenuEntry with: menuBuilder
"	Install the menu entries to play and to edit this aDKMPresenter 	"
	| playEntry editEntry |
	playEntry := (dkmMenuEntry, 'play') asSymbol.
	editEntry := (dkmMenuEntry , 'edit') asSymbol.
	menuBuilder newEntry: dkmMenuEntry in: parentEntry :: 
		label: aDKMPresenter title;
		help: aDKMPresenter description .
		menuBuilder newEntry: playEntry in: dkmMenuEntry ::
			order: 1;
			label: 'play';
			icon: #playIcon;
			target: aDKMPresenter ;
			selector: #evaluateSample.
		menuBuilder newEntry: editEntry in: dkmMenuEntry ::
			order: 2;
			label: 'edit';
			icon: #genericTextIcon;
			target: aDKMPresenter ;
			selector: #presentInWorkspace
			! !

!Stoa class methodsFor: 'command' stamp: 'hlsf 24/Dec/2025 20:46:45'!
physics: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #physics forDKM: GasSimulation in: #gasSimulation with: menuBuilder 

			! !

!Stoa class methodsFor: 'command' stamp: 'hlsf 24/Dec/2025 20:44:23'!
topMenu: menuBuilder
	<iStoaAppCommand>
		menuBuilder newEntry: #history ::
			label: 'History';
			order: 10.
		menuBuilder newEntry: #physics ::
			label: 'Physics';
			order: 20! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 00:17:56'!
getMenuIn: aWorld at: aHand
	| menu |
	menu :=  (CommandBuilder on: #iStoaAppCommand) getMenu.
	menu addStayUpIcons ;
		addTitle: 'DKM Menu '.
	^ menu! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 10:38:04'!
install
	Preferences name: #focusFollowsMouse category: #gui value: true.
	self setStoaMenu ! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 00:17:19'!
setCuisMenu
	Preferences at: #worldMenu put: TheWorldMenu! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 00:16:43'!
setStoaMenu
	Preferences at: #worldMenu put: Stoa! !
