<?php
session_start();

include("includes/config.php"); //Include the config file

$_SESSION['login']=="";  //Empty the session variable that stores the login status

date_default_timezone_set('Asia/Kathmandu');  //Set the Default timezone to Asia Kathmandu

$ldate=date( 'd-m-Y h:i:s A', time () );  //Get the current date and time in the specified format

//Update the logout time in the userlog table for the logged-in user
mysqli_query($bd, "UPDATE userlog  SET logout = '$ldate' WHERE username = '".$_SESSION['login']."' ORDER BY id DESC LIMIT 1");

session_unset(); //Clear all session variables

?>
<script language="javascript">
document.location="../index.html";  //Redirect the user to index.html
</script>