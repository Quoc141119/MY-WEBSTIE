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
				<h1 class=text-center>Danh Sách Thống Kê</h1>
				<div class="pt-4 pl-3 row">

					<form class="form-inline" action="admin-searchStatistic"
						method="get" onsubmit="return validateFormTK() ">
						<div class="form-group">
						<b>Từ&nbsp;</b><input class="form-control mr-sm-2" type="date"
							placeholder="Tên Sản Phẩm" name="date1" id="date1" style="width: 470px;" required>
						<b>Đến&nbsp;</b><input class="form-control mr-sm-2" type="date"
							placeholder="Tên Sản Phẩm" name="date2" id="date2" style="width: 470px;" required>
						<button class="btn btn-success" type="submit" name="">Search</button>
						</div>
					</form>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh Sách Thống Kê
					</div>
					
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>OrderID</th>
										<th>CustomerName</th>
										<th>Address</th>
										<th>TotalPrice</th>
										<th>Date</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>OrderID</th>
										<th>CustomerName</th>
										<th>Address</th>
										<th>TotalPrice</th>
										<th>Date</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${liststatistic }" var="item">
										<tr>
											<td>${item.getOrderID() }</td>
											<td>${item.getCustomer().getCustomerName() }</td>
											<td>${item.getCustomer().getAddress() }</td>
											<td>${item.getTotalPrice() }</td>
											<td>${item.getOrderDate().toString().substring(0,10) }</td>
										</tr>
									</c:forEach> 
								</tbody>								
							</table>
							<h3 class="text-center">Tổng:<a style="color: red"> ${sum }</a> USD</h3>
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
