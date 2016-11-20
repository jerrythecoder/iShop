<!-- Functional Bar Starts -->
<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
	<div class="container main-function-row-container">
		<a href="<spring:url value='/customer/cart'/>" ng-init="refreshCart()">
			<button class="btn btn-warning" type="button">
				<span class="badge">{{cart.totalQuantity}}</span>
				<span class="glyphicon glyphicon-shopping-cart"></span>
				My Shopping Cart
			</button>
		</a>
	</div>
</sec:authorize>
<!-- Functional Bar Ends -->