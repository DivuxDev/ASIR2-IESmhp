# Ej9.12 Por David 

$x=Read-Host "introduce la altura"
$y=Read-Host "introduce la base"

$i=0
$a= "*" * $x
$b= "*" * $y
 
while ($i -lt $x)
{
write-host ($a)
$i++
} 
