<?php

    if((isset($_REQUEST['usuario']) && $_REQUEST['usuario'] != '') &&
       (isset($_REQUEST['password']) && $_REQUEST['password'] != '')){
        $usuario = $_REQUEST['usuario'];
        $password = $_REQUEST['password'];
        
        $mysqli = new mysqli("localhost", "root", "Carrasco2?", "deportes");

        /* comprobar la conexión */
        if (mysqli_connect_errno()) {
            printf("Falló la conexión: %s\n", mysqli_connect_error());
            exit();
        }

        $consulta = "SELECT * FROM usuarios WHERE usuario = '".$usuario."' AND password = '".$password."'";
		
        if ($resultado = $mysqli->query($consulta)) {
            if($resultado->num_rows > 0){
            /* liberar el conjunto de resultados */
                session_start();
                $usuario_conectado = $resultado->fetch_assoc();
                $_SESSION['nombre'] = $usuario_conectado['usuario'];
                header('Location: index.php');
            }else{
                echo 'LOS DATOS DE CONEXION NO COINCIDEN<br>';
            }
            $resultado->close();
        }

        /* cerrar la conexión */
        $mysqli->close();
    }else{
        echo 'No se han introducido datos de conexion<br>';
    }
?>
