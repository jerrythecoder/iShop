<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container-wrapper">
    
    	<div class="container">
    	
    		<div class="page-header">
    		
    			<div> <!-- Register box -->
    				<h1>Register a New User</h1>
	    			<h3>Please enter your username and password:</h3>
	    			
	    			<!-- 
	    			<c:if test="${not empty logout}">
	    				<div class="msg">${logout}</div>
	    			</c:if>
	    			
	    			<form action='<c:url value="/login"/>' method="post">
	    				
	    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    				
	    				<c:if test="${not empty error}">
	    					<div class="error" style="color:#ff0000;">${error}</div>
	    				</c:if>
	    			
	    				<div class="form-group">
	    					<label>Username:</label>
	    					<input type="text" name="username" class="form-control"/>
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>Password:</label>
	    					<input type="password" name="password" class="form-control"/>
	    				</div>
	    				
	    				<input type="submit" value="Login" class="btn btn-default"/>
	    				
	    			</form>
	    			 -->
	    			 
					<form:form action="${pageContext.request.contextPath}/register/submit" modelAttribute="user" method="post">
						<div class="form-group">
							<label>Username: </label>
							<c:if test="${not empty userError}">
   								<div class="error" style="color:#ff0000;">${userError}</div>
   							</c:if>
							<form:input path="username" type="text" name="username" class="form-control"/>
						</div>
						
						<div class="form-group">
	    					<label>Password:</label>
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
    		</div>
    		
    		
    		
    		
    		

    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		