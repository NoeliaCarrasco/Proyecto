<?php
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}
	if(!isset($_SESSION['carrito'])){ $_SESSION['carrito'] = [];}
	if(isset($_SESSION['carrito'][$_REQUEST['IDPRODUCTO']])){
		if(isset($_REQUEST['CANTIDAD']) && $_REQUEST['CANTIDAD'] > 0){ 
			$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']]['CANTIDAD']+=$_REQUEST['CANTIDAD'];
		}else{
			$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']]['CANTIDAD']++;
		}
	}else{
		$nuevoProducto = [];
		$nuevoProducto['NOMBRE'] = $_REQUEST['NOMBRE'];
		$nuevoProducto['PRECIO'] = $_REQUEST['PRECIO'];
		$nuevoProducto['FOTO'] = $_REQUEST['FOTO'];
		$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']] = $nuevoProducto;
		$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']]['CANTIDAD'] = 0;
		if(isset($_REQUEST['CANTIDAD']) && $_REQUEST['CANTIDAD'] > 0){ 
			$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']]['CANTIDAD']+=$_REQUEST['CANTIDAD'];
		}else{
			$_SESSION['carrito'][$_REQUEST['IDPRODUCTO']]['CANTIDAD']++;
		}
	}
	header('location: product-list.php');
?>
