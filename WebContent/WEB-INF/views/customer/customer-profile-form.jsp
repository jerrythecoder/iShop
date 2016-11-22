<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container main-content-container">
    
    	<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					Customer Profile Form
   				</h2>
   			</div>
   			<p class="lead">Please enter your information:</p>
   		</div>
    	
		<div class="main-content-body">
		
			<!-- ------ use when CSRF enabled -----------
			<form:form action="product-form-submit?${_csrf.parameterName}=${_csrf.token}" 
					modelAttribute="product" enctype="multipart/form-data">
			</form:form>
			-->
			
			<form:form action="${flowExecutionUrl}&_eventId=submit" modelAttribute="customer" method="post">
				
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
				
			</form:form>
		</div>
	
	</div> <!-- end tag of main content container -->
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
