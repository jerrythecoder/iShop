<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	
	
	<c:set var="imagePath" value="${pageContext.request.contextPath}/resources/images/product-images"/>

   	<div class="container main-content-container">
   	
   		<div class="page-header main-content-header">
   			<div class="main-content-header-title">
   				<h2 class="header-msg-default">
   					<span class="glyphicon glyphicon-list-alt"></span>
   					View Your Order
   				</h2>
   			</div>
   			<p class="lead">Below is the details of your order:</p>
   		</div>
   		
   		<div class="main-content-body">
			
		</div>
		
	</div> <!-- end tag of main content container -->
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		