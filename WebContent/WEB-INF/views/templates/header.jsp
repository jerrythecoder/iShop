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

    <title>Welcome to E-Music Store</title>

    <!-- Bootstrap core CSS -->
    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/carousel.css" rel="stylesheet">
    
    <!-- Main CSS defined by ourselves -->
    <link href="${ctx}/resources/css/main.css" rel="stylesheet">
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-cookies.js"></script>
    <script src="<c:url value='/resources/js/basket-controller.js'/>"></script>
    
    <!-- Spring Security -->
    <sec:csrfMetaTags />
    <!--
    <script type="text/javascript" language="javascript">
		var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
	</script>
	-->
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
  </head>
	<!-- NAVBAR
	================================================== -->
  <body ng-app="basketApp" ng-controller="basketCtrl">
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
              <a class="navbar-brand" href='<spring:url value="/"/>'>E-Music Store</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href='<c:url value="/"/>'>Home</a></li>
                <li><a href='<c:url value="/product/list"/>'>Product</a></li>
                <li><a href='<c:url value="/item"/>'>Item(test)</a></li>
              </ul>
              <ul class="nav navbar-nav pull-right">
              	<li><a href='<spring:url value="/admin"/>'>Admin</a></li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
      
        <!-- Functional Bar -->
		<div class="container">
	      	<div class="row">
	      		
	      		<div class="col-md-9">
	      		</div>
	      	
	      		<div class="col-md-3" ng-init="updateTotalItemCount()">
	      			<a href="<c:url value='/basket'/>">
	      				<p class="text-right">
	      					<button class="btn btn-warning" type="button">
	      						<span class="badge">{{totalItemCount}}</span>
		      					<span class="glyphicon glyphicon-shopping-cart"></span>
		      					My Shopping Cart
	      					</button>
	      				</p>
	      			</a>
	      		</div>
	      		
	      	</div>
	    </div>
      
    </div>
    
    
    