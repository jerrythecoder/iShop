<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<div class="container main-content-container" ng-init="refreshCart(); cartEmpty = true">

		<div class="page-header main-content-header">
			<div class="main-content-header-title">
				<h2 class="header-msg-default">
					<span class="glyphicon glyphicon-list-alt"></span>
					My Shopping Cart
				</h2>
			</div>
		</div>
			
		<div class="main-content-body main-align-center-parent">
   			<div ng-show="cartEmpty">
   				<p>Your cart is empty.</p>
  					<div class="row main-flow-action-button-row">
					<div class="col-md-12">
						<a href="<c:url value='/product/list'/>" class="btn btn-warning main-button-md">
							Go shopping now!
						</a>
					</div>
				</div>
   			</div>
   			
   			<div ng-hide="cartEmpty">
	    		<table class="table">
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Count</th>
						<th>Total Price</th>
						<th></th>
					</tr>
					<tr ng-repeat="item in cart.cartItems">
						<td>{{item.product.productId}}</td>
						<td>{{item.product.productName}}</td>
						<td>{{item.product.productPrice}} $</td>
						<td>
							<button style="height:25px;width:25px;"
								ng-click="addProduct(item.product.productId)">+</button>
							{{item.quantity}}
							<button style="height:25px;width:25px;"
								ng-click="removeProduct(item.product.productId)">-</button>
						</td>
						<td>{{item.totalPrice}} $</td>
						<td>
							<a href="" ng-click="removeCartItem(item.product.productId)">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</td>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th>Grand Total: </th>
						<th>{{cart.grandTotal}} $</th>
						<th></th>
					</tr>
				</table>
				
				<div class="row main-flow-action-button-row">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<a href="" class="btn btn-danger main-button-md" ng-click="clearCart()">
							Clear Cart
						</a>
					</div>
					<div class="col-md-3">
						<a href="<c:url value='order/checkout'/>" class="btn btn-warning main-button-md">
							Check Out
							<span class="glyphicon glyphicon-hand-right"></span>
						</a>
					</div>
				</div>
   			</div>
    		
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		