<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký</title>
	<!-- import JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <!-- spring form taglib -->
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    
    <!-- base var -->
     <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
     <!-- font awesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
	
    <!-- bootstrap css -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
    />
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${base}css/customer/style.css" />
    <link rel="stylesheet" href="${base}css/customer/login.css" />
  </head>
  <body>
    <div class="row w-100 px-5 pt-2">
      <div class="col-4 p-0 mt-5 ml-4">
        <a href="${base}/home" style="color: white; font-size: 40px" class="logo"
          >CrazyShoes<span class="text-primary">.</span></a
        >
      </div>
      <div class="container col-5 sign-up-container">
        <h2 class="text-center font-weight-bold">Welcome to CrazyShoes!</h2>
        <h3 class="text-left text-center font-weight-bold mt-2 mb-3">
          Đăng ký
        </h3>
        <form action="${base }/sign_up" method="post">
          <div class="form-group">
            <label for="firstName" class="font-weight-bold">Nhập tên</label>
            <input
              type="text"
              class="form-control"
              id="firstName"
              name="firstName"
              placeholder="First name"
            />
          </div>
          <div class="form-group">
            <label for="lastName" class="font-weight-bold">Nhập họ đệm</label>
            <input
              type="text"
              class="form-control"
              id="lastName"
               name="lastName"
              placeholder="Last name"
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1 " class="font-weight-bold"
              >Email</label
            >
            <input
              type="email"
              class="form-control"
              id="exampleInputEmail1"
              name="email"
              aria-describedby="emailHelp"
              placeholder="Enter email"
            />
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1" class="font-weight-bold"
              >Mật khẩu</label
            >
            <input
              type="password"
              name="password"
              class="form-control"
              id="exampleInputPassword1"
              placeholder="Password"
            />
          </div>
          <div class="form-group">
            <label for="confPassword" class="font-weight-bold"
              >Số điện thoại</label
            >
            <input
              type="text"
              class="form-control"
              id="confPassword"
              name="phoneNumber"
              placeholder="Nhập số điện thoại"
            />
          </div>
          <button type="submit" class="btn btn-lg btn-dark btn-block rounded-0">
            Đăng ký
          </button>
        </form>
        <p class="mt-3">
          Đã có tài khoản? <a href="${base}/sign_in">Đăng Nhập</a>
        </p>
      </div>
    </div>
  </body>
</html>
