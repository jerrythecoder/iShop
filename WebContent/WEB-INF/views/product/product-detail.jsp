<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@include file="/WEB-INF/views/templates/func-bar.jsp" %>


	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

    <div class="container-wrapper">
    	<div class="container">
    	
    		<div class="page-header">
    			<h1>All Products in Store:</h1>
    			<p class="lead">Checkout all the products available now!</p>
    			
    			<div class="text-right">
   					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<c:set var="productListUrl" 
  									value="${pageContext.request.contextPath}/admin/product-inventory"/>
					</sec:authorize>
					<sec:authorize access="not hasRole('ROLE_ADMIN')">
						<c:set var="productListUrl" 
  									value="${pageContext.request.contextPath}/product/list"/>
					</sec:authorize>
  					
   					<a href="${productListUrl}" class="btn btn-default">
						<span class="glyphicon glyphicon-hand-left"></span>
						Back to List
					</a>
    			</div>
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
   					
   					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
	  					<div ng-init="verifyProductAdded('${product.productId}')">
						
							<a href="" class="btn btn-warning main-button-detail-primary" 
								ng-click="addProduct('${product.productId}')">
								<span class="glyphicon glyphicon-ok"></span>
								Add to Cart
							</a>
							
							<div ng-show="productAdded">
								<br><br>
								<p>
									This product has been added to your cart.
								</p>
								
								<p>
									You can 
									<a href="" class="btn btn-danger main-button-detail-optional" 
										ng-click="removeCartItem('${product.productId}')">
										<span class="glyphicon glyphicon-remove"></span>
										Remove Product
									</a>
									 or 
									<a href="<c:url value='/customer/cart'/>" 
											class="btn btn-warning main-button-detail-optional">
										<span class="glyphicon glyphicon-shopping-cart"></span>
										View Cart
									</a>
								</p>
							</div>
						</div>
					</sec:authorize>
					
   				</div>
   				
   			</div> <!-- end tag of row -->
    		
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		