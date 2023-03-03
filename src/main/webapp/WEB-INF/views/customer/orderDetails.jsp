<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<meta name="description" content="" />
<meta name="keywords" content="" />
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

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

<title>Chi tiết đơn hàng</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">Chi tiết đơn hàng</h3>
					<p class="mb-4">
						<a href="${base }/home">Trang chủ</a> / <a
							href="${base }/purchase_history">Lịch sử đơn hàng</a> / <strong>Chi
							tiết đơn hàng</strong>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12 p-0" method="post">
					<div class="site-blocks-table">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th class="product-thumbnail">Hình ảnh</th>
									<th class="product-name">Tên sản phẩm</th>
									<th class="product-price">Đơn giá</th>
									<th class="product-size">Size</th>
									<th class="product-quantity">Số lượng</th>
									<th class="product-total">Tổng</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderDetails}" var="orderProduct">
									<tr class="product-in-cart">
										<td class="product-thumbnail"><img
											src="${base }/upload/${orderProduct.product.avatar}"
											alt="Image" class="img-fluid" /></td>
										<td class="product-name">
											<h2 class="h5 text-black">${orderProduct.product.productName}</h2>
										</td>
										<td class="price-per-one"
											value="${orderProduct.product.salePrice}"><fmt:setLocale
												value="vi_VN" /> <fmt:formatNumber
												value="${orderProduct.product.salePrice}" type="currency" /></td>
										<td>${orderProduct.size}</td>
										<td>
											<div class="input-group mb-3"
												style="max-width: 100px; margin: auto">
												<input type="text" disabled
													class="form-control border-left border-right quantity text-center"
													value="${orderProduct.quantity}"
													id="quantity_${orderProduct.product.id}"
													aria-label="Example text with button addon"
													aria-describedby="button-addon1" />

											</div>
										</td>

										<td class="total-each">0</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="row mb-5">
						<div class="col-md-12">
							<a href="${base}/shop"
								class="btn btn-outline-black btn-sm btn-block"> Tiếp tục mua
								sắm</a>
						</div>
					</div>
				</div>
				<div class="col-md-9 pl-5">
					<div class="row justify-content-end">
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12 text-right border-bottom mb-5">
									<h3 class="text-black h4 text-uppercase">Thông tin đặt
										hàng</h3>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Mã đơn hàng</span>
								</div>
								<div class="col-md-6 text-right">
									<strong id="orderCode" class="text-black">${saleOrder.orderCode}</strong>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Ngày / giờ đặt hàng</span>
								</div>
								<div class="col-md-6 text-right">
									<strong id="orderCode" class="text-black">${saleOrder.createdDate}</strong>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Tên khách hàng</span>
								</div>
								<div class="col-md-6 text-right">
									<strong id="orderCode" class="text-black">${saleOrder.customerName}</strong>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Số điện thoại</span>
								</div>
								<div class="col-md-6 text-right">
									<strong id="orderCode" class="text-black">${saleOrder.customerPhone}</strong>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Tổng tiền</span>
								</div>
								<div class="col-md-6 text-right">
									<strong id="cart-value" class="text-black">$230.00</strong>
								</div>
							</div>
							<div class="row mb-3">

								<c:choose>

									<c:when test="${saleOrder.recieved}">
										<div class="col-md-12">
											<h3 class="text-right mt-3">Đã nhận hàng</h3>
										</div>
									</c:when>

									<c:when test="${saleOrder.cancel_request && !saleOrder.cancel_status}">
										<div class="col-md-12 text-right">
											<input type="button" class="ml-0 btn btn-outline-dark"
												value="Đang xử lý yêu cầu huỷ">
										</div>
									</c:when>
									<c:when test="${saleOrder.cancel_status}">
										<div class="col-md-12 text-right">
											<h3 class="text-right mt-3">Đã huỷ</h3>
										</div>
									</c:when>

									<c:when
										test="${saleOrder.cancel_request == false && saleOrder.status}">
										<div class="col-md-12 text-right">
											<h3 class="text-right mt-3">Đang chuẩn bị hàng</h3>
										</div>
										
										<div class="col-md-6 text-left">
											<input type="button" id="addToCartBtn"
												onclick="requestToCancel(${saleOrder.id})"
												class="ml-0 btn btn-outline-dark" value="Yêu cầu huỷ">
										</div>
									</c:when>
									<c:when
										test="${saleOrder.cancel_request == false && saleOrder.status == false}">
										<div class="col-md-12 text-left">
											<h3 class="text-right mt-3">Đang giao hàng</h3>
											<div class="col-md-12">
											<button type="button" onclick="recieved(${saleOrder.id})"
												id="recieved" class="btn btn-black">Đã nhận hàng</button>
										</div>
										</div>
									</c:when>

								</c:choose>


							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function  recieved(orderID) {
		if(confirm("Bạn đã nhận được hàng?")){
			$.ajax({
				type:"post",
				url:"${base}/recieved/"+orderID,
				success: function (data) {
					alert("Xác nhận thành công!")
					window.location = "${base }/purchase_history";
				},
				error: function (errorThrown) {
					alert("Đã có lỗi")
				}
			})
		}
	}
		
		function  requestToCancel(orderID) {
			if(confirm("Bạn muốn huỷ đơn hàng?")){
				$.ajax({
					type:"post",
					url:"${base}/cancelOrder/"+orderID,
					success: function (data) {
						alert("Yêu cầu huỷ đơn hàng thành công!")
						window.location = "${base }/purchase_history";
					},
					error: function (errorThrown) {
						alert("Đã có lỗi")
					}
				})
			}
		}
	
	</script>
	<!-- footer start -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- footer end -->

	<!-- JS start -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<!-- JS end -->
	<script src="${base}/js/customer/cart.js"></script>
</body>
</html>
