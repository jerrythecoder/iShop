<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>

<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"></c:set>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container">
    	
    		<div class="page-header">
    			<h1>All Products in Store</h1>
    			<p class="lead">Manage the inventory:</p>
    			
    			<p>
	    			<a href='<spring:url value="/admin/product-form-add"/>' class="btn btn-primary">
	    				Add a New Product
	    			</a>
    			</p>
    		</div>
    			
   			<table class="table table-striped table-hover">
				<thead>
					<tr class="bg-success">
						<th>Product ID</th>
						<th>Photo Thumb</th>
						<th>Product Name</th>
						<th>Category</th>
						
						<th>Description</th>
						<th>Price</th>
						<th>Condition</th>
						<th>Status</th>
						
						<th>Unit in Stock</th>
						<th>Manufacturer</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<c:forEach var="product" items="${productList}">
					
					<tr>
						<td>
							<img src="${imagePath}/product_${product.productId}.png" alt="image" 
								class="img-responsive img-thumbnail">
						</td>
						<td>${product.productId}</td>
						<td>${product.productName}</td>
						<td>${product.productCategory}</td>
						
						<td>${product.productDescription}</td>
						<td>${product.productPrice}</td>
						<td>${product.productCondition}</td>
						<td>${product.productStatus}</td>
						
						<td>${product.unitInStock}</td>
						<td>${product.productManufacturer}</td>
						<td>
							<a href='<spring:url value="/product/detail/${product.productId}"/>'>
								<span class="glyphicon glyphicon-info-sign"/>
							</a>
						</td>
						<td>
							<a href='<spring:url value="/admin/product-form-update/${product.productId}"/>'>
								<span class="glyphicon glyphicon-pencil"/>
							</a>
						</td>
						<td>
							<a href='<spring:url value="/admin/product-delete/${product.productId}"/>'>
								<span class="glyphicon glyphicon-remove"/>
							</a>
						</td>
					</tr>
					
				</c:forEach>
					 
			</table>
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		