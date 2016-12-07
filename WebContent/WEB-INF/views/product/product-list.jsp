<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
</sec:authorize>

<div class="container">
	
	<div class="page-header i-top-elem" style="margin-top: 10px !important;">
		<div class="row">
			<div class="col-md-8">
				<h2>
					<img alt="devices" src="${ctx}/resources/images/product-title-image.png" width="40" height="40">
					All Products in Shop
				</h2>
				<p class="lead">Don't miss out on our latest electronic selections!</p>
			</div>
			<div class="col-md-4 text-right">
				<sec:authorize access="not isAuthenticated()">
					<a href="<c:url value='/customer/product/list'/>" class="btn btn-warning i-btn-lg" style="margin-top: 25px;">
						Sign In to Buy
					</a>
				</sec:authorize>
			</div>
		</div>
	</div>
  		
	<div class="panel panel-warning">
		<table class="table table-hover">
			<thead>
				<tr class="active">
					<th class="i-wd-15"></th>
					<th class="i-wd-35">Product Name</th>
					<th class="i-wd-10">Category</th>
					<th class="i-wd-10">Condition</th>
					<th class="i-wd-10">Status</th>
					<th class="i-wd-10">Price</th>
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
					<th class="i-wd-10"></th>
					</sec:authorize>
				</tr>
			</thead>
			
			<c:forEach var="product" items="${productList}">
				<tr>					
					<td>
						<a href='<spring:url value="/product/detail/${product.productId}"/>'>
							<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
									class="img-responsive img-thumbnail">
						</a>
					</td>
					<td>
						<a href='<spring:url value="/product/detail/${product.productId}"/>'>
							<span class="i-font-16">
								${product.productName}
							</span>
						</a>
					</td>
					<td>${product.productCategory}</td>
					<td>${product.productCondition}</td>
					<td>${product.productStatus}</td>
					<td>${moneySign} ${product.productPrice}</td>
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
						<td>
							<button id="add-btn-${product.productId}" class="btn btn-warning btn-sm" onclick="showToastBar('add-btn-${product.productId}');"
									ng-click="addProduct('${product.productId}'); ">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								Add
							</button>
						</td>	
					</sec:authorize>
				</tr>
			</c:forEach> 
		</table>
	</div> <!-- end of table wrapper panel -->
	
	<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
		<div class="row i-button-row i-center-child">
			<div class="col-md-12">
				<a href='<c:url value="/customer/cart"/>' class="btn btn-warning i-btn-lg pull-right">
					<span class="badge" ng-hide="isNaN(cart.totalQuantity)">{{cart.totalQuantity}}</span>
					<span class="glyphicon glyphicon-shopping-cart"></span>
					My Cart
				</a>
			</div>
		</div> <!-- row -->
	</sec:authorize>
	<sec:authorize access="not isAuthenticated()">
		<a href="<c:url value='/customer/product/list'/>" class="btn btn-warning i-btn-lg pull-right" 
				style="margin-top: 25px;">
			Sign In to Buy
		</a>
	</sec:authorize>
</div>
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		