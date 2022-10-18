#ejercicio 8.9 por David Prado

if ($args[0] -is [int]) 
{
write-host "el primer argumento es entero"
} 
else
{
write-host "el primer argumento no es entero"
}


if ($args[1] -is [int]) 
{
write-host "el segundo argumento es entero"
} 
else
{
write-host "el segundo argumento no es entero"
}

if ( $args[0] -and $args[1] -is [int]) 
{
write-host "la suma de los dos numeros es de"
[int]$args[0]+$args[1]
} 
else
{
write-host "no se puede sumar ya que no son enteros los dos numeros"
}
