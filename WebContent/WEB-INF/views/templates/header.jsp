<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html >
<html>

	<!-- Global scope variables -->
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
	<c:set var="imagePath" value="${ctx}/resources/images"/>
	<c:set var="productImagePath" value="${ctx}/resources/images/product-images/large"/>
	<c:set var="productThumbnailPath" value="${ctx}/resources/images/product-images/thumbnail"/>
	<c:set var="moneySign" value="$"/>
	
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
		
		<!-- ishop custom CSS -->
		<link href="${ctx}/resources/css/ishop.css" rel="stylesheet">
		
		<!-- Angular JS -->
		<script src="${ctx}/resources/js/angular.min.js"></script>
		<script src="${ctx}/resources/js/angular-cookies.min.js"></script>
		<script src="<c:url value='/resources/js/controller.js'/>"></script>
		
		<!-- Customization JS -->
		<script src="<c:url value='/resources/js/ishop.js'/>"></script>
		
	</head>

	<body ng-app="shoppingCartApp" ng-controller="cartCtrl">
		
		<!-- This is only used for the sticky footer, end tag defined in footer -->
		<div id="wrap"> 
		
		<!-- Navbar Starts -->
		<nav class="navbar navbar-inverse navbar-static-top i-navbar">
			<div id="row-1" class="row">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						  <span class="sr-only">Toggle navigation</span>
						  <span class="icon-bar"></span>
						  <span class="icon-bar"></span>
						  <span class="icon-bar"></span>
						</button>
						<div class="navbar-brand" style="padding-top: 5px; padding-bottom: 5px; padding-right: 0px;">
							<a href='<spring:url value="/"/>'>
								<img alt="Brand" src="${imagePath}/brand-image.png" width="40" height="40">
							</a>
						</div>
						<a class="navbar-brand" href='<spring:url value="/"/>'>
							<p class="i-font-20" style="color: white">i-SHOP</p>
						</a>
					</div>
					
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a></a></li>
							<li><a href='<spring:url value="/"/>'>Home</a></li>
							
							<li><a href='<spring:url value="/product/list"/>'>Products</a></li>
							
							<li><a href='<c:url value="/contact"/>'>Contact</a></li>
							
							<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
											aria-expanded="false">My Links <span class="caret"></span></a>
									<ul class="dropdown-menu" style="border-radius: 0px !important;">
										<li><a href='<c:url value="/customer/home"/>'>
											<span class="glyphicon glyphicon-home" style="margin-right: 5px;"></span>
											Customer Home
										</a></li>
										<li><a href='<c:url value="/customer/order/list"/>'>
											<span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>
											My Orders
										</a></li>
										<li><a href='<c:url value="/customer/cart"/>'>
											<span class="glyphicon glyphicon-shopping-cart" style="margin-right: 5px;"></span>
											My Shopping Cart
										</a></li>
										<li role="separator" class="divider"></li>
										<li class="dropdown-header">
											<span class="glyphicon glyphicon-wrench" style="margin-right: 5px;"></span>
											Customer Tools
										</li>
										<li><a href='<c:url value="/customer/profile-form"/>'>Edit My Profile</a></li>
										<li><a href='<c:url value="/customer/billing-address-form"/>'>Edit Billing Address</a></li>
										<li><a href='<c:url value="/customer/shipping-address-form"/>'>Edit Shipping Address</a></li>
									</ul>
								</li>
							</sec:authorize>
							
							<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
											aria-expanded="false">Admin Tools <span class="caret"></span></a>
									<ul class="dropdown-menu" style="border-radius: 0px !important;">
										<li><a href='<c:url value="/admin/product-inventory"/>'>
											<span class="glyphicon glyphicon-th" style="margin-right: 5px;"></span>
											Product Inventory
										</a></li>
										<li><a href='<c:url value="/admin/order-management"/>'>
											<span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>
											Order Management
										</a></li>
										<li><a href="#">
											<span class="glyphicon glyphicon-user" style="margin-right: 5px;"></span>
											Customer Management
										</a></li>
										<li><a href="#">
											<span class="glyphicon glyphicon-link" style="margin-right: 5px;"></span>
											i-Shop Contact
										</a></li>
									</ul>
								</li>
							</sec:authorize>
							
						</ul>
							
						<ul class="nav navbar-nav pull-right">
							<sec:authentication var="user" property="principal"/>
							<sec:authorize access="isAuthenticated()">
								<sec:authorize access="hasRole('ROLE_USER')">
									<li>
										<a href="<spring:url value='/customer/home'/>" style="color: white;">
											<span class="glyphicon glyphicon-user"></span>
											Welcome, ${user.username}
										</a>
									</li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li>
									<a href="<spring:url value='/admin'/>" style="color: white;">
										<span class="glyphicon glyphicon-user"></span>
										Welcome, ${user.username}
									</a>
								</li>
								</sec:authorize>
								<li><a>|</a></li>
								<li>
									<a href='<spring:url value="/logout"/>'>Sign Out</a>
								</li>
							</sec:authorize>
							
							<sec:authorize access="not isAuthenticated()">
								<li><a href='<spring:url value="/register"/>'>Sign Up</a></li>
								<li><a>|</a></li>
								<li><a href='<spring:url value="/login"/>'>Sign In</a></li>
							</sec:authorize>
						</ul>
					</div> <!-- navbar-collapse -->
				</div> <!-- container -->
			</div> <!-- row-1 -->
			
			<div id="row-2" class="row">
				<div class="container">
				
					<div class="col-md-4" style="margin-right: -23px;">
						<div class="navbar-brand pull-right" 
								style="padding-top: 1px; padding-bottom: 5px; padding-right: 0px; margin-right: 0px;">
							<a href="#">
								<img alt="devices" src="${imagePath}/device-gallery.png" width="210" height="60">
							</a>
						</div>
					</div>
					
					<form class="navbar-form navbar-left" role="search" action='<c:url value="/product/list/search/1"/>' method="get">
						<div class="form-group">
							<input type="text" name="keyword" class="form-control" placeholder="All electronics" 
									style="width: 400px;">
						</div>
						<button type="submit" class="btn btn-warning" style="width: 100px; margin-left: 5px;">Search</button>
					</form>
					
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
						<form class="navbar-form pull-right" action="<spring:url value='/customer/cart'/>" method="get">
							<button type="submit" class="btn btn-warning i-btn-md">
								<span class="badge" ng-init="refreshCart()" ng-hide="isNaN(cart.totalQuantity)" 
										ng-bind="cart.totalQuantity">
									0
								</span>
								<span class="glyphicon glyphicon-shopping-cart"></span>
								My Cart
							</button>
						</form>
					</sec:authorize>
					
				</div> <!-- container -->
			</div> <!-- row-2 -->
		</nav>
		
			
