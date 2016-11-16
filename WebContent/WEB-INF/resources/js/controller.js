/*
 * AngularJS module of the 'shoppingCartApp'.
 */

angular.module('shoppingCartApp', ['ngCookies'])
	.controller('cartCtrl', function($scope, $http, $cookies) {
		
		/*
		 * Refresh Cart by retrieving the latest Cart data.
		 */
		$scope.refreshCart = function() {
			$http.get('/ishop/customer/cart/rest/refresh-cart')
			.then(function successCallback(response) {
				$scope.cart = response.data;
			});
		};
		
		/*
		 * Add a Product to Cart.
		 */
		$scope.addToCart = function(productId) {
			$http.put('/ishop/customer/cart/rest/add-to-cart/' + productId)
			.then(function successCallback() {
				alert("Item added");
				$scope.refreshCart();
			});
		};
		
		
		
	});
