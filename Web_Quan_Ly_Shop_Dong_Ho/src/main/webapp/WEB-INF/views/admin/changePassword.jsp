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
					<div class="card card-login mx-auto mt-3">
						<div class="card-header">
							<h1 class=text-center>Đổi Mật Khẩu</h1>
						</div>
						<div class="card-body">
							<form action="admin-changePass" method="post">
								<div class="form-group">
									<label for="inputEmail" path="CategoryName">Mật khẩu
										cũ:</label> <input type="password" class="form-control"
										required="required" path="CategoryName" name="oldPass" />
								</div>
								<div class="form-group">
									<label for="inputEmail" path="CategoryName">Mật khẩu
										mới</label> <input type="password" class="form-control"
										required="required" path="CategoryName" name="newPass" />
								</div>
								<div class="form-group">
									<label for="inputEmail" path="CategoryName">Nhập lại
										mật khẩu mới</label> <input type="password" class="form-control"
										required="required" path="CategoryName" name="comfirmPass" />
								</div>
								<c:if test="${not empty message }">
									<div style="color: red" class="text-center alert alert-warning">
										${message }</div>
								</c:if>
								<div style="margin: auto;">
									<button class="btn btn-primary btn-block">Lưu</button>
									<a href="admin-information?message" class="btn btn-primary btn-block">Hủy</a>
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
