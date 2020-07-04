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
				<h1 class=text-center>Danh Sách Nhân Viên</h1>
				<div class="pt-4 pl-3 row">

					<form class="form-inline" action="admin-seacrhEmployee"
						method="get">
						<input class="form-control mr-sm-2" type="text"
							placeholder="Tên nhân viên" name="search" style="width: 940px;">
						<button class="btn btn-success" type="submit" name="">Search</button>
					</form>
					<form class="form-inline mr-sm-2 pl-1" action="admin-showAddEmployees">
						<input type="hidden" name="message" value="">
						<input type="hidden" name="acc" value="">
						<button class="btn btn-primary btn-block" type="submit">Thêm Nhân Viên</button>
					</form>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh Sách Nhân Viên
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Last name</th>
										<th>First name</th>
										<th>Account</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Birth Date</th>
										<th>Photo</th>
										<th>Notes</th>
										<th>Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Last name</th>
										<th>First name</th>
										<th>Account</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Birth Date</th>
										<th>Photo</th>
										<th>Notes</th>
										<th>Action</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${listEmployees }" var="item">
										<tr>
											<td>${item.getLastName() }</td>
											<td>${item.getFirstName() }</td>
											<td>
												<form action="admin-showEditAccount" method="post"
													class="form-inline">
													<input type="hidden" name="message" value="">
													<input type="hidden" name="id"
														value="${item.getAccount().getAccountID() }">
													<button class="btn btn-outline-info" type="submit">${item.getAccount().getUsername() } 
														<c:if test="${item.getAccount().getRole() eq 1}">
															<span class="badge badge-success">Ad</span>
														</c:if>
													</button>	
												</form>
											</td>
											<td>${item.getPhone() }</td>
											<td>${item.getEmail() }</td>
											<td>${item.getBirthDate().toString().substring(0,10) }</td>
											<td><img src="${item.getPhoto() }"
												style="width: 30px; height: 30px;"></td>
											<td>${item.getNotes() }</td>
											<td>
												<form onclick="return confirm('Are you sure?')" action="admin-deleteEmployee" method="post"
													class="form-inline">
													<input type="hidden" name="id" value="${item.getEmployeeID() }">
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
