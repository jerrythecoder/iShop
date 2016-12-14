<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">

	<div class="page-header i-top-elem">
		<h2 class="header-msg-default">
			<span class="glyphicon glyphicon-list-alt"></span>
			My Orders
		</h2>
		<p class="text-right i-center-child i-font-18">
			<span class="label label-primary">Total Orders: ${orderTotalCount}</span>
		</p>
	</div>
	
	<c:choose>
		<c:when test="${empty orderList}">
			<div class="jumbotron i-flow-jumbotron text-center">
				<p>
					<span class="glyphicon glyphicon-exclamation-sign"></span>
					You don't have any order yet.
				</p>
			</div>
		</c:when>
	</c:choose>
	
	<c:forEach var="order" items="${orderList}">
		<div class="panel panel-info i-order-panel i-center-child">
		
			<div class="panel-heading i-order-panel-heading">
				<div class="row">
					<div class="col-md-3">
						<p><span class="i-font-bold">Ordered on: </span>${order.creationTime}</p>
					</div>
					<div class="col-md-3">
						<p><span class="i-font-bold">Ordered ID: </span>${order.orderId}</p>
					</div>
				</div>
			</div>
			
			<div class="panel-body text-center">
				<div class="row">
				
					<div class="col-md-6">
						<div class="panel panel-default">
    						<table class="table table-condensed">
    							<c:forEach var="item" items="${order.orderItems}">
    								<tr>
    									<td class="i-wd-10">
											<div class="thumbnail text-center i-thumbnail" style="width: 80px;">
												<div class="i-img-wrapper" style="height: 50px;">
													<img src="${imagePath}/product-images/product_${item.itemProductId}.png" alt="image" 
															class="img-responsive img-thumbnail i-img">
												</div>
											</div>
    									</td>
    									<td class="i-wd-50">${item.itemProductName}</td>
    									<td class="i-wd-30">x ${item.itemProductQuantity}</td>
    								</tr>
    							</c:forEach>
    						</table>
    					</div>
					</div> <!-- left col -->
					
					<div class="col-md-6">
						<div class="panel panel-default">
							<table class="table table-condensed table-bordered">
								<tr>
									<th class="i-wd-30 text-center">Total paid</th>
									<th class="i-wd-40 text-center">Shipped to</th>
									<th class="i-wd-30 text-center">Order status</th>
								</tr>
								<tr>
									<td>${moneySign} ${order.grandTotal}</td>
									<td>${order.recipientFirstName} ${order.recipientLastName}</td>
									<td>${order.orderStatus}</td>
								</tr>
							</table>
						</div>
					
						<a href="<c:url value='/customer/order/detail/${order.orderId}'/>" class="-btn -btn-link -i-btn-md i-font-16">
							<span class="glyphicon glyphicon-th-list"></span>
							View Order Detail
						</a>
					</div> <!-- right col -->
				</div> <!-- row -->
			</div> <!-- order panel body -->
			
		</div> <!-- order panel -->
	</c:forEach>
	
	
	<div class="row i-button-row i-center-child">
		<div class="col-md-3 text-left">
			<a href="<c:url value='/customer/home'/>" class="btn btn-warning i-btn-lg text-center">
				Back to Customer Home
			</a>
		</div>
		<div class="col-md-6 text-center">
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
								<a href='<c:url value="/customer/order/list/page/${currentPageNumber - 1}"/>' aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="pageNumber"  begin="1" end="${pageCount}" varStatus="loop">
						<c:choose>
							<c:when test="${loop.index == currentPageNumber}">
								<li class="active"><a href='<c:url value="/customer/order/list/page/${loop.index}"/>'>${loop.index}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href='<c:url value="/customer/order/list/page/${loop.index}"/>'>${loop.index}</a></li>
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
								<a href='<c:url value="/customer/order/list/page/${currentPageNumber + 1}"/>' aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
		<div class="col-md-3 text-right">
			<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
				Keep Shopping
			</a>
		</div>
	</div>	
</div> <!-- container -->

<%@ include file="/WEB-INF/views/templates/footer.jsp" %>