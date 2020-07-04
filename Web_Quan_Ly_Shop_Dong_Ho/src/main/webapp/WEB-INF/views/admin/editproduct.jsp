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
							<h1 class=text-center>Sửa Sản Phẩm</h1>
						</div>
						<div class="card-body">
							<form:form action="admin-saveeditProducut" method="GET"
								modelAttribute="editproduct" onsubmit="return validateFormEditProduct()">

								<div class="form-group">
									<div class="form-group">
										<%-- <form:label for="inputEmail" path="SupplierName">SupplierName</form:label> --%>
										<input type="hidden" id="" class="form-control"
											placeholder="Tên sản phẩm" required="required"
											name="ProductID" value="${editproduct.getProductID()}"
											readonly="readonly" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="ProductName">ProductName</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Tên nhà sản xuất" required="required"
											path="ProductName" name="ProductName"
											value="${editproduct.getProductName()}" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Quantity">Quantity</form:label>
										<form:input type="number" min="0" id="" class="form-control"
											placeholder="Số lượng" required="required" path="Quantity"
											name="Quantity" value="${editproduct.getQuantity()}" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Image">Image</form:label>
										<form:input type="file" id="" class="form-control"
											placeholder="Ảnh" required="required" path="Image"
											name="Image" value="${editproduct.getImage()}" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Discount">Discount</form:label>
										<form:input type="text" id="Discount" class="form-control"
											placeholder="Giảm giá (%)" required="required" path="Discount"
											name="Discount" value="${editproduct.getDiscount()}" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Price">Price</form:label>
										<form:input type="text" id="Price" class="form-control"
											placeholder="Đơn giá ($)" required="required" path="Price"
											name="Price" value="${editproduct.getPrice()}" />
									</div>
									<div class="form-group">
										<form:label for="inputEmail" path="Description">Description</form:label>
										<form:input type="text" id="" class="form-control"
											placeholder="Mô tả" required="required" path="Description"
											name="Description" value="${editproduct.getDescription()}" />
									</div>

								</div>
								
								<div>
									<form:button class="btn btn-primary" name="" id="">Sửa</form:button>
									<a class="btn btn-primary " href="admin-listproduct">Quay về</a>
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
