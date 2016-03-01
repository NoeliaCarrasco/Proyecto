<?php
	session_start();
	/*echo '<pre>$_REQUEST<BR>'.print_r($_REQUEST, true).'</pre>';
	echo '<pre>$_SESSION<BR>'.print_r($_SESSION, true).'</pre>';
	echo '<pre>$_FILES<BR>'.print_r($_FILES, true).'</pre>';
	echo '<pre>$_SERVER<BR>'.print_r($_SERVER, true).'</pre>';*/

	if(!isset($_SESSION['rol'])){header('location: login.php');}else{if(intval($_SESSION['rol']) != 2){header('location: index.php');}}
	if(isset($_REQUEST['nombre'])&&isset($_REQUEST['categoria'])){
		$connection = new mysqli("localhost", "root", "", "deportes");
		
		$insert="INSERT INTO productos VALUES(NULL, '".$_REQUEST['nombre']."', '".$_REQUEST['precio']."', '".intval($_REQUEST['stock'])."', '".$_FILES['fileToUpload']['name']."', '".$_REQUEST['categoria']."', '".$_REQUEST['descripcion']."')";
		echo '<pre>'.print_r($_REQUEST, true).'</pre>';
		echo $insert.'<br>';
		$connection->query($insert);
					
	$target_dir = getcwd()."\\imagenes\\";
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			//echo "File is an image - " . $check["mime"] . ".";
			$uploadOk = 1;
		} else {
			//echo "File is not an image.";
			$uploadOk = 0;
		}
	}
	// Check if file already exists
	if (file_exists($target_file)) {
	//	echo "Sorry, file already exists.";
		$uploadOk = 0;
	}
	// Check file size
	if ($_FILES["fileToUpload"]["size"] > 500000) {
		//echo "Sorry, your file is too large.";
		$uploadOk = 0;
	}
	// Allow certain file formats
	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
		//echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
		$uploadOk = 0;
	}
	// Check if $uploadOk is set to 0 by an error
	if ($uploadOk == 0) {
		//echo "Sorry, your file was not uploaded.";
	// if everything is ok, try to upload file
	} else {
		if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
		//	echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
		} else {
			//echo "Sorry, there was an error uploading your file.";
		}
	}
				
	}
	header('location: administrarProductos.php');
?>
