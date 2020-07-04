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
				<h1 class=text-center>Danh Sách Đơn Hàng</h1>
				<div class="row pt-4">
					<a class="btn btn-info mb-2 ml-3 mr-1" href="admin-listOrderQueue">Đơn hàng chờ</a>
					<a class="btn btn-info mb-2 mr-1" href="admin-listOrderComfirmed">Đơn
								hàng đã xác nhận</a>
					<a class="btn btn-info mb-2 mr-1" href="admin-listOrderCancelled">Đơn
								hàng đã hủy</a>
					<a class="btn btn-info mb-2 mr-1" href="admin-listOrderError">Đơn
								hàng lỗi</a>
					<a class="btn btn-warning mb-2 mr-1" href="admin-listOrderHistory">Lịch sử</a>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Lịch Sử Đơn Hàng
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead style="text-align: center;">
											<tr>
												<th>Order ID</th>
												<th>Order date</th>
												<th>Time</th>
												<th>Total price</th>
												<th>Status</th>
												<th>Customer</th>
												<th>Employee</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tfoot style="text-align: center;">
											<tr>
												<th>Order ID</th>
												<th>Order date</th>
												<th>Time</th>
												<th>Total price</th>
												<th>Status</th>
												<th>Customer</th>
												<th>Employee</th>
												<th>Actions</th>
											</tr>
										</tfoot>
										<tbody>
											<c:forEach items="${listHistory }" var="item">
												<tr>
													<td>${item.getOrderID() }</td>
													<td>${item.getOrderDate().toString().substring(0,10) }</td>
													<td>${item.getTime() }</td>
													<td>${item.getTotalPrice().toString() }</td>
													<td>${item.getStatus() }</td>
													<td>
														<form action="admin-showCustomerInfo" method="post" class="form-inline">
															<input type="hidden" name="id"
																value="${item.getCustomer().getCustomerId()}">
															<input name="list" type="hidden" value="admin-listOrderHistory">	
															<button class="btn btn-outline-info" type="submit">${item.getCustomer().getUsername() } </button>	
														</form>
													</td>
													<td>
														<form action="admin-showEmployeeInfo" method="post" class="form-inline">
															<input type="hidden" name="id"
																value="${item.getEmployee().getEmployeeID() }">
															<input name="list" type="hidden" value="admin-listOrderHistory">
															<button class="btn btn-outline-info" type="submit">${item.getEmployee().getAccount().getUsername() }</button>	
														</form>
													</td>
													<td>
														<form action="admin-showOrderDetail" method="post"
															class="form-inline">
															<input type="hidden" name="id"
																value="${item.getOrderID() }"> 
															<input type="hidden" name="list"
																value="admin-listOrderHistory"> 
															<button class="btn btn-outline-warning" type="submit">
																Detail</button>
														</form>
													</td>
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
