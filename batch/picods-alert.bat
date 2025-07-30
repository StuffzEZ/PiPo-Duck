@echo off
:: Enable ANSI escape sequences (Windows 10+)
:: Clear the screen and print red text

:: Use prompt trick to get ESC char into variable
for /F "delims=" %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

cls
color 4
echo Rread the Pop Up!

:: -------------------------------
:: Create temporary VBScript for popup
:: -------------------------------
echo Set objShell = CreateObject("WScript.Shell") > %temp%\popup.vbs
echo objShell.Popup "This means someone has plugged a PiPo ducky into your computer and ran this script to warn you! They are kind for doing that since it's a hacking tool :3", 0, "You should be grateful!", 64 >> %temp%\popup.vbs

:: Show the popup and wait until user closes it
cscript //nologo %temp%\popup.vbs
del %temp%\popup.vbs

:: -------------------------------
:: Create a second batch file to delete this one
:: -------------------------------
> %temp%\delself.bat echo @echo off
>> %temp%\delself.bat echo ping 127.0.0.1 -n 3 >nul
>> %temp%\delself.bat echo del "%~f0"

:: Run the delete script in background
start "" /b %temp%\delself.bat
exit
