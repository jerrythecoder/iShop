<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container i-wd-50">
	
	<div class="page-header -text-center">
		<c:choose>
			<c:when test="${sessionScope.sessionNewRegister == true}">
				<p class="lead i-color-warn">
					<span class="glyphicon glyphicon-ok-circle"></span>
					Your i-Shop account has been successfully created with username:
				</p>
				<p class="lead text-center">
					<span class="i-font-18 i-font-bold"> ${username}</span>
				</p>
				<p class="lead i-color-warn">To activate your shopping cart, you will need to enter your profile information below:</p>
			</c:when>
			<c:otherwise>
				<p class="lead text-center">Please enter your profile information:</p>
			</c:otherwise>
		</c:choose>
	</div>
	

	<div class="jumbotron i-center-child i-login-jumbotron i-wd-75">
	
		<form:form action="${flowExecutionUrl}&_eventId=submit" modelAttribute="customer" method="post" 
				class="form-horizontal i-center-parent">
				
			<form:hidden path="customerId"/>
			
			<div class="row i-error-msg-wrapper">
				<div class="col-sm-8 col-sm-offset-4">
					<form:errors path="customerFirstName" class="i-error-msg-box"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">First Name: </label>
				<div class="col-sm-8">
					<form:input path="customerFirstName" class="form-control"/>
				</div>
			</div>
			
			<div class="row i-error-msg-wrapper">
				<div class="col-sm-8 col-sm-offset-4">
					<form:errors path="customerLastName" class="i-error-msg-box"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">Last Name: </label>
				<div class="col-sm-8">
					<form:input path="customerLastName" class="form-control"/>
				</div>
			</div>
			
			<div class="row i-error-msg-wrapper">
				<div class="col-sm-8 col-sm-offset-4">
					<form:errors path="customerEmail" class="i-error-msg-box"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">Email Address: </label>
				<div class="col-sm-8">
					<form:input path="customerEmail" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">Phone Number: </label>
				<div class="col-sm-8">
					<form:input path="customerPhone" class="form-control"/>
				</div>
			</div>
			
			<br>
			<div class="col-sm-12 i-center-child">
				<input type="submit" value="OK" class="btn btn-primary i-btn-md"/>
			</div>
			<br>
			
		</form:form>
	
	</div> <!-- jumbotron -->
</div> <!-- container -->

    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
