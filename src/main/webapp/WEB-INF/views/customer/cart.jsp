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

<title>Giỏ hàng</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">GIỎ HÀNG</h3>
					<p class="mb-4">
						<a href="${base }/home">Trang chủ</a> / <strong>Giỏ hàng</strong>
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
									<th class="product-remove">Xoá</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cart.cartItems }" var="ci">
									<tr class="product-in-cart">
										<td class="product-thumbnail"><img
											src="${base }/upload/${ci.avatar}" alt="Image"
											class="img-fluid" /></td>
										<td class="product-name">
											<h2 class="h5 text-black">${ci.productName}</h2>
										</td>
										<td class="price-per-one" value="${ci.priceUnit}"><fmt:setLocale
												value="vi_VN" /> <fmt:formatNumber value="${ci.priceUnit}"
												type="currency" /></td>
										<td>${ci.size}</td>
										<td>
											<div class="input-group mb-3"
												style="max-width: 100px; margin: auto">
												<div class="input-group-prepend">
													<button 
													onclick="decreaseQuantityCartItem(${ci.productId},${ci.size})" class="btn btn-outline-black js-btn-minus"
														type="button">&minus;</button>
												</div>
												<input type="text" disabled
													class="form-control border-left border-right quantity text-center"
													value="${ci.quantity}" id="quantity_${ci.productId}"
													aria-label="Example text with button addon"
													aria-describedby="button-addon1" />
												<div class="input-group-append">
													<button onclick="increaseQuantityCartItem(${ci.productId},${ci.size})" class="btn btn-outline-black js-btn-plus"
														type="button">&plus;</button>
												</div>
											</div>
										</td>

										<td class="total-each">0</td>

										<td><button onclick="deleteCartItem(${ci.productId},${ci.size})"
												class="btn btn-black delete-btn btn-sm">X</button></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="row mb-5">
						<div class="col-md-6">
							<a href="${base}/shop"
								class="btn btn-outline-black btn-sm btn-block"> Tiếp tục mua
								sắm</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 pl-5">
					<div class="row justify-content-end">
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-12 text-right border-bottom mb-5">
									<h3 class="text-black h4 text-uppercase">Giá trị giỏ hàng
									</h3>
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
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-black btn-lg py-3 btn-block"
										onclick="window.location='${base}/cart/checkout'">Chuyển
										tới thanh toán</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteCartItem(productId,size) {
			var data = {
				id : productId,
				size :size,
			};

			jQuery.ajax({
				
				url : "${base}/ajax/cart/deleteItem/" + data.id + "/" + data.size,
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
		
		function increaseQuantityCartItem(productId,size) {
			var data = {
					id : productId,
					size :size,
			};

			jQuery.ajax({
				url : "${base}/ajax/cart/increaseItem/" + data.id + "/" + data.size,
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
		function decreaseQuantityCartItem(productId,size) {
			var data = {
				id : productId,
				size :size,
			};

			jQuery.ajax({
		
				url : "${base}/ajax/cart/decreaseItem/" + data.id + "/" + data.size,
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
