# Ej9.12 Por David 

if (($args[0] -lt 10) -or ($args[0] -gt 30))
{
$ERR++
Write-Host "llevas" $ERR "intentos fallidos"
}
else
{
$a= "*" * $args[0]
Write-Host $a
}