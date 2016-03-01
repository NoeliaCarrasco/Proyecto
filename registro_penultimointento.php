<?php
	session_start();
	if(isset($_REQUEST['nombre'])&&isset($_REQUEST['apellido'])){
		$connection = new mysqli("localhost", "root", "", "deportes");
		
		$insert="INSERT INTO usuarios VALUES(NULL, '".$_REQUEST['nombre']."', '".$_REQUEST['apellido']."', '1', 'Cliente', '".$_REQUEST['usuario']."', '".$_REQUEST['password']."')";
		echo '<pre>'.print_r($_REQUEST, true).'</pre>';
		echo $insert.'<br>';
		$connection->query($insert);
	}
	header('location: login.php');
?>
