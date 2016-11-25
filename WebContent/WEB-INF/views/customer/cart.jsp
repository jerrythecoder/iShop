<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>
	
	<div class="container main-content-container" ng-init="refreshCart(); cartEmpty = true">

		<div class="page-header main-content-header main-content-header-customer">
			<div class="main-content-header-title">
				<h2 class="header-msg-default">
					<span class="glyphicon glyphicon-shopping-cart"></span>
					My Shopping Cart
				</h2>
			</div>
		</div>
			
		<div class="main-content-body main-align-center-parent">
	   			<div ng-show="cartEmpty">
	   				<div class="jumbotron">
	   					<p>Your cart is empty.</p>
	   				</div>
	  				<div class="row main-flow-action-button-row">
						<div class="col-md-12">
							<a href="<c:url value='/product/list'/>" class="btn btn-warning main-button-lg">
								Go Shopping
							</a>
						</div>
					</div>
	   			</div>
	   			
	   			<div class="panel panel-default" ng-hide="cartEmpty">
		    		<table class="table table-hover table-striped">
						<tr class="info">
							<th class="main-cell-10 main-align-center-parent">ID</th>
							<th class="main-cell-8"></th>
							<th class="main-cell-25">Name</th>
							<th class="main-cell-15">Condition</th>
							<th class="main-cell-10">Price</th>
							<th class="main-cell-15">Quantity</th>
							<th class="main-cell-10">Total Price</th>
							<th class="main-cell-5"></th>
						</tr>
						<tr ng-repeat="item in cart.cartItems">
							<td class="main-align-center-parent">{{item.product.productId}}</td>
							<td>
								<a href='<spring:url value="/product/detail/{{item.product.productId}}"/>'>
									<img src="${imagePath}/product_{{item.product.productId}}.png" alt="image" 
										class="img-responsive img-thumbnail">
								</a>
							</td>
							<td>
								<a href='<spring:url value="/product/detail/{{item.product.productId}}"/>'>
									{{item.product.productName}}
								</a>
							</td>
							<td>{{item.product.productCondition}}</td>
							<td>$ {{item.product.productPrice}}</td>
							<td>
								<button style="height:25px;width:25px;"
									ng-click="addProduct(item.product.productId)">+</button>
								{{item.quantity}}
								<button style="height:25px;width:25px;"
									ng-click="removeProduct(item.product.productId)">-</button>
							</td>
							<td>$ {{item.totalPrice}}</td>
							<td>
								<a href="" ng-click="removeCartItem(item.product.productId)">
									<span class="glyphicon glyphicon-trash"></span>
								</a>
							</td>
						</tr>
						<tr class="main-font-20 main-font-bold">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<p class="main-cell-data-total-label">Grand Total:</p>
							</td>
							<td>
								<p class="main-cell-data-total-price">$ {{cart.grandTotal}}</p>
							</td>
							<td></td>
						</tr>
					</table>
	   			</div>
	    	
	    	<div ng-hide="cartEmpty">
				<div class="row main-flow-action-button-row">
					<div class="col-md-6 main-align-left-parent">
						<a href="" class="btn btn-danger main-button-sm" ng-click="clearCart()">
							<span class="glyphicon glyphicon-remove"></span>
							Clear Cart
						</a>
					</div>
					<div class="col-md-3 main-align-right-parent">
						<a href="<c:url value='/product/list'/>" class="btn btn-warning main-button-lg">
							<span class="glyphicon glyphicon-arrow-left"></span>
							Keep Shopping
						</a>
					</div>
					<div class="col-md-3 main-align-right-parent">
						<a href="<c:url value='order/checkout'/>" class="btn btn-warning main-button-lg">
							Checkout
							<span class="glyphicon glyphicon-arrow-right"></span>
						</a>
					</div>
				</div>
   			</div>
	    	
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		