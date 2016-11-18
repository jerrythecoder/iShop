<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>

<c:set var="productImagePath" 
	value="${pageContext.request.contextPath}/resources/images/product-images/product_${product.productId}.png">
</c:set>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container">
    	
    		<div class="page-header">
    			<h1>Product Form</h1>
    			<p class="lead">Enter product information below:</p>
    			
    			<!-- ------ use when CSRF enabled -----------
				<form:form action="product-form-submit?${_csrf.parameterName}=${_csrf.token}" 
						modelAttribute="product" enctype="multipart/form-data">
				</form:form>
				-->
				 
				<form:form action="submit" modelAttribute="product" enctype="multipart/form-data" method="post">
					
					<form:hidden path="productId"/>
					
					<div class="form-group">
						<label>Name: </label>
						<form:errors path="productName" cssStyle="color: #ff0000;"/>
						<form:input path="productName" class="form-control"/>
					</div>
					
					<div class="form-group row">
						<div class="col-md-2">
							<img alt="image" src="${productImagePath}" class="img-responsive img-thumbnail">
						</div>
						<div class="col-md-10">
							<div class="form-group">
								<label class="control-label">Upload a product image:</label>
								<form:input type="file" path="productImage" />
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label>Category: </label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCategory" value="iPad"/>
							iPad
						</label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCategory" value="Apple Mac"/>
							Apple Mac
						</label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCategory" value="Apple Watch"/>
							Apple Watch
						</label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCategory" value="Accessory"/>
							Accessory
						</label>
					</div>
					
					<div class="form-group">
						<label>Description: </label>
						<form:textarea path="productDescription" class="form-control" rows="5"/>
					</div>
					
					<div class="form-group">
						<label>Price: </label>
						<form:errors path="productPrice" cssStyle="color: #ff0000;"/>
						<form:input path="productPrice" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Condition: </label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCondition" value="New"/>
							New
						</label>
						<label class="checkbox-inline">
							<form:radiobutton path="productCondition" value="Used"/>
							Used
						</label>
					</div>
					
					<div class="form-group">
						<label>Status: </label>
						<label class="checkbox-inline">
							<form:radiobutton path="productStatus" value="In Stock"/>
							In Stock
						</label>
						<label class="checkbox-inline">
							<form:radiobutton path="productStatus" value="Not Available"/>
							Not Available
						</label>
					</div>
					
					<div class="form-group">
						<label>Unit in Stock: </label>
						<form:errors path="unitInStock" cssStyle="color: #ff0000;"/>
						<form:input path="unitInStock" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Manufacturer: </label>
						<form:input path="productManufacturer" class="form-control"/>
					</div>
					
					<br>
					
					<input type="submit" value="Submit" class="btn btn-primary"/>
					<a href='<spring:url value="/admin/product-inventory"/>' class="btn btn-primary">Cancel</a>
					
				</form:form>
    		
    		</div>
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		