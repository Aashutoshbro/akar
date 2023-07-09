<aside>
    <div id="sidebar"  class="nav-collapse " style="background:#3970b3;color:#fff;border:3px solid orange;" >
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <p class="centered" style="margin-top:100px;"><a href="profile.html"><img src="assets\img\ui-sam.jpg" class="img-circle" width="60"></a></p>
            <?php $query=mysqli_query($bd, "select fullName from users where userEmail='".$_SESSION['login']."'");
                while($row=mysqli_fetch_array($query)) 
                {
            ?>

            <h4 class="centered" style="margin-top:36px;"><?php echo htmlentities($row['fullName']);?></h4>
            <?php } ?>
            <li class="mt">
                <a href="dashboard.php" style="color:#fff;font-size:14px;font-weight:bold;">
                    <i class="fa fa-dashboard"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="sub-menu">
                <a href="javascript:;"  style="color:#fff;font-size:14px;font-weight:bold;" >
                    <i class="fa fa-cogs"></i>
                    <span>Account Setting</span>
                </a>
                <ul class="sub">
                    <li style="background-color:#ff2b2b80;border-bottom:1px solid gold;"><a  href="profile.php" style="font-size:14px;font-weight:bold;color:#fff;">Profile</a></li>
                    <li style="background-color:#ff2b2b80;"><a  href="change-password.php" style="font-size:14px;font-weight:bold;color:#fff;">Change Password</a></li>
                </ul>
            </li>

            <li class="sub-menu">
                <a href="register-complaint.php" style="color:#fff;font-size:14px;font-weight:bold;" >
                    <i class="fa fa-book"></i>
                    <span>Lodge Complaint</span>
                </a>
            </li>
            
            </li>
            
            <li class="sub-menu">
                <a href="complaint-history.php" style="color:#fff;font-size:14px;font-weight:bold;" >
                    <i class="fa fa-tasks"></i>
                    <span>Complaint History</span>
                </a>
            </li>
                            
        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>