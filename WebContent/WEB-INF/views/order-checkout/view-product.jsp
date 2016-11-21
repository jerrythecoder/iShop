<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					View Your Order
   				</h2>
   			</div>
   			<p class="lead">Below is the details of your order:</p>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent">
			<div class="jumbotron main-wd-80 main-align-center-child">
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
			</div>
			
			<div class="row main-flow-action-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=back" class="btn btn-primary main-button-md">
						<span class="glyphicon glyphicon-chevron-left"></span>
						Back to Cart
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=next" class="btn btn-primary main-button-md">
						Next
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		