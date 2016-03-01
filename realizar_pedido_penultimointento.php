<?php
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}
	$id_usuario = '';
	if(isset($_SESSION['carrito'])){
		$connection = new mysqli("localhost", "root", "", "deportes");
		$fechaPedido = getdate();
		$fechaPedido = $fechaPedido['year']."-".$fechaPedido['mon']."-".$fechaPedido['mday'];
		if (isset($_SESSION['IDUSUARIO']) && $_SESSION['IDUSUARIO'] != '') {
			$result = $connection->query("SELECT IDUSUARIO FROM usuarios WHERE USUARIO='".$_SESSION['IDUSUARIO']."'");
			$fila = $result->fetch_assoc();
			$id_usuario = $fila['IDUSUARIO'];
			$insert="INSERT INTO pedidos VALUES (NULL, '".$fechaPedido."', '".$id_usuario."')"; 
			$connection->query($insert);
		}
		
		
		
		$result=$connection->query("SELECT MAX(IDPEDIDO) AS ID FROM pedidos WHERE IDUSUARIO = '".$id_usuario."' AND FECHA_ALTA = '".$fechaPedido."'");
		$pedido=$result->fetch_object();
		foreach($_SESSION['carrito'] as $codigo => $producto){
			$insert="INSERT INTO detallespedido VALUES (NULL, '".$codigo."', '".$producto['CANTIDAD']."', '".$pedido->ID."', '".$producto['PRECIO']."')";
			$connection->query($insert);
			$update="UPDATE productos SET stock = (stock - ".$producto['CANTIDAD'].") WHERE IDPRODUCTO = '".$codigo."'";
			$connection->query($update);
		}
		unset($_SESSION['carrito']);
	}
	header('location: index.php');
?>
