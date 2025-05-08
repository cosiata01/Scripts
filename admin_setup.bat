:: Con el echo off hacemos que no se vean las acciones que realiza nuestro script y oculta las acciones
@echo off

:: Se usa para activar algo llamado expasión retardada de variables,se utiliza sobre todo para estructuras como if o for
setlocal EnableDelayedExpansion   

:: Aquí solicitamos los datos al usuario, la IP, Máscara, Gatewal 
set /p IP=Introduce la dirección IP: 
set /p MASCARA=Introduce la máscara de subred: 
set /p GATEWAY=Introduce la puerta de enlace: 


:: Configurar la red usamos el comando netsh con ello configuramos la interfaz "Ethernet" la dejamos estatica con los datos dados
:: Cuando usamos el echo siempre lo usamos para ver que se está "imprimiendo" en la consola

echo Configurando IP
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %GATEWAY%
echo Configuracion aplicada

:: Ahora creamos dos variables que pediran las rutas para copiar archivos, es decir a hacer un backup.
::El origen pide dice de dónde copiar los archivos y el destino donde los copia  
set /p ORIGEN=Ruta de origen para la copia:
set /p DESTINO=Ruta de destino para la copia:

:: Aquí nos dice que si no existe esa caperta de destino lo cree
if not exist "%DESTINO%" mkdir "%DESTINO%"

echo Iniciando backup...

::Robocopy se usa para copiar archivos y carpetas
::El parámetro  /E copia subcarpetas, /Z le está diciendo reinicialo en caso de que se interrupa el proceso, /NP no muestra el progreso de la copia
:: Finalemnte el /LOG+:log_admin.txt guarda un log en el archivo log_admin.txt sin borrar lo que ya haya   
robocopy "%ORIGEN%" "%DESTINO%" /E /Z /NP /LOG+:log_admin.txt

:: Aquí agregamos la fecha con las datos al log
:: En teoria debería imprimir todos los datos dados, pero habría que cambiar "%PUERTA% por %GATEWAY%"
echo --- >> log_admin.txt
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt
echo [%DATE% %TIME%] Copia realizada de %ORIGEN% a %DESTINO% >> log_admin.txt

:: finalemnte se informa que todo terminó con el echo
:: y el Pause mantiene la ventana abierta a la espera de que el ususario presione una tecla. 
echo Operación completada. Revisa el archivo log_admin.txt
pause
