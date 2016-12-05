<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>



<!-- Modal Dialog -->
<div class="modal fade" id="clearCartDialog" tabindex="-1" role="dialog" aria-labelledby="clearCartDialog">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content i-modal-content">
			<div class="modal-body i-modal-body">
				Remove all items in cart?
			</div>
			<div class="modal-footer i-center-parent">
				<button type="button" class="btn btn-default i-btn-xsm" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary i-btn-xsm" ng-click="clearCart()" data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>



<div class="container" ng-init="refreshCart(); cartEmpty = true">

	<div class="page-header i-top-elem">
		<h2 class="header-msg-default">
			<img alt="devices" src="${ctx}/resources/images/cart-title-image.png" width="40" height="40">
			My Shopping Cart
		</h2>
		<p class="lead text-right i-center-child" ng-init="cart.totalQuantity = 0; refreshCart()">
			<span class="label label-primary">Total Quantity: {{cart.totalQuantity}}</span>
		</p>
	</div>
			
	<div class="text-center" ng-show="cartEmpty">
		<div class="jumbotron i-flow-jumbotron i-center-child">
			<p>
				<span class="glyphicon glyphicon-exclamation-sign"></span>
				Your cart is empty.
			</p>
		</div>
		<div class="row i-button-row">
			<div class="col-md-12">
				<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
					Go Shopping
				</a>
			</div>
		</div>
	</div>
	   			
	<div ng-hide="cartEmpty">
  		<div class="panel panel-warning">
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
						<button class="btn btn-sm btn-default i-font-bold active" style="height:30px;width:30px;" 
								ng-click="addProduct(item.product.productId)">+</button>
						<span class="btn text-center" style="padding: 0px; width: 20px;">{{item.quantity}}</span>
						<button class="btn btn-sm btn-default i-font-bold active" style="height:30px;width:30px;" 
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
						Grand Total:
					</td>
					<td>
						${moneySign} {{cart.grandTotal}}
					</td>
					<td></td>
				</tr>
			</table>
  		</div> <!-- panel -->
	    	
		<div class="row i-button-row">
			<div class="col-md-6 text-left">
				<button class="btn btn-danger i-btn-sm" data-toggle="modal" data-target="#clearCartDialog">
					<span class="glyphicon glyphicon-remove"></span>
					Clear Cart
				</button>
			</div>
			<div class="col-md-3 text-right">
				<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
					Keep Shopping
				</a>
			</div>
			<div class="col-md-3 text-right">
				<a href="<c:url value='/customer/order/checkout'/>" class="btn btn-warning i-btn-lg text-center">
					Go Checkout
				</a>
			</div>
		</div>	<!-- button row -->
  	</div> <!-- ng-hide -->
	
</div> <!-- container -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		