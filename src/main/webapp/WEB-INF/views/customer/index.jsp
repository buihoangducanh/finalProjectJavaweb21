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
	<h1 class="introduce section-title">Th????ng hi???u v?? s???n ph???m</h1>

	<div class="untree_co-section"
		style="padding-top: 0; padding-bottom: 0">
		<!-- check this ****************************************************** -->
		<div class="thumbnail-container">
			<div class="deal-hero overlay"
				style="background-image: url('${base}/img/customer/vans_shop_thumnail.jpeg')">
				<div class="deal-contents">
					<span class="subtitle">Limited Offers 20% OFF</span>
					<p class="mb-5">V???i m???c gi?? kh??ng qu?? ?????t ????? c??ng qu?? nhi???u ??u
						??i???m nh?? ????n gi???n nh??ng v???n mang nh???ng n??t r???t ri??ng, d??? ph???i h???p
						nhi???u phong c??ch c??ng ch???t l?????ng ???????c ch??m ch??t, kh??ng kh?? hi???u
						khi t??? l??u Vans ???? lu??n ???????c y??u th??ch v?? c?? nh???ng fan cu???ng nhi???t
						hay c??n g???i l?? Vansaholic.</p>
					<a href="${base}/shop?keyword=Vans" class="btn btn-black">Shop Now</a>
				</div>
			</div>
			<!-- /.deal-hero -->
		</div>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="col-md-6">
				<h3 class="h3 mb-5">C??C S???N PH???M PH??? BI???N</h3>
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
				<p class="mb-5">Converse l?? m???t c??ng ty gi??y c???a M??? chuy??n s???n
					xu???t gi??y tr?????t v??n, gi??y d??p th?????ng ng??y v?? qu???n ??o. ???????c th??nh
					l???p v??o n??m 1908, ?????n nay Converse ???? tr??? th??nh m???t c??ng ty con c???a
					Nike, Inc. k??? t??? n??m 2003.</p>
				<a href="${base}/shop?keyword=Converse" class="btn btn-black">Shop Now</a>
			</div>
		</div>
		<!-- /.deal-hero -->
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h3 class="h3">C??C S???N PH???M PH??? BI???N</h3>
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
