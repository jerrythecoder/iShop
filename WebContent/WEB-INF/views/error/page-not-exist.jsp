<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container" ng-init="refreshCart(); cartEmpty = true">
			
	<div class="text-center">
		<div class="jumbotron i-flow-jumbotron i-top-elem">
			<p>
				<span class="glyphicon glyphicon-remove-sign"></span>
				The page you're accessing does not exist.
			</p>
		</div>
		<div class="row">
			<div class="col-md-12">
				<a href="<c:url value='${backLink}'/>" class="btn btn-default i-btn-md">
					Go back
				</a>
			</div>
		</div>
	</div>
	
</div> <!-- container -->
    		

<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		