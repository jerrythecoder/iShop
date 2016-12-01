<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>

<!-- Modal Dialog -->
<%@ include file="/WEB-INF/views/templates/checkout-flow-cancel-dialog.jsp" %>


<div class="container">
	
	<div class="page-header">
		<div class="main-content-header-title">
			<h2 class="header-msg-default">
				<span class="glyphicon glyphicon-check"></span>
				Customer Checkout
			</h2>
		</div>
	</div>   
   		
   		
   	<%@ include file="/WEB-INF/views/templates/checkout-flow-validation-block.jsp" %>
	   	
	   	
 	<div class="i-center-parent" ng-show="${orderActive && orderValid}">
  		<div class="jumbotron i-wd-80 i-center-child i-flow-jumbotron">
  			
  			<div class="row text-center i-flow-label-row">
	   			<div class="col-md-4">
	   				<div class="i-flow-label">1. Your Items</div>
	   			</div>
	   			<div class="col-md-4">
	   				<div class="i-flow-label i-flow-label-active">2. Billing/shipping Address</div>
	   			</div>
	   			<div class="col-md-4">
	   				<div class="i-flow-label">3. Confirm Order</div>
	   			</div>
	   		</div>
  			
  			<!-- variables for AngularJS -->
			<c:choose>
				<c:when test="${billingAddress == null}">
					<c:set var="billingAddressExist" value="false"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="billingAddressExist" value="true"></c:set>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${shippingAddress == null}">
					<c:set var="shippingAddressExist" value="false"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="shippingAddressExist" value="true"></c:set>
				</c:otherwise>
			</c:choose>
  			
  			
   			<div class="row">
   			
   				<div class="col-md-6">	
					<div class="panel panel-default">
						<table class="table table-hover text-left">
		   					<tr class="info i-font-16 text-center">
			   					<td>
		   							<span class="glyphicon glyphicon-credit-card"></span>
		   							Billing Address
			   					</td>
		   					</tr>
		   					<tr>
			   					<td ng-hide="${billingAddressExist} === false">
									<p class="i-font-14">${billingAddress.apartmentNumber} ${billingAddress.streetName}</p>
									<p class="i-font-14">${billingAddress.city}, ${billingAddress.state}</p>
									<p class="i-font-14">${billingAddress.country}</p>
									<p class="i-font-14">${billingAddress.zipCode}</p>
								</td>
								<td ng-show="${billingAddressExist} === false">
									<p class="i-font-14">No billing address.</p>
								</td>
							</tr>
						</table>
						<div class="i-panel-button-row">
							<a href="${flowExecutionUrl}&_eventId=editBillingAddress" class="btn btn-default btn-sm i-btn-sm"
									ng-hide="${billingAddressExist} === false">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a href="${flowExecutionUrl}&_eventId=editBillingAddress" class="btn btn-default btn-sm i-btn-sm"
									ng-show="${billingAddressExist} === false">
								<span class="glyphicon glyphicon-pencil"></span>
								Add
							</a>
						</div>
					</div>
   				</div>
   				
   				<div class="col-md-6">
					<div class="panel panel-default">
						<table class="table table-hover text-left">
		   					<tr class="info i-font-16 text-center">
			   					<td>
		   							<span class="glyphicon glyphicon-plane"></span>
	   								Shipping Address
			   					</td>
		   					</tr>
		   					<tr>
			   					<td ng-hide="${shippingAddressExist} === false">
									<p class="i-font-14">${shippingAddress.apartmentNumber} ${shippingAddress.streetName}</p>
									<p class="i-font-14">${shippingAddress.city}, ${shippingAddress.state}</p>
									<p class="i-font-14">${shippingAddress.country}</p>
									<p class="i-font-14">${shippingAddress.zipCode}</p>
								</td>
								<td ng-show="${shippingAddressExist} === false">
									<p class="i-font-14">No shipping address.</p>
								</td>
							</tr>
						</table>
						<div class="i-panel-button-row">
							<a href="${flowExecutionUrl}&_eventId=editShippingAddress" class="btn btn-default btn-sm i-btn-sm"
									ng-hide="${shippingAddressExist} === false">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a href="${flowExecutionUrl}&_eventId=editShippingAddress" class="btn btn-default btn-sm i-btn-sm"
									ng-show="${shippingAddressExist} === false">
								<span class="glyphicon glyphicon-pencil"></span>
								Add
							</a>
						</div>
					</div>
   				</div>
   				
   			</div> <!-- row -->
  		</div> <!-- end of jumbotron -->
  			
  		<div class="row i-button-row i-wd-80 i-center-child">
			<div class="col-md-8">
				<button class="btn btn-default pull-left i-btn-md" data-toggle="modal" data-target="#cancelCheckout">
					Cancel
				</button>
			</div>
			<div class="col-md-2">
				<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-default pull-right i-btn-md">
					<span class="glyphicon glyphicon-chevron-left"></span>
					Back
				</a>
			</div>
			<div class="col-md-2">
				<button onclick="location.href='${flowExecutionUrl}&_eventId=next'" class="btn btn-warning pull-right i-btn-md" 
						ng-disabled="${shippingAddressExist} === false || ${billingAddressExist} === false">
					Next
					<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		