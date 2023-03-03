<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- spring form taglib -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- search bar -->
<div class="search-form" id="search-form">
	<form action="${base }/shop">
		<input type="search" value="${prodSearchMod.keyword}" name="keyword"
			class="form-control" placeholder="Nhập từ khoá để tìm kiếm..." />
		<button class="button">
			<svg width="1em" height="1em" viewBox="0 0 16 16"
				class="bi bi-search" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
					d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
            <path fill-rule="evenodd"
					d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
          </svg>
		</button>
		<button class="button">
			<div class="close-search">
				<span class="icofont-close js-close-search"></span>
			</div>
		</button>
	</form>
</div>
<!-- /search bar -->
<div class="site-mobile-menu">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>
<!-- navigation bar -->
<nav class="site-nav mb-5">
	<div class="sticky-nav js-sticky-header">
		<div class="container position-relative">
			<div class="site-navigation text-center dark">
				<a href="${base}/home" class="logo menu-absolute m-0">CrazyShoes<span
					class="text-primary">.</span></a>

				<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
					<li class=""><a href="${base}/home">Trang chủ</a></li>
					<li class="has-children"><a href="${base}/shop">Shop</a></li>

					<li class="has-children"><a href="#">Thương hiệu</a>
						<ul class="dropdown">
							<li><a href="${base}/shop?keyword=Vans">Vans</a></li>
							<li><a href="${base}/shop?keyword=Converse">Converse</a></li>
						</ul></li>
					<li class="has-children"><a href="#">Kiểu dáng</a>
						<ul class="dropdown">
							<c:forEach var="type" items="${types }">
								<li><a href="${base}/shop?keyword=${type.typeName}">${type.typeName}</a></li>
							</c:forEach>
						</ul></li>

					<li class="has-children"><a href="#">KHÁC</a>
						<ul class="dropdown">
							<li><a href="${base}/contact">LIÊN HỆ</a></li>
							<li><a href="${base}/cart">GIỎ HÀNG</a></li>
							<li><a href="${base}/cart/checkout">THANH TOÁN</a></li>

							<c:if test="${isLogined}">
								<li><a href="${base}/purchase_history?UID=${userLogined.id}">LỊCH SỬ MUA HÀNG</a></li>
							</c:if>

						</ul></li>
				</ul>

				<div class="menu-icons">
					<a href="#" class="btn-custom-search " id="btn-search"> <svg
							width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
								d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                  <path fill-rule="evenodd"
								d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                </svg>
					</a>
					<c:choose>

						<c:when test="${isLogined}">
							<span class="mr-3 ml-3 text-body">
								${userLogined.first_name} ${userLogined.last_name}</span>
							<a href="${base}/logout" style="border-left: 2px solid black;"
								class="mr-3 text-body pl-3"> <img
								src="https://cdn.iconscout.com/icon/premium/png-256-thumb/logout-2017042-1701862.png"
								alt="Logout Icon" width="20">
							</a>
						</c:when>

						<c:otherwise>
							<a href="${base}/sign_in" class="mr-3 ml-3 text-body"> Đăng
								nhập </a>
							<a href="${base}/sign_up" style="border-left: 2px solid black;"
								class="mr-3 text-body pl-3"> Đăng ký </a>
						</c:otherwise>
					</c:choose>


					<a href="${base}/cart" class="cart"> <span id="item-in-cart"
						class="item-in-cart"> <c:choose>

								<c:when test="${totalItems == null}">  
								 0
         						</c:when>
								<c:otherwise>
            				${totalItems}
         					</c:otherwise>
							</c:choose>
					</span> <svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-cart" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                </svg>
					</a>
				</div>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>
			</div>
		</div>
	</div>
</nav>
<!-- /navigation bar -->