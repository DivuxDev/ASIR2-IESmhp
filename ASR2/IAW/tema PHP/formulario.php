<!DOCTYPE html>
<html>
<!-- Programa hecho por David Prado este es un formulario con y que las respuestas se enseñan
en el archivo viana.php-->
<body>
<h1>club de patinaje Ales Viana</h1>
<h2>Recogida de firmas</h2>
<p>Desde el club de patinaje Ales Viana iniciamos una recogida de firmas con el fin 
    de conseguir una instalaciones de hockey aptas para competir a nivel nacional
    y autonomico
</p>
<br>
<h2>Escribe tus datos para cumplimentar el documento de firma</h2>

<!-- inicio del formulario el "method" de be ser POST y el "action" debe apuntar al 
archivo PHP de respuesta-->
<form method="POST" action="viana.php">
    nombre: <input type="text" name="nombre" >
    <br>
    apellidos: <input type="text" name="apellidos" >
    <br>
    DNI: <input type="text" name="DNI">
    <br>
    <input type="submit" name="" value="rellenar">  
    <input type="reset" value="Borrar">

</body>

</html>