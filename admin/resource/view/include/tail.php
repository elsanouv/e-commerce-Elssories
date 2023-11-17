				<!--=*= FOOTER SECTION START =*=-->
				<footer class="sticky-footer" id="footer">
					All Rights Reserverd &copy; <?php echo date("Y"); ?> | Developed by 
					<a href="#" target="_blank">
						<b> Elsa Novita </b>
					</a> 
				</footer>
				<!--=*= FOOTER SECTION END =*=-->
			</div>
		</section>

		<script src="public/js/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="public/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="public/js/bootstrap.min.js"></script>
		<script src="public/js/modernizr.min.js"></script>
		<script src="public/js/jquery.nicescroll.js"></script>

		<script type="text/javascript" language="javascript" src="public/js/datatable/jquery.dataTables.js"></script>
		<script type="text/javascript" src="public/js/datatable/DT_bootstrap.js"></script>
		<script src="public/js/datatable/dynamic_table_init.js"></script>
		

		<script type="text/javascript">
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					var div_id  = $(input).attr('set-to');
					reader.onload = function (e) {
						$('#'+div_id).attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			
			$(".default").change(function(){
				readURL(this);
			});
		</script>
		<script src="public/js/jquery.counterup.js"></script>
		<script src="public/js/jquery.waypoints.min.js"></script>
		<script type="text/javascript">
			$(".counter").counterUp({delay: 1, time: 300});
		</script>

		<script src="public/summernote/summernote-lite.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#summerOne').summernote();
				$('#summerTwo').summernote();
			});
		</script>

		<script src="public/js/scripts.js"></script>
		<script type="text/javascript">
			$("img").mousedown(function(){
				return false;
			});
		</script>

	</body>
</html>