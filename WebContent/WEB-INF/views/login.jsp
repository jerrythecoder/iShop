<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


    <div class="container main-content-container">
    	
   		<div class="page-header main-content-header">
	   			<c:if test="${not empty logout}">
	   				<br>
		   				<h3 class="header-msg-warn">
		   					<span class="glyphicon glyphicon-ok-circle"></span>
		   					${logout}
		   				</h3>
	   				<br>
	   			</c:if>
   		
   		   	<div class="main-content-header-title">
   				<h2 class="header-msg-info">
   					<span class="glyphicon glyphicon-user"></span>
   					Sign in with your username and password
   				</h2>
   			</div>
   			
    	</div>
    	
    	<div class="main-content-body">
	    	<div class="row main-credential-box"> <!-- login box -->
	    		<div class="col-md-4"></div>
	  				<div class="col-md-4">
	    			<form action='<c:url value="/login"/>' method="post">
	    				
	    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    				
	    				<c:if test="${not empty error}">
	    					<div class="error" style="color:#ff0000;">${error}</div>
	    				</c:if>
	
	    				<div class="form-group">
	    					<label>Username: </label>
	    					<input type="text" name="username" class="form-control"/>
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>Password: </label>
	    					<input type="password" name="password" class="form-control"/>
	    				</div>
						
						<div class="form-group">
	    					<input type="submit" value="Login" 
	    							class="btn btn-primary text-center center-block main-button-login"/>
	    				</div>
	    			</form>
	   			</div>
	   			<div class="col-md-4"></div>
	   		</div> <!-- end tag of login box -->
   		</div>
    		
	</div> <!-- end tag of main content container -->
    
    
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		