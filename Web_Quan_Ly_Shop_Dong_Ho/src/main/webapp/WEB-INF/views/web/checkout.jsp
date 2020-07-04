<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<%@ include file="/common/web/taglib.jsp"%>
<style type="text/css">
.btn_checkout_buy {
	background-color: #000;
	border: 1px solid #000;
	color: #fff;
	font-size: 14px;
	height: 57px;
	line-height: 57px;
	margin-bottom: 15px;
	padding: 0 25px;
	text-align: center;
	text-transform: none;
	transition: all 0.5s ease 0s;
	width: 100%;
	display: block;
}

.btn_checkout_buy:hover {
	background: #c43b68;
	border: 1px solid #c43b68;
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
										class="breadcrumb-item active">checkout</span>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->
		<c:set var="tax" value="0"></c:set>
		<c:set var="shipping" value="0"></c:set>
		<c:set var="total_bill" value="${totalPrice + tax + shipping}"></c:set>
		<!-- cart-main-area start -->
		<div class="checkout-wrap ptb--100">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<c:if test="${param.status == 'success' }">
							<div class="alert alert-success" role="alert">Success!</div>
						</c:if>
						<c:if test="${param.status == 'error' }">
							<div class="alert alert-danger" role="alert">Shop now!</div>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="checkout__inner">
							<div class="accordion-list">
								<div class="accordion">
									<div class="accordion__title">Billing Information</div>
									<div class="accordion__body">
										<div class="bilinfo">
											<c:if test="${not empty sessionScope.customer}">
												<form
													action="${pageContext.request.contextPath}/checkout/buy"
													method="POST">
													<div class="row">
														<div class="col-md-12">
															<div class="single-input">
																<input type="text" name="customerName"
																	placeholder="Họ tên"
																	value="${customer.getCustomerName() }">
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<input type="email" name="email"
																	placeholder="Email address"
																	value="${customer.getEmail()}">
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<input type="text" name="phone"
																	placeholder="Phone number"
																	value="${customer.getPhone()}">
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<select name="bil-city" id="bil-city">
																	<option value="City">City</option>
																	<option value="Hà Nội">Hà Nội</option>
																	<option value="Hồ Chí Minh">Hồ Chí Minh</option>
																	<option value="Đà Nẵng">Đà Nẵng</option>
																	<option value="Huế">Huế</option>
																	<option value="Quảng Bình">Quảng Bình</option>
																</select>
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<select name="bil-district" id="bil-district">
																	<option value="">District</option>
																	<option value="Quận 3">Quận 3</option>
																	<option value="Quận 5">Quận 5</option>
																	<option value="Quận Tân Bình">Quận Tân Bình</option>
																</select>
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<input type="text" name="address" placeholder="Address">
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<select name="bil-payment" id="bil-payment">
																	<option value="Payment">Payment</option>
																	<option value="Master Card">Master Card</option>
																	<option value="Papal">Papal</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<div class="single-input">
																<input type="text" name="notes" placeholder="Notes: ">
															</div>
														</div>
														<div class="col-md-12">
															<div class="single-input">
																<input type="hidden" name="total_bill"
																	value="${total_bill}" /> <input type="submit"
																	value="Buy" class="btn_checkout_buy">
															</div>
														</div>
													</div>
												</form>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="order-details">
							<h5 class="order-details__title">Your Order</h5>
							<div class="order-details__count">
								<div class="order-details__count__single">
									<h5>sub total</h5>
									<span class="price">$<c:out value="${totalPrice}"></c:out></span>
								</div>
								<div class="order-details__count__single">
									<h5>Tax</h5>
									<span class="price">$<c:out value="${tax}"></c:out></span>
								</div>
								<div class="order-details__count__single">
									<h5>Shipping</h5>
									<span class="price">$<c:out value="${shipping}"></c:out></span>
								</div>
							</div>
							<div class="ordre-details__total">
								<h5>Order total</h5>
								<span class="price">$<c:out value="${total_bill}"></c:out></span>
							</div>
						</div>
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