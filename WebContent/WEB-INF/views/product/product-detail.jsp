<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

    <div class="container-wrapper">
    	<div class="container">
    	
    		<div class="page-header">
    			<h1>All Products in Store:</h1>
    			<p class="lead">Checkout all the products available now!</p>
    		</div>
    		
   			<div class="row">
   				<div class="col-md-5">
   					<img src="${imagePath}/product_${product.productId}.png" alt="image" 
   						class="img-responsive" style="width:100%; height:auto"/>
   				</div>
   				
   				<div class="col-md-5">
   					<h3>Product Name: ${product.productName}</h3>
   					<p>Description: ${product.productDescription}</p>
   					<p>Category: ${product.productCategory}</p>
   					<p>Condition: ${product.productCondition}</p>
   					<p>Manufacturer: ${product.productManufacturer}</p>
   					
   					<br>
   					
   					<div>
   						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<c:set var="productListUrl" 
   									value="${pageContext.request.contextPath}/admin/product-inventory"/>
						</sec:authorize>
						<sec:authorize access="not hasRole('ROLE_ADMIN')">
							<c:set var="productListUrl" 
   									value="${pageContext.request.contextPath}/product/list"/>
						</sec:authorize>
   						
   						
						<a href="${productListUrl}" class="btn btn-primary">
							<span class="glyphicon glyphicon-hand-left"></span>
							Back
						</a>
						
						<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
							<a href="" class="btn btn-warning" 
								ng-click="addProduct('${product.productId}')">
								<span class="glyphicon glyphicon-ok"></span>
								Add to Cart
							</a>
							
							<a href="<c:url value='/customer/cart'/>" class="btn btn-warning">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								View Cart
							</a>
						</sec:authorize>
						
					</div>
					
   				</div>
   				
   			</div> <!-- end tag of row -->
    		
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		