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
    			<h1>Customer Form</h1>
    			<p class="lead">Please enter your information:</p>
    			
    			<!-- ------ use when CSRF enabled -----------
				<form:form action="product-form-submit?${_csrf.parameterName}=${_csrf.token}" 
						modelAttribute="product" enctype="multipart/form-data">
				</form:form>
				-->
				 
				<form:form action="${pageContext.request.contextPath}/customer/info-form/submit" 
						modelAttribute="customer" method="post">
					
					<form:hidden path="customerId"/>
					
					<div class="form-group">
						<label>First Name: </label>
						<form:errors path="customerFirstName" cssStyle="color: #ff0000;"/>
						<form:input path="customerFirstName" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Last Name: </label>
						<form:errors path="customerLastName" cssStyle="color: #ff0000;"/>
						<form:input path="customerLastName" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Email Address: </label>
						<form:errors path="customerEmail" cssStyle="color: #ff0000;"/>
						<form:input path="customerEmail" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Phone Number: </label>
						<form:input path="customerPhone" class="form-control"/>
					</div>
					
					<br>
					
					<input type="submit" value="Submit" class="btn btn-primary"/>
					<a href='<spring:url value="/home"/>' class="btn btn-primary">Cancel</a>
					
				</form:form>
    		
    		</div>
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		