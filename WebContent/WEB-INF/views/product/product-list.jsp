<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header main-content-header-product">
	   		<div class="row">
		   		<div class="col-md-9">
		   			<div class="main-content-header-title">
		   				<h2 class="header-msg-default">
		   					<span class="glyphicon glyphicon-list-alt"></span>
		   					All Products in Shop
		   				</h2>
		   			</div>
		   			<p class="lead">Don't miss out on our latest electronic selections!</p>
		   		</div>
		   		<div class="col-md-3">
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
						<div class="main-func-button-wrapper">
							<a href="<spring:url value='/customer/cart'/>" ng-init="refreshCart()" 
									class="btn btn-warning">
								<span class="badge">{{cart.totalQuantity}}</span>
								<span class="glyphicon glyphicon-shopping-cart"></span>
								My Cart
							</a>
						</div>
					</sec:authorize>
		   		</div>
		   	</div>
   		</div>
   		
   		<div class="main-content-body">
	   		<div class="panel panel-default">
				<table class="table table-hover table-striped">
					<thead>
						<tr class="success">
							<th class="main-cell-15"></th>
							<th class="main-cell-35">Product Name</th>
							<th class="main-cell-10">Category</th>
							<th class="main-cell-10">Condition</th>
							<th class="main-cell-10">Status</th>
							<th class="main-cell-10">Price</th>
							<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
							<th class="main-cell-sm"></th>
							</sec:authorize>
						</tr>
					</thead>
					
					<c:forEach var="product" items="${productList}">
						<tr>					
							<td>
								<a href='<spring:url value="/product/detail/${product.productId}"/>'>
									<img src="${imagePath}/product_${product.productId}.png" alt="image" 
											class="img-responsive img-thumbnail">
								</a>
							</td>
							<td>
								<a href='<spring:url value="/product/detail/${product.productId}"/>'>
									<span class="main-font-18">
										${product.productName}
									</span>
								</a>
							</td>
							<td>${product.productCategory}</td>
							<td>${product.productCondition}</td>
							<td>${product.productStatus}</td>
							<td>$ ${product.productPrice}</td>
							<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
								<td>
									<a href="" class="btn btn-warning btn-sm" 
										ng-click="addProduct('${product.productId}')">
										<span class="glyphicon glyphicon-shopping-cart"></span>
										Add
									</a>
								</td>	
							</sec:authorize>
						</tr>
					</c:forEach> 
				</table>
			</div> <!-- end of table wrapper panel -->
			
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		