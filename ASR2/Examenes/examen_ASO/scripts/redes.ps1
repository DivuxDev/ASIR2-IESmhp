#ej3
#script de redes
write-host '1. mostrar version de powershell'
write-host '2. mostrar IP'
write-host '3. mostrar tabla de rutas'
write-host '4. cambiar el nombre del equipo'
write-host '5. añadir un equipo a un dominio'

$opcion=Read-Host 'que quieres hacer'
switch ($opcion) 
{

1{

$PSVersionTable.PSVersion

}
################################################
2{

write-host 'tu IP es....'
(Get-NetIPAddress -interfacealias Ethernet).IPv4Address

}
################################################
3{

Get-NetRoute

}
################################################
4{

$nombreequipo=Read-Host "escribe el nuevo nonbre del equipo"
Rename-computer $nombreequipo
}
################################################
5{
$nombredominio=Read-Host 'escribe el nombre del dominio'
Add-Computer -DomainName $nombredominio
}

}