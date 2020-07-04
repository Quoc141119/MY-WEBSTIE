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
				<h1 class=text-center>Danh Sách Khách Hàng</h1>
				<div class="pt-4 pl-3 row">

					<form class="form-inline" action="admin-searchCustomer"
						method="get">
						<input class="form-control mr-sm-2" type="text"
							placeholder="Tên khách hàng" name="search" style="width: 940px;">
						<button class="btn btn-success" type="submit" name="">Search</button>
					</form>

				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh Sách Khách Hàng
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Username</th>
										<th>Password</th>
										<th>Customer Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Address</th>
										<th>Country</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Username</th>
										<th>Password</th>
										<th>Customer Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Address</th>
										<th>Country</th>
										<th>Actions</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${listCustomer }" var="item">
										<tr>
											<td>${item.getUsername() }</td>
											<td>********</td>
											<td>${item.getCustomerName() }</td>
											<td>${item.getEmail() }</td>
											<td>${item.getPhone() }</td>
											<td>${item.getAddress() }</td>
											<td>${item.getCountry() }</td>
											<td>
												<form onclick="return confirm('Are you sure?')" action="admin-deleteCustomer" method="post"
													class="form-inline">
													<input type="hidden" name="id" value="${item.getCustomerId() }">
													<button class="btn btn-outline-danger" type="submit">
														Delete
													</button>
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
