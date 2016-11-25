<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header main-content-header-checkout">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-check"></span>
   					Order Checkout
   				</h2>
   			</div>
	   		<div class="row" ng-show="${orderActive && orderValid}">
	   			<div class="col-md-1"></div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-done">
	   					View Product
	   				</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-done">
	   					Verify Address
	   				</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-done">Confirm Order</p>
	   			</div>
	   			<div class="col-md-1">
	   				<p class="lead"><span class="glyphicon glyphicon-triangle-right"></span></p>
	   			</div>
	   			<div class="col-md-2">
	   				<p class="lead main-flow-active">Ordered !</p>
	   			</div>
	   			<div class="col-md-1"></div>
	   		</div>
   		</div> <!-- end of header -->
   		
   		<%@ include file="/WEB-INF/views/templates/checkout-flow-validation-block.jsp" %>
   		
   		<div class="main-content-body main-align-center-parent">
   			<div class="panel panel-default">
				<div class="jumbotron main-wd-80 main-align-center-child">
					<p>Order Success</p>
				</div>
				
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
			
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		