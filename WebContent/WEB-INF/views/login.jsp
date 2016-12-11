<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container i-wd-50">

	<c:if test="${not empty logout}">
		<div class="page-header text-center">
			<p class="lead i-color-warn">
				<span class="glyphicon glyphicon-ok-circle"></span>
				${logout}
				<br>
			</p>
		</div>
	</c:if>

	
	<div class="jumbotron i-wd-55 i-center-child i-login-jumbotron">
		<div class="text-center">
			<h4>
				<span class="glyphicon glyphicon-user" style="margin-right: 5px;"></span>
				Please sign in
				<br><br>
			</h4>
		</div>
	
		<form action='<c:url value="/login"/>' method="post" class="i-center-child">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<c:if test="${not empty error}">
				<div class="i-error-msg-wrapper i-error-msg-box">${error}</div>
			</c:if>
			
			
			<div class="form-group">
				<input type="text" name="username" class="form-control" placeholder="Username"/>
			</div>
			
			<div class="form-group">
				<input type="password" name="password" class="form-control" placeholder="Password"/>
			</div>
			
			<div class="checkbox">
			<label>
				<!-- To be implemented ... -->
				<input type="checkbox"/>Remember me
			</label>
			</div>
			
			<br>
			<div class="form-group text-center">
				<input type="submit" value="Sign In" class="btn btn-warning i-btn-lg"/>
			</div>
 		</form>
 		
	</div> <!-- jumbotron -->
	
	<div class="i-wd-55 i-center-child">
		<p>
			Don't have an account? please  
			<a href='<c:url value="/register"/>' class="i-font-bold">sign up here.</a>
		</p>
	</div>
</div> <!-- container -->
    
    
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		