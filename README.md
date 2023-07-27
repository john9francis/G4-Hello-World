# G4-Hello-World

[![Latest release](https://img.shields.io/badge/Release:-v0.1.0-violet)](https://github.com/john9francis/G4-Hello-World/releases/latest) 
[![Software Demo Video](https://img.shields.io/badge/Software_demo-YouTube-red)](https://www.youtube.com/channel/UCDJQomy5ICn2fkJWiCm9Dig)

# Overview

G4 Hello World is an extremely simple Geant4 application to quickly start developing apps. It includes many helpful features, while still staying as simple and as generic as possible.

Don't spend precious time configuring your cmakelists file, or linking your app to the Geant4 source code, just download G4-Hello-World and hit the ground running.

# How to use

Before using G4 Hello World, you must have the Geant4 source code, cmake, and visual studio downloaded. For a comprehensive tutorial on downloading and installing these, check out my [YouTube tutorial](https://youtu.be/w7k9PK1Ipv8). 

To run G4 Hello World, download the source code, and compile it with cmake. This will create a build directory with an executible file in the "release" directory. Clicking on this file should open a Geant4 GUI. Once in the GUI, you can run test.mac to display "Hello World" in the output console.

G4 Hello World is designed to be converted into your own Geant4 project. To start developing, download the source code from the latest release, and open the project in visual studio. Simply perform a "find and replace" in the CMakeLists.txt replacing all instances of "Hello_World" with the name of your desired app. Also rename Hello_World.cc to your desired app name. Then, after compiling again to make sure there are no errors, you're ready to start writing your Geant4 app. 

For more help, check out my [G4 Hello World Software Demo Video](https://www.youtube.com/channel/UCDJQomy5ICn2fkJWiCm9Dig)

# Versions

This app was devloped in Windows 11. It uses Geant4 version 11.1.2, and CMake version 3.16 and above. (Release for macOS coming soon...)

# Features of G4-Hello-World:

- [Simple UI or Batch mode Geant4 application](#simple-ui-or-batch-mode-geant4-application)
- [Pre-Configured CMakeLists file](#pre-configured-cmakelists-file)
- [Connection to Geant4 source code](#connection-to-geant4-source-code)
- [Link to src and include folders](#link-to-src-and-include-folders)
- [Automatic mac file copying](#automatic-mac-file-copying)
- [Geant4 License](#geant4-license)
- [Simple gitignore file](#simple-gitignore-file)

## Simple UI or Batch mode Geant4 application

This app supports both UI and Batch modes for Geant4 devloping. In other words, you can either double click on the Hello_World.exe file to run, or run from the terminal by the command, 
```
.\Hello_World test.mac
```
The second method runs much faster especially when modelling several particle interactions.

## Pre-Configured CMakeLists file

Save hours configuring your CMakeLists.txt file by using G4 Hello World. G4 Hello World uses similar cmake configurations that can be found in official Geant4 example applications, as well as some helpful additions. 

## Connection to Geant4 source code

As long as you have correctly installed the Geant4 source code on your computer, G4 Hello World will automatically link to the Geant4 source code right away. This way you can start including G4 headers without missing a beat. 

## Link to src and include folders

G4 Hello World's CMakeLists.txt file automatically configures your project's include and src directories. The project will expect your "src" directory to contain any .cc files where you define your own classes, and it will expect to find your own .hh files in the "include" directory. 

## Automatic mac file copying

An added bonus to G4 Hello World is automatic mac file copying. Upon building, G4 Hello World will copy all mac files in the "mac_files" directory into the same directory as the .exe file. This way your application can run the mac files without errors. 

## Geant4 License

G4 Hello World comes with the Geant4 software License already included, so no need to worry about legal issues when developing open source Geant4 applications. 

## Simple gitignore file

G4 Hello World comes with a very simple .gitignore file, which ignores your .vs/, out/ and build/ directories. This allows for simpler version control by making sure all the junk files don't get added to your own GitHub repository. 
