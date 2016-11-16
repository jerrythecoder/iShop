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
						<a href='<c:url value="${url}"/>' class="btn btn-default">Back</a>
						
						<a href="" class="btn btn-warning btn-large" 
							ng-click="addToCart('${product.productId}')">
							<span class="glyphicon glyphicon-shopping-cart"></span>
							Add to Cart
						</a>
						
						<a href="<c:url value='/customer/cart'/>" class="btn btn-default">
							<span class="glyphicon glyphicon-hand-right"></span>
							View My Cart
						</a>
					</div>
					
   				</div>
   				
   			</div> <!-- end tag of row -->
    		
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		