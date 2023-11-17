<?php
include("app/Http/Controllers/Controller.php");
include("app/Models/Eloquent.php");

$eloquent = new Eloquent;

if($_POST['ajax_edit_product'] == "YES")
{
	$columnName = "*";
	$tableName = "subcategories";
	$whereValue['category_id'] = $_POST['category_id'];
	$subcategoryList = $eloquent->selectData($columnName, $tableName, $whereValue);

	echo '<option value="">Select a Subcategory</option>';
	foreach($subcategoryList AS $eachRow)
	{
		echo '<option value="'. $eachRow['id'] .'" ';
		
		if($eachRow['id'] == $_POST['subcategory_id'])
			echo 'selected';		
		
		echo ' >'. $eachRow['subcategory_name'] .'</option>';
	}
}

if($_POST['ajax_create_product'] == "YES")
{
	$columnName = "*";
	$tableName = "subcategories";
	$whereValue['category_id'] = $_POST['category_id'];
	$subcategoryList = $eloquent->selectData($columnName, $tableName, $whereValue);

	echo '<option value="">Select a Subcategory</option>';
	foreach($subcategoryList AS $eachRow)
	{
		echo '<option value="'. $eachRow['id'] .'" >'. $eachRow['subcategory_name'] .'</option>';
	}
}
?>