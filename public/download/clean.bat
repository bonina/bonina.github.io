@echo off
echo =====================================
echo  Unnecessary files removal tool v1.1
echo  for Windows 7/8/10/11
::    @bonina.eu
echo =====================================
echo.

net session >nul 2>&1
if %errorLevel% == 0 (
goto :start
) else (
echo ERROR please execute with admin privileges
goto :error
)

:start
color 0A
echo Cleanup setup in progress... & cleanmgr.exe /SAGESET:1 && (echo Cleanup setup OK) || (echo Cleanup setup ERROR & goto :error)
echo. & echo Cleanup in progress... & cleanmgr.exe /SAGERUN:1 && (echo Cleanup OK) || (echo Cleanup ERROR & goto :error)
Dism.exe /online /Cleanup-Image /StartComponentCleanup && (echo WImage cleanup OK) || (echo Image cleanup ERROR & goto :error)
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase && (echo Base wimage cleanup OK) || (echo Base wimage cleanup ERROR & goto :error)

echo. & echo WUpdate cache cleanup in progress... & (del /S /Q /F "C:\Windows\SoftwareDistribution\Download\*" >nul & for /D %%p in (C:\Windows\SoftwareDistribution\Download\*) do rmdir /S /Q "%%p") && (echo WUpdate cache cleanup OK & goto :success) || (echo WUpdate cache cleanup ERROR & goto :error)

:success
echo.
echo.
echo ==========================================
echo  ALL Unnecessary files sucessfuly removed
echo ==========================================
:continue
echo.
echo PRESS ANY KEY TO CLOSE WINDOW
pause >nul
goto: eof

:error
color 0C
goto :continue
