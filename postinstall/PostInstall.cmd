@echo off 

cd /D "%~dp0"
@REM echo Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-powershell.ps1') } -useMSI -EnablePSRemoting -Quiet"

@REM pwsh -Command "& {Set-ExecutionPolicy bypass}" -NoExit
@REM start /wait pwsh -Command "& {./start.ps1}" -NoExit
@REM pwsh -Command "& {Set-ExecutionPolicy RemoteSigned}" -NoExit

start /wait Powershell.exe -executionpolicy bypass -File  "./start.ps1"


@REM c:\Windows\System32\shutdown.exe -r -f -t 0
