# iStoaApp

This is the repository of the *iStoa simulation environment*, named
*iStoaApp* in the remaining of this README document.

# Installation
Follow the instructions to build the iStoaApp within the [Cuis-Smalltalk
environment](http://cuis.st). All the DKM packages are installed with
the appropriate menus to play and to edit each model.

We need first to fetch the Cuis-Smalltalk environment and the
needed dependencies.

## 1. The Cuis-Smalltalk Environment
```bash
mkdir Cuis
cd Cuis
# Install Cuis image and packages
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI
git clone --depth 1 https://github.com/Cuis-Smalltalk/SVG
git clone --depth 1 https://github.com/Cuis-Smalltalk/Numerics
```

Next, we fetch the source code packages of the DKM and
iStoaApp.

## 2. The DKM and iStoaApp packages

```bash 
cd Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/Dynamic-Book/DyboLib
git clone --depth 1 https://framagit.org/istoa/app
```

## 3. Start the iStoaApp IDE
This build an environment to test and to develop the DKM.

```bash
cd Cuis/Cuis-Smalltalk-Dev
./app/startIDE.sh
```

A new image istoaIDE.image is built. This is the development
environment for the iStoaApp.

# Licenses

* Copyright 2025-2026 Hilaire Fernandes

* The iStoa source code `iStoaApp.pck.st` is released under the terms of
  the MIT license.

* Each DKM source code is released under the terms of its specific
  license, as specified in their [source code
  folder](https://github.com/istoa-eu/app/tree/main/src/dkm)

License restrictions may apply to the whole application built from the
iStoaApp source code and DKMs source codes.
