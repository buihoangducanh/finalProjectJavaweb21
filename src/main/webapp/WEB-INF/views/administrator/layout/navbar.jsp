<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- Navbar Start -->
<nav
	class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
	<a href="${base}/admin/dashboard"
		class="navbar-brand d-flex d-lg-none me-4">
		<h2 class="text-primary mb-0">
			<i class="fa fa-user-edit"></i>
		</h2>
	</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
		class="fa fa-bars"></i>
	</a>

	<div class="navbar-nav align-items-center ms-auto">
		<div class="nav-item dropdown">
			<a href="${base}/admin/my_profile" class="nav-link dropdown-toggle"
				data-bs-toggle="dropdown"> <span
				class="d-none d-lg-inline-flex">${userLogined.first_name} ${userLogined.last_name}</span>
			</a>
			<div
				class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
				<a href="${base}/admin/my_profile" class="dropdown-item">My
					Profile</a> <a href="${base}/logout" class="dropdown-item">Đăng
					xuất</a>
			</div>
		</div>
	</div>
</nav>
<!-- Navbar End -->