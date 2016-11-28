<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container" ng-init="refreshCart(); cartEmpty = true">

	<div class="page-header">
		<h2 class="header-msg-default">
			<img alt="devices" src="${ctx}/resources/images/cart-title-image.png" width="50" height="50">
			My Shopping Cart
		</h2>
	</div>
			
	<div class="text-center" ng-show="cartEmpty">
		<div class="jumbotron">
			<p>Your cart is empty.</p>
		</div>
		<div class="row">
			<div class="col-md-12">
				<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
					Go Shopping
				</a>
			</div>
		</div>
	</div>
	   			
	<div ng-hide="cartEmpty">
  		<div class="panel panel-default">
    		<table class="table table-hover">
				<tr class="active">
					<th class="i-wd-10 text-center">ID</th>
					<th class="i-wd-8"></th>
					<th class="i-wd-25">Name</th>
					<th class="i-wd-15">Condition</th>
					<th class="i-wd-10">Price</th>
					<th class="i-wd-15">Quantity</th>
					<th class="i-wd-10">Total Price</th>
					<th class="i-wd-5"></th>
				</tr>
				<tr ng-repeat="item in cart.cartItems">
					<td class="text-center">{{item.product.productId}}</td>
					<td>
						<a href='<spring:url value="/product/detail/{{item.product.productId}}"/>'>
							<img src="${imagePath}/product-images/product_{{item.product.productId}}.png" alt="image" 
								class="img-responsive img-thumbnail">
						</a>
					</td>
					<td>
						<a href='<spring:url value="/product/detail/{{item.product.productId}}"/>'>
							{{item.product.productName}}
						</a>
					</td>
					<td>{{item.product.productCondition}}</td>
					<td>${moneySign} {{item.product.productPrice}}</td>
					<td>
						<button style="height:25px;width:25px;"
							ng-click="addProduct(item.product.productId)">+</button>
						<span class="btn text-center" style="padding: 0px; width: 20px;">{{item.quantity}}</span>
						<button style="height:25px;width:25px;"
							ng-click="removeProduct(item.product.productId)">-</button>
					</td>
					<td>${moneySign} {{item.totalPrice}}</td>
					<td>
						<a href="" ng-click="removeCartItem(item.product.productId)">
							<span class="glyphicon glyphicon-trash"></span>
						</a>
					</td>
				</tr>
				<tr class="i-font-20 i-font-bold">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<p>Grand Total:</p>
					</td>
					<td>
						<p>${moneySign} {{cart.grandTotal}}</p>
					</td>
					<td></td>
				</tr>
			</table>
  		</div> <!-- panel -->
	    	
		<div class="row i-button-row">
			<div class="col-md-6 text-left">
				<a href="" class="btn btn-danger i-btn-sm" ng-click="clearCart()">
					<span class="glyphicon glyphicon-remove"></span>
					Clear Cart
				</a>
			</div>
			<div class="col-md-3 text-right">
				<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
					Keep Shopping
				</a>
			</div>
			<div class="col-md-3 text-right">
				<a href="<c:url value='order/checkout'/>" class="btn btn-warning i-btn-lg text-center">
					Go Checkout
				</a>
			</div>
		</div>	<!-- button row -->
  	</div> <!-- ng-hide -->
	
</div> <!-- container -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		