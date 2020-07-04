<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

.contact-box label{
	width: 100px !important;
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
            		<div class="col-md-1">
            		</div>
					<div class="col-md-8">
						<c:if test="${param.status == 'success' }">
							<div class="alert alert-success" role="alert">Success!</div>
						</c:if>
						<c:if test="${param.status == 'error' }">
							<div class="alert alert-danger" role="alert">Error!</div>
						</c:if>
					</div>
				</div>
                <div class="row" style="text-align: center;">
                	<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12">
            		</div>
                    <div class="contact-form-wrap mt--60 col-lg-11 col-md-11 col-sm-12 col-xs-12">
                        <div class="col-xs-12">
                            <div class="contact-title">
                                <h2 class="title__line--6">Update Infomation</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <form:form action="${pageContext.request.contextPath}/customer/info/edit" 
                            method="POST" modelAttribute="customer">
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                    	<label style="color: #888686;">Full Name</label>
                                        <form:input path="customerName" placeholder = "Full Name"/>
                                        <label style="color: #888686;">Country</label>
                                        <form:input path="country" placeholder = "Country"/>
                                    </div>
                                </div>
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                    	<label style="color: #888686;">Email</label>
                                        <form:input path="email" placeholder = "Email"/>
                                        <label style="color: #888686;">Password</label>
                                        <form:input path="password" type="password" placeholder = "Password"/>                                    </div>
                                </div>
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                    	<label style="color: #888686;">Phone</label>
                                        <form:input path="phone" placeholder = "Phone number"/>
                            			<label style="color: #888686;">Address</label>
                                        <form:input path="address" placeholder = "Address"/>
                                    </div>
                                </div>
                                <div class="contact-btn">
                                    <button type="submit" class="fv-btn">Save</button>
                                </div>
                            </form:form>
                            <div class="form-output">
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div> 
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