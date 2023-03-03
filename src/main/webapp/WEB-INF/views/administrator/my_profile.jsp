<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>My Profile</title>
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
			<div class="container-fluid pt-4 px-4 mh-100">
				<div
					class="row bg-secondary rounded align-items-center justify-content-center mx-0">
					<div class="bg-secondary rounded h-100 p-4">
						<div class="col-sm-12 col-xl-12">
							<div class="bg-secondary rounded h-100 p-4">
								<h6 class="mb-4">Thông tin của bạn</h6>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">First Name</th>
											<th scope="col">Last Name</th>
											<th scope="col">Email</th>
											<th scope="col">Password</th>
											<th scope="col">Số điện thoại</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${userLogined.first_name}</td>
											<td>${userLogined.last_name}</td>
											<td>${userLogined.username}</td>
											<td>*********</td>
											<td>${userLogined.phone}</td>
										</tr>
									</tbody>
								</table>
								<h6 class="mt-4 d-flex flex-row-reverse"><button type="button" class="btn btn-primary">Chỉnh sửa thông tin cá nhân</button></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main content End -->

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
