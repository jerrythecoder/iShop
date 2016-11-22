<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container main-content-container">
    
    	<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					Thank you, ${customer.customerFirstName}!
   				</h2>
   			</div>
   			<p class="lead">We're honored to ...</p>
   		</div>
    	
		<div class="main-content-body">
			<a href="${flowExecutionUrl}&_eventId=goCustomerHome" class="btn btn-warning">
				View My Profile
			</a>
			<a href="${flowExecutionUrl}&_eventId=goShopping" class="btn btn-warning">
				Shopping Now!
			</a>
		</div>
	
	</div> <!-- end tag of main content container -->
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
