<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/templates/header.jsp" %>

<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
	<div id="snackbar" ng-init="verifyCartExists()">
		<div ng-show="cartExists">
			<span class="glyphicon glyphicon-shopping-cart"></span>
			Item added to cart<br>
			Total: ${moneySign}{{cart.grandTotal}}
		</div>
		<div ng-hide="cartExists">
			Shopping cart not activated
		</div>
	</div>
</sec:authorize>


<c:url var="redirectingProductList" value='/customer/product/list'>
	<c:param name="destPageNumber" value="${currentPageNumber}"></c:param>
</c:url>


<div class="container">
	
	<div class="row page-header i-top-elem" style="margin-top: 10px !important;">
			<div class="col-md-8">
				<h2>
					<img alt="devices" src="${ctx}/resources/images/product-title-image.png" width="40" height="40">
					All Products in Shop
				</h2>
				<p class="lead">Don't miss out on our latest electronic selections!</p>
			</div>
			<div class="col-md-4 text-right">
				<sec:authorize access="not isAuthenticated()">
					<a href="${redirectingProductList}" class="btn btn-warning i-btn-lg" style="margin-top: 30px;">
						Sign In to Buy
					</a>
				</sec:authorize>
			</div>
	</div>
  		
	<div class="panel panel-warning">
		<table class="table table-hover">
			<thead>
				<tr class="active">
					<th class="i-wd-15"></th>
					<th class="i-wd-35">Product Name</th>
					<th class="i-wd-10">Category</th>
					<th class="i-wd-10">Condition</th>
					<th class="i-wd-10">Status</th>
					<th class="i-wd-10">Price</th>
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
					<th class="i-wd-10"></th>
					</sec:authorize>
				</tr>
			</thead>
			
			<c:forEach var="product" items="${productList}">
			
				<c:url var="productDetailLink" value='/product/detail/${product.productId}'>
					<c:param name="backLinkPageNumber" value="${currentPageNumber}"></c:param>
				</c:url>
			
				<tr>					
					<td>
						<a href="${productDetailLink}">
							<img src="${imagePath}/product-images/product_${product.productId}.png" alt="image" 
									class="img-responsive img-thumbnail">
						</a>
					</td>
					<td>
						<a href="${productDetailLink}">
							<span class="i-font-16">
								${product.productName}
							</span>
						</a>
					</td>
					<td>${product.productCategory}</td>
					<td>${product.productCondition}</td>
					<td>${product.productStatus}</td>
					<td>${moneySign} ${product.productPrice}</td>
					<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
						<td>
							<button id="add-btn-${product.productId}" class="btn btn-warning btn-sm" onclick="showToastBar('add-btn-${product.productId}');"
									ng-click="addProduct('${product.productId}'); ">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								Add
							</button>
						</td>	
					</sec:authorize>
				</tr>
			</c:forEach> 
		</table>
	</div> <!-- end of table wrapper panel -->
	
	<div class="row i-button-row i-center-child">
		<div class="col-md-6 col-md-offset-3 text-center">
			<nav aria-label="Page navigation">
				<ul class="pagination" style="margin-top: 0px !important">
						
					<c:choose>
						<c:when test="${currentPageNumber == 1}">
							<li class="disabled">
								<a aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href='<c:url value="/product/list/page/${currentPageNumber - 1}"/>' aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="pageNumber"  begin="1" end="${pageCount}" varStatus="loop">
						<c:choose>
							<c:when test="${loop.index == currentPageNumber}">
								<li class="active"><a href='<c:url value="/product/list/page/${loop.index}"/>'>${loop.index}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href='<c:url value="/product/list/page/${loop.index}"/>'>${loop.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${currentPageNumber == pageCount}">
							<li class="disabled">
								<a aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href='<c:url value="/product/list/page/${currentPageNumber + 1}"/>' aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
		<div class="col-md-3 text-right">
			<sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
				<a href='<c:url value="/customer/cart"/>' class="btn btn-warning i-btn-lg">
					<span class="badge" ng-hide="isNaN(cart.totalQuantity)">{{cart.totalQuantity}}</span>
					<span class="glyphicon glyphicon-shopping-cart"></span>
					My Cart
				</a>
			</sec:authorize>
			<sec:authorize access="not isAuthenticated()">
				<a href="${redirectingProductList}" class="btn btn-warning i-btn-lg">
					Sign In to Buy
				</a>
			</sec:authorize>
		</div>
	</div> <!-- row -->
	
</div>
    		
    		
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
    		