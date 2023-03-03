<%@page import="com.devpro.finalProjectJavaweb21.model.Role"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Danh sách tài khoản</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring form taglib -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- base var -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<!-- Favicon -->

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/libraries_stylesheet.jsp"></jsp:include>

<!-- Customized Bootstrap Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/customized_bootstrap_style.jsp"></jsp:include>

<!-- Template Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/template_style.jsp"></jsp:include>
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<jsp:include page="/WEB-INF/views/administrator/layout/spinner.jsp"></jsp:include>
		<!-- Spinner End -->


		<!-- Sidebar Start -->
		<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
		<!-- Sidebar End -->

		<!-- Content Start -->
		<div class="content">

			<!-- Navbar Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/navbar.jsp"></jsp:include>
			<!-- Navbar End -->

			<!-- main content Start -->
			<div class="container-fluid pt-4 px-4">
				<div
					class="row vh-100 bg-secondary rounded justify-content-center mx-0">
					<div class="col-12">
						<div class="bg-secondary rounded h-100 p-4">
							<h2 class="mb-4">Danh sách tài khoản</h2>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">Role</th>
											<th scope="col">First Name</th>
											<th scope="col">Last Name</th>
											<th scope="col">Email</th>
											<th scope="col">Số điện thoại</th>
											<th scope="col" class="text-center" colspan="2">Chỉnh
												sửa quyền</th>
											<th class="text-center" scope="col">Khác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr>
												<td><c:forEach items="${user.roles}" var="role">
														${role.name}
												</c:forEach></td>
												<td>${user.first_name}</td>
												<td>${user.last_name}</td>
												<td>${user.email}</td>
												<td>${user.phone}</td>
												<c:choose>
													<c:when
														test="${user.email == 'buihoangducanh0987@gmail.com'}">
														<td colspan="2" class="text-center"><a type="button">
														</a></td>
													</c:when>

													<c:otherwise>
														<c:forEach items="${user.roles}" var="role">
															<c:if test="${role.name == 'ADMIN'}">
																<td colspan="2" class="text-center"><a
																	href="${base }/admin/accounts_management/setToUser/${user.id}"
																	type="button" class="btn btn-success rounded-pill ">
																		Sửa thành user</a></td>

															</c:if>

															<c:if test="${role.name == 'USER'}">
																<td colspan="2" class="text-center"><a
																	href="${base }/admin/accounts_management/setToAdmin/${user.id}"
																	type="button" class="btn btn-warning rounded-pill">
																		Sửa thành Admin</a></td>
															</c:if>
														</c:forEach>
													</c:otherwise>
												</c:choose>

												<c:choose>

													<c:when
														test="${user.email == 'buihoangducanh0987@gmail.com'}">
														<td colspan="2" class="text-center"><a type="button">
														</a></td>
													</c:when>

													<c:otherwise>
														<td class="text-center"><button
																onclick="callDeleteUserAjax(${user.id})" type="button"
																class="btn btn-danger rounded-pill">Xoá</button></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main content End -->
			<script type="text/javascript">
                	function callDeleteUserAjax(userID) {
                		if (confirm("Bạn muốn xoá người dùng này?")) {
    						$.ajax({
    									type : "post",
    									url : "${base}/ajax/admin/deleteUser/"+userID,
    									success : function(data) {
    										alert("Xoá người dùng thành công")
    										location.reload();
    									},
    									error : function(errorThrown) {
    										alert("Xoá người dùng thất bại")
    									}
    								})
    					}
					}
                </script>
			<!-- Footer Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
			<!-- Footer End -->
		</div>
		<!-- Content End -->

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<jsp:include page="/WEB-INF/views/administrator/layout/jsLibrary.jsp"></jsp:include>
	<!-- Template Javascript -->
	<jsp:include page="/WEB-INF/views/administrator/layout/templateJS.jsp"></jsp:include>
</body>
</html>
