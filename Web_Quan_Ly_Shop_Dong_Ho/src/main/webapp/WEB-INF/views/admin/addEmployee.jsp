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
							<h1 class=text-center>Thêm Nhân Viên</h1>
						</div>
						<div class="card-body">
						<form method="POST" id="addEmployee" action="admin-addEmployee">
							<div class="form-group">
								<label for="username">Username:</label> <input name="acc"
									class="form-control" value='<c:if test="${not empty acc }">${acc.get(0) }</c:if>' id="username" required
									placeholder="Enter username" />
							</div>
							<c:if test="${not empty message }">
								<div class="alert alert-warning">
									<strong>Warning!</strong> ${message }
								</div>
							</c:if>
							<div class="form-group">
								<label for="password">Password:</label> <input name="acc"
									class="form-control" type="password" id="password" required value='<c:if test="${not empty acc }">${acc.get(1) }</c:if>'
									placeholder="Enter password" />
							</div>
							<div class="form-group">
								<label for="role">Role:</label> <select name="acc" id="fname">
									<option value="0">Nhân viên</option>
									<option value="1">Admin</option>
								</select>
							</div>
							<div class="form-group">
								<label for="lname">Last name:</label> <input name="acc"
									class="form-control" id="lname" value='<c:if test="${not empty acc }">${acc.get(3) }</c:if>' required
									placeholder="Enter lastname" />
							</div>
							<div class="form-group">
								<label for="fname">First name:</label> <input name="acc"
									class="form-control" id="fname" value='<c:if test="${not empty acc }">${acc.get(4) }</c:if>' required
									placeholder="Enter first name" />
							</div>
							<div class="form-group">
								<label for="phone">Phone:</label> <input type="tel" pattern="[0-9]{10}" name="acc"
									class="form-control" id="phone" value='<c:if test="${not empty acc }">${acc.get(5) }</c:if>' required
									placeholder="Enter phone" />
							</div>
							<div class="form-group">
								<label>Email:</label> <input type="email" name="acc"
									class="form-control" id="email" value='<c:if test="${not empty acc }">${acc.get(6) }</c:if>' required
									placeholder="Enter email" />
							</div>
							<div class="form-group">
								<label for="birthDate">Birth date:</label> <input type="date"
									name="acc" class="form-control" value='<c:if test="${not empty acc }">${acc.get(7) }</c:if>' id="birthDate" required
									placeholder="Enter birth date" />
							</div>
							<c:if test="${not empty messageDate }">
								<div class="alert alert-warning">
									<strong>Warning!</strong> ${messageDate }
								</div>
							</c:if>
							<div class="form-group">
								<label for="photo">Photo: </label> <input type="file"
									name="acc" class="form-control" id="photo" required
									placeholder="Enter photo" />
							</div>
							<div class="form-group">
								<label for="notes">Notes:</label> 
								<textarea name="acc" class="form-control" id="notes" rows="3" cols="10"><c:if test="${not empty acc }">${acc.get(9) }</c:if></textarea>
							</div>
						</form>
						<input type="submit" form="addEmployee"
							class="btn btn-primary mr-2" value="Lưu" /> 
							<a class="btn btn-primary" href="admin-listEmployee">Quay về </a>
					</div>
				</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>
	</div>



</body>
