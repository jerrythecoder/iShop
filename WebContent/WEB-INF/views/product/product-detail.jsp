<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div id="snackbar" ng-init="verifyCartExists()">
	<div ng-show="cartExists">
		<span class="glyphicon glyphicon-shopping-cart"></span>
		Item added to cart<br>
		Total: ${moneySign}{{cart.grandTotal}}
	</div>
	<div ng-hide="cartExists">
		Shopping cart not activated
	</div>
</div>

<div id="snackbar-remove-item" ng-init="verifyCartExists()">
	<div ng-show="cartExists">
		<span class="glyphicon glyphicon-shopping-cart"></span>
		Item removed from cart<br>
		Total: ${moneySign}{{cart.grandTotal}}
	</div>
	<div ng-hide="cartExists">
		Shopping cart not activated
	</div>
</div>


<div class="container">
	<div class="i-wd-80 i-center-child">
		
		<div class="page-header">
			<div class="row">
				<div class="col-md-8">
					<h2>${product.productName}</h2>
				</div>
				<div class="col-md-4">
					<div class="text-right">
	   					<sec:authorize access="hasRole('ROLE_ADMIN')">
							<c:set var="productListUrl" 
	  									value="${pageContext.request.contextPath}/admin/product-inventory"/>
						</sec:authorize>
						<sec:authorize access="not hasRole('ROLE_ADMIN')">
							<c:set var="productListUrl" 
	  									value="${pageContext.request.contextPath}/product/list"/>
						</sec:authorize>
	  					
	   					<a href="${productListUrl}" class="btn btn-default" style="margin-top: 25px;">
							<span class="glyphicon glyphicon-chevron-left"></span>
							Back to List
						</a>
	    			</div>
					
				</div>
			</div>
		</div>
		
		<div class="-page-header i-top-elem">
			<div class="row">
				<div class="col-md-6 -col-md-offset-1">
					<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
						class="img-responsive img-rounded" style="width:100%; height:auto"/>
				</div>
				
				<div class="col-md-6 -col-md-offset-1">
					
					<p><span class="i-font-bold">Product ID: </span>${product.productId}</p>
					<p><span class="i-font-bold">Category: </span>${product.productCategory}</p>
					<p><span class="i-font-bold">Condition: </span>${product.productCondition}</p>
					<p><span class="i-font-bold">Manufacturer: </span>${product.productManufacturer}</p>
					<p><span class="i-font-bold">Status: </span>${product.productStatus}</p>
						
					<br><br>
					
					
					<div class="text-center">
						<p class="lead">
							Price: <span class="i-font-bold">${moneySign} ${product.productPrice}</span>
						</p>
						
						<sec:authorize access="!isAuthenticated()">
							<a href='<c:url value="/login" />' class="btn btn-warning i-btn-lg">
								Sign In to Buy
							</a>
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
		  					<div ng-init="verifyProductAdded('${product.productId}')">
							
								<a href="" class="btn btn-warning i-btn-lg" ng-hide="productAdded" 
									onclick="showToastBar('add-btn-${product.productId}');" 
									ng-click="addProduct('${product.productId}')">
									<span class="glyphicon glyphicon-ok"></span>
									Add to Cart
								</a>
								<a href="" class="btn btn-warning i-btn-lg" ng-show="productAdded" 
									onclick="showToastBar('add-btn-${product.productId}');" 
									ng-click="addProduct('${product.productId}')">
									<span class="glyphicon glyphicon-plus"></span>
									Add One More
								</a>
								
								<div ng-show="productAdded">
									<br><br>
									<p>
										<span class="glyphicon glyphicon-ok-sign"></span>
										This product has been added to your cart.
									</p>
									
									<p>
										You can 
										<a href="" class="btn btn-danger btn-sm" style="margin-left: 5px; margin-right: 5px;" 
											onclick="showToastBarRemoveItem('add-btn-${product.productId}');" 
											ng-click="removeCartItem('${product.productId}')">
											<span class="glyphicon glyphicon-remove"></span>
											Remove
										</a>
										 or 
										<a href="<c:url value='/customer/cart'/>" style="margin-left: 5px; margin-right: 5px;" 
												class="btn btn-warning btn-sm">
											<span class="glyphicon glyphicon-shopping-cart"></span>
											View Cart
										</a>
									</p>
								</div>
							</div>
						</sec:authorize>
					</div> <!-- text center end -->	
					
				</div>
			</div> <!-- row 1 -->
		</div>
		
		<div class="page-header"></div>
		
		<div class="page-header -i-top-elem">
			<div class="row">
				<div class="col-md-10 -col-md-offset-1">
					<p class="lead">${product.productDescription}</p>
				</div>
			</div> <!-- row 2 -->
		</div>
		
		<a href="${productListUrl}" class="btn btn-default pull-right" style="margin-top: 25px;">
			<span class="glyphicon glyphicon-chevron-left"></span>
			Back to List
		</a>
		
	</div>
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		