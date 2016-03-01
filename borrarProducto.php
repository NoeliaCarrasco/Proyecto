<?php
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}
	if(isset($_REQUEST['i'])){
		$connection = new mysqli("localhost", "root", "", "deportes");
		
		$delete="DELETE FROM productos WHERE IDPRODUCTO = '".$_REQUEST['i']."'";
		$connection->query($delete);
	}
	header('location: administrarProductos.php');
?>
