@echo off
setlocal


set "origen=archivo.txt"



for /L %%i in (1,1,5) do (
    copy "%origen%" "archivo_%%i.txt"
    echo Copiada como "archivo_%%i.txt"
)

endlocal