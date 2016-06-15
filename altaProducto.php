<?php
include_once("./db_configuration.php");
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}
	if(isset($_REQUEST['nombre'])&&isset($_REQUEST['categoria'])){
		$connection = new mysqli($db_host, $db_user, $db_password, "deportes");
		
		$insert="INSERT INTO productos VALUES(NULL, '".$_REQUEST['nombre']."', '".$_REQUEST['precio']."', '".intval($_REQUEST['stock'])."', '".$_FILES['fileToUpload']['name']."', '".$_REQUEST['categoria']."', '".$_REQUEST['descripcion']."')";
		
		$connection->query($insert);
					
	$target_dir = getcwd()."\\imagenes\\";
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	
	if(isset($_REQUEST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			
			$uploadOk = 1;
		} else {
			
			$uploadOk = 0;
		}
	}
	
	if (file_exists($target_file)) {
		$uploadOk = 0;
	}
	
	if ($_FILES["fileToUpload"]["size"] > 500000) {
		$uploadOk = 0;
	}
	
	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
		$uploadOk = 0;
	}
	
	if ($uploadOk == 0) {
        
	} else {//sino
		if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file));
	}
				
	}
	header('location: administrarProductos.php');
?>
