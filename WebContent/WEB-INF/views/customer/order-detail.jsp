<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">

	<div class="i-center-parent">
  		<div class="panel panel-info i-order-panel i-wd-80 i-center-child i-top-elem">
  		
  			<div class="panel-heading i-font-18">
				<div class="row">
					<div class="col-md-4">
						<span class="i-font-bold i-font-18">Ordered on: </span>${order.creationTime}
					</div>
					<div class="col-md-4">
						<span class="i-font-bold i-font-18">Ordered ID: </span>${order.orderId}
					</div>
					<div class="col-md-4">
						<span class="i-font-bold i-font-18">Status: </span>${order.orderStatus}
					</div>
				</div>
			</div>
			
  		
  			<div class="panel panel-default">
				<table class="table text-left">
					<tr>
						<td>Deliver To: ${order.customer.customerFirstName} ${order.customer.customerLastName}</td>
						<td></td>
					</tr>
					<tr>
						<td class="i-wd-50">
							E-mail: ${order.customer.customerEmail}
						</td>
						<td class="i-wd-50">
							Phone: ${order.customer.customerPhone}
						</td>
					</tr>
				</table>
			</div>
			
			<div class="panel panel-default">
				<table class="table text-left">
					<tr class="active">
						<th class="i-wd-10 text-center">ID</th>
						<th class="i-wd-10"></th>
						<th class="i-wd-30">Name</th>
						<th class="i-wd-15">Price</th>
						<th class="i-wd-20">Quantity</th>
						<th class="i-wd-15">Total</th>
					</tr>
					<c:forEach var="item" items="${order.orderItems}">
						<tr>
							<td class="text-center">${item.itemProductId}</td>
							<td>
								<div class="thumbnail text-center i-thumbnail" style="width: 80px;">
									<div class="i-img-wrapper" style="height: 50px;">
										<img src="${imagePath}/product-images/product_${item.itemProductId}.png" alt="image" 
												class="img-responsive img-thumbnail i-img">
									</div>
								</div>
							</td>
							<td>${item.itemProductName}</td>
							<td>${item.itemProductPrice}</td>
							<td>x ${item.itemProductQuantity}</td>
							<td>${moneySign} ${item.itemTotalPrice}</td>
						</tr>
					</c:forEach>
					<tr class="i-font-bold">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Grand Total:</td>
						<td>${moneySign} ${order.grandTotal}</td>
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
						<td>${moneySign} ${order.grandTotal}</td>
					</tr>
				</table>
			</div> <!-- end of panel -->
  			
   			<div class="row">
   			
   				<div class="col-md-6">	
					<div class="panel panel-default">
						<table class="table text-left">
		   					<tr class="active i-font-16 text-center">
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
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.apartmentNumber}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.streetName}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.city}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.state}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.country}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.billingAddress.zipCode}</span></p>
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
						<table class="table text-left">
		   					<tr class="active i-font-16 text-center">
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
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.apartmentNumber}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.streetName}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.city}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.state}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.country}</span></p>
													<p class="i-font-14"><span class="i-font-bold">${order.shippingAddress.zipCode}</span></p>
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
   			
  		</div> <!-- end of i-panel -->
  			
  		<div class="row i-button-row i-wd-80 i-center-child">
  			<div class="col-md-6">
				<a href="<c:url value='/customer/home'/>" class="btn btn-warning i-btn-lg text-center">
					Back to Customer Home
				</a>
			</div>
			<div class="col-md-6">
				<a href='<c:url value="/customer/order/list"/>' class="btn btn-warning i-btn-lg">
					Back to Order List
				</a>
			</div>
		</div> <!-- row -->
		
	</div> <!-- center-parent -->
</div> <!-- container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		