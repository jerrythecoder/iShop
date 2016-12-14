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
				<div class="i-flow-label i-flow-label-active">1. View Your Items</div>
			</div>
			<div class="col-md-4">
				<div class="i-flow-label">2. Verify Billing/shipping Address</div>
			</div>
			<div class="col-md-4">
				<div class="i-flow-label">3. Confirm Order</div>
			</div>
		</div>
  	
		<div class="jumbotron i-center-child i-flow-jumbotron">		
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
		</div> <!-- jumbotron -->
		
		<div class="row i-button-row i-center-child">
			<div class="col-md-8">
				<button class="btn btn-default pull-left i-btn-md" data-toggle="modal" data-target="#cancelCheckout">
					Cancel
				</button>
			</div>
			<div class="col-md-2">
			</div>
			<div class="col-md-2">
				<button onclick="location.href='${flowExecutionUrl}&_eventId=next'" class="btn btn-warning pull-right i-btn-md" 
						ng-disabled="cart.totalQuantity === 0">
					Next
					<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		