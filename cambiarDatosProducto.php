<?php
include_once("./db_configuration.php");
	session_start();
	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}
	if(isset($_REQUEST['id'])){
		$connection = new mysqli($db_host, $db_user, $db_password, "deportes");
		
		if($_FILES['fileToUpload']['name'] != ''){$fichero = ", FOTO='".$_FILES['fileToUpload']['name']."'";}else{ $fichero = "";}
		$update="UPDATE productos SET NOMBRE = '".$_REQUEST['nombre']."', PRECIO='".floatval($_REQUEST['precio'])."'".$fichero.", STOCK='".intval($_REQUEST['stock'])."', IDCATEGORIA='".$_REQUEST['categoria']."', DESCRIPCION='".$_REQUEST['descripcion']."' WHERE IDPRODUCTO = '".$_REQUEST['id']."'";
		$connection->query($update);
        
			
		if($_FILES['fileToUpload']['name'] != ''){
			$target_dir = getcwd()."\\imagenes\\";
			$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
			$uploadOk = 1;
			$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
			
			if(isset($_POST["submit"])) {
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
				
			
			} else {
				if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
				
				} else {
					
				}
			}		
		}					
	}
		
	header('location: administrarProductos.php');
?>
