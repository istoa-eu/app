'From Cuis7.5 [latest update: #7739] on 27 December 2025 at 9:46:56 pm'!
'Description '!
!provides: 'iStoaApp' 1 8!
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


!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 20:42:51'!
getMenuIn: aWorld at: aHand
	| menu |
	menu :=  (CommandBuilder on: #iStoaAppCommand) getMenu.
	menu 
		addTitle: 'Environement Menu    '; 
		addStayUpIcons .
	^ menu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025 20:45:56'!
history: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #history forDKM: Timeline in: #timeline with: menuBuilder 
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 20:27:10'!
newEntryIn: parentEntry forDKM: aDKMPresenter in: dkmMenuEntry with: menuBuilder
"	Install the menu entries to play and to edit this aDKMPresenter 	"
	| playEntry editEntry docEntry |
	playEntry := (dkmMenuEntry, 'play') asSymbol.
	editEntry := (dkmMenuEntry , 'edit') asSymbol.
	docEntry := (dkmMenuEntry , 'doc') asSymbol.
	menuBuilder newEntry: dkmMenuEntry in: parentEntry :: 
		label: aDKMPresenter title;
		help: aDKMPresenter description .
		menuBuilder newEntry: playEntry in: dkmMenuEntry ::
			order: 10;
			label: 'play';
			icon: #playIcon;
			target: aDKMPresenter ;
			selector: #evaluateSample.
		menuBuilder newEntry: editEntry in: dkmMenuEntry ::
			order: 20;
			label: 'edit';
			icon: #terminalIcon;
			target: aDKMPresenter ;
			selector: #presentInWorkspace.
		menuBuilder newEntry: docEntry in: dkmMenuEntry ::
			order: 30;
			label: 'documentation';
			icon: #inspectIcon;
			target: self; selector: #browseApi: ; arguments: {aDKMPresenter} 
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025 20:46:45'!
physics: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #physics forDKM: GasSimulation in: #gasSimulation with: menuBuilder 

			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 19:59:55'!
preferencesMenu: menuBuilder
	<iStoaAppCommand>
	menuBuilder newEntry: 'Size of GUI elements' in: #preferences ::
		target: Theme; selector: #changeFontSizes;
		icon: #preferencesDesktopFontIcon;
		order: 10.
	menuBuilder newEntry: 'Toggle full screen mode' in: #preferences ::
		icon: #viewFullscreenIcon;
		action: [Stoa toggleFullscreen];
		help: 'Turn full screen mode on when it is off, off when it is on.';
		order: 20.! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 25/Dec/2025 00:17:19'!
setCuisMenu
	Preferences at: #worldMenu put: TheWorldMenu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 25/Dec/2025 00:16:43'!
setStoaMenu
	Preferences at: #worldMenu put: Stoa! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 20:37:37'!
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
		help: 'A window used as a scratchpad area where fragments of Cuis-Smalltalk code can be entered, stored, edited, and evaluated. To edit DKM, use the ''edit'' menu entry of each DKM.';
		order: 20.
	(menuBuilder newEntry: 'System Browser' in: #tools)
		icon: #developmentIcon;
		action: [BrowserWindow fullOnClass: Stoa selector: nil];
		help:'A source code browser to view, edit and save changes to DKM code.';
		order: 30.
		
	(menuBuilder newEntry: 'Save session' in: #tools)
		order: 999;
		action: [Smalltalk saveImage];
		icon: #saveIcon;
		help: 'Save this iStoa session.'! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025 20:36:46'!
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
	menuBuilder newEntry:  #Quit ::
		action: [ Stoa quit ];
		icon: #quitIcon;
		order: 999	
		! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025 20:33:17'!
browseApi: aDKMPresenter
	| browser |
	browser := HierarchyBrowserWindow onClass: aDKMPresenter selector: nil.
	browser model messageCategoryListIndex: (browser model messageCategoryList indexOf: 'DSL')! !

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

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025 19:53:59'!
quit
	(self confirm: 'There is may be unsaved data!! 
Are you sure to quit the iStoa environment?') ifFalse: [ ^ self].
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

!Stoa class methodsFor: 'accessing' stamp: 'hlsf 27/Dec/2025 21:46:40'!
install
	| world |
	"Report by any mean installation and run time"
	Transcript
		showOnDisplay: false;
		logToFile: true;
		logToStdout: true.
	Smalltalk at: #LogStartupDebugAids put: true.
	self setStoaMenu.
	'Installing updates...' print.
	Smalltalk condenseChanges.
	"Focus does follow mouse, it is usefull to delete genereated morph in Workspace "
	Preferences at: #focusFollowsMouse put: true.
	"Adjust font size"
	Preferences at: #defaultFontSize put: 12.
	'Font preferences set' print.
	"Preferences at: #logDebuggerStackToFile put: true."
	Preferences at: #warnAndOfferLastUserChanges put: false.
	Preferences at: #autoNumberUserChanges put: false.
	"Set a default name for authoring"
	Utilities setAuthorName: 'iStoa User' initials: 'iStoaUser'.

	'Finalizing installation...' print.
	world := UISupervisor ui.
[
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: 	[
		"Adjust taskbar size"
		world showTaskbar 
		world taskbar scale: 1/2.
		'Task bar rescaled' print.
		Display fullScreenMode: true.
		"Remove all morphs"
		(world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph]) 
			do: [:each | each delete].
		'Morphs deleted' print.
		'Cleaning image' print.
		Smalltalk garbageCollect.
		'Installation ended' print.
		'Saving image...' print.
		Smalltalk saveAndQuit ]
] fork
! !
