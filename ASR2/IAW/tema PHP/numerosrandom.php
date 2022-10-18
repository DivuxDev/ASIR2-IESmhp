

<?php 
#codigo hecho por david prado
$i=1;
$par=array();
$impar=array();

while ($i <= 100)
{

$num=rand(1,5000);

if (($num % 2) == 0)
{array_push($par, $num);}
else
{array_push($impar, $num);}
$i++;
}

echo "estos numero son pares ";
print_r($par);
echo "<br>";
echo "estos numero son impares ";
print_r($impar);

?>