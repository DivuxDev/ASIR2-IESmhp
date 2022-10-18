<!DOCTYPE html>
<html>

<body>

    <?php
echo "Tablas";
echo "<br>";
    for ($multiplo = 0; $multiplo <= 20; $multiplo++) {
        echo "tabla del $multiplo";
        echo "<br>";
        for ($multiplicador = 0; $multiplicador <= 15; $multiplicador++) {
            echo "$multiplo * $multiplicador = ";
            echo $multiplicador * $multiplo;
            echo "<br>";
        }
        echo "<br>";
    }
    ?>

</body>

</html>