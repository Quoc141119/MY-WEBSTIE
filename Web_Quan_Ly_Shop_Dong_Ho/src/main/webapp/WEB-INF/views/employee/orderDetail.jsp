<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/../../../common/admin/header.jsp"%>

<body id="page-top">
	<%@include file="/../../../common/admin/nav.jsp"%>

	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="/../../../common/admin/menuEmployee.jsp"%>

		<div id="content-wrapper">
			<div class="container-fluid">
				<h1 class=text-center>Chi Tiết Đơn Hàng</h1>
				<div class="pt-4 row">
					<div class="col-3 btn-block">
						<form class="form-inline mr-sm-2" action="${list }" method="post">
							<input type="submit" class="btn btn-primary btn-block"
								value="Quay về">
						</form>
					</div>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Chi Tiết Đơn Hàng
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Product Id</th>
										<th>Product name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Product Id</th>
										<th>Product name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${listDetail }" var="item">
										<tr>
											<td>${item.getProduct().productID }</td>
											<td>${item.getProduct().productName }</td>
											<td>${item.getProduct().price }</td>
											<td>${item.getQuantity() }</td>
											<td>${item.getProduct().price * item.getQuantity() }</td>
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
