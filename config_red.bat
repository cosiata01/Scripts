@echo off
setlocal EnableDelayedExpansion


set /p IP=Introduce la dirección IP: 
set /p MASCARA=Introduce la máscara de subred: 
set /p GATEWAY=Introduce la puerta de enlace: 


set INTERFAZ=Ethernet


netsh interface ip set address name="%INTERFAZ%" static %IP% %MASCARA% %GATEWAY%


set FECHA=%DATE:/=-%
set HORA=%TIME::=-%
set HORA=%HORA: =0%  
set HORA=%HORA:.=-%  
set ARCHIVOLOG=config_red_log_%FECHA%_%HORA%.txt


(
echo Fecha: %DATE% %TIME%
echo Interfaz configurada: %INTERFAZ%
echo IP: %IP%
echo Máscara: %MASCARA%
echo Puerta de enlace: %GATEWAY%
) >> %ARCHIVOLOG%


echo Configuración aplicada correctamente.
echo Log creado: %ARCHIVOLOG%

endlocal
pause

