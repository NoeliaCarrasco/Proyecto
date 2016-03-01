<?php
include_once("./db_configuration.php");
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}
	if(isset($_REQUEST['nombre'])&&isset($_REQUEST['apellido'])&&isset($_REQUEST['admin'])){
		$connection = new mysqli($db_host, $db_user, $db_password, "deportes");
		$tipo = 'Indefinido';
		switch(intval($_REQUEST['admin'])){
			case 1:
				$tipo = 'Cliente';
				break;
			case 2:
				$tipo = 'Administrador';
				break;
		}
		
		$insert="INSERT INTO usuarios VALUES(NULL, '".$_REQUEST['nombre']."', '".$_REQUEST['apellido']."', '".intval($_REQUEST['admin'])."', '".$tipo."', '".$_REQUEST['usuario']."', '".$_REQUEST['password']."')";
		echo '<pre>'.print_r($_REQUEST, true).'</pre>';
		echo $insert.'<br>';
		$connection->query($insert);
	}
	header('location: administrarUsuarios.php');
?>
