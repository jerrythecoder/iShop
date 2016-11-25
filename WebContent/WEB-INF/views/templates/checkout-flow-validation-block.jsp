   		<div class="main-content-body main-align-center-parent" ng-hide="${orderActive}">
	   		<div class="jumbotron">
				<p>The check-out session you're accessing has expired.</p>
			</div>
		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-show="${orderActive}">
   			<div class="jumbotron" ng-hide="${orderValid}">
   				<p>The content of the order is invalid.</p>
   			</div>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent" ng-hide="${orderActive && orderValid}">
			<div class="row main-flow-action-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToShopping" class="btn btn-warning main-button-md">
						Keep Shopping
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=switchToOrderList" class="btn btn-warning main-button-md">
						View Order List
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>