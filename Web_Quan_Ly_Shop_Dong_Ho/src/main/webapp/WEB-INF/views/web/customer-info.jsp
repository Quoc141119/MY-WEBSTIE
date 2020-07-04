<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Information</title>
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
		<!-- Start Contact Area -->
		<section class="htc__contact__area ptb--100 bg__white">
			<div class="container">
				<div class="row">
					<h2 class="title__line--6" style="text-align: center;">personal information</h2>
					<c:if test="${!empty sessionScope.customer}">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"
						style="margin: 0; padding: 0">
						<div class="address__details">
							<h2 class="ct__title">Full Name</h2>
							<p>${customer.getCustomerName() }</p>
							<br>
							<h2 class="ct__title">Email</h2>
							<p>${customer.getEmail() }</p>
							<br>
							<h2 class="ct__title">Phone Number</h2>
							<p>${customer.getPhone() }</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"
						style="margin: 0; padding: 0">
						<div class="address__details">
							<h2 class="ct__title">User Name</h2>
							<p>${customer.getUsername() }</p>
							<br>
							<h2 class="ct__title">Address</h2>
							<p>${customer.getAddress() }</p>
							<br>
							<h2 class="ct__title">Country</h2>
							<p>${customer.getCountry() }</p>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
					</c:if>
				</div>
				<div class="row" style="height: 50px; text-align: center; margin-top: 20px;">
					<a href="${pageContext.request.contextPath}/customer/info/edit" class="fv-btn" style="font-size: 30px;">Update</a>
				</div>
			</div>
		</section>
		<!-- End Contact Area -->

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