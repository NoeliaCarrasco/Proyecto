<?php
include_once("./db_configuration.php");
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}
    if((isset($_REQUEST['usuario']) && $_REQUEST['usuario'] != '') &&
       (isset($_REQUEST['password']) && $_REQUEST['password'] != '')){
        $usuario = $_REQUEST['usuario'];
        $password = $_REQUEST['password'];
        
       $mysqli = new mysqli($db_host, $db_user, $db_password, "deportes");

        
        if (mysqli_connect_errno()) {
            printf("Falló la conexión: %s\n", mysqli_connect_error());
            exit();
        }

        $consulta = "SELECT * FROM usuarios WHERE USUARIO = '".$usuario."' AND PASSWORD = '".$password."'";
		
        if ($resultado = $mysqli->query($consulta)) {
            if($resultado->num_rows > 0){
            
                session_start();
                $usuario_conectado = $resultado->fetch_assoc();
                $_SESSION['IDUSUARIO'] = $usuario_conectado['USUARIO'];
                header('Location: index.php');
            }else{//sino
                echo 'LOS DATOS DE CONEXION NO COINCIDEN<br>';
            }
            $resultado->close();
        }

        $mysqli->close();
    }else{
        echo 'No se han introducido datos de conexion<br>';
    }
?>
