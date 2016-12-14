<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>

<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
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
</sec:authorize>

<div class="container">
	<div class="i-wd-80 i-center-child">
		
		<div class="page-header i-top-elem">
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
							<c:choose>
								<c:when test="${onSearch == true}">
	  								<c:url var="onSearchUrl" value='/product/list/search/${backLinkPageNumber}'>
										<c:param name="keyword" value="${keyword}"></c:param>
									</c:url>
									<c:set var="productListUrl" value="${onSearchUrl}"/>
								</c:when>
								<c:when test="${backToHome == true}">
									<c:set var="productListUrl" value="${pageContext.request.contextPath}/"/>
								</c:when>
								<c:otherwise>
									<c:set var="productListUrl" 
	  									value="${pageContext.request.contextPath}/product/list/page/${backLinkPageNumber}"/>
								</c:otherwise>
							</c:choose>
						</sec:authorize>
	  					
	   					<a href="${productListUrl}" class="btn btn-link" style="margin-top: 25px;">
							<span class="glyphicon glyphicon-chevron-left"></span>
							Back to List
						</a>
	    			</div>
					
				</div>
			</div>
		</div>
		
		<div class="page-header" style="margin-top: 0px !important;">
			<div class="row">
				<div class="col-md-7">
				<!-- 
					<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
						class="img-responsive img-rounded" style="max-width:100%; height:480px;"/>
					 -->	

						<div class="-thumbnail text-center i-thumbnail" style="width: 520px;">
							<div class="i-img-wrapper" style="height: 400px;">
									<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
											class="img-responsive img-thumbnail i-img">
							</div>
						</div>

				</div>
				
				<div class="col-md-5 -col-md-offset-1">
					
					<p><span class="i-font-bold">Product ID: </span>${product.productId}</p>
					<p><span class="i-font-bold">Category: </span>${product.productCategory}</p>
					<p><span class="i-font-bold">Condition: </span>${product.productCondition}</p>
					<p><span class="i-font-bold">Manufacturer: </span>${product.productManufacturer}</p>
					<p><span class="i-font-bold">Status: </span>${product.productStatus}</p>
						
					<div class="page-header i-top-elem"></div>
					
					<div class="text-center">
						<p class="lead">
							Price: <span class="i-font-bold">${moneySign} ${product.productPrice}</span>
						</p>
						
						<sec:authorize access="not isAuthenticated()">
							<c:url var="redirectingProductLink" value="/customer/product/detail/${product.productId}">
								<c:param name="backLinkPageNumber" value="${backLinkPageNumber}"></c:param>
							</c:url>
						
							<a href="${redirectingProductLink}" class="btn btn-warning i-btn-lg">
								Sign In to Buy
							</a>
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
							<a href='<c:url value="/admin/product-form-update/${product.productId}"/>' 
									class="btn btn-primary i-btn-lg">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit Product
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
									Add 1 More
								</a>
								
								<div ng-show="productAdded">
									<br><br>
									<p class="i-font-16">
										<span class="glyphicon glyphicon-ok i-color-warn"></span>
										This product is already in your cart.
									</p>
									
									<p class="i-font-16">
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
		
		
		<div class="page-header i-top-elem">
			<div class="row">
				<div class="col-md-12 -col-md-offset-1">
					<p class="lead">${product.productDescription}</p>
				</div>
			</div> <!-- row 2 -->
		</div>
		
		<a href="${productListUrl}" class="btn btn-link pull-right" style="margin-top: 25px;">
			<span class="glyphicon glyphicon-chevron-left"></span>
			Back to List
		</a>
		
	</div>
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		