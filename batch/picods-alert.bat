@echo off
:: Create temporary VBScript for popup
echo Set objShell = CreateObject("WScript.Shell") > %temp%\popup.vbs
echo objShell.Popup "This message is shown because someone has plugged a PiPo ducky into your computer and ran this script to warn you! They are kind for doing that since its a hacking tool :3", 0, "You should be grateful!", 64 >> %temp%\popup.vbs
cls

:: Show the popup (waits for user to close it)
cscript //nologo %temp%\popup.vbs
del %temp%\popup.vbs
cls

:: Create a second batch file to delete this one AFTER popup closes
> %temp%\delself.bat echo @echo off
>> %temp%\delself.bat echo ping 127.0.0.1 -n 4 >nul
>> %temp%\delself.bat echo del "%~f0"

:: Run the delete script in background
start "" /b %temp%\delself.bat
exit
