<?php
	session_start();
	$para      = 'noelia-besos-doce@hotmail.com';
	$titulo    = 'Contacto desde la web';
	$mensaje   = $_REQUEST['mensaje']."\n\n\nDe: ".$_REQUEST['nombre']."\n\nTelefono: ".$_REQUEST['telefono'];
	$cabeceras = 'From: '.$_REQUEST['email'] . "\r\n" .
		'Reply-To:'.$_REQUEST['email']."\r\n" .
		'X-Mailer: PHP/' . phpversion();

	mail($para, $titulo, $mensaje, $cabeceras);
	header('location: contact.php');
?>
