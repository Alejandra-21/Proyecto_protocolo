<?php
$servername = "localhost";
$username = "root";
$password = "";

//Crear conexion
$conn = new mysqli($servername, $username, $password);

//Checar conexion
if($conn->connect_error){
  die("La conexión falló" . $conn->connect_error);
}

echo"Conectado con éxito"

$conn->close();

?>
