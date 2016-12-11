<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>



<div class="container i-wd-50">
	<div class="page-header">
		<p class="lead i-color-warn text-center i-font-24">
			<span class="glyphicon glyphicon-ok-circle"></span>
			Thank you, ${customer.customerFirstName}
		</p>
		<p class="lead i-color-warn">
			We are very pleased to welcome you as our new customer.<br>
			Here in i-Shop, you will just find everything about trendy electronics!
		</p>
		
		<div class="row">
			<div class="col-md-6">
				<div class="jumbotron i-center-child i-login-jumbotron text-center">
					<p class="lead">
						Want to revisit your profile? Click on 
					</p>
					<a href="${flowExecutionUrl}&_eventId=goCustomerHome" class="btn btn-warning i-btn-md">
						View My Profile
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="jumbotron i-center-child i-login-jumbotron text-center">
					<p class="lead">
						Or, no more wait. Just go  
					</p>
					<a href="${flowExecutionUrl}&_eventId=goShopping" class="btn btn-warning i-btn-md">
						Shopping Now!
					</a>
				</div>
			</div>
		</div>
			
	</div>
</div> <!-- container -->

    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
