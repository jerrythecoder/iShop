/*
 * Basket controller
 */

angular.module('basketApp', ['ngCookies'])
		.controller('basketCtrl', basketCtrl);

function basketCtrl ($scope, $http, $cookies) {
	
	$scope.refreshBasket = function() {
		$http.get('/emusicstore/rest/basket/refresh')
		.then(function successCallback(response) {
				$scope.basket = response.data;
		});
	};
	
	$scope.initBasket = function(basketId) {
		$scope.basketId = basketId;
		$scope.refreshBasket();
	};
	
	// ---------- Add Item -------------
	
	$scope.addItemToBasket = function(itemId) {
		$http.put('/emusicstore/rest/basket/addItem/' + itemId)
		.then(function successCallback() {
			//alert('Your item has been added to basket successfully: ' + itemId);
			$scope.refreshBasket();
			$scope.updateTotalItemCount();
		});
	};
	
	
	// ------------ Remove Item -------------
	
	$scope.removeItemFromBasket = function(itemId) {
		$http.put('/emusicstore/rest/basket/removeItem/' + itemId)
		.then(function successCallBack() {
			$scope.refreshBasket();
			$scope.updateTotalItemCount();
		});
	};
	
	$scope.removeEntryFromBasket = function(itemId) {
		$http.put('/emusicstore/rest/basket/removeEntry/' + itemId)
		.then(function successCallBack() {
			$scope.refreshBasket();
			$scope.updateTotalItemCount();
		});
	};
	
	// -------------  --------------
	
	$scope.updateTotalItemCount = function() {
		$http.get('/emusicstore/rest/basket/totalItemCount')
		.then(function successCallback(response) {
			$scope.totalItemCount = response.data;
		});
	};
	
	$scope.clearBasket = function() {
		$http.delete('/emusicstore/rest/basket/clear')
		.then(function successCallback() {
			$scope.refreshBasket();
			$scope.updateTotalItemCount();
		});
	}
	
}















