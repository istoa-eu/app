'From Cuis7.9 [latest update: #8266] on 20 October 2026 at 5:30:33 pm'!
'Description '!
!provides: 'iStoaApp' 1 21!
!requires: 'DKM-Physics-GasSimulation' 1 33 nil!
!requires: 'DKM-Math-Geometry' 1 3 nil!
!requires: 'DKM-Misc-ConceptMap' 1 12 nil!
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


!Stoa class methodsFor: 'menu' stamp: 'hlsf 18/Jan/2026, 5:17:05 pm (UTC)'!
getMenuIn: aWorld at: aHand
	| menu |
	menu :=  (CommandBuilder on: #iStoaAppCommand) getMenu.
	menu 
		addTitle: 'Dynamic Knowledge Models   '; 
		addStayUpIcons .
	^ menu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025, 6:45:56 pm (UTC)'!
history: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #history forDKM: Timeline in: #timeline with: menuBuilder 
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 29/Jan/2026, 8:27:39 pm (UTC)'!
math: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #math forDKM: InteractiveGeometry in: #interactiveGeometry with: menuBuilder.
	self newEntryIn: #math forDKM: GeometrieInteractive in: #geometrieInteractive with: menuBuilder 

			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 18/Jan/2026, 5:12:47 pm (UTC)'!
newEntryIn: parentEntry forDKM: aDKMPresenter in: dkmMenuEntry with: menuBuilder
"	Install the menu entries to play and to edit this aDKMPresenter 	"
	| playEntry editEntry docEntry promptForAI |
	playEntry := (dkmMenuEntry, 'play') asSymbol.
	editEntry := (dkmMenuEntry , 'edit') asSymbol.
	docEntry := (dkmMenuEntry , 'doc') asSymbol.
	promptForAI := (dkmMenuEntry, 'prompt') asSymbol.
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
			icon: #textEditorIcon;
			target: aDKMPresenter ;
			selector: #presentInWorkspace.
		menuBuilder newEntry: docEntry in: dkmMenuEntry ::
			order: 30;
			label: 'documentation';
			icon: #inspectIcon;
			target: self; selector: #browseApi: ; arguments: (Array with: aDKMPresenter).
		menuBuilder newEntry: promptForAI in: dkmMenuEntry ::
			order: 40;
			label: 'copy prompt for AI';
			icon: #terminalIcon;
			action: [Clipboard storeObject: aDKMPresenter promptForAI]
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 20/Oct/2026, 3:29:13 pm (UTC)'!
others: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #others forDKM: ConceptMap in: #conceptMap with: menuBuilder 
			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025, 6:46:45 pm (UTC)'!
physics: menuBuilder
	<iStoaAppCommand>
	self newEntryIn: #physics forDKM: GasSimulation in: #gasSimulation with: menuBuilder 

			! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025, 5:59:55 pm (UTC)'!
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

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025, 10:17:19 pm (UTC)'!
setCuisMenu
	Preferences at: #worldMenu put: TheWorldMenu! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 24/Dec/2025, 10:16:43 pm (UTC)'!
setStoaMenu
	Preferences at: #worldMenu put: Stoa! !

!Stoa class methodsFor: 'menu' stamp: 'hlsf 27/Dec/2025, 6:37:37 pm (UTC)'!
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

!Stoa class methodsFor: 'menu' stamp: 'hlsf 20/Oct/2026, 3:27:25 pm (UTC)'!
topMenu: menuBuilder
	<iStoaAppCommand>
	menuBuilder newEntry: #history ::
		label: 'History';
		order: 10.
	menuBuilder newEntry: #math ::
		label: 'Mathematics';
		order: 20.
	menuBuilder newEntry: #physics ::
		label: 'Physics';
		order: 30.
	menuBuilder newEntry: #others ::
		label: 'Others';
		order: 40.

	menuBuilder newEntry: #tools ::
		label: 'Tools';
		icon: #systemIcon;
		order: 100.
	menuBuilder newEntry: #preferences ::
		label: 'Preferences';
		icon: #preferencesIcon;
		order: 110.	
	menuBuilder newEntry: #About ::
		action: [Stoa about];
		order: 120.	
	menuBuilder newEntry:  #Quit ::
		action: [ Stoa quit ];
		icon: #quitIcon;
		order: 999	
		! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 12/Jan/2026, 6:53:20 pm (UTC)'!
browseApi: aDKMPresenter
	| browser |
	browser := HierarchyBrowserWindow onClass: aDKMPresenter presenterClass selector: nil.
	browser model messageCategoryListIndex: (browser model messageCategoryList indexOf: aDKMPresenter dslCategory)! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025, 1:59:40 pm (UTC)'!
cuisVersion
	^ SystemVersion current versionString, ' #', SystemVersion current highestUpdate printString! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 27/Dec/2025, 2:00:03 pm (UTC)'!
iStoaCopyright
	^ 'Source code application: Copyright 2025-2026 Hilaire Fernandes'! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 1/Feb/2026, 10:24:50 am (UTC)'!
iStoaInformationString
	|text |
	text := 'iStoa (istoa.eu) is a simulation environment to explore the Dynamic Knowledge Models (DKM).
With iStoa you can explore the DKM with the script examples already provided or
edit new ones to invent variations.
iStoa is also a development environment, so you can study and modify
the DKM code as you wish.

{2}
{1} - {3}
LICENSES: 
 - iStoaApp MIT license, 
 - Each DKM comes with its own license terms (visit istoa.eu/dkm).' translated format: {self iStoaVersion. self iStoaCopyright. self cuisVersion }.
	^ text! !

!Stoa class methodsFor: 'documentation' stamp: 'hlsf 20/Oct/2026, 3:30:22 pm (UTC)'!
iStoaVersion
	^ 'Installed version: ', 
		'26.11a (code revision ', 
		(String streamContents: [:str | 
			(CodePackage installedPackages at: 'iStoaApp') featureSpec provides printVersionRevisionOn: str]), ')'! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025, 2:00:17 pm (UTC)'!
about
	UISupervisor whenUIinSafeState: [
		(PopUpMenu labels: ' Ok ' ) 
			startUpNonModalWithCaption:  self iStoaInformationString ]! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025, 5:53:59 pm (UTC)'!
quit
	(self confirm: 'There is may be unsaved data!! 
Are you sure to quit the iStoa environment?') ifFalse: [ ^ self].
	Smalltalk quitPrimitive! !

!Stoa class methodsFor: 'user interface' stamp: 'hlsf 27/Dec/2025, 2:22:39 pm (UTC)'!
toggleFullscreen	
	| isFullscreen |
	isFullscreen := [ Preferences at: #fullscreen ] 
		on: Error 
		do: [Preferences name: #fullscreen category: #gui value: true.
			true].
	Preferences at: #fullscreen put: isFullscreen not.
	Display fullScreenMode: isFullscreen not! !

!Stoa class methodsFor: 'system-support' stamp: 'hlsf 22/Jan/2026, 4:37:43 pm (UTC)'!
install
	| world  stream |
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
	"We do code style for a whole workspace, not by paragraph"
	Preferences at: #workspacesStyleByParagraphs put: false.
	"Set a default name for authoring"
	Utilities setAuthorName: 'iStoa User' initials: 'iStoaUser'.

	'Finalizing installation...' print.
	world := UISupervisor ui.
[
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: 	[
		"Adjust taskbar size"
		world showTaskbar 
		world taskbar scale: 1.
		'Task bar rescaled' print.
		Display fullScreenMode: true.
		"Remove all morphs"
		(world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph]) 
			do: [:each | each delete].
		'Morphs deleted' print.
		world taskbar color: Color gray muchLighter.
		'Installing background image...' print.
		stream := (DirectoryEntry cuisBaseDirectory / 
			'iStoa' / 'resources' / 'graphics' // 'background.png') readStream.
		world backgroundImageData: stream binary contentsOfEntireFile.
		'Cleaning image...' print.
		Smalltalk garbageCollect.
		'Installation ended' print.
		'Saving image...' print.
		Smalltalk saveAndQuit ]
] fork
! !
