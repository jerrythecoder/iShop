<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					Success!
   				</h2>
   			</div>
   			<p class="lead">success:</p>
   		</div>
   		
   		<div class="main-content-body main-align-center-parent">
			<div class="jumbotron main-wd-80 main-align-center-child">
				...
			</div>
			
			<div class="row main-flow-action-button-row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=keepShopping" class="btn btn-primary main-button-md">
						Keep Shopping
					</a>
				</div>
				<div class="col-md-3">
					<a href="${flowExecutionUrl}&_eventId=viewOrderList" class="btn btn-primary main-button-md">
						View My Order List
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div> <!-- end of main content body -->
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		