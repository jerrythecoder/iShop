<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../favicon.ico">
		
		<title>Welcome to i-SHOP</title>
		
		<!-- Bootstrap core CSS -->
		<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Custom styles for this template -->
		<link href="${ctx}/resources/css/carousel.css" rel="stylesheet">
		
		<!-- Main CSS defined by ourselves -->
		<link href="${ctx}/resources/css/main.css" rel="stylesheet">
		
		<!-- Angular JS -->
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-cookies.js"></script>
		<script src="<c:url value='/resources/js/controller.js'/>"></script>
	</head>

	<body class="home" ng-app="shoppingCartApp" ng-controller="cartCtrl">
		<div class="container"> <!-- main container -->
		
			<!-- Navbar Starts -->
			<div class="navbar-wrapper">
				<div class="container">
				
					<nav class="navbar navbar-inverse navbar-static-top">
						<div class="container">
						
							<div class="navbar-header">
							  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
							    <span class="sr-only">Toggle navigation</span>
							    <span class="icon-bar"></span>
							    <span class="icon-bar"></span>
							    <span class="icon-bar"></span>
							  </button>
							  <a class="navbar-brand" href='<spring:url value="/"/>'>i-SHOP</a>
							</div>
							
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li><a href='<spring:url value="/"/>'>Home</a></li>
									<li><a href='<spring:url value="/product/list"/>'>Product</a></li>
									<li><a href="#">Contact</a></li>
									<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
									<li><a href='<spring:url value="/admin"/>'>Admin Tools</a></li>
									</sec:authorize>
								</ul>
									
								<ul class="nav navbar-nav pull-right">
									<sec:authentication var="user" property="principal"/>
									<sec:authorize access="isAuthenticated()">
									<sec:authorize access="hasRole('ROLE_USER')">
										<li>
											<a href="<spring:url value='/customer/home'/>">Welcome, ${user.username}</a>
										</li>
									</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li>
											<a href="<spring:url value='/admin'/>">Welcome, ${user.username}</a>
										</li>
										</sec:authorize>
										<li>
											<a href='<spring:url value="/logout"/>'>Sign Out</a>
										</li>
									</sec:authorize>
									
									<sec:authorize access="not isAuthenticated()">
										<li><a href='<spring:url value="/register"/>'>Sign Up</a></li>
										<li><a href='<spring:url value="/login"/>'>Sign In</a></li>
									</sec:authorize>
								</ul>
							</div> <!-- id navbar -->

						</div>
					</nav>
					
				</div> <!-- container inside navbar-wrapper -->
			</div> <!-- navbar-wrapper -->
			<!-- Navbar Ends -->
			
			<!-- Carousel Starts -->
		    <div id="myCarousel" class="carousel slide" data-ride="carousel">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		      </ol>
		      <div class="carousel-inner" role="listbox" style="border-radius: 3px;">
		        <div class="item active">
		          <img class="first-slide home-image" src='<c:url value="/resources/images/slide-01.jpg"/>' alt="First slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>Example headline.</h1>
		              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
		              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="second-slide home-image" src='<c:url value="/resources/images/slide-02.jpg"/>' alt="Second slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>Another example headline.</h1>
		              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
		              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="third-slide home-image" src='<c:url value="/resources/images/slide-03.jpg"/>' alt="Third slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>One more for good measure.</h1>
		              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
		              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
		            </div>
		          </div>
		        </div>
		      </div>
		      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="border-radius: 3px;">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="border-radius: 3px;">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div><!-- /.carousel -->
			<!-- Carousel Ends -->
			
			
			<!-- FOOTER Starts-->
			<footer>
			  <p class="pull-right"><a href="#">Back to top</a></p>
			  <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
			</footer>
			<!-- Footer Ends -->
			
		</div> <!-- main container -->
		
		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>window.jQuery || document.write('<script src="${ctx}/resources/js/jquery-3.1.1.min.js"><\/script>')</script>
		<script src="${ctx}/resources/js/bootstrap.min.js"></script>
	</body>
</html>