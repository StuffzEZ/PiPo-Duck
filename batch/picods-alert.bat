@echo off
:: Create temporary VBScript for popup
echo Set objShell = CreateObject("WScript.Shell") > %temp%\popup.vbs
echo objShell.Popup "This is your alert message!", 5, "Alert Title", 64 >> %temp%\popup.vbs

:: Show the popup
cscript //nologo %temp%\popup.vbs
del %temp%\popup.vbs

:: Create a second batch file to delete this one
> %temp%\delself.bat echo @echo off
>> %temp%\delself.bat echo ping 127.0.0.1 -n 2 >nul
>> %temp%\delself.bat echo del "%~f0"

:: Run the delete script and exit
start "" /b %temp%\delself.bat
exit
