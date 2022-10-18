#ej4
#script de redes
# 1. dar informacion de la tarjeta de red del equipo
# 2. mostrar ip
# 3. renombrar la tarjeta de red

write-host '1. dar informacion de la tarjeta de red del equipo'
write-host '2. mostrar ip'
Write-Host '3. renombrar la tarjeta de red'

$opcion=Read-Host 'que quieres hacer'
switch ($opcion) 
{

1{

Get-NetAdapter -Name Ethernet

}
2{

write-host 'tu IP es....'
(Get-NetIPAddress -interfacealias Ethernet).IPv4Address

}
3{
$nuevonombr=read-host 'cual quieres que sea el nuevo nombre de la tarjeta'
Rename-NetAdapter -Name Ethernet -NewName $nuevonombr

}

}