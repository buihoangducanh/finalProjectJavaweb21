<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>CrazyShoes Dashboard</title>
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
<link href="img/favicon.ico" rel="icon" />

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

			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Doanh thu hôm nay</p>
								<h6 class="mb-0"><span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${totalSalesToday}" type="currency" />
										</span></h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Tổng doanh thu</p>
								<h6 class="mb-0"><span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${totalSales}" type="currency" />
										</span></h6>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- Sale & Revenue End -->

			<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">Các đơn hàng gần đây</h6>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-white">
									<th scope="col">Mã đơn hàng</th>
									<th scope="col">Tên khách hàng</th>
									<th scope="col">Số điện thoại</th>
									<th scope="col">Giá trị</th>
									<th scope="col">Trạng thái</th>
									<th scope="col">Xem chi tiết</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="order" items="${saleOrders }">
									<tr>
										<td>${order.orderCode }</td>
										<td>${order.customerName}</td>
										<td>${order.customerPhone}</td>
										<td><span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${order.total}" type="currency" />
										</span></td>
										<td><c:choose>

												<c:when
													test="${order.status && order.cancel_status == false && !order.recieved && 
																!order.cancel_request}">
													<button type="button" class="btn btn-warning">Chưa
														giao hàng</button>
												</c:when>
												<c:when
													test="${order.status == false && order.cancel_status == false && !order.recieved && 
																!order.cancel_request}">
													<button type="button" class="btn btn-success text-info">Đang
														giao hàng</button>
												</c:when>
												<c:when test="${order.cancel_status && !order.recieved }">
													<button type="button" class="btn btn-danger">Đã bị
														huỷ</button>
												</c:when>
												<c:when
													test="${order.recieved && 
																!order.cancel_request}">
													<button type="button" class="btn btn-success">Đã
														nhận hàng</button>
												</c:when>
												<c:when test="${order.cancel_request && !order.recieved}">
													<button type="button" class="btn btn-danger text-warning">Yêu
														cầu huỷ</button>
												</c:when>

											</c:choose></td>
										<td><a type="button"
											href="${base }/admin/orders_management/orders_list/order_details/${order.id }"
											class="btn btn-light">Xem chi tiết</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->

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
