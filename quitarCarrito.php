<?php
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}
	if(!isset($_SESSION['carrito'])){ $_SESSION['carrito'] = [];}
	if(isset($_SESSION['carrito'][$_REQUEST['i']])){
		unset($_SESSION['carrito'][$_REQUEST['i']]);
	}
	header('location: shopping-cart.php');
?>
