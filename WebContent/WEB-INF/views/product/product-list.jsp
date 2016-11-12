<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container">
    	
    		<div class="page-header">
    			<h1>All Products in Store:</h1>
    			<p class="lead">Checkout all the products available now!</p>
    		</div>
    		
  			<table class="table table-striped table-hover">
  			
				<thead>
					<tr class="bg-success">
						<th>Photo Thumb</th>
						<th>Product Name</th>
						<th>Category</th>
						<th>Description</th>
						<th>Condition</th>
						<th>Price</th>
						<th></th>
					</tr>
				</thead>
				
				<c:forEach var="product" items="${productList}">
					<tr>
						<td>
							<img src="${imagePath}/product_${product.productId}.png" alt="image" 
								class="img-responsive img-thumbnail">
						</td>
						<td>${product.productName}</td>
						<td>${product.productCategory}</td>
						<td>${product.productDescription}</td>
						<td>${product.productCondition}</td>
						<td>${product.productPrice}</td>
						<td>
							<a href='<spring:url value="/product/detail/${product.productId}"/>'>
								<span class="glyphicon glyphicon-info-sign"/>
							</a>
						</td>
					</tr>
				</c:forEach> 
			</table>
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		