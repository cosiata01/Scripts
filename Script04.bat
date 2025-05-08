@echo off
rem condicional If simple 
set /p edad=Que edad tienes?
if %edad% GEQ 18 (
    echo Eres mayor de edad
) else (
    echo Eres menor de edad
)
pause
