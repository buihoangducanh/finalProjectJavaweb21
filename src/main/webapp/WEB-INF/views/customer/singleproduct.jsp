<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<title>Chi tiết sản phẩm</title>
<style>
.price-in-details {
	color: red;
	font-size: 30px;
}
</style>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->
	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">CHI TIẾT SẢN PHẨM</h3>
					<p class="mb-4">
						<a href="${base}/home">Trang chủ</a> / <a href="${base}/shop">Shop</a>
						/ <strong>Chi tiết</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="untree_co-section pt-3 pb-0">
		<div class="container">
			<div class="product-content mt-5">
				<div class="material-price row">
					<div class="col-md-6 text-right pr-5 border-right border-secondary">

						<!-- product slider -->
						<div class="product-slider">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">

									<!-- render items -->
									<c:set var="smallCount" value="${1}"></c:set>
									<c:forEach items="${imgsList}" var="imgItem">

										<c:choose>
											<c:when test="${smallCount == 1}">
												<div class="carousel-item active">
													<img style="max-width: 400px" class="d-block w-80 mx-auto"
														src="${base}/upload/${imgItem.path}" alt="product slide" />
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img style="max-width: 400px" class="d-block w-80 mx-auto"
														src="${base}/upload/${imgItem.path}" alt="product slide" />
												</div>
											</c:otherwise>
										</c:choose>
										<c:set var="smallCount" value="${smallCount + 1}" />
									</c:forEach>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleControls"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
						<!-- product slider end-->
					</div>
					<div class="col-md-6 pl-5 border-left border-secondary">
						<h1 class="font-weight-bold pb-4">${product.productName}</h1>
						<p class="mb-2">
							Chất liệu: <span class="material font-weight-bold">${product.material}</span>
						</p>
						<p>
							Màu sắc: <span class="color font-weight-bold">${product.color.colorName}</span>
						</p>
						<p>
							Giá bán: <span class="price-in-details font-weight-bold">
								<fmt:setLocale value="vi_VN" /> <fmt:formatNumber
									value="${product.salePrice}" type="currency" />
							</span> <span class="ml-2 font-weight-normal"> <del>
									<fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${product.productPrice}"
										type="currency" />
								</del>
							</span>
						</p>
						<div class="row ml-0">
							<select id="sizeValue" name="sizeValue"
								class="col-3 font-weight-bold p-2">
								<c:forEach items="${sizesList}" var="size">
									<option value="${size.id}">${size.sizeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="row pt-4 ml-0 quantity-buy">
							<div class="col-4 p-0">
								<div class="input-group quantity" style="width: fit-content">
									<div class="input-group-btn">
										<button type="button"
											class="btn btn-sm border border-secondary btn-black h-100 btn-minus">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text" id="product-quantity"
										name="product-quantity"
										class="form-control border-right border-left quantity form-control-sm text-center"
										style="max-width: 50px" value="1" />
									<div class="input-group-btn">
										<button type="button"
											class="btn btn-sm border btn-black border-secondary h-100 btn-plus">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-5">
								<button type="button"
									onclick="buyNow('${base}',${product.id },getQuantityValue(),getSizeValue())"
									id="buyNowButton" class="btn btn-black">Mua hàng</button>
							</div>
						</div>
						<p class="row font-weight-bold ml-0 mt-2" style="color: red"
							id="alert-quantity"></p>
						<div class="pl-0 col-8">
							<input type="button" id="addToCartBtn"
								onclick="AddToCart('${base}',${product.id },getQuantityValue(),getSizeValue())"
								class="ml-0 btn btn-outline-dark" value="Thêm vào giỏ hàng" />
						</div>
					</div>


				</div>
				<script>
        	function getQuantityValue(){
            // Selecting the input element and get its value 
            var inputVal = document.getElementById("product-quantity").value;
            
            // return the value
            return inputVal;
        }
        	
        	function getSizeValue(){
                // Selecting the input element and get its value 
                var size = $( "#sizeValue option:selected" ).text();
                // return the value
                return size;
            }
    </script>
				<!-- short description start -->
				<div class="row justify-content-center mt-4">
					<h3 class="col-12 font-weight-bold mb-5">
						<ins>Mô tả ngắn</ins>
					</h3>
					<p id="short-des" class="col-12 justify-content-center">
						${product.productDescription}</p>
				</div>
				<!-- short description end -->
				<!-- product slider -->
				<div class="product-slider">
					<div id="carouselToggle" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<c:set var="count" value="${1}"></c:set>
							<c:forEach items="${imgsList}" var="imgItem">
								<c:choose>
									<c:when test="${count == 1}">
										<div class="carousel-item active">
											<img class="d-block w-80 mx-auto"
												src="${base}/upload/${imgItem.path}" alt="slide" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
											<img class="d-block w-80 mx-auto"
												src="${base}/upload/${imgItem.path}" alt="slide" />
										</div>
									</c:otherwise>
								</c:choose>
								<c:set var="count" value="${count + 1}" />
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselToggle"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselToggle"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<!-- product slider end-->
				<!-- product information start -->
				<div class="row pt-5">
					<table class="table">
						<thead class="mb-0">
							<tr>
								<th scope="col" class="border-top-0 border-secondary"
									colspan="2">
									<h4 class="text-uppercase col-12 text-center font-weight-bold">
										Thông tin sản phẩm</h4>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">NHÃN HIỆU</th>
								<td>${product.brand.brandName }</td>
							</tr>
							<tr>
								<th scope="row">TÊN</th>
								<td>${product.productName}</td>
							</tr>
							<tr>
								<th scope="row">NƠI SẢN XUẤT</th>
								<td>${product.manufactory}</td>
							</tr>
							<tr>
								<th scope="row">CHẤT LIỆU</th>
								<td>${product.material}</td>
							</tr>
							<tr>
								<th scope="row">MÀU SẮC CHỦ ĐẠO</th>
								<td>${product.color.colorName}</td>
							</tr>
							<tr>
								<th scope="row">KIỂU DÁNG</th>
								<td>${product.type.typeName}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- product information end -->
				<!-- size chart -->
				<div class="row justify-content-center pt-4 mt-5">
					<h3 class="col-12 font-weight-bold pt-4 mt-5">
						<ins>Hướng dẫn chọn size giày</ins>
					</h3>
					<img src="${base}/img/customer/sizechart.jpg"
						class="col-12 justify-content-center" alt="vans sizes" />
				</div>
				<!-- size chart end-->
			</div>
		</div>
	</div>
	<!-- /.untree_co-section -->

	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h3 class="h3">CÁC SẢN PHẨM LIÊN QUAN</h3>
				</div>
			</div>
			<!-- /.heading -->
			<div class="owl-4-slider owl-carousel">

				<c:forEach items="${relatedProducts }" var="relatedItem">
					<div class="item">
						<div class="product-item">
							<a href="${base}/product_details/${relatedItem.id}" class="product-img"> <img
								src="${base}/upload/${relatedItem.avatar}"
								alt="Image" class="img-fluid" />
							</a>
							<h3 class="title">
								<a href="${base}/product_details/${relatedItem.id}">${relatedItem.productName}</a>
							</h3>
							<span > <fmt:setLocale
										value="vi_VN" /> <fmt:formatNumber
										value="${relatedItem.salePrice}" type="currency" />
								</span>
						</div>
					</div>
					<!-- /.item -->
				</c:forEach>

			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /.untree_co-section -->

	<!-- footer start -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- footer end -->
	<script src="${base}/js/customer/modify-quantity.js"></script>
	<!-- JS start -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<!-- JS end -->
</body>
</html>
