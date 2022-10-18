write-host '1. mostrar info de archivos'
write-host '2. crear archivo'
write-host '3. crear carpeta'
write-host '4. mostrar archivos ocultos'
write-host '5. fecha de creacion de archivo'
write-host '6. archivos creados recientemente'
write-host '7. archivos con extension "x"'

$opcion=read-host 'elige una de las opciones'
switch ($opcion)
{
1{ 
$ruta=read-host "que archivo quieres mostrar?"
gci -Path $ruta  
}
################################################
2{
$ruta=read-host "en que ruta quieres crear el archivo?"
$nombre=Read-Host "que nombre quieres que tenga el archivo"
New-Item -Path $ruta -ItemType File -name $nombre
}
################################################
3{
$ruta=read-host "en que ruta quieres crear la carpeta?"
$nombre=Read-Host "que nombre quieres que tenga la carpeta"
New-Item  -ItemType Directory -Path $ruta -Name $nombre
}
################################################
4{
$ruta=read-host "en que ruta quieres mostrar archivos ocultos?"
gci -Path $ruta -Hidden
}
################################################
5{
$ruta=read-host "escribe la ruta del archivo"
(gci -path $ruta).creationtime
}
################################################
6{
$ruta=read-host "escribe la ruta del directorio"
gci -Path . | Sort-Object LastWriteTime -Descending
}
################################################
7{
$ruta=read-host "escribe la ruta del directorio"
$tipo=read-host "escribe la extension del archivo"
gci -Path $ruta -name *.$tipo
}
################################################
default{Write-Host "no has introducido nada"}
}