<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

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

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

<title>Thanh toán</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">THANH TOÁN</h3>
					<p class="mb-4">
						<a href="${base }/home">Trang chủ</a> / <strong>Thanh
							toán</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
	<form action="${base}/cart/checkout" method="post">
		<div class="untree_co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 mb-5 mb-md-0">
						<h4 class="mb-3 text-black font-weight-bold text-center">
							Thông tin người nhận hàng</h4>
						<div class="p-3 p-lg-5 border">



							<c:choose>

								<c:when test="${isLogined}">
									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_fname" class="text-black">Tên người
												nhận <span class="text-danger">*</span>
											</label> <input type="text" value="${userLogined.first_name } ${userLogined.last_name }"
												class="form-control" id="c_fname" name="customerFullName" />
										</div>
									</div>
									<div class="form-group row ">
										<div class="col-md-12">
											<label for="c_phone" class="text-black">Số điện thoại
												<span class="text-danger">*</span>
											</label> <input type="text" value="${userLogined.phone }"
												class="form-control" id="c_phone" name="customerPhone" />
										</div>
									</div>
								</c:when>

								<c:otherwise>
									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_fname" class="text-black">Tên người
												nhận <span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="c_fname"
												name="customerFullName" />
										</div>
									</div>
									<div class="form-group row ">
										<div class="col-md-12">
											<label for="c_phone" class="text-black">Số điện thoại
												<span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="c_phone"
												name="customerPhone" />
										</div>
									</div>
								</c:otherwise>
							</c:choose>


							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_address" class="text-black">Địa chỉ <span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="c_address"
										name="customerAddress" />
								</div>
							</div>


							<div class="form-group">
								<label for="c_order_notes" class="text-black">Ghi chú</label>
								<textarea name="note" id="c_order_notes" cols="30" rows="5"
									class="form-control" placeholder="Nhập lời nhắn"></textarea>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-12">
								<h4 class="mb-3 text-black font-weight-bold text-center">
									Hoá đơn</h4>
								<div class="p-3 p-lg-5 border">
									<table class="table site-block-order-table mb-5">
										<thead>
											<tr>
												<th>Sản phẩm</th>
												<th>Size</th>
												<th>Tổng</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="cartValue" value="${0}" />
											<c:forEach items="${cart.cartItems }" var="item">
												<tr>
													<td>${item.productName}<strong class="mx-2">x</strong>
														${item.quantity}
													</td>
													<td>${item.size}</td>
													<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
															value="${item.priceUnit*item.quantity}" type="currency" />
													</td>
												</tr>
												<c:set var="cartValue"
													value="${cartValue+item.priceUnit*item.quantity}" />
											</c:forEach>
											<tr>
												<td colspan="2" class="text-black"><strong>Tổng
														giá trị sản phẩm</strong></td>
												<td class="text-black"><fmt:setLocale value="vi_VN" />
													<fmt:formatNumber value="${cartValue}" type="currency" /></td>
											</tr>
											<tr>
												<td colspan="2" class="text-black"><strong>Tổng
														giá trị đơn hàng</strong></td>
												<td class="text-black"><strong> <fmt:setLocale
															value="vi_VN" /> <fmt:formatNumber value="${cartValue}"
															type="currency" /></strong></td>
											</tr>
										</tbody>
									</table>

									<div class="border p-3 mb-3">
										<h3 class="h6 mb-0">
											<a class="d-block" data-toggle="collapse"
												href="#collapsebank" role="button" aria-expanded="false"
												aria-controls="collapsebank">Thanh toán khi nhận hàng</a>
										</h3>
									</div>

									<div class="form-group">
										<c:choose>
											<c:when test="${totalItems == null || totalItems == 0}">
            								Bạn chưa có sản phẩm nào trong giỏ hàng
         									</c:when>
											<c:otherwise>
												<button class="btn btn-black btn-lg py-3 btn-block">
													Thanh toán</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- footer start -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- footer end -->

	<!-- JS start -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<!-- JS end -->

</body>
</html>
