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

<title>Lịch sử đơn hàng</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">LỊCH SỬ ĐƠN HÀNG</h3>
					<p class="mb-4">
						<a href="${base }/home">Trang chủ</a> / <strong>Lịch sử
							mua hàng</strong>
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
									<th class="product-thumbnail">Mã đơn hàng</th>
									<th class="product-name">Người nhận</th>
									<th class="product-price">Số điện thoại</th>
									<th class="product-size">Giá trị đơn hàng</th>
									<th class="product-remove">Xem đơn hàng</th>
									<th class="product-remove">Trạng thái đơn hàng</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
									<c:when test="${empty saleOrdersList }">

										<tr>
											<td colspan="6" class="">Bạn chưa mua sản phẩm nào</td>

										</tr>
									</c:when>

									<c:otherwise>
										<c:forEach items="${saleOrdersList }" var="saleOrder">
											<tr class="product-in-cart">
												<td class="product-thumbnail">${saleOrder.orderCode }</td>
												<td class="product-name">${saleOrder.customerName}</td>
												<td class="product-name">${saleOrder.customerPhone}</td>
												<td class="price-per-one "><fmt:setLocale value="vi_VN" />
													<fmt:formatNumber value="${saleOrder.total}"
														type="currency" /></td>
												<td><a
													href="${base }/purchase_history/order_details/${saleOrder.id}"
													class="btn btn-dark m-2">Xem</a></td>


												<td class="font-weight-bold"><c:choose>

														<c:when test="${saleOrder.recieved == true}">
            Đã nhận hàng
         </c:when>

														<c:when test="${saleOrder.cancel_status == true}">
            Đã huỷ
         </c:when>
														<c:when test="${saleOrder.cancel_request == true}">
            Đang yêu cầu huỷ
         </c:when>
														<c:when
															test="${saleOrder.cancel_request == false && saleOrder.status}">
            Đang chuẩn bị hàng
         </c:when>
														<c:when
															test="${saleOrder.cancel_request == false && saleOrder.status == false}">
            Đang giao hàng
         </c:when>

													</c:choose></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteCartItem(productId, size) {
			var data = {
				id : productId,
				size : size,
			};

			jQuery.ajax({

				url : "${base}/ajax/cart/deleteItem/" + data.id + "/"
						+ data.size,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				success : function(jsonResult) {
					location.reload();

				},
				error : function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
		}

		function increaseQuantityCartItem(productId, size) {
			var data = {
				id : productId,
				size : size,
			};

			jQuery.ajax({
				url : "${base}/ajax/cart/increaseItem/" + data.id + "/"
						+ data.size,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				success : function(jsonResult) {

				},
				error : function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
		}
		function decreaseQuantityCartItem(productId, size) {
			var data = {
				id : productId,
				size : size,
			};

			jQuery.ajax({

				url : "${base}/ajax/cart/decreaseItem/" + data.id + "/"
						+ data.size,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				success : function(jsonResult) {

				},
				error : function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
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
