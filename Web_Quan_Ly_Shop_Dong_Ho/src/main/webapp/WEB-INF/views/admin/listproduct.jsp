<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/../../../common/admin/header.jsp"%> 

<body id="page-top">
	<%@include file="/../../../common/admin/nav.jsp"%>

	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="/../../../common/admin/menu.jsp"%>
		
		<div id="content-wrapper">
			<div class="container-fluid">
				<h1 class=text-center>Danh Sách Sản Phẩm</h1>
			<div class="pt-4 pl-3 row">

				<form class="form-inline" action="admin-searchProduct" method="get" onsubmit="return validateFormSearch() ">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Tên Sản Phẩm" name="search" id="search" style="width: 840px;">
					<button class="btn btn-success" type="submit" name="">Search</button>
				</form>
				<form class="form-inline mr-sm-2 pl-1">
					<a class="btn btn-primary btn-block" href="admin-addproduct">Thêm
						Sản Phẩm</a>
				</form>
			</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh Sách Sản Phẩm
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Image</th>
										<th>ProductName</th>
										<th>Quantity</th>
										<th>Unit</th>
										<th>Discount</th>
										<th width="100px">Price</th>
										<th >Actions</th>
										<th >Actions</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Image</th>
										<th>ProductName</th>
										<th>Quantity</th>
										<th>Unit</th>
										<th>Discount</th>
										<th>Price</th>
										<th >Actions</th>
										<th >Actions</th>
									</tr>
								</tfoot>
								<tbody>
								<c:forEach items="${listproduct }" var="item">
									<tr>
										<td><img alt=""
										src="${pageContext.request.contextPath}${item.getImage()}"
										width="100px" height="100px"></td>
										<td>${item.getProductName() }</td>
										<td>${item.getQuantity() }</td>
										<td>${item.getUnit() }</td>
										<td>${item.getDiscount() }</td>
										<td>${item.getPrice()}</td>
										<td><a class="btn btn-outline-danger"
										href="admin-deleteproduct?id=${item.getProductID()}"
										onclick="return confirm('Bạn có muốn xóa?')">Delete</a></td>
										<td><a class="btn btn-outline-warning"
										href="admin-editproduct?id=${item.getProductID()}">Edit</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>						
				</div>		
			</div>
			<!-- /.container-fluid -->
			<hr>
			<!-- Sticky Footer -->
			<%@include file="/../../../common/admin/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>
	