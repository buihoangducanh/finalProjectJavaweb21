<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Chi tiết đơn hàng</title>
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
			<!-- Main Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row bg-secondary rounded justify-content-center mx-0">
					<div class="bg-secondary rounded h-100 p-4">
						<h2 class="mb-4 text-center">Chi tiết đơn hàng</h2>
						<h4 class="mb-4 text-right text-danger ">
							<span class="h5 text-warning">Mã đơn hàng:</span>
							${saleOrder.orderCode}
						</h4>
						<h6 class="mb-4 text-right ">
							<span class="text-warning">Ngày tạo:</span>
							${saleOrder.createdDate}
						</h6>
						<h6 class="mb-4 text-right ">
							<span class="text-warning">Tên khách hàng:</span>
							${saleOrder.customerName}
						</h6>
						<h6 class="mb-4 text-right ">
							<span class="text-warning">Số điện thoại:</span>
							${saleOrder.customerPhone}
						</h6>
						<h6 class="mb-4 text-right ">
							<span class="text-warning">Lời nhắn:</span> ${saleOrder.note}
						</h6>
						<h6 class="mb-4 text-right ">
							<span class="text-warning">Địa chỉ nhận hàng:</span>
							${saleOrder.customerAddress}
						</h6>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Ảnh sản phẩm</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Size</th>
									<th scope="col" class="text-center">Số lượng</th>
									<th scope="col" class="text-center">Đơn giá</th>
									<th scope="col" class="text-center">Tổng</th>
								</tr>
							</thead>
							<tbody>

								<c:set var="total" value="0" />
								<c:forEach items="${orderDetails}" var="orderProduct">
									<tr>
										<td>${orderProduct.product.id}</td>
										<td><img
											src="${base}/upload/${orderProduct.product.avatar}"
											alt="Image" class="img-fluid" width="120" /></td>
										<td class=" align-middle">${orderProduct.product.productName}</td>
										<td class="text-center align-middle">${orderProduct.size}</td>
										<td class="text-center align-middle">${orderProduct.quantity}</td>
										<td class="text-center align-middle"><span> <fmt:setLocale
													value="vi_VN" /> <fmt:formatNumber
													value="${orderProduct.product.salePrice}" type="currency" />
										</span></td>
										<td class="text-center align-middle"><span> <fmt:setLocale
													value="vi_VN" /> <fmt:formatNumber
													value="${orderProduct.product.salePrice*orderProduct.quantity}"
													type="currency" />
										</span></td>

									</tr>
									<c:set var="total"
										value="${total+ orderProduct.product.salePrice*orderProduct.quantity}" />
								</c:forEach>

							</tbody>
						</table>

						<div class="d-flex justify-content-md-between p-md-4">

							<div class="text-danger h4">TỔNG GIÁ TRỊ ĐƠN HÀNG</div>
							<div class="text-danger h4 text-center align-middle">
								<span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
										value="${total}" type="currency" />
								</span>
							</div>
						</div>
						<p class="d-flex flex-row-reverse">
							<c:choose>

								<c:when test="${saleOrder.recieved}">
									<button type="button" class="btn btn-secondary text-success">Đã
										giao hàng</button>
								</c:when>

								<c:when test="${saleOrder.cancel_status}">
									<button type="button" class="btn btn-secondary text-danger">Đơn
										hàng đã bị huỷ</button>
								</c:when>
								<c:when test="${!saleOrder.status && !saleOrder.cancel_status}">
									<button type="button" onclick="cancelOrder(${saleOrder.id})"
										class="btn btn-warning m-2">Huỷ đơn hàng</button>
									<button type="button" class="btn btn-secondary text-info">Đang
										giao hàng</button>
								</c:when>
								<c:when
									test="${!saleOrder.cancel_status && saleOrder.cancel_request}">
									<button type="button" onclick="cancelOrder(${saleOrder.id})"
										class="btn btn-warning m-2">Huỷ đơn hàng</button>
									<a type="button"
										href="/admin/orders_management/orders_list/order_details/delivered/${saleOrder.id}"
										class="btn btn-success m-2"> Giao hàng </a>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="cancelOrder(${saleOrder.id})"
										class="btn btn-warning m-2">Huỷ đơn hàng</button>
									<a type="button"
										href="/admin/orders_management/orders_list/order_details/delivered/${saleOrder.id}"
										class="btn btn-success m-2"> Giao hàng </a>
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
			</div>
			<!-- Main End -->

			<!-- Footer Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
			<!-- Footer End -->
		</div>
		<!-- Content End -->

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>
	<script type="text/javascript">
	function  cancelOrder(orderID) {
		if(confirm("Bạn muốn huỷ đơn hàng?")){
			$.ajax({
				type:"post",
				url:"${base}/admin/cancelOrder/"+orderID,
				success: function (data) {
					alert("Huỷ đơn hàng thành công")
					window.location = "${base}/admin/orders_management/orders_list";
				},
				error: function (errorThrown) {
					alert("Đã có lỗi")
				}
			})
		}
	}
	
	</script>
	<!-- JavaScript Libraries -->
	<jsp:include page="/WEB-INF/views/administrator/layout/jsLibrary.jsp"></jsp:include>

	<!-- Template Javascript -->
	<jsp:include page="/WEB-INF/views/administrator/layout/templateJS.jsp"></jsp:include>
</body>
</html>
