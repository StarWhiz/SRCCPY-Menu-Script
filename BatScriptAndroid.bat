:: This script is written for the scrcpy application. Scrcpy is an application
:: that can display and control one's android phone on a Windows machine. 
::
:: The app can be found at https://github.com/Genymobile/scrcpy
:: 
:: Written by: Tai Dao
:: Date: 09/25/2019

:: Change IP to be the IP address of the target phone.
SET ip_address=192.168.88.203
:: Set the path to your scrcpy directory. 
SET scrcpy_path=C:\screen copy android

ECHO OFF
CLS
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO ...............................................
ECHO.
ECHO USB Debugging must be enabled on phone for this to work!!!
ECHO.
ECHO For WiFi connection do options 1. 2. Then 3.
ECHO.
ECHO For Direct USB connection skip option 1 and 2...
ECHO Plug in USB cable and choose option 3.
ECHO.
ECHO.
ECHO 1 - Connect Phone to PC via USB. Then choose this option.
ECHO 2 - Unplug Phone from PC. Then choose this option.
ECHO 3 - Start scrcpy.exe
ECHO 4 - EXIT
ECHO.

SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO MENU1
IF %M%==2 GOTO MENU2
IF %M%==3 GOTO MENU3
IF %M%==4 GOTO MENUEXIT

:MENU1
cd %scrcpy_path%
adb.exe tcpip 5555
GOTO MENU
:MENU2
cd %scrcpy_path%
adb.exe connect %ip_address%:5555
GOTO MENU
:MENU3
cd %scrcpy_path%
ECHO ...............................................
ECHO Quick Reference
ECHO ...............................................
ECHO Ctrl+G = Original resolution.
ECHO Ctrl+X = Resize to screen.
ECHO Ctrl+H = Home
ECHO Ctrl+B = Back
ECHO Ctrl+M = Menu
ECHO Ctrl+F = Fullscreen
ECHO Ctrl+P = Power
ECHO Ctrl+O = Turn off phone screen
ECHO.
scrcpy.exe
GOTO MENU
:MENUEXIT
cd %scrcpy_path%
adb.exe kill-server
PAUSE
GOTO EOF