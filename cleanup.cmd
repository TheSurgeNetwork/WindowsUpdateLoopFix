@echo off

REM NAME: Windows Update Loop Fix
REM VERSION: 5.1
REM BUILD DATE: 28 April 2020
REM AUTHOR: aakkam22
REM EDITOR: firewire10000

REM Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

call :setWindow
goto cleanup

REM Function to set the window properties
:setWindow
title Windows Update Loop Fix
mode con cols=80 lines=40
goto :eof

REM Function to print header
:printHeader
cls
echo.
echo %screen%
title title Windows Update Loop Fix - %screen%
echo.
goto :eof

:cleanup
set screen=Cleanup
call :printHeader
echo The script is deleting leftover files...
rmdir %systemdrive%\packages\3020369 /s /q >nul 2>&1
rmdir %systemdrive%\packages\3172605 /s /q >nul 2>&1
del /q %systemdrive%\packages\3020369.msu >nul 2>&1
del /q %systemdrive%\packages\3172605.msu >nul 2>&1
del /q %systemdrive%\packages\wua.exe >nul 2>&1
del /q %systemdrive%\packages\updates.cmd >nul 2>&1
del /q %systemdrive%\packages\master.cmd >nul 2>&1
goto summary

:summary
set screen=Summary
call :printHeader
echo The script has finished running. You can now check for Windows Updates. 
echo.
echo Please be patient when checking for updates for the first time. 
echo Windows Update might still be registering brand new components.
echo.
echo NOTE: A DISM.EXE log for the update installations was created at:
echo.
echo.	"%systemdrive%\install.log"
echo.
echo Please choose an option:
echo.
echo.	+-------------------------------+
echo.	^|			    	^|
echo.	^|  [1] Open Windows Update	^|
echo.	^|  [2] Go to GitHub Repository	^|
echo.	^|  [3] Exit		   	^|
echo.	^|			      	^|
echo.	+-------------------------------+
choice /c 123 /n
	if %errorlevel% EQU 3 goto quit
	if %errorlevel% EQU 2 start https://github.com/aakkam22/windowsUpdateLoopFix && goto :summary	
	if %errorlevel% EQU 1 start wuapp.exe && goto :sumarry

:quit
SETLOCAL >nul 2>&1
SET someOtherProgram=SomeOtherProgram.exe >nul 2>&1
TASKKILL /IM "%someOtherProgram%" >nul 2>&1
DEL "%~f0" >nul 2>&1
exit 
