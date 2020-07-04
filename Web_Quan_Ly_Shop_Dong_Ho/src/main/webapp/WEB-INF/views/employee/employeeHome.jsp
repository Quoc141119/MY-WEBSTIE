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
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
					<li class="breadcrumb-item active">Overview</li>
				</ol>

				<!-- Icon Cards-->
				<div class="row">
					
					<div class="col-xl-4 col-sm-6 mb-4">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="mr-5">${lstQueueSize} Đơn hàng mới!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" 
							href="${pageContext.request.contextPath}/employee-listOrderQueue">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Thành viên
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Name</th>
										<th>Address</th>
										<th>University</th>
										<th>Age</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Address</th>
										<th>University</th>
										<th>Age</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>Tran Nam My</td>
										<td>QB</td>
										<td>Hue University</td>
										<td>22</td>
									</tr>
									<tr>
										<td>Nguyen Van Quoc</td>
										<td>QN</td>
										<td>Hue University</td>
										<td>23</td>
									</tr>
									<tr>
										<td>Dang Van Hien</td>
										<td>DN</td>
										<td>Hue University</td>
										<td>22</td>
									</tr>
									<tr>
										<td>Cao Minh Anh</td>
										<td>QB</td>
										<td>Hue University</td>
										<td>22</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<%@include file="/../../../common/admin/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->


</body>
