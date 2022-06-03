::===============================================================
:: Unnecessary files removal tool v1.1
:: Windows 7/8/10/11
:: @bonina.eu
::===============================================================
@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
goto :start
) else (
color 0C
echo ERROR please execute with admin privileges
goto :error
)

:start
cleanmgr.exe /SAGESET:1 && (color 0A & echo Clean setup OK) || (color 0C & echo Clean setup ERROR & goto :error)
cleanmgr.exe /SAGERUN:1 && (color 0A & echo. & echo Cleaning OK) || (color 0C & echo. & echo Cleaning ERROR & goto :error)
Dism.exe /online /Cleanup-Image /StartComponentCleanup && (color 0A & echo Image cleanup OK) || (color 0C & echo Image cleanup ERROR & goto :error)
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase && (color 0A & echo Base image OK) || (color 0C & echo Base image ERROR & goto :error)

del /S /Q /F "C:\Windows\SoftwareDistribution\Download\*" >nul && for /D %%p in (C:\Windows\SoftwareDistribution\Download\*) do rmdir /S /Q "%%p" && (color 0A & echo. & echo WUpdate cache OK & goto :success) || (color 0C & echo. & echo WUpdate cache ERROR & goto :error)

:success
echo.
echo.
echo Unnecessary files sucessfuly removed
:error
echo.
echo PRESS ANY KEY TO CLOSE WINDOW
pause >nul
goto: eof