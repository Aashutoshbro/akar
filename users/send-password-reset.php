<?php
include("includes/database.php");

$email = $_POST["email"];

$token = bin2hex(random_bytes(16));

$token_hash = hash("sha256", $token);

$expiry = date("Y-m-d H:i:s", time() + 60 * 30);

$mysqli = require __DIR__ . "/includes/database.php";

$sql = "UPDATE users
        SET reset_token_hash = ?,
            reset_token_expires_at = ?
        WHERE userEmail = ?";

$stmt = $mysqli->prepare($sql);

$stmt->bind_param("sss", $token_hash, $expiry, $email);

$stmt->execute();

if ($mysqli->affected_rows) {

    $mail = require __DIR__ . "/mailer.php";

    $mail->setFrom("noreply@example.com");
    $mail->addAddress($email);
    $mail->Subject = "Password Reset";
    $mail->Body = <<<END

    
    Click <a href="http://localhost/akar/users/reset-password.php?token=$token">here</a> 
    to reset your password.



    END;

    try {

        $mail->send();

    } catch (Exception $e) {

        echo "Message could not be sent. Mailer error: {$mail->ErrorInfo}";

    }

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        body{margin-top:20px;}
.mail-seccess {
    text-align: center;
	background: #fff;
	border-top: 1px solid #eee;
}
.mail-seccess .success-inner {
	display: inline-block;
}
.mail-seccess .success-inner h1 {
	font-size: 100px;
	text-shadow: 3px 5px 2px #3333;
	color: #006DFE;
	font-weight: 700;
}
.mail-seccess .success-inner h1 span {
	display: block;
	font-size: 25px;
	color: #333;
	font-weight: 600;
	text-shadow: none;
	margin-top: 20px;
}
.mail-seccess .success-inner p {
	padding: 20px 15px;
}
.mail-seccess .success-inner .btn{
	color:#fff;
}
.fa-envelope{
    animation: mymove 2s infinite;
}

@keyframes mymove {
  0%   {transform: scale(0.5);}
  25%  {transform: scale(0.8);}
  50%  {transform: scale(1.4);}
  75%  {transform: scale(0.8);}
  100% {transform: scale(0.5);}
}
        </style>
</head>
<body>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<section class="mail-seccess section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<!-- Error Inner -->
				<div class="success-inner"  style="border:4px solid red;padding:24px;border-radius:10px;">
				    <h1 style="font-size:50px;color:#8C52FF;">Thank you for choosing us</h1>	
                    <h1><i class="fa fa-envelope"></i><span>Recovery Mail Sent Successfully!</span></h1>
				</div>
				<!--/ End Error Inner -->
			</div>
		</div>
	</div>
</section>



</body>
</html>
