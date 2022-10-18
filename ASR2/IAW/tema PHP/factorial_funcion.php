<?php
$numerodado=$_POST['numeroacalcular'];
function facto($arg_1)
{
    $i=1;
    $resul=1;
    while ($i <= $arg_1)
    {
    $resul=$resul*$i;
    $i++;
    }
    
    if ($i = $arg_1)
    {
        echo "el numero factorial de " ;
        echo $arg_1; 
        echo " es ";
        echo $resul;
    }  
}

facto($numerodado);

?>