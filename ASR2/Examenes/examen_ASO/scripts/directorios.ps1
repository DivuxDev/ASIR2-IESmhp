# 1. crear un directorio
# 2. mover un directorio a otro lado
# 3. renombar un directorio
# 4. copiar un directorio
# 5. eliminar un directorio
# 6. ver el directorio
# 7. añadir directorio


write-host '1. crear un directorio'
write-host '2. mover un directorio a otro lado'
write-host '3. renombar un directorio'
write-host '4. eliminar un directorio'
write-host '5. ver el directorio'
write-host '6. ver los permisos'
write-host '7. añadir directorio'
write-host '8. salir'

$opcion=read-host 'elige una de las opciones'
switch ($opcion)
{
1{
$ruta=Read-Host "introduce la ruta del archivo y el nombre del directorio"
$nombre=read-host "introduce el nombre"
New-Item -ItemType directory -Path $ruta\$nombre
}
################################################
2{
$ruta=read-host "introduce la ruta del directorio?"
$destino=read-host "introduce la ruta de destino del directorio"
Move-Item -Path $ruta -Destination $destino
}
################################################
3{
$ruta=read-host "introduce la ruta del directorio que quieres cambiar de nombre"
$nuevo=read-host "nuevo nombre"
Ren $ruta $nuevo
}
################################################
4{
$ruta=read-host "rutal del directorio que quierer eliminar"
Remove-Item $ruta
}
################################################
5{
$ruta=read-host "ruta del directorio"
Get-ChildItem -Path $ruta -Force
}
################################################
6{
$ruta=read-host "ruta del directorio que quieres ver los permisos"
Get-Acl –Path $ruta
}
################################################
7{
$ruta=read-host "escribe la ruta del directorio al que quieras añadir"
$añadir=read-host "escribe los archivos que quieres añadir"
New-Item -path $ruta -ItemTypeDirectory -name $añadir
}
################################################
8{
return
}
default{Write-Host "no has introducido nada"}
}