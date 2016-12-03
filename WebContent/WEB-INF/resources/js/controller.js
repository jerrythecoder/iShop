/*
 * AngularJS module of the 'shoppingCartApp'.
 */

angular.module('shoppingCartApp', ['ngCookies'])
.controller('cartCtrl', function($scope, $http, $cookies) {
	
	
	/*
	 * Tests if cart exists.
	 */
	$scope.verifyCartExists = function() {
		$http.get('/ishop/customer/cart/rest/verify-cart-exists')
		.then(function successCallback(response) {
			$scope.cartExists = response.data;
		});
	};
	
	/*
	 * Tests if cart is empty.
	 */
	$scope.verifyCartEmpty = function() {
		$http.get('/ishop/customer/cart/rest/verify-cart-empty')
		.then(function successCallback(response) {
			$scope.cartEmpty = response.data;
		});
	};
	
	/*
	 * Refreshes Cart by retrieving the latest Cart data.
	 */
	$scope.refreshCart = function() {
		$http.get('/ishop/customer/cart/rest/retrieve-cart')
		.then(function successCallback(response) {
			$scope.cart = response.data;
			// Tests if cart is empty.
			$scope.verifyCartEmpty();
		});
	};
	
	/*
	 * Tests if a product is in cart or not.
	 */
	$scope.verifyProductAdded = function(productId) {
		$http.get('/ishop/customer/cart/rest/verify-product-added/' + productId)
		.then(function successCallback(response) {
			$scope.productAdded = response.data;
		});
	};
	
//		/*
//		 * Get product quantity by productId.
//		 */
//		$scope.refreshProductQuantity = function(productId) {
//			$http.get('/ishop/customer/cart/rest/retrieve-quantity/{productId}')
//			.then(function successCallback(response) {
//				$scope.productQuantity = response.data;
//			});
//		};
	
	/*
	 * Adds a Product to Cart.
	 */
	$scope.addProduct = function(productId) {
		$http.put('/ishop/customer/cart/rest/add-product/' + productId)
		.then(function successCallback(response) {
			if (response.data == 'false') {
				alert("Failed to add product to cart!");
			}
			
			$scope.refreshCart();
			$scope.verifyProductAdded(productId);
		});
	};
	
	/*
	 * Removes a Product from Cart.
	 */
	$scope.removeProduct = function(productId) {
		$http.delete('/ishop/customer/cart/rest/remove-product/' + productId)
		.then(function successCallback(response) {
			if (response.data == 'false') {
				alert("Failed to remove product from cart!");
			}
			
			$scope.refreshCart();
			$scope.verifyProductAdded(productId);
		});
	};
	
	/*
	 * Removes a CartItem from Cart.
	 */
	$scope.removeCartItem = function(productId) {
		$http.delete('/ishop/customer/cart/rest/remove-item/' + productId)
		.then(function successCallback(response) {
			if (response.data == 'false') {
				alert("Failed to remove cart item from cart!");
			}
			
			$scope.refreshCart();
			$scope.verifyProductAdded(productId);
		});
	};
	
	/*
	 * Clears all CartItems from Cart.
	 */
	$scope.clearCart = function() {
		$http.delete('/ishop/customer/cart/rest/clear-cart')
		.then(function successCallback(response) {
			if (response.data == 'false') {
				alert("Failed to clear cart!");
			}
			
			$scope.refreshCart();
			$scope.verifyProductAdded(productId);
		});
	};
});
