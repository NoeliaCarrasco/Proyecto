<?PHP
    session_start();
    $nombre = 'Anonimo';
    if(isset($_SESSION['nombre']) && $_SESSION['nombre'] != ''){
        $nombre = $_SESSION['nombre'];
    }
?>
<html>
    <body>
        <h1>Conectado como <?PHP echo $nombre; ?></h1>
        <?PHP
        if(!isset($_SESSION['nombre'])){
        ?>
            <a href="login.php">Conectar</a>
        <?PHP
        }else{
        ?>
            <a href="cerrar_sesion.php">Desconectar</a>
        <?PHP
        }
        ?>
    </body>
</html>
