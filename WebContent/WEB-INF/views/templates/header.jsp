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

	<body ng-app="shoppingCartApp" ng-controller="cartCtrl">
		<div class="container main-container"> <!-- main container -->
		
			<!-- Navbar Starts -->
			<div class="container">
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
											<a href="<spring:url value='/customer/home'/>">
												<span class="glyphicon glyphicon-user"></span>
												Welcome, ${user.username}
											</a>
										</li>
									</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li>
											<a href="<spring:url value='/admin'/>">
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
							</div> <!-- id navbar -->

						</div>
					</nav>
					
				</div> <!-- container inside navbar-wrapper -->
			</div> <!-- navbar-wrapper -->
			</div>
			<!-- Navbar Ends -->
			
			
