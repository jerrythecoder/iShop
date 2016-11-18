<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container main-content-container">
    	
   		<div class="page-header main-content-header">
 			<div class="main-content-header-title">
   				<h2 class="header-msg-info">
   					<span class="glyphicon glyphicon-star"></span>
   					Sign up as a new customer
   				</h2>
   			</div>
   			<p class="lead">Please enter your username and password</p>
    	</div>
    			
    	<div class="main-content-body">
			<div class="row main-credential-box"> <!-- Register box -->
			
				<div class="col-md-4"></div>
	  				<div class="col-md-4">
					<form:form action="${pageContext.request.contextPath}/register/submit" modelAttribute="user" method="post">
						<div class="form-group">
							<label>Username: </label>
							<c:if test="${not empty userError}">
								<div class="error" style="color:#ff0000;">${userError}</div>
							</c:if>
							<form:errors path="username" cssStyle="color: #ff0000;"/>
							<form:input path="username" type="text" name="username" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label>Password:</label>
							<form:errors path="password" cssStyle="color: #ff0000;"/>
							<form:input path="password" type="password" name="password" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label>Confirm password:</label>					
							<c:if test="${not empty passwordError}">
								<div class="error" style="color:#ff0000;">${passwordError}</div>
							</c:if>
							<input type="password" name="confirmPassword" class="form-control"/>
						</div>
						
						<input type="submit" value="Register" class="btn btn-primary center-block main-button-login"/>
					</form:form>
				</div>
	  				<div class="col-md-4"></div>
				
			</div> <!-- end tag of register box -->
		</div>
    		
    		
	</div> <!-- end tag of main content container -->
    		
	
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		