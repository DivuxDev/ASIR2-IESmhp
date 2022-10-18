<?php
//<!-- codigo hecho por David Prado -->
$numero = $_POST['inputNumPrimo'];
$contadorPrimo = 0;
$contador = 1;
while( $contador<=$numero ){
	if($numero % $contador == 0){
		$contadorPrimo++;
	}
    $contador++;
}

if($contadorPrimo == 2){
	echo "El numero ".$numero." es primo";
}
else{
	echo "El numero ".$numero." NO es primo";
}
