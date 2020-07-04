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
							<h1 class=text-center>Sửa Danh Mục</h1>
						</div>
						<div class="card-body">
							<form:form action="admin-saveeditCategory" method="GET" modelAttribute="editcategory"> 
								<div class="form-group">
									<div class="form-group">
									<%--  <form:label for="inputEmail" path="CategoryID">Mã Danh Mục</form:label> --%>
										<input type="hidden" id="" class="form-control"
											placeholder="Tên danh mục" required="required"  name="CategoryID" value = "${editcategory.getCategoryID() }" readonly="readonly"  />
									</div>
								</div>
								<div class="form-group">
									<div class="form-group">
									 <form:label for="inputEmail" path="CategoryName">Tên Danh Mục</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Tên danh mục" required="required" path="CategoryName" name="CategoryName" value = "${editcategory.getCategoryName() }" />
									</div>
								</div>
								<c:if test="${not empty thongbao }">
								<div style="color: red" class="text-center alert alert-warning">
									<%=request.getAttribute("thongbao") != null ? "Danh Mục Đã Tồn Tại" : ""%>									
								</div>
								</c:if>
								<div>
									<form:button class="btn btn-primary" name="" id="">Sửa</form:button>
									<a class="btn btn-primary " href="admin-listcategory">Quay về</a>
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
