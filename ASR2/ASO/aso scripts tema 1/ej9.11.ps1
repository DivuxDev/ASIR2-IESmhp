# Ej9.11 Por David Prado

$x=Read-Host "introduce en numero del lado"
$i=0
$a= " " * $x
$b= "*" * $x
 
write-host "*"$b "*"
while ($i -lt $x)
{
write-host "*"$a "*"
$i++
} 
write-host "*"$b "*" 