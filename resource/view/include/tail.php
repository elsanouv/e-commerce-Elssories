<?php
	$eloquent = new Eloquent;
	
	$columnName = $tableName = $whereValue = null;
	$columnName = "*";
	$tableName = "categories";
	$whereValue['category_status'] = "Active";
	$categoryMenu = $eloquent->selectData($columnName, $tableName, @$whereValue);
?>

			<!--=*= FOOTER SECTION START =*=-->
			<footer class="footer" id="footer">
				<div class="footer-middle">
					<div class="container">
						<div class="row">
							<div class="col-lg-2 col-md-6">
								<div class="widget">
									<h4 class="widget-title">My Account</h4>
									<ul class="links">
										<li><a href="about.php">About Us</a></li>
										<li><a href="contact.php">Contact Us</a></li>
										<li><a href="my-account.php">My Account</a></li>
										<li><a href="#">Privacy Policy</a></li>
										<li><a href="#">Terms &amp; Conditions</a></li>
										<li><a href="login.php">Login</a></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="widget">
									<h4 class="widget-title">About Us</h4>
									<p>Elssories is an online accessories store that provides handmade and imported products. Products are provided in various categories.</p>
									<p> 
										<li> Handamade </li>
										<li> Product Import</li>
										<li> Quality Produk</li>
										<li> Various Products</li>
									</p>
								</div>
							</div>
							<div class="col-lg-5 col-md-6">
								<div class="widget widget-newsletter">
									<h4 class="widget-title">Subscribe newsletter</h4>
									<p>Get all the latest information on Events, Sales and Offers. Sign up for newsletter today</p>
									<form action="" method="post">
										<input type="email" name="user_newsletter" class="form-control" placeholder="Email address" required>
										<button type="submit" name="news_subscribe" class="btn">Subscribe<i class="icon-angle-right"></i></button>
									</form>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="widget">
									<ul class="contact-info">
										<li><span class="contact-info-label">Address:</span>Rangkasbitung, Lebak, Banten</li>
										<li><span class="contact-info-label">Phone:</span>Whatsapp Only <a href="tel:">+62 856-9464-7115</a></li>
										<li><span class="contact-info-label">Email:</span> <a href="mailto:elsanovitaca@gmail.com">elsanovitaca@gmail.com</a></li>
										<li><span class="contact-info-label">Working Days/Hours:</span>Mon - Sun / 9:00AM - 8:00PM</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="footer-bottom">
						<p class="footer-copyright mt-1">All Rights Reserved &copy; <?= date('Y') ?> | Developed By 
							<a href="//aamroni.info" target="_blank"> Elsa Novita</a>
						</p>
						<div class="social-icons">
							<a><img style="height: 33px; padding-left: 16px;" src="public/assets/images/icons/ovo.png" alt=""></a>
							<a><img style="height: 33px; padding-left: 16px;" src="public/assets/images/icons/dana.jpg" alt=""></a>
							<a><img style="height: 33px; padding-left: 16px;" src="public/assets/images/icons/spay.png" alt=""></a>
							<a><img style="height: 35px; padding-left: 16px;" src="public/assets/images/icons/cod.png" alt=""></a>
						</div>
						<div class="social-icons">
							<a href="#" target="_blank" style="margin: 0px 15px;">
								<img src="public/assets/images/elsaa.jpeg" class="rounded-circle" style="width:35px; height:35px;">
							</a>				
							<a href="https://www.facebook.com/elsa.novita.12914/" class="social-icon" target="_blank">
								<i class="icon-facebook"></i>
							</a>
							<a href="https://www.linkedin.com/in/elsa-novita-41911727b?trk=contact-info/" class="social-icon" target="_blank">
								<i class="icon-linkedin"></i>
							</a>
							<a href="https://www.instagram.com/chaelsanvta/?igshid=NGExMmI2YTkyZg==" class="social-icon" target="_blank">
								<i class="icon-instagram"></i>
							</a>
						</div>
					</div>
				</div>
			</footer>
			<!--=*= FOOTER SECTION END =*=-->
		</div>
		<!--=*= MAIN SECTION END =*=-->

		<!--=*= MOBILE MENU CONTAINER START =*=-->
		<div class="mobile-menu-overlay"></div>
		<div class="mobile-menu-container">
			<div class="mobile-menu-wrapper">
				<span class="mobile-menu-close">
					<i class="icon-cancel"></i>
				</span>
				<nav class="mobile-nav">
					<ul class="mobile-menu">
						<li class="active"><a href="index.php">Home</a></li>
						
						<?php
							#== CREATE DYNAMIC MAIN MENU FROM CATEGORIES
							foreach($categoryMenu as $eachCategory)
							{
								echo'<li>
								<a href="#" class="sf-with-ul">'.$eachCategory['category_name'].'</a>
								<ul>';
								
								#== GET SUBCATEGORIES DATA FOR SUB MENU BASED ON MAIN CATEGORIES
								$columnName = $tableName = $whereValue = null;
								$columnName = "*";
								$tableName = "subcategories";
								$whereValue['category_id'] = $eachCategory['id'];
								$subcategoryMenu = $eloquent->selectData($columnName, $tableName, @$whereValue);	
								
								foreach($subcategoryMenu as $eachSubcategory)
								{
									echo '<li>
												<a href="category.php?id='.$eachSubcategory['id'].'">'.$eachSubcategory['subcategory_name'].'</a>
											</li>';
								}
								
								echo '</ul>
								</li>';
							}
						?>
						
						<li><a href="dashboard.php">My Account</a></li>
						<li><a href="contact.php">Contact</a></li>
						<li><a href="login.php">Log In</a></li>
					</ul>
				</nav>
				<div class="social-icons">
					<a href="https://www.facebook.com/elsa.novita.12914/" class="social-icon" target="_blank">
								<i class="icon-facebook"></i>
							</a>
							<a href="https://www.linkedin.com/in/elsa-novita-41911727b?trk=contact-info/" class="social-icon" target="_blank">
								<i class="icon-linkedin"></i>
							</a>
							<a href="https://www.instagram.com/chaelsanvta/?igshid=NGExMmI2YTkyZg==" class="social-icon" target="_blank">
								<i class="icon-instagram"></i>
							</a>
				</div>
			</div>
		</div>
		<!--=*= MOBILE MENU CONTAINER END =*=-->

		<!--=*= SCROLL BUTTON TO GO TO PAGE TOP =*=-->
		<a id="scroll-top" href="#top" title="Top" role="button">
			<i class="icon-angle-up"></i>
		</a>

		<!--=*= NEWSLETTER POP-UP CONTENT START =*=-->
		<div class="modal fade" id="newsletterPopup" tabindex="-1" role="dialog" aria-labelledby="newsletterModal" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="cuspop" style="background-image: url('public/assets/images/menu-bg.png')">
						<div class="modal-header">
							<img src="public/assets/images/favicon/logoFrontEnd.png" alt="Logo" class="logo-newsletter">
						</div>
						<div class="modal-body">
							<h2>BE THE FIRST TO KNOW</h2>
							<p>Subscribe to the <b>Elssories Store Handmade Accessories</b>  newsletter <br/> to receive timely updates from your favorite products.</p>
							<form action="" method="post">
								<div class="row">
									<div class="col-sm-8 offest-sm-1">
										<div class="input-group">
											<input type="email" class="form-control" name="user_newsletter" placeholder="Email address" required>
											<input type="submit" name="news_subscribe" class="btn btn-primary" value="Subscribe!">
										</div>
									</div>
								</div>
							</form>
							<div class="newsletter-subscribe">
								<div class="checkbox" id="remove">
									<label>
										<input type="checkbox" value="1">
										Don't show this popup again
									</label>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-sm btn-secondary news-rem" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--=*= NEWSLETTER POP-UP CONTENT END =*=-->

	<!--=*= JS SOURCE FILES =*=-->
	<script src="public/assets/js/bootstrap.bundle.min.js"></script>
	<script src="public/assets/js/toastr.min.js"></script>
	<script src="public/assets/js/plugins.min.js"></script>
	<script src="public/assets/js/nouislider.min.js"></script>
	<script src="public/assets/js/main.js"></script>
	<!--=*= JS SOURCE FILES =*=-->

	<!--=*= MULTIPLE JS MANIPULATION SCRIPT =*=-->

	<!--# AUTO SEARCH COMPLETE #-->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#search').keyup(function(){
				var data = $(this).val();
				
				if(data!='') {
					$.ajax({
						url: 'auto-search.php',
						type: 'POST',
						data: {search: data},
						success: function(response) {
							$('#show-list').html(response);
						}
					});
					} else {
					$('#show-list').html('');
				}
			});
			$(document).on('click', '.loadData', function() {
				$('#search').val($(this).text());
				$('#show-list').html('');
			});
		});
	</script>
	<!--# AUTO SEARCH COMPLETE #-->

	<!--# ADD TO CART MESSAGE #-->
	<script type="text/javascript">
		function success_toast(details, title) {
			toastr.options = {
				"closeButton": true,
				"debug": false,
				"newestOnTop": false,
				"progressBar": false,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "3000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}
			//toastr["success"]("Your product is added to cart successfully!", "Congratulation")
			toastr["success"](details, title) 
		}			
		
		function warning_toast(details, title) {
			toastr.options = {
				"closeButton": true,
				"debug": false,
				"newestOnTop": false,
				"progressBar": false,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "3000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}
			toastr["warning"](details, title) 
		}
	</script>

	<?php
		#== PRODUCT ADDED TO THE CART ITEMS MESSAGE
		if(isset($_POST['add_to_cart']))
		{
			if($_SESSION['ADD_TO_CART_RESULT'] > 0) {
				echo '<script type="text/javascript"> 
				success_toast("Your product is added to cart successfully!", "CONGRATULATION")
				</script>';
				
				} else {
				echo '<script type="text/javascript"> 
				warning_toast("Please <b> register </b> an account first!", "DEAR CUSTOMER")
				</script>';
			}
		}
		#== NEWSLETTERS CONFIRMATION MESSAGE
		if(isset($_POST['news_subscribe']))
		{
			echo '<script type="text/javascript"> 
			success_toast("Thank for subscribe our newsletter", "CONGRATULATION");
			</script>';
		}
	?>
	<!--# ADD TO CART MESSAGE #-->

	<!--# NEWSLETTER POPUP TIME #-->
	<script type="text/javascript">
		setTimeout(function(){
			$('#newsletterPopup').modal('toggle')
		}, 6000000);	
	</script>
	<!--# NEWSLETTER POPUP TIME #-->

	<!--# DISABLE IMAGE DRAG #-->
	<script type="text/javascript">
		$("img").mousedown(function(){
			return false;
		});	
	</script>	
	<!--# DISABLE IMAGE DRAG #-->
	
	<!--=*= MULTIPLE JS MANIPULATION SCRIPT =*=-->
	</body>
</html>