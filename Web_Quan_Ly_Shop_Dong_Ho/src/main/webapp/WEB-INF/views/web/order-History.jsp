<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Order History</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<%@ include file="/common/web/taglib.jsp"%>
<style type="text/css">
.buttons-cart input {
	background: #ebebeb none repeat scroll 0 0;
	color: #3f3f3f;
	font-family: 'Poppins', sans-serif;
	font-size: 12px;
	font-weight: 500;
	height: 62px;
	line-height: 62px;
	padding: 0 45px;
	text-transform: uppercase;
	display: inline-block;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- Header -->
		<%@ include file="/common/web/header.jsp"%>
		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area"
			style="background: rgba(0, 0, 0, 0) url(<c:url value='/static/images/bg/bg.jpg' />) no-repeat scroll center center / cover ;">
			<div class="ht__bradcaump__wrap">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="bradcaump__inner">
								<nav class="bradcaump-inner">
									<a class="breadcrumb-item" href="index.html">Home</a> <span
										class="brd-separetor"><i
										class="zmdi zmdi-chevron-right"></i></span> <span
										class="breadcrumb-item active">shopping cart</span>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->
		<!-- cart-main-area start -->
		<div class="cart-main-area ptb--100 bg__white">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form action="${pageContext.request.contextPath}/cart/update"
							method="post">
							<div class="table-content table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product-name"><span class="nobr">Order
													ID</span></th>
											<th class="product-price"><span class="nobr">Order
													Date</span></th>
											<th class="product-stock-stauts"><span class="nobr">
													Order Time</span></th>
											<th class="product-add-to-cart"><span class="nobr">Total
													Price</span></th>
											<th class="product-add-to-cart"><span class="nobr"></span>Status</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstOrderHistory}">
											<c:forEach var="order" items="${lstOrderHistory}">
												<tr>
													<td class="product-order-id"><a href="#">${order.getOrderID()}</a></td>
													<td class="product-order-date"><span
														class="wishlist-in-stock">${order.getOrderDate()}</span></td>
													<td class="product-order-time"><span
														class="wishlist-in-stock">${order.getTime()}</span></td>
													<td class="product-order-price"><span class="amount">$${order.getTotalPrice()}</span></td>
													<td class="product-stock-status"><span
														class="wishlist-in-stock" style="text-transform: uppercase;">${order.getStatus()}</span></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- cart-main-area end -->

		<!-- Start Brand Area -->
		<div class="htc__brand__area bg__cat--4">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="ht__brand__inner">
							<ul class="brand__list owl-carousel clearfix">
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/1.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/2.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/3.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/4.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/5.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/5.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/1.png'/>"
										alt="brand images"></a></li>
								<li><a href="#"><img
										src="<c:url value='/static/images/brand/2.png'/>"
										alt="brand images"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Brand Area -->
		<!-- Footer -->
		<%@ include file="/common/web/footer.jsp"%>
	</div>

	<%@ include file="/common/web/scriptslib.jsp"%>
</body>
</html>