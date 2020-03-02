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

//echo "Conectado con éxito";
$sql = "use protocolo";

			if($conn->query($sql) === TRUE)
			{
        $sql = "insert into Alumno (boleta,nombre,correo,password) values ('".$_POST["boleta1"]."','".$_POST["nombre1"]."','".$_POST["email"]."','".$_POST["password"]."')";

        /*if(isset($_POST['sub'])){
          $archivo = $_FILES["file"]["tmp_name"];
          $tamanio = $_FILES["file"]["size"];
          $tipo    = $_FILES["file"]["type"];
          $nombre  = $_FILES["file"]["name"];
          $titulo  = $_POST["titulo"];
          $destino = "ttfile/".$nombre;

          if($nombre != ""){
            if(copy($archivo, $destino)){
              //echo "success";
              $titulo = $_POST["titulo"];
              $sql = "insert into protocolo (nombre,ruta_pdf) values ($titulo,$nombre)";
            }else{
              echo "error";
            }
          }
        }
        $sql = "insert into palabras_clave (palabra) values (".$_POST["pc1"]."')";
        $sql = "insert into palabras_clave (palabra) values (".$_POST["pc2"]."')";
        $sql = "insert into palabras_clave (palabra) values (".$_POST["pc3"]."')";
        $sql = "insert into alumno (boleta,nombre) values ('".$_POST["boleta2"]."','".$_POST["nombre2"]."')";*/
        if($conn->query($sql) === TRUE)
                {
                    echo "<br>"."Ahora ya puedes disfrutar de nuestros servicios";
                }

                else{
                    echo "Error: ". $sql . "<br>" . $conn->error;
                    //printf("Revisa que todos los campos estén cubiertos");
                }
      }

$conn->close();

?>
