@echo off
:: =============================================
:: Script avec admin + suppression totale après utilisation
:: =============================================

NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs" >nul 2>&1
    exit /b
)

:: Lancement de kdmapper
start "" "%TEMP%\kdmapper_Release" "%TEMP%\qe7irj.sys" >nul 2>&1

:: Attente pour que kdmapper termine
timeout /t 6 /nobreak >nul

:: Nettoyage + auto-suppression
start "" /b cmd /c "timeout /t 3 /nobreak >nul & del /F /Q "%TEMP%\qe7irj.sys" "%TEMP%\kdmapper_Release.exe" "%TEMP%\kdmapper_Release" "%~f0" >nul 2>&1" >nul 2>&1

exit
