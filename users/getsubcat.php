<?php
include('includes/config.php');

if(!empty($_POST["catid"])) //Get the category ID from AJAX request

{
 $id=intval($_POST['catid']);

 if(!is_numeric($id)){
 	echo htmlentities("invalid industryid"); //Output an error msg if the category ID is not numeric
    exit;
 }
 else{
 $stmt = mysqli_query($bd, "SELECT subcategory FROM subcategory WHERE categoryid ='$id'");  //Fetch subcategories based on the provided category ID
 ?><option selected="selected">Select Subcategory </option><?php  //Output a default option for the subcategory dropdown
 
 while($row=mysqli_fetch_array($stmt))
 {
  ?>
  <option value="<?php echo htmlentities($row['subcategory']); ?>"><?php echo htmlentities($row['subcategory']); ?></option>
  <?php
 }
}

}
?>
