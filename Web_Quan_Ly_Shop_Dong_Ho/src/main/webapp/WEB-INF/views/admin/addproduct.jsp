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
					<div>
						<div class="card card-login mx-auto mt-3">
							<div class="card-header">
								<h1 class=text-center>Thêm Sản Phẩm</h1>
							</div>
							<div class="card-body">

								<form:form action="admin-saveProduct" method="GET"
									modelAttribute="saveproduct" onsubmit="return validateFormAddProduct()">

									<div class="form-group">
										<div class="form-group">
											<form:label for="inputEmail" path="ProductName">ProductName</form:label>
											<form:input type="text" id="" class="form-control"
												placeholder="Tên sản phẩm" required="required"
												path="ProductName" name="ProductName" />
										</div>
										<div class="form-group">
											<label for="inputEmail">SupplierName</label> <select
												name="listsupplier" id="listsupplier" class="form-control"  >
												<c:forEach items="${listsupplier}" var="item">
													<option id="listsupplier" value="${item.getSupplierID()}">${item.getSupplierName()}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputEmail">CategoryName</label> <select
												name="listcategory" id="listcategory" class="form-control" >
												<c:forEach items="${listcategory}" var="item">
													<option id="listcategory" value="${item.getCategoryID()}">${item.getCategoryName()}</option>
												</c:forEach>											
											</select>
										</div>

										<div class="form-group">
											<form:label for="inputEmail" path="Quantity">Quantity</form:label>
											<form:input type="number" min="0" id="Quantity" class="form-control"
												placeholder="Số lượng" required="required" path="Quantity"
												name="Quantity" />
												
										</div>
										<div style="color: red" class="text-center">
											<%=request.getAttribute("errSoLuong") != null ? "Số lợng không hợp lệ" : ""%>
											
										</div>
										<div class="form-group">
											<form:label for="inputEmail" path="Image">Image</form:label>
											<form:input type="file" id="" class="form-control"
												placeholder="Ảnh" required="required" path="Image"
												name="Image" />
										</div>
										<div class="form-group">
											<form:label for="inputEmail" path="Unit">Unit</form:label>
											<form:input type="text" id="" class="form-control"
												placeholder="Đơn vị" required="required" path="Unit"
												name="Unit" />
										</div>
										<div class="form-group">
											<form:label for="inputEmail" path="Discount">Discount</form:label>
											<form:input type="text"  id="Discount" class="form-control"
												placeholder="Giảm giá (%)" required="required" path="Discount"
												name="Discount" />
										</div>
										<div class="form-group">
											<form:label for="inputEmail" path="Price">Price</form:label>
											<form:input type="text" min="1" id="Price" class="form-control"
												placeholder="Đơn giá ($)" required="required" path="Price"
												name="Price" />
										</div>
										<div class="form-group">
											<form:label for="inputEmail" path="Description">Description</form:label>
											<%-- <form:input type="text" id="" class="form-control"
												placeholder="Mổ tả" required="required" path="Description"
												name="Description" /> --%>
												<textarea class="form-control" rows="5" cols="20" required="required" name="Description"></textarea>
										</div>

									</div>
									<div style="color: red" class="text-center">
										<%=request.getAttribute("thongbao") != null ? "Nhà Sản Xuất Đã Tồn Tại" : ""%>
										<c:if test="${param['thongbao']}">Thêm Thất Bại</c:if>
									</div>
									<div class="mt-5" style="margin: auto;">
										<form:button class="btn btn-primary" name="" id="">Thêm</form:button>
										<a class="btn btn-primary " href="admin-listproduct">Quay về</a>
									</div>
								</form:form>

							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<%@include file="/../../../common/admin/footer.jsp"%>
		</div>
	</div>



</body>
