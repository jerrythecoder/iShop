<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">

	<div class="row i-top-elem">
		<div class="col-md-5">
			<div class="jumbotron -i-cus-jumbotron-active text-center" 
					style="width: 100%; height: 450px; border: 1px !important; border-style: solid !important; 
					border-color: #faebcc !important; background-color: #ffffcc;">
				<h3 class=" i-color-warn">
					<img alt="Brand" src="${imagePath}/brand-image.png" width="50" height="50">
					Thank you for visiting i-Shop
				</h3>
				<br>
				<div class="text-left i-font-16">
					<p class="i-font-16">
						<span class="i-font-bold">Contact Person: </span>Jerry Zhang
					</p>
					<p class="i-font-16">
						<span class="i-font-bold">Cell Phone: </span>519-991-XXXX
					</p>
					<p class="i-font-16">
						<span class="i-font-bold">E-mail: </span>jerryzhang@XXXX.com
					</p>
					<p class="i-font-16">
						<span class="i-font-bold">Company Address: </span> 
						1788 Dominion Blvd. 
						<br>Windsor, Ontario, 
						Canada, N9B 3H7
					</p>
				</div>
				<br>
				<h3 class=" i-color-warn">
					<span class="glyphicon glyphicon-globe"></span>
					<p class="i-font-16">2016</p>
				</h3>
			</div>
		</div>
		<div class="col-md-7">
			<div class="panel panel-danger" style="border-radius: 2px !important; width: 100%; height: 450px;">
				<iframe  frameborder="0" style="border:0; width: 100%; height: 100%;"
						src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJTXtiWLItO4gRRqin7z3mrfw&key=AIzaSyBzMrGU3jBXuMSVJQDmvnCsiGLohwTBdK4" 
						allowfullscreen>
				</iframe>
			</div>
		</div>
	</div>

</div> <!-- container -->


<%@include file="/WEB-INF/views/templates/footer.jsp" %>