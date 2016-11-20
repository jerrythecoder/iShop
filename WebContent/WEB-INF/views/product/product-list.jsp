<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@include file="/WEB-INF/views/templates/func-bar.jsp" %>
	
	
	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					All Products in Shop
   				</h2>
   			</div>
   			<p class="lead">Don't miss out on our latest electronic selections!</p>
   		</div>
   		
   		<div class="main-content-body">
			<table class="table table-striped table-hover">
				
				<thead>
					<tr class="bg-success">
						<th class="main-cell-md">Photo Thumb</th>
						<th class="main-cell-lg">Product Name</th>
						<th class="main-cell-sm">Category</th>
						<th class="main-cell-sm">Condition</th>
						<th class="main-cell-sm">Status</th>
						<th class="main-cell-sm">Price</th>
						<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
						<th class="main-cell-sm"></th>
						</sec:authorize>
					</tr>
				</thead>
				
				<c:forEach var="product" items="${productList}">
					<tr>					
						<td class="main-cell-sm">
							<img src="${imagePath}/product_${product.productId}.png" alt="image" 
							class="img-responsive img-thumbnail">
						</td>
						<td class="main-cell-lg">
							<a href='<spring:url value="/product/detail/${product.productId}"/>'>
								<span class="main-cell-font-bg">
									${product.productName}
								</span>
							</a>
						</td>
						<td class="main-cell-sm">${product.productCategory}</td>
						<td class="main-cell-sm">${product.productCondition}</td>
						<td class="main-cell-sm">${product.productStatus}</td>
						<td class="main-cell-sm">$${product.productPrice}</td>
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
		</div>
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		