<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
	<nav class="navbar bg-secondary navbar-dark">
		<a href="${base}/admin/dashboard" class="navbar-brand mx-4 mb-3">
			<h3 class="text-primary">
				<i class="fa fa-user-edit me-2"></i>CrazyShoes
			</h3>
		</a>
		<div class="d-flex align-items-center ms-4 mb-4">
			<div class="position-relative">
				<div
					class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
			</div>
			<div class="ms-3">
				<h6 class="mb-0">
					${userLogined.first_name} ${userLogined.last_name}
				</h6>
				<span>Admin</span>
			</div>
		</div>
		<div class="navbar-nav w-100">
			<a href="${base}/admin/dashboard" class="nav-item nav-link"
				style="padding-top: 15px; padding-bottom: 20px">Dashboard</a>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"
					style="padding-top: 15px; padding-bottom: 20px"> Quản lý đơn
					hàng</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="${base}/admin/orders_management/orders_list"
						class="dropdown-item">Danh sách đơn hàng</a>
				</div>
			</div>

			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"
					style="padding-top: 15px; padding-bottom: 20px"> Quản lý sản
					phẩm</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="${base}/admin/products_management/add_product"
						class="dropdown-item">Thêm/Cập nhật sản phẩm</a> <a
						href="${base}/admin/products_management/available_products"
						class="dropdown-item">Các sản phẩm hiện có</a>
				</div>
			</div>

			<a href="${base}/admin/subcribers"
				class="nav-item nav-link pt-3 pb-3">Subcribers</a> <a
				href="${base}/admin/accounts_management"
				class="nav-item nav-link pt-3 pb-3">Quản lý tài khoản</a> <a
				href="${base}/admin/contacts" class="nav-item nav-link pt-3 pb-3">Liên
				hệ</a>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"
					style="padding-top: 15px; padding-bottom: 20px"> Personal</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="${base}/logout" class="dropdown-item">Đăng xuất</a> <a
						href="${base}/admin/my_profile" class="dropdown-item">My
						Profile</a>
				</div>
			</div>
		</div>
	</nav>
</div>
<!-- Sidebar End -->