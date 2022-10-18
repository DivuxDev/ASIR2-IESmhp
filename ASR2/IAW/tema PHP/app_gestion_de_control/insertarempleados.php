<html>
<link rel="stylesheet" href="cssphp.css">
<body>
<nav>
<ul>
        <li><a href="panel.php">Inicio</a></li>
        <li><a href="insertarclientes.php">Insertar clientes</a></li>
        <li><a href="insertarempleados.php">Insertar empleados</a></li>
        <li><a href="insertarproveedores.php">Insertar proveedores</a></li>
        <li><a href="insertarproductos.php">Insertar productos</a></li>
        <li><a href="listarnominas.php">Listar nominas</a></li>
        <li><a href="listarproveedores.php">Listar proveedores</a></li>
    </ul>
</nav>


<div class="panelcentral">
<h1>Formulario de insercion de empleados</h1>
<form  action="insertarempleados.php" method="POST">
    Nombre: <input type="text" name="nombre" ><br><br>
    Apellidos: <input type="text" name="apellidos"><br><br>
    categoria: <input type="text" name="categoria"><br><br>
    sueldo: <input type="text" name="sueldo"><br><br>
    <input type="submit" name="submit" value="Insertar empleados"><br><br>
    <input class="botoninicio" type="reset" value="Resetear">
</form>
<?php

$hostname = "localhost";
$user = "root";
$pwd = "";
$dbname = "empresa";



if (isset($_POST['submit']) && !empty($nombre=$_POST["nombre"])){
// Conectando, seleccionando la base de datos
if (!$conect = mysqli_connect($hostname, $user, $pwd,$dbname)) {
    die("no se ha podido conectar al SGBD");
}
$nombre= $_POST["nombre"];
$apellidos= $_POST["apellidos"];
$categoria=$_POST["categoria"];
$sueldo=$_POST["sueldo"];

$insert= "insert into empleados values
(NULL,'".$nombre."','".$apellidos."',".$categoria.",".$sueldo.")";

if (mysqli_query($conect,$insert) === TRUE) {
    echo "Se ha insertado correctamente";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
// Cerrar la conexión
mysqli_close($conect);
}else {}
?>
</div>


</div>
</body>

</html>