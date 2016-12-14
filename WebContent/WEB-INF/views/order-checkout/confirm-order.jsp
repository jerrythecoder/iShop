<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>

<!-- Modal Dialog -->
<%@ include file="/WEB-INF/views/templates/checkout-flow-cancel-dialog.jsp" %>


<div class="container i-wd-70">

	<div class="page-header i-top-elem">
		<div class="main-content-header-title">
			<h2 class="header-msg-default">
				<span class="glyphicon glyphicon-check"></span>
				Customer Checkout
			</h2>
		</div>
	</div>   
   		
   		
   	<%@ include file="/WEB-INF/views/templates/checkout-flow-validation-block.jsp" %>
	

	<div class="i-center-parent" ng-show="${orderActive && orderValid}">
	
		<div class="row text-center i-flow-label-row">
			<div class="col-md-4">
				<div class="i-flow-label">1. View Your Items</div>
			</div>
			<div class="col-md-4">
				<div class="i-flow-label">2. Verify Billing/shipping Address</div>
			</div>
			<div class="col-md-4">
				<div class="i-flow-label i-flow-label-active">3. Confirm Order</div>
			</div>
		</div>
	
  		<div class="jumbotron i-center-child i-flow-jumbotron">
  			<div class="panel panel-info">
				<table class="table table-hover text-left">
					<tr class="i-font-18 i-font-bold">
						<td>Deliver To: ${customer.customerFirstName} ${customer.customerLastName}</td>
						<td></td>
					</tr>
					<tr>
						<td class="i-wd-50">
							E-mail: ${customer.customerEmail}
						</td>
						<td class="i-wd-50">
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
								<div class="thumbnail text-center i-thumbnail" style="width: 80px;">
									<div class="i-img-wrapper" style="height: 50px;">
										<img src="${imagePath}/product-images/product_${item.product.productId}.png" alt="image" 
												class="img-responsive img-thumbnail i-img">
									</div>
								</div>
							</td>
							<td>${item.product.productName}</td>
							<td>${item.product.productPrice}</td>
							<td>x ${item.quantity}</td>
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
									<table>
			   							<tr>
											<td>
				   								<div class="text-right" style="margin-left: 30px;">
													<p class="i-font-14"><span class="-i-font-bold">Apt. number: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Street Name: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">City: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Province / State: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Country: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">ZIP Code: </span></p>
												</div>
											</td>
											<td>
				   								<div class="text-left" style="margin-left: 10px;">
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.apartmentNumber}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.streetName}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.city}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.state}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.country}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${billingAddress.zipCode}</span></p>
												</div>
											</td>
			   							</tr>
			   						</table>
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
									<table>
			   							<tr>
											<td>
				   								<div class="text-right" style="margin-left: 30px;">
													<p class="i-font-14"><span class="-i-font-bold">Apt. number: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Street Name: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">City: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Province / State: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">Country: </span></p>
													<p class="i-font-14"><span class="-i-font-bold">ZIP Code: </span></p>
												</div>
											</td>
											<td>
				   								<div class="text-left" style="margin-left: 10px;">
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.apartmentNumber}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.streetName}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.city}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.state}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.country}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${shippingAddress.zipCode}</span></p>
												</div>
											</td>
			   							</tr>
			   						</table>
								</td>
							</tr>
						</table>
					</div>
   				</div>
   				
   			</div> <!-- row -->
   			
  		</div> <!-- end of jumbotron -->
  			
  		<div class="row i-button-row i-center-child">
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
				<a href="${flowExecutionUrl}&_eventId=confirm" class="btn btn-warning pull-right i-btn-md">
					Confirm Order
				</a>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		