<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					Billing Address Form
   				</h2>
   			</div>
   			<p class="lead">Please enter your billing address information:</p>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent">
			<div class="jumbotron main-wd-80 main-align-center-child">
				<form:form action="${flowExecutionUrl}&_eventId=submit" modelAttribute="billingAddress" method="POST">
					<form:hidden path="addressId"/>
					
					<div class="form-group">
						<label>Apartment Number:</label>
						<form:input path="apartmentNumber" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Street Name:</label>
						<form:input path="streetName" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>City: </label>
						<form:input path="city" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>State/Province: </label>
						<form:input path="state" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Country: </label>
						<form:input path="country" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>ZIP Code: </label>
						<form:input path="zipCode" class="form-control"/>
					</div>
					
					<a href="${flowExecutionUrl}&_eventId=cancel" class="btn btn-default">
						Cancel
					</a>
					
					<input type="submit" value="Submit" class="btn btn-primary">
					
				</form:form>
			</div>
		</div>
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		