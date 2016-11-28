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
	   				<span class="label label-warning i-flow-label">Your Items</span>
	   			</div>
	   			<div class="col-md-1 i-vertical-center">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-default i-flow-label">Addresses</span>
	   			</div>
	   			<div class="col-md-1">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-default i-flow-label">Confirm</span>
	   			</div>
	   			<div class="col-md-1">
	   				<span class="glyphicon glyphicon-triangle-right" style="padding-top: 6px"></span>
	   			</div>
	   			<div class="col-md-2">
	   				<span class="label label-default i-flow-label">Ordered !</span>
	   			</div>
	   			<div class="col-md-1"></div>
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
		</div> <!-- jumbotron -->
		
		<div class="row i-button-row i-wd-80 i-center-child">
			<div class="col-md-8"></div>
			<div class="col-md-2">
				<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-default pull-right i-btn-md">
					<span class="glyphicon glyphicon-chevron-left"></span>
					Back to Cart
				</a>
			</div>
			<div class="col-md-2">
				<a href="${flowExecutionUrl}&_eventId=next" class="btn btn-warning pull-right i-btn-md">
					Next
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		