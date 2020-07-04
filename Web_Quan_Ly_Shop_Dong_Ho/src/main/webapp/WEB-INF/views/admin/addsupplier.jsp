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
					<div class="card card-login mx-auto mt-5 col-6">
						<div class="card-header">
							<h1 class=text-center>Thêm Nhà Sản Xuất</h1>
						</div>
						<div class="card-body">
							<form:form action="admin-saveSupplier" method="GET"
								modelAttribute="savesupplier">

								<div class="form-group">
									<div class="form-group">
										<form:label for="inputEmail" path="SupplierName">SupplierName</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Tên nhà sản xuất" required="required"
											path="SupplierName" name="SupplierName" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Address">Address</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Địa chỉ" required="required" path="Address"
											name="Address" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Country">Country</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Quốc Gia" required="required" path="Country"
											name="Country" />
									</div>

								</div>
								<c:if test="${not empty thongbao }">
								<div style="color: red" class="text-center alert alert-warning">
									<%=request.getAttribute("thongbao") != null ? "Nhà Sản Xuất Đã Tồn Tại" : ""%>									
								</div>
								</c:if>
								<div>
									<form:button class="btn btn-primary" name="" id="">Thêm</form:button>
									<a class="btn btn-primary " href="admin-listsupplier">Quay về</a>
								</div>
							</form:form>

						</div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>
	</div>



</body>
