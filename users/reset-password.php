<?php
session_start();
error_reporting(0);

//Include the configuration files which likely contains database connection detalils 
include("includes/config.php");

//Check if the form is submitted
if(isset($_POST['submit']))
{

	//Retrieve the user details from the database based on the entered email and password
$ret=mysqli_query($bd, "SELECT * FROM users WHERE userEmail='".$_POST['username']."' and password='".md5($_POST['password'])."'");
$num=mysqli_fetch_array($ret);


if($num>0)
{

	//If the user is found on the database, set session variables and log the user in
$extra="change-password.php";//
$_SESSION['login']=$_POST['username'];
$_SESSION['id']=$num['id'];
$host=$_SERVER['HTTP_HOST'];
$uip=$_SERVER['REMOTE_ADDR'];
$status=1;

//Insert the log entry for the user login
$log=mysqli_query($bd, "insert into userlog(uid,username,userip,status) values('".$_SESSION['id']."','".$_SESSION['login']."','$uip','$status')");

//Redirect user to a different page after successful login
$uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();

}
else
{
	//If the user is not found on the database, handle the unsuccessful login attempt by displaying an error msg
$_SESSION['login']=$_POST['username'];	
$uip=$_SERVER['REMOTE_ADDR'];
$status=0;

//Insert a log entry for the unsuccessful login attempt
mysqli_query($bd, "insert into userlog(username,userip,status) values('".$_SESSION['login']."','$uip','$status')");
$errormsg="Invalid username or password";
$extra="login.php";

}
}

//Check if the password change form is submitted
if(isset($_POST['change']))
{
   $email=$_POST['email'];
    $password=md5($_POST['password']);

	//Check if the email and contact number are valid in the database
$query=mysqli_query($bd, "SELECT * FROM users WHERE userEmail='$email'");
$num=mysqli_fetch_array($query);


if($num>0)
{
	//If the email and contact number are valid, update the user's password
mysqli_query($bd, "update users set password='$password' WHERE userEmail='$email'");
$msg="Password Changed Successfully";
;

}
else
{
	//If the email and contact number are not valid, display an error message
$errormsg="Invalid email id";
}
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">

    <title>AKAR CMS | User Login</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

<script type="text/javascript">
function valid()
{
 if(document.forgot.password.value!= document.forgot.confirmpassword.value)
{
alert("Password and Confirm Password Field do not match  !!");
document.forgot.confirmpassword.focus();
return false;
}
return true;
}
</script>
</head>

<body>

<!--******************************************** Top Navbar ***************************************** -->
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner bg">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>
                <ul>
			  	<li><a class="brand" href="http://localhost/akar/"  style="color:white;font-size:20px;">
			  		AKAR CMS | USER
			  	</a></li></ul>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

						<li><a href="http://localhost/akar/" style="color:white;background:#8C52FF;border-radius:6px;margin-top:-40px;">
						Back to Portal
						</a></li>	

					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div>
    <!-- ***************************************** navbar ********************************************-->

    

	<!-- ************************************* MAIN CONTENT ****************************************** -->

	<div id="login-page">
		<div class="container">
	  		<form class="form-login" name="login" method="post">
		    	<h2 class="form-login-heading" style="background-color:#8C52FF" >Change Your Password</h2>
		        <p style="padding-left:4%; padding-top:2%;  color:red">
		        <?php if($errormsg){
				echo htmlentities($errormsg);
		        }?></p>
				<p style="padding-left:4%; padding-top:2%;  color:green">
		        <?php if($msg){
				echo htmlentities($msg);
		        }?></p>


								<div class="modal-body">
									<p>Enter your new password</p>
                                        <input type="email" name="email" placeholder="Email" autocomplete="off" class="form-control" required><br>
                                        <input type="password" class="form-control pwd" placeholder="New Password" id="password" name="password"  required ><br />
                                        <input type="password" class="form-control unicase-form-control text-input pwd" placeholder="Confirm Password" id="confirmpassword" name="confirmpassword" required >
                                        <br>
                                        
                                
                                </div>
								<div class="modal-footer">
                                    <button class="btn btn-default reveal col-ml-2" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
								    <button data-dismiss="modal" class="btn btn-default col-md-3" type="button">Cancel</button>
									<button class="btn btn-theme" type="submit" name="change" onclick="return valid();">Submit</button>
								</div>
		
		        </div>

		        </form>
		</div>
	</div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
       $.backstretch("assets/img/road-bg.png", {speed: 500});


       $(".reveal").on('click',function() {
    var $pwd = $(".pwd");
    if ($pwd.attr('type') === 'password') {
        $pwd.attr('type', 'text');
    } else {
        $pwd.attr('type', 'password');
    }
});
    </script>


  </body>
</html>
