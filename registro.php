<?php
 include_once("./db_configuration.php");
	session_start();
	if(isset($_REQUEST['nombre'])&&isset($_REQUEST['apellido'])){
		$connection = new mysqli($db_host, $db_user, $db_password, "deportes");
		
		$insert="INSERT INTO usuarios VALUES(NULL, '".$_REQUEST['nombre']."', '".$_REQUEST['apellido']."', '1', 'Cliente', '".$_REQUEST['usuario']."', '".md5($_REQUEST['password'])."')";
		$connection->query($insert);
	}
	header('location: login.php');
?>
