<?php 
		$servername="localhost";
		$dbname="quizzer";
		$dbpassword="";
		$user="root";
		$con=mysqli_connect($servername,$user,$dbpassword,$dbname);
		if(!$con)
		echo 'Failled to connect to database';
 ?>