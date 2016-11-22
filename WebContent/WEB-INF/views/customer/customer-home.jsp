<%@include file="/WEB-INF/views/templates/header.jsp" %>

<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container" ng-app="cartApp">
    	
    		<div class="page-header">
    			<h1>Customer Details: </h1>
    			<p class="lead">This is your profile page</p>
    		</div>
    		
    		<div class="container">
    			<div class="row">
    				<div class="col-md-7">
    					<p>${sessionUsername}</p>
    					<p>${customer.customerFirstName}</p>
    					<p>${customer.customerLastName}</p>
    					<p>${customer.customerEmail}</p>
    					<p>${customer.customerPhone}</p>
    				</div>
    				
    				<div class="col-md-5">
						<a href="<c:url value="/customer/address-form"/>" class="btn btn-primary main-button-md">
							Add Addresses
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
    				</div>
    			</div>
    		</div>
    		
    		<script type="text/javascript" src="<c:url value='/resources/js/controller.js'/>"></script>
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		