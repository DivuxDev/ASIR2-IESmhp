<html>
    <!-- codigo hecho por David Prado, este codigo calcula la masa corporal y te dice si
     tienes sobrepeso,peso normal o infrapeso dependiendo de tu genero-->
<body>
    <?php
    //calculos necesarios  y definicion de variables
    $cm = $_POST['cm'];
    $kg = $_POST['kg'];
    $m = $cm / 100;
    $m2 = $m * $m;
    $imc = $kg / $m2;
    $genero = $_POST['genero'];

    if ($genero == "hombre") {
        if ($imc < 21) {
            $estado = "infrapeso";
        }

        if ($imc > 21 && $imc < 25) {
            $estado = "peso normal";
        }

        if ($imc > 25) {
            $estado = "sobrepeso";
        }
    } else {
        if ($imc < 21) {
            $estado = "infrapeso";
        }

        if ($imc > 21 && $imc < 25) {
            $estado = "peso normal";
        }

        if ($imc > 24) {
            $estado = "sobrepeso";
        }
    }

    //texto que muestra el texto de resultado
    echo "<br>";
    echo "Su indice de masa corporal es de ";
    echo $imc;
    echo "<br>";
    echo "Usted es una persona con ";
    echo $estado;
    echo "<br>";
    ?>
    <br>
    <a href="javascript:history.back()"> Volver Atrás</a>
</body>
</html>