<?php
if(@$_REQUEST['exit'] == "yes")
{
	session_start();
	session_destroy();
	header("Location: index.php");
}


if(empty($_SESSION['SMC_login_time']) && empty($_SESSION['SMC_login_id']))
{
	header("Location: index.php"); 
}


if(@$_REQUEST['exit'] == "lock")
{
	header("Location: lock-screen.php");
}

$pagename = basename($_SERVER['PHP_SELF']);

#== TECHNICAL OPERATOR
$technicalOperatorPages = ['create-product.php', 'list-product.php', 'create-slider.php', 'list-slider.php', 'list-customer.php', 'invoice-list.php'];

if(in_array($pagename, $technicalOperatorPages) && $_SESSION['SMC_login_admin_type'] == "Technical Operator")
{
	header("Location: dashboard.php");
}

#== CONTENT MANAGER
$contentManagerPages = ['create-admin.php', 'list-admin.php', 'create-category.php', 'list-category.php', 'create-subcategory.php', 'list-subcategory.php', 'list-customer.php', 'list-order.php', 'detail-order.php', 'invoice-list.php'];

if(in_array($pagename, $contentManagerPages) && $_SESSION['SMC_login_admin_type'] == "Content Manager")
{
	header("Location: dashboard.php");
}

#== SALES MANAGER
$salesManagerPages = ['create-product.php', 'list-product.php', 'create-slider.php', 'list-slider.php', 'create-admin.php', 'list-admin.php', 'create-category.php', 'list-category.php', 'create-subcategory.php', 'list-subcategory.php'];

if(in_array($pagename, $salesManagerPages) && $_SESSION['SMC_login_admin_type'] == "Sales Manager")
{
	header("Location: dashboard.php");
}

?>