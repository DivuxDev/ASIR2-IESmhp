
Write-Host 'a que adaptador quieres cambiar la IP'
Get-NetAdapter

#introducir el adaptador de red

$numerito = Read-Host 'introduce el index'

#introducir los parametros de red  a cambiar 

$IP = Read-Host -Prompt 'introduce la IP'

$MaskBits = 24 # This means subnet mask = 255.255.255.0
$Gateway = Read-Host 'introduce la gateway'

$Dns = Read-Host 'introduce el DNS'
$IPType = "IPv4"
$adapter= Get-NetAdapter -InterfaceIndex $numerito

 # Configure the IP address and default gateway
$adapter | New-NetIPAddress `
    -AddressFamily $IPType `
    -IPAddress $IP `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway

# Configure the DNS client server IP addresses
$adapter | Set-DnsClientServerAddress -ServerAddresses $DNS