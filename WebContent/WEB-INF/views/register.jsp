<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container i-wd-50">
	<div class="jumbotron i-wd-55 i-center-child i-login-jumbotron">
		<div class="text-center">
			<h4>
				<span class="glyphicon glyphicon-star"></span>
   				Create new account
				<br><br>
			</h4>
		</div>

		<form:form action="${pageContext.request.contextPath}/register/submit" class="i-center-child"
				modelAttribute="user" method="post">
			
			<div class="i-error-msg-wrapper">
				<form:errors path="username" class="i-error-msg-box"/>
			</div>
			<div class="form-group">
				<c:if test="${not empty userError}">
					<div class="i-error-msg-wrapper i-error-msg-box">${userError}</div>
				</c:if>
				
				<form:input path="username" type="text" name="username" 
						class="form-control" placeholder="Username"/>
			</div>
			
			
			<div class="i-error-msg-wrapper">
				<form:errors path="password" class="i-error-msg-box"/>
			</div>
			<div class="form-group">
				<form:input path="password" type="password" name="password" 
						class="form-control" placeholder="Password"/>
			</div>
			
			<div class="form-group">				
				<c:if test="${not empty passwordError}">
					<div class="i-error-msg-wrapper i-error-msg-box">${passwordError}</div>
				</c:if>
				<input type="password" name="confirmPassword" 
						class="form-control" placeholder="Confirm Password"/>
			</div>
			
			<br>
			<div class="form-group text-center">
				<input type="submit" value="Sign Up" class="btn btn-primary i-btn-md"/>
			</div>
		</form:form>

	</div> <!-- jumbotron -->
</div> <!-- container -->
    		
	
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		