<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<!-- Modal Dialog -->
<div class="modal fade" id="cancelEditingDialog" tabindex="-1" role="dialog" aria-labelledby="cancelEditingDialog">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content i-modal-content">
			<div class="modal-body i-modal-body">
				Modifications made on product won't be saved. Sure to cancel?
			</div>
			<div class="modal-footer i-center-parent">
				<button type="button" class="btn btn-default i-btn-xsm" data-dismiss="modal">No</button>
				<a id="deleteInventoryConfirmBtn" class="btn btn-primary i-btn-xsm" 
						href='<spring:url value="/admin/product-inventory"/>'>Yes</a>
			</div>
		</div>
	</div>
</div>


<div class="container i-wd-50">
	<div class="page-header -i-top-elem">
		<h2>
			<span class="glyphicon glyphicon-pencil"></span>
			Product Information
		</h2>
	</div>
	
	
	<div class="jumbotron">
		<form:form action="submit" modelAttribute="product" enctype="multipart/form-data" method="post">
					
			<form:hidden path="productId"/>
			
			<div class="form-group">
				<label>Name: </label>
				<form:errors path="productName" cssStyle="color: #ff0000;"/>
				<form:input path="productName" class="form-control"/>
			</div>
			
			<div class="form-group row">
				<div class="col-md-3">
					<img alt="image" src="${imagePath}/product-images/product_${product.productId}.png" 
							class="img-responsive img-thumbnail">
				</div>
				<div class="col-md-9">
					<div class="form-group">
						<label class="control-label">Upload a product image:</label>
						<form:input type="file" path="productImage" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label>Category: </label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" value="iPad"/>
					iPad
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" value="Apple Mac"/>
					Apple Mac
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" value="Apple Watch"/>
					Apple Watch
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" value="Accessory"/>
					Accessory
				</label>
			</div>
			
			<div class="form-group">
				<label>Description: </label>
				<form:textarea path="productDescription" class="form-control" rows="5"/>
			</div>
			
			<div class="form-group">
				<label>Price: </label>
				<form:errors path="productPrice" cssStyle="color: #ff0000;"/>
				<form:input path="productPrice" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label>Condition: </label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCondition" value="New"/>
					New
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCondition" value="Used"/>
					Used
				</label>
			</div>
			
			<div class="form-group">
				<label>Status: </label>
				<label class="checkbox-inline">
					<form:radiobutton path="productStatus" value="In Stock"/>
					In Stock
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productStatus" value="Not Available"/>
					Not Available
				</label>
			</div>
			
			<div class="form-group">
				<label>Unit in Stock: </label>
				<form:errors path="unitInStock" cssStyle="color: #ff0000;"/>
				<form:input path="unitInStock" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label>Manufacturer: </label>
				<form:input path="productManufacturer" class="form-control"/>
			</div>
			
			<br>
			
			<div class="text-center">
				<a data-toggle="modal" data-target="#cancelEditingDialog"
						class="btn btn-default i-btn-sm" style="margin-right: 20px;">
					Cancel
				</a>
				<input type="submit" value="OK" class="btn btn-primary i-btn-sm"/>
			</div>
			
		</form:form>
	</div>
</div> <!-- container -->


<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		