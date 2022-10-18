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
//saco los datos de los empleados
$sql = "SELECT id_empleado,nombre,apellidos,categoria,sueldo FROM empleados";



$result = mysqli_query($conect,$sql);
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    //calculo de retenciones y sueldo neto
    $sueldo=$row["sueldo"];
    $CC=($sueldo*4.7)%100;
    $FP=($sueldo*0.1)%100;
    $D=($sueldo*1.55)%100;
    $retenciones=$CC+$FP+$D;
    $sueldoneto=$sueldo-$retenciones;
    echo "<table>
    <tr>
      <th>ID</th>
      <th>Nombre</th>
      <th>Apellidos</th>
      <th>Fecha</th>
      <th>Categoria</th>
      <th>Sueldo Bruto €</th>
      <th>Retenciones €</th>
      <th>Neto €</th>
    </tr>
    <tr>
      <td>".$row["id_empleado"]."</td>
      <td>".$row["nombre"]."</td>
      <td>".$row["apellidos"]."</td>
      <td>".date('m/d/Y h:i:s ', time())."</td>
      <td>".$row["categoria"]."</td>
      <td>".$sueldo."</td>
      <td>".$retenciones."</td>
      <td>".$sueldoneto."</td>
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
