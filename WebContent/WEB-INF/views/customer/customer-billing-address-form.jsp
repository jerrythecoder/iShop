<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<!-- Modal Dialog -->
<div class="modal fade" id="cancelAddressEdit" tabindex="-1" role="dialog" aria-labelledby="cancelAddressEdit">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content i-modal-content">
			<div class="modal-body i-modal-body">
				Billing / Shipping addresses will be required for checkout. Sure to skip?
			</div>
			<div class="modal-footer i-center-parent">
				<button type="button" class="btn btn-default i-btn-xsm" data-dismiss="modal">No</button>
				<a type="button" class="btn btn-primary i-btn-xsm" href="${flowExecutionUrl}&_eventId=cancel">
					Yes
				</a>
			</div>
		</div>
	</div>
</div>


<div class="container i-wd-50">

	<div class="page-header -text-center">
		<c:choose>
			<c:when test="${sessionScope.sessionNewRegister == true}">
				<p class="lead i-color-warn">
					<span class="glyphicon glyphicon-ok-circle"></span>
					Now you have your shopping cart activated!<br><br>
					However, your billing / shipping addresses will be required during cart item checkout. 
					You can provide them either now or later.
				</p>
				<p class="lead text-center">
					<span class="i-font-18 i-font-bold"> ${username}</span>
				</p>
				<br>
			</c:when>
		</c:choose>
		
		<p class="lead text-center">Please enter your <span class="i-font-bold">billing address</span>:</p>
	</div>

	<div class="jumbotron i-center-child i-login-jumbotron i-wd-75">
	
		<form:form action="${flowExecutionUrl}&_eventId=submit" modelAttribute="billingAddress" method="POST"
				class="form-horizontal">
			
			<form:hidden path="addressId"/>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">Apt. number:</label>
				<div class="col-sm-8">
					<form:input path="apartmentNumber" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">Street Name:</label>
				<div class="col-sm-8">
					<form:input path="streetName" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">City: </label>
				<div class="col-sm-8">
					<form:input path="city" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">Province / State: </label>
				<div class="col-sm-8">
					<form:input path="state" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">Country: </label>
				<div class="col-sm-8">
					<form:select path="country" class="form-control">
					    <option>Canada</option>
					    <option>United States</option>
					    <option>Mexico</option>
					</form:select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">ZIP Code: </label>
				<div class="col-sm-8">
					<form:input path="zipCode" class="form-control"/>
				</div>
			</div>
			
			<br>
			<div class="col-sm-6">
				<a class="btn btn-default i-btn-xsm" data-toggle="modal" data-target="#cancelAddressEdit">
					Skip
				</a>
			</div>
			<div class="col-sm-6">
				<input type="submit" value="OK" class="btn btn-primary i-btn-md pull-right"/>
			</div>
			<br>
			
		</form:form>
	
	</div> <!-- jumbotron -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		