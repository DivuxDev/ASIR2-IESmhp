#script de archivos
# comprobar si un archivo, si existe
# 1. agregar una palabra a ese archivo
# 2. ver el contenido de ese fichero
# 3. ver la ultima linea de ese fichero
# 4. comprimir a .zip
# 5. encontrar la fecha de ultima modificacion
# 6. ver los permisos
# 7. establecer permisos
#si no existe preguntar si le quieres crear


$rutaarchivo=Read-Host "escribe la ruta de un archivo"
if ( test-path -path $rutaarchivo) 
{ 
write-host '1. agregar una palabra a ese archivo'
write-host '2. ver el contenido de ese fichero'
write-host '3. ver la ultima linea de ese fichero'
write-host '4. comprimir a .zip'
write-host '5. encontrar la fecha de ultima modificacion'
write-host '6. ver los permisos'
write-host '7. establecer permisos'
write-host '8. salir'

$opcion=Read-Host 'que quieres hacer?'
switch ($opcion){

1{

$textosfin=Read-Host 'escribe el texto que quieras añadir al final'
Add-Content –Path $rutaarchivo –Value $textosfin

}
################################################
2{

Write-Host 'el contenido del fichero $rutaarchivo es ...'
Get-Content -Path $rutaarchivo
}
################################################
3{


write-Host 'la ultima linea del fichero $rutaarchivo es ...'
Get-Content -Path $rutaarchivo -tail 1

}
################################################
4{

$destino=Read-Host 'introduzca la ruta de destino del ZIP terminada con el nombre'
Compress-Archive -Path $rutaarchivo -CompressionLevel Optimal -DestinationPath $destino 

}
################################################

5{

(gci -Path $rutaarchivo).LastWriteTime

}
################################################

6{
Write-Host 'los permisos de' $rutaarchivo 'son..'
Get-Acl –Path $rutaarchivo
}
################################################
7{
Set-Acl –Path $rutaarchivo
}
################################################
8{
return
}

}

}

else 

{ 
$crear=read-host "no existe, quieres crearlo s\n"
if ( $crear -eq 's')

{echo 'si'}

else 

{echo 'no'}

}
