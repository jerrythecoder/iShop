<%@include file="/WEB-INF/views/templates/header.jsp" %>

<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container" ng-app="cartApp">
    	
    		<div class="page-header">
    			<h1>All Products in Store:</h1>
    			<p class="lead">Checkout all the products available now!</p>
    		</div>
    		
    		<div class="container">
    			<div class="row">
    				<div class="col-md-5">
    					<img src="${imagePath}/product_${product.productId}.png" alt="image" class="img-responsive" style="width:100%; height:auto"/>
    				</div>
    				
    				<div class="col-md-5">
    					<h3>Product Name: ${product.productName}</h3>
    					<p>Description: ${product.productDescription}</p>
    					<p>Category: ${product.productCategory}</p>
    					<p>Condition: ${product.productCondition}</p>
    					<p>Manufacturer: ${product.productManufacturer}</p>
    					
    					<br>
    					
    					<c:set var="role" scope="page" value="${param.role}"/>
    					<c:set var="url" scope="page" value="/product/list"/>
    					<c:if test="${role='admin'}">
    						<c:set var="url" value="/admin/product-inventory"/>
    					</c:if>
    					
    					<p>
   							<a href='<c:url value="${url}"/>' class="btn btn-default">Back</a>
   							<a href="" class="btn btn-warning btn-large" 
   									ng-click="addToCart('${product.productId}')">
   								<span class="glyphicon glyphicon-shopping-cart"></span>
   								Order Now
   							</a>
   							<a href="<c:url value='/cart'/>" class="btn btn-default">
   								<span class="glyphicon glyphicon-hand-right"></span>
   								View Cart
   							</a>
   						</p>
    				</div>
    			</div>
    		</div>
    		
    		<script type="text/javascript" src="<c:url value='/resources/js/controller.js'/>"></script>
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		