<?php
$num1=($_POST["primernumero"]);
$num2=($_POST["segundonumero"]);
$operador=$_POST["operacion"];

function suma($arg_1,$arg_2)
{$resul=$arg_1 + $arg_2;
echo "la suma da ";
echo $resul;}

function multiplicacion($arg_1,$arg_2)
{$resul=$arg_1 * $arg_2;
echo "la multiplicacion da ";
 echo $resul;}

function resta ($arg_1,$arg_2)
{$resul=$arg_1 - $arg_2;
    echo "la resta da ";
    echo $resul;}

function division($arg_1,$arg_2)
{$resul=$arg_1 / $arg_2;
    echo "la division da ";
    echo $resul;}

if ( $operador == "sum")
{suma($num1,$num2);}
elseif ($operador == "rest")
{resta($num1,$num2);}
elseif ($operador == "mul")
{multiplicacion($num1,$num2);}
elseif ($operador == "div")
{division($num1,$num2);}
?>