<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container-wrapper">
    	<div class="container">
    	
    		<div class="page-header">
    			<h3>Please login with your username and password:</h3>
    			
    			<c:if test="${not empty logout}">
    				<div class="msg">${logout}</div>
    			</c:if>
	    	</div>
	    			
	    	<div class="NOTE!!-login-box">
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
    		</div> <!-- end tag of login-box -->
    		
    	</div> <!-- end tag of container -->
    </div> <!-- end tag of container-wrapper -->
    
    
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		