<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

    <div class="container-wrapper">
    	<div class="container" ng-init="refreshCart()">
    	
    		<div class="page-header">
    			<h1>My Shopping Cart, ID: ${cart.cartId}</h1>
    		</div>
    		
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
			
			<p class="text-right">
				<button class="btn btn-danger" type="button" ng-click="clearCart()">
					Clear Cart
				</button>
			</p>
			
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		