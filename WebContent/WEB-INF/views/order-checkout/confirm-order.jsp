<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>


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
  		<div class="jumbotron i-wd-80 i-center-child">
  		
	  		<div class="row text-right i-flow-label-row">
	   			<div class="col-md-2 i-vertical-center">
	   				<span class="label label-primary i-flow-label">Your Items</span>
	   			</div>
	   			<div class="col-md-1 i-vertical-center">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-primary i-flow-label">Addresses</span>
	   			</div>
	   			<div class="col-md-1">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-warning i-flow-label">Confirm</span>
	   			</div>
	   			<div class="col-md-1">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-default i-flow-label">Ordered !</span>
	   			</div>
	   			<div class="col-md-1"></div>
	   		</div>
  		
  			<div class="panel panel-info">
				<table class="table table-hover text-left">
					<tr class="i-font-18 i-font-bold">
						<td>Ship To: ${customer.customerFirstName} ${customer.customerLastName}</td>
						<td></td>
					</tr>
					<tr>
						<td>
							E-mail: ${customer.customerEmail}
						</td>
						<td>
							Phone: ${customer.customerPhone}
						</td>
					</tr>
				</table>
			</div>
			
			<div class="panel panel-default">
				<table class="table table-hover text-left">
					<tr class="info">
						<th class="i-wd-10 text-center">ID</th>
						<th class="i-wd-10"></th>
						<th class="i-wd-30">Name</th>
						<th class="i-wd-15">Price</th>
						<th class="i-wd-20">Quantity</th>
						<th class="i-wd-15">Total</th>
					</tr>
					<c:forEach var="item" items="${cart.cartItems}">
						<tr>
							<td class="text-center">${item.product.productId}</td>
							<td>
								<img src="${imagePath}/product-images/product_${item.product.productId}.png" alt="image" 
									class="img-responsive img-thumbnail">
							</td>
							<td>${item.product.productName}</td>
							<td>${item.product.productPrice}</td>
							<td>${item.quantity}</td>
							<td>${moneySign} ${item.totalPrice}</td>
						</tr>
					</c:forEach>
					<tr class="i-font-bold">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Grand Total:</td>
						<td>${moneySign} ${cart.grandTotal}</td>
					</tr>
					<tr class="i-font-bold">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Applied Discount:</td>
						<td>${moneySign} 0.0</td>
					</tr>
					<tr class="i-font-18 i-font-bold">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Total Pay:</td>
						<td>${moneySign} ${cart.grandTotal}</td>
					</tr>
				</table>
			</div> <!-- end of panel -->
  			
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
			   					<td>
									<p class="i-font-14">${billingAddress.apartmentNumber} ${billingAddress.streetName}</p>
									<p class="i-font-14">${billingAddress.city}, ${billingAddress.state}</p>
									<p class="i-font-14">${billingAddress.country}</p>
									<p class="i-font-14">${billingAddress.zipCode}</p>
								</td>
							</tr>
						</table>
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
			   					<td>
									<p class="i-font-14">${shippingAddress.apartmentNumber} ${shippingAddress.streetName}</p>
									<p class="i-font-14">${shippingAddress.city}, ${shippingAddress.state}</p>
									<p class="i-font-14">${shippingAddress.country}</p>
									<p class="i-font-14">${shippingAddress.zipCode}</p>
								</td>
							</tr>
						</table>
					</div>
   				</div>
   				
   			</div> <!-- row -->
   			
  		</div> <!-- end of jumbotron -->
  			
  		<div class="row i-button-row i-wd-80 i-center-child">
			<div class="col-md-7"></div>
			<div class="col-md-2">
				<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-default i-btn-md">
					<span class="glyphicon glyphicon-chevron-left"></span>
					Back
				</a>
			</div>
			<div class="col-md-3">
				<a href="${flowExecutionUrl}&_eventId=confirm" class="btn btn-warning pull-right i-btn-lg">
					Confirm Order
				</a>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		