<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/../../../common/admin/header.jsp"%>


<body id="page-top">
	<%@include file="/../../../common/admin/nav.jsp"%>
	<div id="wrapper">
		<c:if test="${employeeSession.getAccount().getRole() eq 1 }">
			<%@include file="/../../../common/admin/menu.jsp"%>
		</c:if>
		<c:if test="${employeeSession.getAccount().getRole() eq 0 }">
			<%@include file="/../../../common/admin/menuEmployee.jsp"%>
		</c:if>

		<div id="content-wrapper">
			<div>
				<div class="container">
					<div class="row mb-5">
						<h1 style="margin: auto;">Thông Tin Khách Hàng</h1>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-6">
							<table style="width: 100%;" class="mb-3 table table-lg table-info">
								<tr>
									<td>CustomerId:</td>
									<td>${customer.customerId }</td>
								</tr>
								<tr>
									<td>Username:</td>
									<td>${customer.username }</td>
								</tr>
								<tr>
									<td>Password:</td>
									<td>********</td>
								</tr>
								<tr>
									<td>Customer name:</td>
									<td>${customer.customerName }</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${customer.email }</td>
								</tr>
								<tr>
									<td>Phone:</td>
									<td>${customer.phone }</td>
								</tr>
								<tr>
									<td>Address:</td>
									<td>${customer.address }</td>
								</tr>
								<tr>
									<td>Country:</td>
									<td>${customer.country }</td>
								</tr>
							</table>
							<a class="btn btn-warning btn-block" href="${list }">Quay về</a>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>

	</div>


</body>
