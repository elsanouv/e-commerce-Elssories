<?php
include("app/Http/Controllers/View.php");

$view = new View;

$view->loadContent("include", "session");
//$view->loadContent("include", "top");
$view->loadContent("content", "invoice-print");
//$view->loadContent("include", "tail");
?>