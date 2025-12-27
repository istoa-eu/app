'From Cuis7.5 [latest update: #7739] on 27 December 2025 at 4:26:24 pm'!
'Description '!
!provides: 'iStoaApp' 1 4!
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


!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 16:16:42'!
getMenuIn: aWorld at: aHand
	| menu |
	menu :=  (CommandBuilder on: #iStoaAppCommand) getMenu.
	menu addStayUpIcons ;
		addTitle: 'System Menu '.
	^ menu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025 20:45:56'!
history: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #history forDKM: Timeline in: #timeline with: menuBuilder 
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 25/Dec/2025 10:38:57'!
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

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025 20:46:45'!
physics: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #physics forDKM: GasSimulation in: #gasSimulation with: menuBuilder 

			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 25/Dec/2025 00:17:19'!
setCuisMenu
	Preferences at: #worldMenu put: TheWorldMenu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 25/Dec/2025 00:16:43'!
setStoaMenu
	Preferences at: #worldMenu put: Stoa! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 16:21:32'!
toolMenu: menuBuilder
	<iStoaAppCommand>

	(menuBuilder newEntry: 'Open a file' in: #tools)
		icon: #systemFileManagerIcon;
		action: [FileList open];
		help: 'Open the filer on your iStoa installation. From there, you can load DKM script previously saved on disk.';
		order: 10.
	(menuBuilder newEntry: 'Workspace' in: #tools)
		icon: #terminalIcon;
		action: [Workspace open ];
		help: 'A window used as a scratchpad area where fragments of Cuis-Smalltalk code can be entered, stored, edited, and evaluated. To edit DKM, use the ''edit'' entry of each DKM.';
		order: 20.
	(menuBuilder newEntry: 'System Browser' in: #tools)
		icon: #developmentIcon;
		action: [HierarchyBrowserWindow onClass: GasSimulation selector: nil];
		help:'A source code browser to view, edit and save DKM code. I open the browser on the GasSimulation DKM class but you are free to explore the other ones.';
		order: 30.
		
	(menuBuilder newEntry: 'Save session' in: #tools)
		order: 999;
		action: [Smalltalk saveImage];
		icon: #saveIcon;
		help: 'Save this iStoa session.'! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 16:20:42'!
topMenu: menuBuilder
	<iStoaAppCommand>
	menuBuilder newEntry: #history ::
		label: 'History';
		order: 10.
	menuBuilder newEntry: #physics ::
		label: 'Physics';
		order: 20.
menuBuilder newEntry: #tools ::
		label: 'Tools';
		icon: #systemIcon;
		order: 100.
	menuBuilder newEntry: #preferences ::
		label: 'Preferences';
		icon: #preferencesIcon;
		order: 110.		
	
		! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025 15:59:40'!
cuisVersion
	^ SystemVersion current versionString, ' #', SystemVersion current highestUpdate printString! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025 16:00:03'!
iStoaCopyright
	^ 'Source code application: Copyright 2025-2026 Hilaire Fernandes'! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025 16:03:36'!
iStoaInformationString
	|text |
	text := 'iStoa is a simulation environment to explore the Dynamic Knowledge Models (DKM).
With iStoa you can explore the DKM with the script examples already provided or
edit new ones to invent variations.
iStoa is also a development environment, so you can study and modify
the DKM code as you wish.

{2}
{1} - {3}
LICENSE: GPL' translated format: {self iStoaVersion. self iStoaCopyright. self cuisVersion }.
	^ text! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025 16:25:56'!
iStoaVersion
	^ 'Installed version: ', 
		'25.12a (code revision ', 
		(String streamContents: [:str | 
			(CodePackage installedPackages at: 'iStoaApp') featureSpec provides printVersionRevisionOn: str]), ')'! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025 16:00:17'!
about
	UISupervisor whenUIinSafeState: [
		(PopUpMenu labels: ' Ok ' ) 
			startUpNonModalWithCaption:  self iStoaInformationString ]! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 25/Dec/2025 10:38:04'!
install
	Preferences name: #focusFollowsMouse category: #gui value: true.
	self setStoaMenu ! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025 16:25:01'!
quit
	(self confirm: 'There is may be unsaved data!! 
Are you sure to quit iStoa environment?') ifFalse: [ ^ self].
	Smalltalk quitPrimitive! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025 16:22:39'!
toggleFullscreen	
	| isFullscreen |
	isFullscreen := [ Preferences at: #fullscreen ] 
		on: Error 
		do: [Preferences name: #fullscreen category: #gui value: true.
			true].
	Preferences at: #fullscreen put: isFullscreen not.
	Display fullScreenMode: isFullscreen not! !
