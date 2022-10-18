<!DOCTYPE html>

<!-- programa Hecho por David Prado este programa sirve para recoger las respuestas del
 formulario de "formulario.php"-->

<html>
<body>
    <h1>Club de patinaje ales Viana</h1>
    <h2>firma individual</h2>
    <p>desde el club de patinaje Ales de Sagunto iniciamos una recogida de firmas con el fin de conseguir
        unas intalaciones de Hockey Linea aptas para competir a nivel nacionaly autonomico
    </p>
    <p>Estas firmas se presentán al Ayuntamiento de Viana junto con las necesidades evidentes
        que reclama el Club y su masa social para conseguir la adaptacion de un pabellon deportivo cerrado
        para compertir t la creacion de una segunda pista de hockey en la que puedan entrear todos
        los equipos
    </p>
        <!-- las respuestas con php -->

    <p>yo Dña/D_______ <?php echo  $_POST['nombre']; ?> <?php echo $_POST['apellidos']; ?>_____________, con DNI número________ <?php echo $_POST['DNI']; ?>_________
        firmo para que el Ayuntamiento de Viana cubra las necesidades del club de Patinaje de Ales de Viana
        con respecto a las instalaciones deportivas tal y como ellos lo demandan
    </p>

    <p> Firma:</p>
    <br>
    <!-- fecha por PHP-->
    <p> Fecha : <?php echo date("d/m/y") ?></p>

</body>

</html>