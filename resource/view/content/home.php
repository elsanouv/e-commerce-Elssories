<?php
include("app/Http/Controllers/Controller.php");
include("app/Http/Controllers/HomeController.php");


$homeCtrl = new HomeController;
$eloquent = new Eloquent;


$columnName = $tableName = null;
$columnName = "*";
$tableName = "slides";
$slidesList = $eloquent->selectData($columnName, $tableName);

$columnName = $tableName = $whereValue = null;
$columnName["1"] = "id";
$columnName["2"] = "product_name";
$columnName["3"] = "product_price";
$columnName["4"] = "product_master_image";
$tableName = "products";
$whereValue["category_id"] = 1;	
$whereValue["product_status"] = "In Stock";
$formatBy["DESC"] = "id";
$paginate["POINT"] = 0;
$paginate["LIMIT"] = 8;
$menProducts = $eloquent->selectData($columnName, $tableName, @$whereValue, @$inColumn, @$inValue, @$formatBy, @$paginate);
$columnName = $tableName = $whereValue = $inColumn = $inValue = $formatBy = $paginate = null;
$columnName["1"] = "id";
$columnName["2"] = "product_name";
$columnName["3"] = "product_price";
$columnName["4"] = "product_master_image";
$tableName = "products";
$whereValue["category_id"] = 2;	
$whereValue["product_status"] = "In Stock";
$formatBy["DESC"] = "id";
$paginate["POINT"] = 0;
$paginate["LIMIT"] = 8;
$womenProducts = $eloquent->selectData($columnName, $tableName, @$whereValue, @$inColumn, @$inValue, @$formatBy, @$paginate);
$columnName = $tableName = $whereValue = $inColumn = $inValue = $formatBy = $paginate = null;
$columnName["1"] = "id";
$columnName["2"] = "product_name";
$columnName["3"] = "product_price";
$columnName["4"] = "product_master_image";
$tableName = "products";
$whereValue["category_id"] = 8;	
$whereValue["product_status"] = "In Stock";
$formatBy["DESC"] = "id";
$paginate["POINT"] = 0;
$paginate["LIMIT"] = 8;
$watchProducts = $eloquent->selectData($columnName, $tableName, @$whereValue, @$inColumn, @$inValue, @$formatBy, @$paginate);
?>

<!--=*= HOME SECTION START =*=-->
<main class="main">
	<div class="home-top-container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="home-slider owl-carousel owl-carousel-lazy">
						
					<?php 
						foreach($slidesList AS $eachSlide)
						{
							echo '
							<div class="home-slide">
								<img class="owl-lazy" src="public/assets/images/lazy.png" data-src="'.$GLOBALS['SLIDES_DIRECTORY'] . $eachSlide['slider_file'].'" alt="slider image">
								<div class="home-slide-content">
									<h1 class="text-primary">'.$eachSlide['slider_title'].'</h1>
								</div>
							</div>';
						}
					?>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="info-boxes-container">
		<div class="container">
			<div class="info-box">
				<i class="icon-shipping"></i>
				<div class="info-box-content">
					<h4>FREE SHIPPING & RETURN</h4>
					<p>Free shipping on all orders over 250Rb.</p>
				</div>
			</div>
			<div class="info-box">
				<i class="icon-heart"></i>
				<div class="info-box-content">
					<h4>PRODUCT HANDMADE</h4>
					<p>100% Product Handmade</p>
				</div>
			</div>
			<div class="info-box">
				<i class="icon-support"></i>
				<div class="info-box-content">
					<h4>ONLINE SUPPORT 24/7</h4>
					<p>Whenever you need, we are always there.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="home-product-tabs">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="featured-products-tab" data-toggle="tab" href="#featured-products" role="tab" aria-controls="featured-products" aria-selected="true">Accessories</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="featured-products" role="tabpanel" aria-labelledby="featured-products-tab">
							<div class="row row-sm">
								
							<?php
								$homeCtrl->productLister($menProducts);
							?>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="home-product-tabs">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="featured-products-tab" data-toggle="tab" href="#featured-products" role="tab" aria-controls="featured-products" aria-selected="true">Keychain</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="featured-products" role="tabpanel" aria-labelledby="featured-products-tab">
							<div class="row row-sm">
								
							<?php
								$homeCtrl->productLister($womenProducts);
							?>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="home-product-tabs">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="featured-products-tab" data-toggle="tab" href="#featured-products" role="tab" aria-controls="featured-products" aria-selected="true">Gifts</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="featured-products" role="tabpanel" aria-labelledby="featured-products-tab">
							<div class="row row-sm">
								
							<?php
								$homeCtrl->productLister($watchProducts);
							?>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="partners-container">
		<div class="container">
			<div class="partners-carousel owl-carousel owl-theme">
				<a href="#" class="partner">
					<img src="public/assets/images/brand/gosend.png" alt="logo">
				</a>
				<a href="#" class="partner">
					<img src="public/assets/images/brand/grab.png" alt="logo">
				</a>
				<a href="#" class="partner">
					<img src="public/assets/images/brand/jne.png" alt="logo">
				</a>
				<a href="#" class="partner">
					<img src="public/assets/images/brand/jnt.png" alt="logo">
				</a>
				<a href="#" class="partner">
					<img src="public/assets/images/brand/ninja.png" alt="logo">
				</a>				
				<a href="#" class="partner">
					<img src="public/assets/images/brand/tiki.png" alt="logo">
				</a>				
			</div>
		</div>
	</div>
</main>
<!--=*= HOME SECTION START =*=-->