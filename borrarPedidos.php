<?php
include_once("./db_configuration.php");
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}

	if(isset($_REQUEST['i'])){
		$connection = new mysqli($db_host, $db_user, $db_password, "deportes");
		$deletes="DELETE FROM detallespedido WHERE IDPEDIDO = '".$_REQUEST['i']."'";
		$connection->query($deletes);
		$delete="DELETE FROM pedidos WHERE IDPEDIDO = '".$_REQUEST['i']."'";
		$connection->query($delete);
	}
	header('location: '.$_SERVER['HTTP_REFERER']);
?>
