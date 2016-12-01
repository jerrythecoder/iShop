<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

<div class="container">
	
	<div class="page-header">
		<div class="main-content-header-title">
			<h2 class="header-msg-default">
				<span class="glyphicon glyphicon-check"></span>
				Customer Checkout
			</h2>
		</div>
	</div>   
   		
   		
   	<%@ include file="/WEB-INF/views/templates/checkout-flow-validation-block.jsp" %>
	   	
	   	
 	<div class="i-center-parent" ng-show="${orderActive && orderValid}">
  		<div class="jumbotron i-wd-80 i-center-child i-flow-jumbotron">
  		
  			<p>Order Success!</p>
  			
  		</div> <!-- end of jumbotron -->
  			
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
		
	</div> <!-- center-parent -->
</div> <!-- container -->	

    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		