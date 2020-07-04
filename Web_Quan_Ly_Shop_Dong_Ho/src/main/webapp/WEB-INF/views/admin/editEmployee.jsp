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
					<div class="card mx-auto mt-3">
						<div class="card-header">
							<h1 class=text-center>Thông Tin Cá Nhân</h1>
						</div>
						<div class="card-body">
							<form method="POST" id="editEmployee" action="admin-editEmployee">
								<div class="row">
									<div class="col-5">
											<div class="form-group">
												<input type="hidden" value="${employeeSession.employeeID }" name="acc"/>
											</div>
											<div class="form-group">
												<label for="lname">Last name:</label>
												<input name="acc" value="${employeeSession.lastName }" class="form-control"
													id="lname" required placeholder="Enter lastname" />
											</div>
											<div class="form-group">
												<label for="fname">First name:</label> <input name="acc"
													value="${employeeSession.firstName }" class="form-control"
													id="role" required placeholder="Enter first name" />
											</div>
											<div class="form-group">
												<label for="phone">Phone:</label> <input type="tel" pattern="[0-9]{10}" name="acc"
													value="${employeeSession.phone }" class="form-control"
													id="phone" required placeholder="Enter phone" />
											</div>
											<div class="form-group">
												<label for="email">Email:</label> <input type="email" name="acc"
													value="${employeeSession.email }" class="form-control"
													id="email" required placeholder="Enter email" />
											</div>
											<div class="form-group">
												<label for="birthDate">BirthDate:</label>
												<input type="date" name="acc" value="${employeeSession.birthDate.toString().substring(0, 10) }" class="form-control" id="birthDate" required placeholder="Enter birth date" />
											</div>
											<c:if test="${not empty message }">
												<div class="alert alert-warning">
													<strong>Warning!</strong> ${message }
												</div>
											</c:if>
											<div class="form-group">
												<label for="notes">Notes:</label> <input name="acc"
													value="${employeeSession.notes }" class="form-control"
													id="notes" placeholder="Enter notes" />
											</div>
									</div>
									<div class="col-7">
										<div class="row">
											<div class="col-6">
												<div class="form-group">
													<input type="hidden" name="acc" value="${employeeSession.account.getAccountID() }" /> 
												</div>
												<div class="form-group">
													<label for="notes">Username:</label> 
													<input name="acc" readonly class="form-control" value="${employeeSession.account.getUsername() }" />
												</div>
												<div class="form-group">
													<label for="notes">Password:</label> 
													<input readonly value="********" class="form-control" id="notes">
													<input type="hidden" name="acc"  value="${employeeSession.account.getPassword() }" />
												</div>
												<div class="form-group">
													<input type="hidden" name="acc" value="${employeeSession.account.getRole()}"> 
												</div>
												<a class="btn btn-secondary mt-3" href="admin-ShowChangePass?message">Đổi mật khẩu</a>
											</div>
											<div class="col-6 p-3 pt-4">
												<img alt="avatar" class="rounded-circle"
													src="${employeeSession.photo }" style="width: 100%; max-height: 400px;"> <input
													type="file" name="acc" class="form-control mt-2" placeholder="Change image" /> 
											</div>
											<div class="mt-5" style="margin: auto;">
												<input type="submit" form="editEmployee" class="btn btn-primary mr-2 mt-3" value="Lưu Thay Đổi" /> 
												<a class="btn btn-primary mt-3" href="admin-home">Quay về</a>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>

	</div>


</body>
