<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container-wrapper">
    	<div class="container">
    	
    		<div class="page-header">
 				<h1>Register a New User</h1>
  				<h3>Please enter your username and password:</h3>
	    	</div>
	    			
	    		    			
			<div> <!-- Register box -->
			
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
					
					<input type="submit" value="Submit" class="btn btn-default"/>
				</form:form>
				
			</div> <!-- end tag of register box -->
    		
    		
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    		
	
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		