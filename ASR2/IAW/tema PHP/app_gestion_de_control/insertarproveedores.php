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
<h1>Formulario de insercion de proveedores</h1>
<form  action="insertarproveedores.php" method="POST">
    Nombre: <input type="text" name="nombre" ><br><br>
    Id Producto: <input type="text" name="id_producto"><br><br>
    Correo: <input type="text" name="correo"><br><br>
    <input type="submit" name="submit" value="Insertar proveedores"><br><br>
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
$id_producto= $_POST["id_producto"];
$correo=$_POST["correo"];

$insert= "insert into proveedores values
(NULL,'".$nombre."',".$id_producto.",'".$correo."')";

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