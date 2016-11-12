<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container-wrapper">
    
    	<div class="container">
    	
    		<div class="page-header">
	    		<c:if test="${pageContext.request.userPrincipal.name != null}">
	  				<h1>Welcome, ${pageContext.request.userPrincipal.name}</h1>
	   				<form action='<c:url value="/logout"/>' method="post">
	   					<input type="submit" value="Logout"/>
	   					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	   				</form>
	    		</c:if>
    		</div>
    		
    		
    		<div class="row">
    			<div class="col-md-4">
	    			<h3>
		    			<a href='<spring:url value="/admin/product-inventory"/>'>Product Inventory</a>
		    		</h3>
		    		<p>Here you can view and modify the product inventory</p>
    			</div>
    			<div class="col-md-4">
	    			<h3>
		    			<a href='<spring:url value="#"/>'>Customer Management</a>
		    		</h3>
		    		<p>Manage all customers in an easy way</p>
    			</div>
    		</div>
    		

    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		