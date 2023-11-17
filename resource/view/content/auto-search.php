<?php
include("app/Http/Controllers/Controller.php");
include("app/Http/Controllers/PageController.php");


$control = new Controller;
$pageControl = new PageController;


@$searchData = $_POST['search'];

$result = $pageControl->searchAuto('products', 'product_name', $searchData);

if($result > 0)
{
	foreach($result AS $eachData)
	{
		echo '<a class="list-group-item-action loadData">'. $eachData['product_name'] .'</a>';
	}
}
else
{
	echo '<a class="list-group-item-action loadData"> No Data Found </a>';
}
?>