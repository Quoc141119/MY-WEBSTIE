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

		<div id="content-wrapper" >
			<div>
				<div class="container">
					<div class="row mb-5">
						<h1 style="margin: auto;">Thông Tin Nhân Viên</h1>
					</div>
					<div class="row">
						<div class="col-2"></div>
						<div class="col-5">
							<table style="width: 100%;" class="mb-3 table table-lg table-info">
								<tr>
									<td>AccountID:</td>
									<td>${employee.getAccount().accountID }</td>
								</tr>
								<tr>
									<td>Username:</td>
									<td>${employee.getAccount().username }</td>
								</tr>
								<tr>
									<td>Password:</td>
									<td>********</td>
								</tr>
								<tr>
									<td>Role:</td>
									<c:if test="${employee.getAccount().role eq 1}"><td>Admin</td></c:if>
									<c:if test="${employee.getAccount().role eq 0}"><td>Employee</td></c:if>
								</tr>
								<tr>
									<td>EmployeeID:</td>
									<td>${employee.employeeID }</td>
								</tr>
								<tr>
									<td>Last name:</td>
									<td>${employee.lastName }</td>
								</tr>
								<tr>
									<td>First name:</td>
									<td>${employee.firstName }</td>
								</tr>
								<tr>
									<td>Phone:</td>
									<td>${employee.phone }</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${employee.email }</td>
								</tr>
								<tr>
									<td>Birth date:</td>
									<td>${employee.birthDate.toString().substring(0,10) }</td>
								</tr>
								<tr>
									<td>Notes:</td>
									<td>${employee.notes }</td>
								</tr>
							</table>
						</div>
						<div class="col-3" style="margin: auto; padding: auto;">
							<img alt="avatar" class="rounded-circle" src="${employee.photo }" style="width: 300px;max-height: 400px;">
							<a class="btn btn-primary btn-block ml-4 mt-5" href="${list }">Quay về</a>
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>

	</div>


</body>
