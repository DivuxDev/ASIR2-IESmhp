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

<div style="margin-left:15%">
<h1>Listado de usuarios</h1>
<?php

$hostname = "localhost";
$user = "root";
$pwd = "";
$dbname = "empresa";

// Conectando, seleccionando la base de datos
if (!$conect = mysqli_connect($hostname, $user, $pwd,$dbname)) {
    die("no se ha podido conectar al SGBD");
}
//saco los datos lso proveedores y los productos
$sql = "SELECT proveedores.id_proveedor,proveedores.nombre,proveedores.email
,productos.id_producto as idproducto,productos.nombre 
as productonombre FROM proveedores 
inner join productos on productos.id_proveedor=proveedores.id_proveedor";



$result = mysqli_query($conect,$sql);
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    //muestro los datos
    echo "<table>
    <tr>
      <th>ID proveedor</th>
      <th>Nombre proveedor</th>
      <th>ID Producto</th>
      <th>Nombre Producto</th>
      <th>Email</th>
    </tr>
    <tr>
      <td>".$row["id_proveedor"]."</td>
      <td>".$row["nombre"]."</td>
      <td>".$row["idproducto"]."</td>
      <td>".$row["productonombre"]."</td>
      <td>".$row["email"]."</td>
    </tr>
  </table><br><br>";
  }
} else {
  echo "Todavia no se ha añadido ningun resultado";
}
// Cerrar la conexión
mysqli_close($conect);
?>
</div>
</body>
</html>
