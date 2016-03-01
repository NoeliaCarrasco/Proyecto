<?php
    if((isset($_REQUEST['usuario']) && $_REQUEST['usuario'] != '') &&
       (isset($_REQUEST['password']) && $_REQUEST['password'] != '')){
        $usuario = $_REQUEST['usuario'];
        $password = $_REQUEST['password'];
        
        $mysqli = new mysqli("localhost", "root", "", "deportes");

        /* comprobar la conexión */
        if (mysqli_connect_errno()) {
            printf("Falló la conexión: %s\n", mysqli_connect_error());
            exit();
        }

        $consulta = "SELECT * FROM usuarios WHERE USUARIO = '".$usuario."' AND PASSWORD = '".$password."'";
		
        if ($resultado = $mysqli->query($consulta)) {
            if($resultado->num_rows > 0){
            /* liberar el conjunto de resultados */
                session_start();
                $usuario_conectado = $resultado->fetch_assoc();
                $_SESSION['IDUSUARIO'] = $usuario_conectado['USUARIO'];
                $_SESSION['rol'] = $usuario_conectado['ROL'];
                header('Location: index.php');
            }else{
                header('Location: login.php?e=1');
            }
            $resultado->close();
        }

        /* cerrar la conexión */
        $mysqli->close();
    }else{
		header('Location: index.php?e=2');
    }
?>
