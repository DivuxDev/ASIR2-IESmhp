<html>
<link rel="stylesheet" href="cssphp.css">
<nav>
<ul>
        <li><a href="panel.php">Inicio</a></li>
        <li><a href="insertarclientes.php">Insertar clientes</a></li>
        <li><a href="insertarempleados.php">Insertar empleados</a></li>
        <li><a href="insertarproveedores.php">Insertar proveedores</a></li>
        <li><a href="insertarproductos.php">Insertar productos</a></li>
        <li><a href="listarnominas.php">Listar nominas</a></li>
        <li><a href="listarproveedores.php">Listar proveedores</a></li>
        <li><a href="listarproductos.php">Listar productos</a></li>
    </ul>
</nav>
<div class="panelcentral">
<h1> Control de acciones de la empresa </h1>
            <br>
            Insertar clientes: <a href="insertarclientes.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Insertar empleados: <a href="insertarempleados.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Insertar productos: <a href="insertarproductos.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Insertar proveedores: <a href="insertarproveedores.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Listar nominas: <a href="listarnominas.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Listar proveedores: <a href="listarproveedores.php"><br>
            <button class="botoninicio">Insertar </button></a> <br>
            Listar productos: <a href="listarproductos.php"><br>
            <button class="botoninicio">Insertar </button></a> çç<br>

<title>Panel de control</title>
<form action="" method="POST">
         Generar estructura de la base de datos<br>
         <input type="submit" name="generar" value="Generar base de datos" />
</form>
</div>
<?php
//condicion, si se da al boton submit se genera la base de datos
if (!empty($_POST)) {
    //datos de conexion
    $hostname = "localhost";
    $user = "root";
    $pwd = "";
    $db = "empresa";
    //conectarse al SGBD
    if (!$conect = mysqli_connect($hostname, $user, $pwd)) {
        die("no se ha podido conectar al SGBD");
    }
    //borrar la DB is existe

    $borrar = 'DROP DATABASE IF EXISTS ' . $db;
    mysqli_query($conect, $borrar);

    //se crea la BD
    $crear = "CREATE DATABASE " . $db;
    mysqli_query($conect, $crear);
    //seleccionar la BD recien creada

    mysqli_select_db($conect, $db);
    //creo la tabla agenda
    $creartbempleados = "CREATE TABLE empleados(
        id_empleado int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nombre varchar(20) NOT NULL,
        apellidos varchar(32) NOT NULL,
        categoria int(2) NOT NULL,
        sueldo decimal(7,2) NOT NULL)";
        
    $creartbclientes = "CREATE TABLE clientes
    (id_cliente int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(20) NOT NULL,
    apellidos varchar(32) NOT NULL,
    telefono int(9) NOT NULL,
    email varchar(32) NOT NULL,
    n_cuenta varchar(23) NOT NULL)";
    
    $creartbproveedores = "CREATE TABLE proveedores
    (id_proveedor int(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre varchar(20) NOT NULL,
    id_producto int(11) NOT NULL,
    email varchar(32) NOT NULL)";

    $creartbproductos = "CREATE TABLE productos
    (id_producto int(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre varchar(20) NOT NULL,
    id_proveedor int(11) NOT NULL,
    precio decimal(7,2) NOT NULL,
    stock varchar(12) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor))";

    $creartbventas = "CREATE TABLE ventas(
    id_cliente int(11) NOT NULL,
    id_producto int(11) NOT NULL,
    n_productoscomprados int(11),
    gasto decimal(7,2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto))";

    //si existe la tabla de un error

    if (!mysqli_query($conect, $creartbempleados)) {

        echo "error creating the table " . mysqli_error($conect);
    }
    if (!mysqli_query($conect, $creartbclientes)) {

        echo "error creating the table " . mysqli_error($conect);
    }
    if (!mysqli_query($conect, $creartbproveedores)) {

        echo "error creating the table " . mysqli_error($conect);
    }
    if (!mysqli_query($conect, $creartbproductos)) {

        echo "error creating the table " . mysqli_error($conect);
    }

    if (!mysqli_query($conect, $creartbventas)) {

        echo "error creating the table " . mysqli_error($conect);
    }

    //inserto datos en la tabla 
    $insempleados = 'INSERT INTO empleados values (NULL,"david","prado mejuto",1,1200),
    (NULL,"alfredo","lopez perez",3,"1550")';
    mysqli_query($conect, $insempleados);

    $insclientes = 'INSERT INTO clientes values (NULL,"alba","gutierrez vega",543872315,"alba@gmail.com","ES56 1243 768954"),
    (NULL,"pablo","perez vega",234562315,"pablo@gmail.com","ES56 8798 771114")';
    mysqli_query($conect, $insclientes);

    $insproveedores = 'INSERT INTO proveedores values (NULL,"maderas jose saiz",1,"maderas@maderasjosesaiz.es"),
    (NULL,"marcos jesus perez",2,"marcos@marcosesusperez.es")';
    mysqli_query($conect, $insproveedores);

    $insproductos = 'INSERT INTO productos values (NULL,"tabla de madera",1,3.23,5),
    (NULL,"marco de cuadro",2,5.54,3)';
    mysqli_query($conect, $insproductos);




    //cierro la conexion
    mysqli_close($conect);
}
?>
</html>