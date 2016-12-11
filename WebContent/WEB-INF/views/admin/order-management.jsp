<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">
	<div class="page-header i-top-elem">
		<h2>
			<span class="glyphicon glyphicon-list-alt"></span>
			Customer Order Management
		</h2>
		<div class="row" style="margin-top: 30px;">
			<div class="col-md-3">
				<p class="lead">Order Total: ${fn:length(customerOrderList)}</p>
			</div>
			<div class="col-md-9">
					<a href='<spring:url value="/admin"/>' class="btn btn-link i-btn-lg pull-right">
						<span class="glyphicon glyphicon-chevron-left"></span>
	    				Back to Admin Home
	    			</a>
			</div>
		</div>
	</div>
	
	<div class="panel panel-warning">
		<table class="table table-striped table-hover">
			<thead>
				<tr class="bg-warning">
					<th class="i-wd-10 text-center">ID</th>
					<th class="i-wd-15">Status</th>
					<th class="i-wd-15">Created On</th>
					
					<th class="i-wd-10">Grand Total</th>
					<th class="i-wd-10">Customer ID</th>
					
					<th class="i-wd-15">Recipient</th>
					<th class="i-wd-25">Shipping Address</th>
				</tr>
			</thead>
			
			<c:forEach var="order" items="${customerOrderList}">
				<tr>
					<td class="text-center">
						${order.orderId}
					</td>
					<td>${order.orderStatus}</td>
					<td>${order.creationTime}</td>
					
					<td>${moneySign} ${order.grandTotal}</td>
					<td class="text-center">${order.customer.customerId}</td>
					
					<td>${order.recipientFirstName} ${order.recipientLastName}</td>
					<td>
						${order.shippingAddress.apartmentNumber} 
						${order.shippingAddress.streetName} 
						${order.shippingAddress.city} 
						${order.shippingAddress.state}, 
						${order.shippingAddress.country}, 
						${order.shippingAddress.zipCode}
					</td>
				</tr>
			</c:forEach> 
		</table>
	</div>
	
</div> <!-- container -->


<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		