<!DOCTYPE html>
<html>
	<body>
		<head>
			<link href="src/style.css" rel="stylesheet" type="text/css">
			<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
			<title> REPORTS </title>
		</head>
		
		<header>
			<div class="nav_container">
                <nav id="navbar">
                    <ul>
						<li><a href="logout.php" style="text-decoration:none;">LOGOUT</a></li>
                    </ul>
                </nav>
            </div>
		</header>
		
		<?php
			
			$servername = "localhost";
			$username = "root";
			$password = "";
			$db = "hospital";
	
			$conn = mysqli_connect($servername, $username, $password, $db);

	
			if (!$conn) {
    			die("Connection failed: " . mysqli_connect_error());
			}
		
			$sql_1 = "select distinct count(patient.pat_id), dis_name,locality from has_disease join patient on has_disease.pat_id=patient.pat_id group by locality";
			$sql_2 = "select dept_name,expens,revenue from hospital_department";
			$sql_3="";
			
			$result_1=mysqli_query($conn,$sql_1);	
			$result_2=mysqli_query($conn,$sql_2);
		?>
		
		<style>
			
			body{
				
				overflow: auto;
			}
			
			div{
			}
			
			table,th,tr,td{
				border: 1px solid black;
				font-size: 25px;
				font-family: 'Merriweather';
			}
			th,tr,td{border-radius:8px;}
			
			.table-1{
				
				margin:0 auto;
			}
			.table-2{
				margin:40px auto;
			}
			
			.table-3{
				
				margin: 40px auto;
			}
			
			th,tr,td{
				
				padding: 20px;
			}
		</style>
		
		<main>
			
			<div>
				
				
				<table class="table-1">
					<thead>
						<th>NUMBER OF PATIENTS</th>
						<th>DISEASE NAME</th>
						<th>LOCALITY</th>
					</thead>	
					<tbody>
						<?php while($row_1=mysqli_fetch_array($result_1)):;?>
						<tr>
							<td><?php echo $row_1[0]?></td>
							<td><?php echo $row_1[1]?></td>
							<td><?php echo $row_1[2]?></td>
						</tr>
						<?php endwhile;?>
					</tbody>
				</table>
				
				<table class="table-2">
					<thead>
						<th>ADMITTED TIMESTAMP</th>
						<th>DISEASE</th>
						<th>TREATMENT</th>
						<th>DOCTOR NAME</th>
						<th>MEDICINE</th>
					</thead>
				</table>
				
				<table class="table-3">
					<thead>
						<th>DEPARTMENT NAME</th>
						<th>EXPENDITURE</th>
						<th>REVENUE</th>
					</thead>
					<tbody>
						<?php while($row_2=mysqli_fetch_array($result_2)):;?>
						<tr>
							<td><?php echo $row_2[0]?></td>
							<td><?php echo $row_2[1]?></td>
							<td><?php echo $row_2[2]?></td>
						</tr>
						<?php endwhile; ?>
					</tbody>
				</table>
				
				
				
				
				
			</div>
		
		</main>
		
		
		
		
		
		
	</body>
</html>