<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<!-- Modal Dialog -->
<div class="modal fade" id="deleteProductDialog" tabindex="-1" role="dialog" aria-labelledby="deleteProductDialog">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content i-modal-content">
			<div class="modal-body i-modal-body">
				Delete product with ID: <span id="modalBodyProductId"></span>?
			</div>
			<div class="modal-footer i-center-parent">
				<button type="button" class="btn btn-default i-btn-xsm" data-dismiss="modal">Cancel</button>
				<a id="deleteInventoryConfirmBtn" class="btn btn-primary i-btn-xsm" href="#">Yes</a>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="page-header i-top-elem">
		<h2>
			<span class="glyphicon glyphicon-th"></span>
			Product Inventory Management
		</h2>
		<div class="row" style="margin-top: 20px; margin-bottom: 10px;">
			<div class="col-md-3">
					<a href='<spring:url value="/admin/product-form-add"/>' class="btn btn-primary i-btn-lg">
						<span class="glyphicon glyphicon-plus"></span>
	    				Add New Product
	    			</a>
			</div>
			<div class="col-md-9">
					<a href='<spring:url value="/admin"/>' class="btn btn-link i-btn-lg pull-right">
						<span class="glyphicon glyphicon-chevron-left"></span>
	    				Back to Admin Home
	    			</a>
			</div>
		</div>
	</div>
	
	<div class="panel panel-default">
		<table class="table table-striped table-hover">
			<thead>
				<tr class="bg-success">
					<th class="i-wd-5 text-center">ID</th>
					<th class="i-wd-8"></th>
					<th class="i-wd-17">Product Name</th>
					<th class="i-wd-10">Category</th>
					
					<th class="i-wd-10">Price</th>
					<th class="i-wd-10">Condition</th>
					<th class="i-wd-10">Status</th>
					
					<th class="i-wd-10">Unit in Stock</th>
					<th class="i-wd-10">Manufacturer</th>
					
					<th class="i-wd-5"></th>
					<th class="i-wd-5"></th>
				</tr>
			</thead>
			<c:forEach var="product" items="${productList}">
			
				<c:url var="productDetailLink" value='/product/detail/${product.productId}'>
					<c:param name="backLinkPageNumber" value="${currentPageNumber}"></c:param>
				</c:url>
				
				<tr>
					<td class="text-center">${product.productId}</td>
					<td>
						<a href="${productDetailLink}">
							<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
									class="img-responsive img-thumbnail">
						</a>
					</td>
					
					<td>
						<a href="${productDetailLink}">
							<span>
								${product.productName}
							</span>
						</a>
					</td>
					<td>${product.productCategory}</td>
					
					<td>${product.productPrice}</td>
					<td>${product.productCondition}</td>
					<td>${product.productStatus}</td>
					
					<td class="text-center">${product.unitInStock}</td>
					<td>${product.productManufacturer}</td>
					
					<td>
						<a href='<spring:url value="/admin/product-form-update/${product.productId}"/>' 
								class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-pencil"/>
						</a>
					</td>
					<td>
						<a id="product-${product.productId}" data-href="<c:url value='/admin/product-delete/${product.productId}'/>"
								onclick="setDeleteLink('${product.productId}')"
								data-toggle="modal" data-target="#deleteProductDialog" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-remove"/>
						</a>
					</td>
				</tr>
				
			</c:forEach>
				 
		</table>
	</div>
	
</div> <!-- container -->


<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		