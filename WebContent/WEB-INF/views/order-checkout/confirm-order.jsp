<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					Please verify and confirm your order
   				</h2>
   			</div>
   			<p class="lead">Below is the details of your order:</p>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-hide="${orderActive}">
			<p>The check-out session you're accessing has expired.</p>
		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-show="${orderActive}">
   			<div ng-hide="${orderValid}">
   				<p>The content of the order is invalid.</p>
   			</div>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-hide="${orderActive && orderValid}">
			<div class="row main-flow-action-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToShopping" class="btn btn-primary main-button-md">
						Keep Shopping
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToOrderList" class="btn btn-primary main-button-md">
						View My Order List
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-show="${orderActive && orderValid}">
			<div class="jumbotron main-wd-80 main-align-center-child">
				
				<div class="main-align-left-parent">
					<p>Ship To: ${customer.customerFirstName} ${customer.customerLastName}</p>
					<p>Email Address: ${customer.customerEmail}</p>
					<p>Phone Number: ${customer.customerPhone}</p>
				</div>
				
				<table class="table table-condensed">
					<tr>
						<th>Product ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
					<c:forEach var="item" items="${cart.cartItems}">
						<tr class="">
							<td>${item.product.productId}</td>
							<td>${item.product.productName}</td>
							<td>${item.product.productPrice}</td>
							<td>${item.quantity}</td>
							<td>$${item.totalPrice}</td>
						</tr>
					</c:forEach>
					<tr class="">
						<td></td>
						<td></td>
						<td></td>
						<th>Product Grand Total:</th>
						<th>$${cart.grandTotal}</th>
					</tr>
					<tr class="">
						<td></td>
						<td></td>
						<td></td>
						<th>Applied Discount:</th>
						<th>$0.0</th>
					</tr>
					<tr class="info main-row-font-lg">
						<td></td>
						<td></td>
						<td></td>
						<th>Total Pay:</th>
						<th>$${cart.grandTotal}</th>
					</tr>
				</table>
				
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
				
			</div>
			
			<div class="row main-flow-action-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-primary main-button-md">
						<span class="glyphicon glyphicon-chevron-left"></span>
						Back
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=confirm" class="btn btn-primary main-button-md">
						Confirm Order
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		