<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header main-content-header-checkout">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-check"></span>
   					Order Checkout
   				</h2>
   			</div>
	   		<div class="row" ng-show="${orderActive && orderValid}">
	   			<div class="col-md-1"></div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-done">
	   					View Product
	   				</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-active">Verify Address</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-undone">Confirm Order</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-undone">Ordered !</p>
	   			</div>
	   			<div class="col-md-1"></div>
	   		</div>
   			
   		</div> <!-- end of header -->
   		
   		<%@ include file="/WEB-INF/views/templates/checkout-flow-validation-block.jsp" %>
	   	
   		<div class="main-content-body main-align-center-parent" ng-show="${orderActive && orderValid}">
   			<div class="panel panel-default">
   			
	   			<div class="jumbotron main-wd-80 main-align-center-child">
		   			<div class="row">
		   				<div class="col-md-6">
			   				<p>Billing Address</p>
			   				<br>
			   				<div class="main-align-left-parent main-flow-address-container main-bg-color-1">
								<div>${billingAddress.apartmentNumber} ${billingAddress.streetName}</div>
								<div>${billingAddress.city}, ${billingAddress.state}</div>
								<div>${billingAddress.country}</div>
								<div>${billingAddress.zipCode}</div>
							</div>
		   				</div>
		   				
		   				<div class="col-md-6">
			   				<p>Shipping Address</p>
			   				<br>
			   				<div class="main-align-left-parent main-flow-address-container main-bg-color-1">
								<div>${shippingAddress.apartmentNumber} ${shippingAddress.streetName}</div>
								<div>${shippingAddress.city}, ${shippingAddress.state}</div>
								<div>${shippingAddress.country}</div>
								<div>${shippingAddress.zipCode}</div>
							</div>
		   				</div>
		   			</div> <!-- end of row 1 -->
		   			
		   			<div class="row main-align-center-parent main-flow-action-button-row-inner">
		  				<a href="${flowExecutionUrl}&_eventId=edit" 
		  						class="btn btn-primary main-align-center-child">
							
							Edit Billing/Shipping Addresses
						</a>
		   			</div> <!-- end of row 2 -->
	   			</div> <!-- end of jumbotron -->
	   			
	   			<div class="row main-flow-action-button-row">
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-warning main-button-md">
							<span class="glyphicon glyphicon-chevron-left"></span>
							Back
						</a>
					</div>
					<div class="col-md-3">
						<a href="${flowExecutionUrl}&_eventId=next" class="btn btn-warning main-button-md">
							Next
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
					<div class="col-md-3"></div>
				</div> <!-- end of row 3 -->
			</div> <!-- end of panel -->
		</div>
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		