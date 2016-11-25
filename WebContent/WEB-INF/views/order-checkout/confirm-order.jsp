<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<c:set var="imagePath" value="${contextPath}/resources/images/product-images"/>

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
	   				<p class="lead main-flow-done">
	   					Verify Address
	   				</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-active">Confirm Order</p>
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
					
					<div class="panel panel-default main-bg-color-2">
						<table class="table">
							<tr class="warning main-font-16 main-font-bold">
								<td>Ship To: ${customer.customerFirstName} ${customer.customerLastName}</td>
							</tr>
							<tr>
								<td>
									E-mail: ${customer.customerEmail}
									<br>
									Phone: ${customer.customerPhone}
								</td>
							</tr>
						</table>
					</div>
					
					<br>
					
					<div class="panel panel-default main-bg-color-2">
						<table class="table ">
							<tr>
								<th class="main-cell-10 main-align-center-parent">ID</th>
								<th class="main-cell-10"></th>
								<th class="main-cell-35">Name</th>
								<th class="main-cell-15">Price</th>
								<th class="main-cell-20">Quantity</th>
								<th class="main-cell-15">Total</th>
							</tr>
							<c:forEach var="item" items="${cart.cartItems}">
								<tr>
									<td class="main-align-center-parent">${item.product.productId}</td>
									<td>
										<img src="${imagePath}/product_${item.product.productId}.png" alt="image" 
											class="img-responsive img-thumbnail">
									</td>
									<td>${item.product.productName}</td>
									<td>${item.product.productPrice}</td>
									<td>${item.quantity}</td>
									<td>$${item.totalPrice}</td>
								</tr>
							</c:forEach>
							<tr class="main-font-bold">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Grand Total:</td>
								<td>$${cart.grandTotal}</td>
							</tr>
							<tr class="main-font-bold">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Applied Discount:</td>
								<td>$0.0</td>
							</tr>
							<tr class="main-font-16 main-font-bold warning">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Total Pay:</td>
								<td>$${cart.grandTotal}</td>
							</tr>
						</table>
					</div> <!-- end of panel -->
					
					<br>
					
					<div class="panel panel-default main-bg-color-2" style="padding: 15px;">
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
			   			</div> <!-- end of row -->
					</div>
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
						<a href="${flowExecutionUrl}&_eventId=confirm" class="btn btn-warning main-button-md">
							Confirm Order
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
					<div class="col-md-3"></div>
				</div>	
			</div> <!-- end of panel -->
		</div> <!-- end of last content body -->
		
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		