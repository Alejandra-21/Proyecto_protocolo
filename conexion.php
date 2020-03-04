
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
      if(isset($_POST['sub']))
      {
        $archivo = $_FILES["file"]["tmp_name"];
        $tamanio = $_FILES["file"]["size"];
        $tipo    = $_FILES["file"]["type"];
        $nombre  = $_FILES["file"]["name"];
        $titulo  = $_POST["titulo"];
        $destino = "ttfile/".$nombre;
        $id_ = "CATP".$_POST["boleta1"];
        if($nombre != ""){
          if(copy($archivo, $destino))
          {
            //echo "success";
            $sql = "insert into Protocolo1 (no_registro, nombre,ruta_pdf) values ('$id_','$titulo','$destino')";
            if($conn->query($sql) === TRUE)
            {
              echo "<br>"."Ahora ya puedes disfrutar de nuestros servicios";
            }

            else{
              echo "<br>","Error: ". $sql . "<br>" . $conn->error;
                        //printf("Revisa que todos los campos estén cubiertos");
            }
          }
        }
      }
      $sql = "insert into Alumno (boleta, nombre, correo, password, no_registro) values ('".$_POST["boleta1"]."','".$_POST["nombre1"]."','".$_POST["email"]."','".$_POST["password"]."','$id_')";
      if($conn->query($sql) === TRUE)
              {
                  echo "<br>"."Ahora ya puedes disfrutar de nuestros servicios";
              }
              else{
                echo "<br>"."Error: ". $sql . "<br>" . $conn->error;
                          //printf("Revisa que todos los campos estén cubiertos");
              }

      $sql = "insert into palabras_clave (no_registro, p1, p2, p3) values ('$id_','".$_POST["pc1"]."','".$_POST["pc2"]."','".$_POST["pc3"]."')";
      if($conn->query($sql) === TRUE)
              {
                  echo "<br>"."Ahora ya puedes disfrutar de nuestros servicios";
              }
              else{
                echo "<br>"."Error: ". $sql . "<br>" . $conn->error;
                          //printf("Revisa que todos los campos estén cubiertos");
              }
      $sql = "insert into alumno (boleta,nombre, no_registro) values ('".$_POST["boleta2"]."','".$_POST["nombre2"]."','$id_')";
      if($conn->query($sql) === TRUE)
              {
                  echo "<br>"."Ahora ya puedes disfrutar de nuestros servicios";
              }
              else{
                echo "<br>"."Error: ". $sql . "<br>" . $conn->error;
                          //printf("Revisa que todos los campos estén cubiertos");
              }
    }

$conn->close();

?>
