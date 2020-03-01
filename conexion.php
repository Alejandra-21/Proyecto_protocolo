<?php
$servername = "localhost";
$username = "root";
$password = "";
$nombreDB = "protocolo";

//Crear conexion
$conn = new mysqli($servername, $username, $password, $nombreDB);

//Checar conexion
if($conn->connect_error){
  die("La conexión falló" . $conn->connect_error);
}

echo "\nConectado con éxito";

$conn->close();

?>
