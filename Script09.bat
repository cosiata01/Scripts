@echo off
set /p nombreUsuario=Dime tu nombre de NombreUsuario:
set /p password=Dime tu contrasena:

net user %nombreUsuario% %password% /add

echo %nombreUsuario% Ya tu usuario esta creado 

pause

set /p AgregarGrupo=Quieres ser agregado a un grupo? (S/N): 
if %AgregarGrupo% == S (
    set /p grupoLocal=Que grupo?
    net localgroup %grupolocal% %nombreUsuario% /add
) else (
    echo no has sido agregado a ningun grupo 
)

pause