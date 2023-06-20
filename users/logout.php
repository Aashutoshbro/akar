<?php
session_start(); //Start the session


//Include the configuration file
include("includes/config.php");

$_SESSION['login']==""; //Empty the session variable that stores the login status

date_default_timezone_set('Asia/Kolkata');//Set the default timezone to Asia/Kolkata,Kathmandu

$ldate=date( 'd-m-Y h:i:s A', time () );//Get the current date and time in the specified format

//Update the logout time in the userlog table for the logged-in user
mysqli_query($bd, "UPDATE userlog  SET logout = '$ldate' WHERE username = '".$_SESSION['login']."' ORDER BY id DESC LIMIT 1");

//Clear all session variables
session_unset();

?>
<script language="javascript">
document.location="../index.html"; //Redirect the user to the index.html page
</script>
