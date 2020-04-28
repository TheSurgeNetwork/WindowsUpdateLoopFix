# CHANGELOG

> Name: Windows Update Loop Fix  
> Author: aakkam22  
> Editor: firewire10000   
> Last Updated : 28 April 2020

## 5.X

### 5.1

* Fixed bug where the `updates.cmd` and `cleanup.cmd` files were not copying to the destination directory
* Added the ability to run script as Administrator by double clicking the batch file
* Added title names to Command Prompt window to show the current section running in the batch file

### 5.0

* Rewrote the whole script
* Updated documentation on GitHub

## 4.X

### 4.1.2

* Project moved *OpenSource* to [GitHub](https://github.com/aakkam22/windowsUpdateLoopFix)
* Added FAQ to documentation
* Fixed a bug in the Administrator manifest

### 4.1.1

* Fixed an issue where the wizard would report insufficient privileges even when run as administrator
* Minor improvements

### 4.1

* Major code audit and cleanup
* Added %errorlevel%==2 for wusa.exe in stage 3
* Improved the reliability of the file download code


### 4.0

* 32 and 64-bit sources merged into one script
* Required updates are now downloaded directly from Internet (BETA)
* UX and code improvements


## 3.X

* Compiled the program contents into a single .exe file for ease of use
* UX and code improvements

## 2.X

* Added advanced options
* Rewrote documentation
* UX and code improvements

## 1.X

### 1.2

* UX and code improvements

### 1.1

* Added prompt reminding users to extract the zip folder

### 1.0

* Initial Release
