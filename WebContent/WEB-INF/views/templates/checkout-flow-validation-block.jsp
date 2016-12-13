   		<div class="i-center-parent" ng-hide="${orderActive}">
	   		<div class="jumbotron i-flow-jumbotron">
				<p>
					<span class="glyphicon glyphicon-remove-sign"></span>
					The checkout session you're accessing has expired.
				</p>
			</div>
		</div>
   		
   		<div class="i-center-parent" ng-show="${orderActive}">
   			<div class="jumbotron i-flow-jumbotron" ng-hide="${orderValid}">
   				<p>
   					<span class="glyphicon glyphicon-remove-sign"></span>
   					The content of the order is no longer valid.
   				</p>
   			</div>
   		</div>
   		
   		<div class="i-center-parent" ng-hide="${orderActive && orderValid}">
			<div class="row i-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToShopping" class="btn btn-warning i-btn-lg">
						Keep Shopping
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToOrderList" class="btn btn-warning i-btn-lg">
						View My Orders
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>