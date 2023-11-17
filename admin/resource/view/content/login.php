<?php
include("app/Http/Controllers/Controller.php");
include("app/Http/Controllers/AdminController.php");

$adminCtrl = new AdminController;

if(isset($_POST['try_login']))
{
	$username = $_POST['username'];
	$password = sha1($_POST['password']);
	
	$adminData = $adminCtrl->tryLogin( $username, $password );
	
	if(!empty($adminData))
	{
		$_SESSION['SMC_login_time'] = date("Y-m-d H:i:s");
		$_SESSION['SMC_login_id'] = $adminData[0]['id'];
		$_SESSION['SMC_login_admin_name'] = $adminData[0]['admin_name'];
		$_SESSION['SMC_login_admin_email'] = $adminData[0]['admin_email'];
		$_SESSION['SMC_login_admin_image'] = $adminData[0]['admin_image'];
		$_SESSION['SMC_login_admin_status'] = $adminData[0]['admin_status'];
		$_SESSION['SMC_login_admin_type'] = $adminData[0]['admin_type'];
		 
		header("Location: dashboard.php");
	}
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="author" content="Elsa Novita">
		
		<title>Elssories | Admin Login</title>
		<link rel="shortcut icon" href="../public/assets/images/favicon/faviconBackEnd.png" type="image/png">
		<link href="public/css/style.css" rel="stylesheet">
		<link href="public/css/style-responsive.css" rel="stylesheet">
		<style>
			img {
				-moz-user-select: none;
				-webkit-user-select: none;
				-ms-user-select: none;
				user-select: none;
				-webkit-user-drag: none;
				user-drag: none;
				-webkit-touch-callout: none;
			}
		</style>
	</head>
	
	<body class="login-body">
		<div class="container">
			<form class="form-signin" method="post" action="">
				<div class="form-signin-heading text-center">
					<h1 class="sign-title"> Sign In </h1>
					<img class="disable" src="../public/assets/images/favicon/loginBack.png" alt="" style="height: 126px;"/>
				</div>
				<div class="login-wrap">
					<input name="username" type="email" class="form-control" placeholder="Email ID" >
					<input name="password" type="password" class="form-control" placeholder="Password" >
					<button name="try_login" class="btn btn-lg btn-login btn-block" type="submit">
						<i class="fa fa-check"></i>
					</button>
					<div class="registration"> Not a member yet? <a href="registration.php"> Signup </a></div>
				</div>
			</form>
		</div>

		<script src="./public/js/jquery-3.5.1.min.js"></script>
		<script src="./public/js/bootstrap.min.js"></script>
		<script src="./public/js/modernizr.min.js"></script>
		
	</body>
</html>		