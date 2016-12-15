<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<c:set var="carouseHeight" value="500"></c:set>


<!-- Carousel Starts -->
   <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: ${carouseHeight}px !important;">
     <!-- Indicators -->
     <ol class="carousel-indicators">
       <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
       <li data-target="#myCarousel" data-slide-to="1"></li>
       <li data-target="#myCarousel" data-slide-to="2"></li>
     </ol>
     <div class="carousel-inner" role="listbox">
       <div class="item active" style="height: ${carouseHeight}px !important;">
         <img class="first-slide home-image" src='<c:url value="/resources/images/slide-01.jpg"/>' alt="First slide" style="height: ${carouseHeight}px !important;">
         <div class="container">
           <div class="carousel-caption">
             <h1>iOS 10 and iPad. Made to do more together.</h1>
             <p>iPad Pro runs iOS 10, the most advanced, intuitive and secure mobile operating system in the world. With its powerful built-in apps and multitasking capabilities, iOS 10 is designed to help you get the most out of iPad.</p>
             <p><a class="btn btn-lg btn-primary" href='<c:url value="/product/list/search/1?keyword=ipad"/>' role="button">Search iPad in shop</a></p>
           </div>
         </div>
       </div>
       <div class="item" style="height: ${carouseHeight}px !important;">
         <img class="second-slide home-image" src='<c:url value="/resources/images/slide-02.jpg"/>' alt="Second slide" style="height: ${carouseHeight}px !important;">
         <div class="container">
           <div class="carousel-caption">
             <h1>Apple Watch Gallery</h1>
             <p>Whatever your style, there's an Apple Watch for you. Check out the full range of models below, or use the Interactive Gallery to create your own combinations by mixing and matching bands, cases and faces.</p>
             <p><a class="btn btn-lg btn-primary" href='<c:url value="/product/list/search/1?keyword=watch"/>' role="button">Browse gallery</a></p>
           </div>
         </div>
       </div>
       <div class="item" style="height: ${carouseHeight}px !important;">
         <img class="third-slide home-image" src='<c:url value="/resources/images/slide-03.jpg"/>' alt="Third slide" style="height: ${carouseHeight}px !important;">
         <div class="container">
           <div class="carousel-caption">
             <h1>the new Surface family</h1>
             <p>To do great things, you need powerful tools that deliver an ideal balance of craftsmanship, performance and versatility.</p>
             <p><a class="btn btn-lg btn-primary" href='<c:url value="/product/list/search/1?keyword=surface"/>' role="button">Find Windows Surface</a></p>
           </div>
         </div>
       </div>
     </div>
     <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
       <span class="sr-only">Previous</span>
     </a>
     <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
       <span class="sr-only">Next</span>
     </a>
   </div><!-- /.carousel -->
<!-- Carousel Ends -->


<div class="container i-wd-95">

	<div class="panel panel-default text-center" style="padding: 20px; padding-bottom: 10px; 
			border-radius: 4px !important; margin-top: -40px;">
		<p class="i-font-18">Smart phones, tablets, wearables, laptops & desktops, videos & cameras, and also accessories... find all trendy electronics in i-Shop.</p>
		<p class="i-font-18">
			Check with our recommendations below. Or, you can just go 
			<a href='<spring:url value="/product/list"/>' class="btn btn-warning i-btn-lg" 
					style="margin-left: 10px;">View All Our Products</a>
		</p>
	</div>
	
	<sec:authorize access="not isAuthenticated()">
		<div class="panel panel-default text-center" style="padding: 20px; padding-bottom: 10px; 
				border-radius: 4px !important; margin-top: 0px;">
			<p class="i-font-18">
				Alright, to shop your favorite items, you will surely want to 
				<a href='<spring:url value="/register"/>' class="btn btn-warning i-btn-md" 
						style="margin-left: 10px; margin-right: 10px;">Sign Up</a>
				 or 
				<a href='<spring:url value="/login"/>' class="btn btn-warning i-btn-md" 
						style="margin-left: 10px; margin-right: 10px;">Sign In</a>
			</p>
		</div>
	</sec:authorize>
	
	<div class="row">
		<c:forEach var="product" items="${suggestionList}">
		
			<c:url var="productDetailLink" value='/product/detail/${product.productId}'>
				<c:param name="backToHome" value="true"></c:param>
			</c:url>
			
			<div class="col-sm-6 col-md-3">
			    <div class="thumbnail" style="height: 360px; overflow: hidden;">
			    	<a href="${productDetailLink}">
			    		<img src="${productThumbnailPath}/${product.productId}.jpg" alt="image"
			      				style="height: 150px; overflow: hidden;">
			    	</a>
			      <div class="caption text-center">
			      	<div style="height: 60px;">
			      		<h4 class="text-center">${product.productName}</h4>
			      	</div>
			      	<p style="height: 30px;">
			      		<span>${product.productCategory}</span>, <span>${product.productStatus}</span>
			      	</p>
			        <h4 class="i-font-bold">${moneySign} ${product.productPrice}</h4>
			        <p><a href="${productDetailLink}" class="btn btn-warning i-btn-lg" role="button">View Details</a></p>
			      </div>
			    </div>
			  </div>
		</c:forEach>
	</div>
</div>

			
<%@include file="/WEB-INF/views/templates/footer.jsp" %>