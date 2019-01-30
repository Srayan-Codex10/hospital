<!DOCTYPE html>
<html>
	
	<head>
		<link href="src/style.css" rel="stylesheet" type="text/css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
			a{
				text-decoration: none;
				color: brown;
			}
			
			body {font-family: Arial, Helvetica, sans-serif;}
			form {border: 3px solid #f1f1f1;}

			input[type=text], input[type=password] {
  				width: 100%;
				padding: 12px 20px;
  				margin: 8px 0;
  				display: inline-block;
  				border: 1px solid #ccc;
  				box-sizing: border-box;
				}

				button {
  					background-color: #4CAF50;
  					color: white;
					padding: 14px 20px;
  					margin: 8px 0;
  					border: none;
  					cursor: pointer;
				}

				button:hover {
  					opacity: 0.8;
				}

				.cancelbtn {
  					width: auto;
  					padding: 10px 18px;
  					background-color: #f44336;
				}

				.imgcontainer {
  					text-align: center;
  					margin: 24px 0 12px 0;
				}

				img.avatar {
  					width: 40%;
  					border-radius: 50%;
				}

				.container {
  					padding: 16px;
				}

				span.psw {
  					float: right;
  					padding-top: 16px;
				}
				@media screen and (max-width: 300px) {
  				span.psw {
     				display: block;
     				float: none;
  				}
  				.cancelbtn {
  				}
			}
		</style>
	</head>
	
	<body>
		
		<header>
            <div class="nav_container">
                <nav id="navbar">
                    <ul>
						<li><a href="index.html">HOME</a></li>
						<!--<li><a href="report.php" style="text-decoration:none;">VIEW REPORTS</a></li> -->
						
                    </ul>
                </nav>
            </div>
        </header>
		
		<? php 
	
				
			$servername = "localhost";
			$username = "root";
			$password = "";
			$db = "hospital";
	
			$conn = mysqli_connect($servername, $username, $password, $db);

	
			if (!$conn) {
    			die("Connection failed: " . mysqli_connect_error());
			}
		
			
		
		<h2>Login Form</h2>
		
			<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>" method="POST">
  				<div class="imgcontainer">
    				<img src="https://image.shutterstock.com/image-vector/medical-concept-hospital-building-doctor-450w-588196298.jpg" class="avatar">
  				</div>

  			<div class="container">
    			<label for="uname"><b>Username</b></label>
    			<input type="text" placeholder="Enter Username" name="uname" required>

    			<label for="psw"><b>Password</b></label>
    			<input type="password" placeholder="Enter Password" name="psw" required>
        
    			<button type="submit">Login</button>
			</div>

			<div class="container" style="background-color:#f1f1f1">
				<button type="button" class="cancelbtn"><a href="index.html">Cancel</a></button>
    			<!--<span class="psw">Forgot <a href="#">password?</a></span>-->
  			</div>
			</form>
	
	</body>
</html>