<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Log in to Crazy Shoes</title>
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

<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
	rel="stylesheet" />
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${base}css/customer/style.css" />
<link rel="stylesheet" href="${base}css/customer/login.css" />
</head>
<body>
	<div class="row vw-100 p-5">
		<div class="col-5">
			<a href="${base}/home" style="color: white; font-size: 40px"
				class="logo m-0">CrazyShoes<span
				class="text-primary">.</span></a>
		</div>

		<div class="container col-5">
			<h2 class="text-center font-weight-bold">Welcome back!</h2>
			<h3 class="text-left text-center font-weight-bold mt-4 mb-3">
				Đăng nhập</h3>
			<form action="${base }/login_processing_url" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1 " class="font-weight-bold">Email</label>
					<input name="username" type="email" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp"
						placeholder="Enter email" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1" class="font-weight-bold">Mật
						khẩu</label> <input name="password" type="password" class="form-control"
						id="exampleInputPassword1" placeholder="Password" />
				</div>
				<button type="submit"
					class="rounded-0 btn btn-lg btn-dark btn-block">Đăng nhập
				</button>

				<c:if test="${not empty param.sign_in_error}">
					<p class="text-danger mt-4">
						Tài khoản hoặc mật khẩu không đúng, hãy thử lại!
					<p>
				</c:if>
			</form>
			<p class="mt-3">
				Chưa có tài khoản? <a href="${base}/sign_up">Đăng Ký</a>
			</p>
		</div>
	</div>
</body>
</html>
