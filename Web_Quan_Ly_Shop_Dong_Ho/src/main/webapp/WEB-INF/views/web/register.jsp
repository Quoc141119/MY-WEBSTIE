<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Register</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/common/web/taglib.jsp"%>
<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/fontawesome-free/css/all.min.css' />" />

<!-- Custom styles for this template-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/css/sb-admin.css' />" />
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<c:url value='/static/images/icons/favicon.ico'/>" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/css/bootstrap.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/fontawesome-free/css/fontawesome.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/fonts/icon-font.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/animate/animate.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/css-hamburgers/hamburgers.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/animsition/css/animsition.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/select2/select2.min.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value='/static/vendor/daterangepicker/daterangepicker.css' />" />
<!--===============================================================================================-->
<link rel="stylesheet" href="<c:url value='/static/css/util.css' />" />
<link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
<!--===============================================================================================-->
<style type="text/css">
.form-label-group {
	padding: 0 20px;
	width: 100%;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #eee;
}

.form-label-group input {
	width: 111%;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #eee;
	margin-left: -22px;
}

.form-register {
	margin-top: -160px;
	font-size: 11px;
}
</style>
</head>
<body style="background-color: #666666;">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form
					action="${pageContext.request.contextPath}/customer/register"
					modelAttribute="customer" method="POST"
					class="login100-form validate-form form-register"
					onsubmit="return customerValidate();">
					<span class="login100-form-title p-b-20"> Register Account </span>
					<label style="color: #888686;">Full Name</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="customerName" />
						</div>
					</div>
					<label style="color: #888686;">User Name</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="username" type="text" />
						</div>
					</div>
					<label style="color: #888686;">Password</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="password" type="password" />
						</div>
					</div>
					<label style="color: #888686;">Email</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="email" type="email" />
						</div>
					</div>
					<label style="color: #888686;">Phone</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="phone" type="text" />
						</div>
					</div>
					<label style="color: #888686;">Address</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="address" />
						</div>
					</div>
					<label style="color: #888686;">Country</label>
					<div class="form-group">
						<div class="form-label-group">
							<form:input path="country" />
						</div>
					</div>
					<c:if test="${param['error']}">
						<div class="alert alert-danger" role="alert">Username available!</div>
					</c:if>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Register</button>
					</div>
					<div class="text-center p-t-20 p-b-20">
						<a href="${pageContext.request.contextPath}/customer/login"
							class="txt1">Login</a>
					</div>
				</form:form>
				<div class="login100-more"
					style="background-image: url(<c:url value='/static/images/bg/bg-login.jpg' />);">
				</div>
			</div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script src="<c:url value='/static/vendor/js/jquery-3.2.1.min.js' />"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/static/vendor/animsition/js/animsition.min.js' />"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/static/vendor/bootstrap/js/popper.js' />"></script>
	<script
		src="<c:url value='/static/vendor/bootstrap/js/bootstrap.min.js' />"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/static/vendor/select2/select2.min.js' />"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/static/vendor/daterangepicker/moment.min.js' />"></script>
	<script
		src="<c:url value='/static/vendor/daterangepicker/daterangepicker.js' />"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/static/vendor/countdowntime/countdowntime.js' />"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/static/js/main.js' />"></script>

	<%@ include file="/common/web/scriptslib.jsp"%>
</body>
</html>