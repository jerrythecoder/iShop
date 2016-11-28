<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">
	<div class="page-header">
		<h2 class="-i-font-black">
			<img alt="devices" src="${ctx}/resources/images/product-title-image.png" width="50" height="50">
			All Products in Shop
		</h2>
		<p class="lead">Don't miss out on our latest electronic selections!</p>
	</div>
  		
	<div class="panel panel-default">
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
</div>
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		