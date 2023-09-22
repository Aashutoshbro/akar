<?php
session_start();
error_reporting(0);

//Include the configuration files which likely contains database connection detalils 
include("includes/database.php");


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

    
	<!-- **********************************************************************************************************************************************************
	MAIN CONTENT
	*********************************************************************************************************************************************************** -->

	<div id="login-page">
		<div class="container">
	  		<form class="form-login" name="login" action="send-password-reset.php" method="post">
		    	<h2 class="form-login-heading" style="background-color:#8C52FF" >Recover Account</h2>
    
		        <div class="login-wrap">
                    <p>Enter Your Email Properly</p>
                    <input type="text" class="form-control" name="email" placeholder="Email"  required autofocus>
		            <br>
		            <button class="btn btn-theme btn-block" name="password_reset_link" type="submit" style="background-color:#8C52FF">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 12">
                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                    </svg>
                    Send Password Reset Link</button>
		            <hr>
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
    </script>


  </body>
</html>
