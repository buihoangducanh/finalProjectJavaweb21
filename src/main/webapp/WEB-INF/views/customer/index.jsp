<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="anhbui" content="crazy-shoe" />

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
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

<title>Crazy Shoes</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="owl-carousel owl-single home-slider">
		<div class="item">
			<div class="untree_co-hero"
				style="
            background-image: url('${base}/img/customer/shop_slides/stock-photo-girl-in-jeans-and-blue-sneakers-43128721-transformed.jpeg');
          ">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">
								CLASSIC</h1>
							<div class="mb-5 text-white desc mx-auto" data-aos="fade-up"
								data-aos-delay="200"></div>

							<p class="mb-0" data-aos="fade-up" data-aos-delay="300">
								<a href="${base}/shop" class="btn btn-outline-black">Explore
									now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- /.untree_co-hero -->
		</div>

		<div class="item">
			<div class="untree_co-hero"
				style="
            background-image: url('${base}/img/customer/shop_slides/stock-photo-cagliari-italy-vans-ward-canvas-sneakers-shoes-in-blue-and-white-color-studio-1985695733-transformed.jpeg');
          ">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">
								LOW-TOP</h1>
							<div class="mb-5 text-white desc mx-auto" data-aos="fade-up"
								data-aos-delay="200"></div>

							<p class="mb-0" data-aos="fade-up" data-aos-delay="300">
								<a href="${base}/shop" class="btn btn-outline-black">Explore
									now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- /.untree_co-hero -->
		</div>
	</div>
	<!-- our product -->
	<h1 class="introduce section-title">Thương hiệu và sản phẩm</h1>

	<div class="untree_co-section"
		style="padding-top: 0; padding-bottom: 0">
		<!-- check this ****************************************************** -->
		<div class="thumbnail-container">
			<div class="deal-hero overlay"
				style="background-image: url('${base}/img/customer/vans_shop_thumnail.jpeg')">
				<div class="deal-contents">
					<span class="subtitle">Limited Offers 20% OFF</span>
					<p class="mb-5">Với mức giá không quá đắt đỏ cùng quá nhiều ưu
						điểm như đơn giản nhưng vẫn mang những nét rất riêng, dễ phối hợp
						nhiều phong cách cùng chất lượng được chăm chút, không khó hiểu
						khi từ lâu Vans đã luôn được yêu thích và có những fan cuồng nhiệt
						hay còn gọi là Vansaholic.</p>
					<a href="${base}/shop?keyword=Vans" class="btn btn-black">Shop Now</a>
				</div>
			</div>
			<!-- /.deal-hero -->
		</div>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="col-md-6">
				<h3 class="h3 mb-5">CÁC SẢN PHẨM PHỔ BIẾN</h3>
			</div>
			<div class="row">
				<c:forEach var="hotVans" items="${hotVansList}">
					<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-3">
						<div class="product-item">
							<a href="${base}/product_details/${hotVans.id}"
								class="product-img"> <img
								src="${base}/upload/${hotVans.avatar}" alt="Image"
								class="img-fluid" />
							</a>
							<h3 class="title">
								<a href="${base}/product_details/${hotVans.id}">${hotVans.productName}</a>
							</h3>
							<div class="price">
								<span class="price-in-details font-weight-bold"> <fmt:setLocale
										value="vi_VN" /> <fmt:formatNumber
										value="${hotVans.salePrice}" type="currency" />
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- /.untree_co-section -->
	<!-- check this ****************************************************** -->
	<div class="thumbnail-container">
		<div class="deal-hero overlay"
			style="background-image: url('${base}/img/customer/converse_shop_thumbnail.jpeg')">
			<div class="deal-contents">
				<span class="subtitle">Limited Offers 20% OFF</span>
				<p class="mb-5">Converse là một công ty giày của Mỹ chuyên sản
					xuất giày trượt ván, giày dép thường ngày và quần áo. Được thành
					lập vào năm 1908, đến nay Converse đã trở thành một công ty con của
					Nike, Inc. kể từ năm 2003.</p>
				<a href="${base}/shop?keyword=Converse" class="btn btn-black">Shop Now</a>
			</div>
		</div>
		<!-- /.deal-hero -->
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h3 class="h3">CÁC SẢN PHẨM PHỔ BIẾN</h3>
				</div>
			</div>
			<!-- /.heading -->
			<div class="owl-4-slider owl-carousel">
				<c:forEach var="hotConverse" items="${hotConverseList}">
					<div class="item">
						<div class="product-item">
							<a href="${base}/product_details/${hotConverse.id}"
								class="product-img"> <img
								src="${base}/upload/${hotConverse.avatar}" alt="Image"
								class="img-fluid" />
							</a>
							<h3 class="title">
								<a href="${base}/product_details/${hotConverse.id}">${hotConverse.productName}</a>
							</h3>
							<div class="price">
								<span class="price-in-details font-weight-bold"> <fmt:setLocale
										value="vi_VN" /> <fmt:formatNumber
										value="${hotConverse.salePrice}" type="currency" />
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- /.container -->
	</div>

	<!-- /.untree_co-section -->

	<!-- footer start -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- footer end -->

	<!-- JS start -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<!-- JS end -->
</body>
</html>
