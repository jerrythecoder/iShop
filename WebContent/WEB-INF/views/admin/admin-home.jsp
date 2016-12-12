<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<!-- Modal Dialog -->
<div class="modal fade" id="featureNotCompleted" tabindex="-1" role="dialog" aria-labelledby="featureNotCompleted">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content i-modal-content">
			<div class="modal-body i-modal-body">
				Sorry, this feature is not completed yet.
			</div>
			<div class="modal-footer i-center-parent">
				<button type="button" class="btn btn-primary i-btn-sm" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="page-header">
   		<h2>
   			<span class="glyphicon glyphicon-home" style="margin-right: 10px;"></span>
   			Administrator Home
   		</h2>
  	</div>

	<div class="row" style="margin-top: 30px">
	
		<a href='<c:url value="/admin/product-inventory"/>'>
			<div class="col-md-4">
				<div class="jumbotron i-uni-jumbotron-active text-left">
					<h4 class="i-color-warn">
						<span class="glyphicon glyphicon-th"></span>
			   			Product Inventory
			   		</h4>
			   		<h4>Create, modify or delete products.</h4> 
			   		<h4>Set product features and information.</h4>
				</div>
			</div>
		</a>
		
		<a href='<c:url value="/admin/order-management"/>'>
			<div class="col-md-4">
				<div class="jumbotron i-uni-jumbotron-active text-left">
					<h4 class="i-color-warn">
						<span class="glyphicon glyphicon-list-alt"></span>
			   			Order Management
			   		</h4>
			   		<h4>View and modify customer orders in time.</h4> 
			   		<h4>Supervise order / shipment status.</h4>
				</div>
			</div>
		</a>
		
		<a href='#' data-toggle="modal" data-target="#featureNotCompleted">
			<div class="col-md-4">
				<div class="jumbotron i-uni-jumbotron-active text-left">
					<h4 class="i-color-warn i-font-18">
						<span class="glyphicon glyphicon-user"></span>
			   			Customer Management
			   		</h4>
			   		<h4>Manage all customers in an easy way.</h4> 
			   		<h4>Activate / deactivate customers.</h4>
				</div>
			</div>
		</a>
		
	</div> <!-- row 1 -->
	
	<div class="row" style="margin-top: 30px">
	
		<a href='#' data-toggle="modal" data-target="#featureNotCompleted">
			<div class="col-md-4">
				<div class="jumbotron i-uni-jumbotron-active text-left">
					<h4 class="i-color-warn">
						<span class="glyphicon glyphicon-link"></span>
			   			i-Shop Contact
			   		</h4>
			   		<h4>Edit shop contact information.</h4> 
				</div>
			</div>
		</a>
		
	</div> <!-- row 2 -->

</div> <!-- container -->

		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		