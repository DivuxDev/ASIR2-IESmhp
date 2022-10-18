<?php
#codigo hecho por david prado Mejuto
$numerodado=$_POST['numeroacalcular'];
$i=1;
$resul=1;
while ($i <= $numerodado)
{
$resul=$resul*$i;
$i++;
}

if ($i = $numerodado)
{
    echo "el numero factorial de " ;
    echo $numerodado; 
    echo " es ";
    echo $resul;
}

?>