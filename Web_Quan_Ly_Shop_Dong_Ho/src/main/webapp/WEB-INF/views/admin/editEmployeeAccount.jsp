<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/../../../common/admin/header.jsp"%>


<body id="page-top">
	<%@include file="/../../../common/admin/nav.jsp"%>
	<div id="wrapper">
		<%@include file="/../../../common/admin/menu.jsp"%>

		<div id="content-wrapper">



			<div>
				<div class="container">
					<div class="card card-login mx-auto mt-3">
						<div class="card-header">
							<h1 class=text-center>Sửa Tài Khoản</h1>
						</div>
						<div class="card-body">
							<form:form method="POST" id="editAccount"
								action="admin-editEmployeeAccount" modelAttribute="account">
								<div class="form-group">
									<form:label for="accountID" path="accountID">CustomerId:</form:label>
									<form:input readonly="true" type="number" path="accountID"
										class="form-control" id="accountID" />
								</div>
								<div class="form-group">
									<form:label for="username" path="username">Username:</form:label>
									<form:input path="username" readonly="true" class="form-control" id="username" />
								</div>
								<c:if test="${not empty message }">
									<div class="alert alert-warning">
										<strong>Warning!</strong> ${message }
									</div>
								</c:if>
								<div class="form-group">
									<form:hidden path="password" class="form-control" id="password"/>
								</div>
								<div class="form-group">
									<form:label for="role" path="role">Role:</form:label>
									<form:select path="role" id="role">
										<c:if test="${account.getRole() eq 0}">
											<form:option value="0">Nhân viên</form:option>
											<form:option value="1">Admin</form:option>
										</c:if>
										<c:if test="${account.getRole() eq 1}">
											<form:option value="1">Admin</form:option>
											<form:option value="0">Nhân viên</form:option>
										</c:if>
									</form:select>
								</div>
							</form:form>
							<input type="submit" form="editAccount"
								class="btn btn-primary mr-2" value="Lưu" /> <a
								class="btn btn-primary" href="admin-listEmployee">Quay về</a>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>

	</div>


</body>
