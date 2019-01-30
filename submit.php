<!DOCTYPE html>
<html>
<body>
<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$db = "hospital";
	
	$conn = mysqli_connect($servername, $username, $password, $db);

	
	if (!$conn) {
    	die("Connection failed: " . mysqli_connect_error());
	}
	echo "Connected successfully";
	
	$name=$age=$contct=$dept=$street=$local=$pin=$dep="";
	
	if($_SERVER["REQUEST_METHOD"] == "POST"){
		
		$name=$_POST["name"];
		$age=$_POST["age"];
		$contct=$_POST["contct_number"];
		$dept=$_POST["dept"];
		$street=$_POST["street"];
		$local=$_POST["local"];
		$pin=$_POST["pin"];
	}
	
	$sql_1 = "insert into patient (pat_name,age,cntct,locality,street) values ('$name','$age','$contct','$street','$local')";
	$sql_2 = "insert into patient_pin (pin,locality) values ('$pin','$local')";
	$sql_3 = "insert into hospital_department (dept_name) values ('$dept')";

	if(mysqli_query($conn,$sql_1) && mysqli_query($conn,$sql_2) && mysqli_query($conn,$sql_3)){
		
		echo("Data Submitted");
	
	}	
	
	else{
		
		echo("Error Try Again");
	}
?>
	
</body>
</html>