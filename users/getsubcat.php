<?php
include('includes/config.php'); //Includes the configuration file which likely contains database connection


if(!empty($_POST["catid"])) 
{
 $id=intval($_POST['catid']); //Get the category ID from the AJAX request


 if(!is_numeric($id)){

 	echo htmlentities("invalid industryid"); //Output an error message if the category ID is not numeric
    exit;
 }
 else{

 $stmt = mysqli_query($bd, "SELECT subcategory FROM subcategory WHERE categoryid ='$id'"); //Fetch subcategories based on the provide category ID
 ?><option selected="selected">Select Subcategory </option><?php //Output a default option for the subcategory dropdown


 while($row=mysqli_fetch_array($stmt)) //generate an HTML option element for each subcategory
 {
  ?>
  <option value="<?php echo htmlentities($row['subcategory']); ?>"><?php echo htmlentities($row['subcategory']); ?></option>
  <?php
 }
}

}
?>