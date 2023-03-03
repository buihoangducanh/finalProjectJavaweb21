<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Thêm mới sản phẩm</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />
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

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/libraries_stylesheet.jsp"></jsp:include>

<!-- Customized Bootstrap Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/customized_bootstrap_style.jsp"></jsp:include>

<!-- Template Stylesheet -->
<jsp:include
	page="/WEB-INF/views/administrator/layout/template_style.jsp"></jsp:include>
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<jsp:include page="/WEB-INF/views/administrator/layout/spinner.jsp"></jsp:include>
		<!-- Spinner End -->

		<!-- Sidebar Start -->
		<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
		<!-- Sidebar End -->

		<!-- Content Start -->
		<div class="content">

			<!-- Navbar Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/navbar.jsp"></jsp:include>
			<!-- Navbar End -->

			<!-- Main Start -->
			<div class="container-fluid pt-4 px-4 mh-100">
				<div
					class="row bg-secondary rounded align-items-center justify-content-center mx-0">
					<div class="bg-secondary rounded h-100 p-4">
						<!-- Form start -->
						<sf:form modelAttribute="product"
							action="${base}/admin/products_management/add_product"
							class="h-100" method="post" enctype="multipart/form-data">
							<h6 class="mb-4">Thêm/Cập nhật sản phẩm</h6>
							<div class="form-floating mb-3">
								<sf:hidden path="id" class="form-control" id="floatingInput"
									placeholder="id number"></sf:hidden>
								<label for="floatingInput">Id</label>
							</div>
							<div class="form-floating mb-3">
								<sf:input path="productName" type="text" class="form-control"
									id="product-name" placeholder="product name" />
								<label for="product-name">Tên sản phẩm</label>
							</div>

							<div class="form-floating mb-3">
								<sf:input path="productPrice" type="text" class="form-control"
									id="priceID" name="price" placeholder="Price" />
								<label for="price">Giá</label>
							</div>

							<div class="form-floating mb-3">
								<sf:input path="salePrice" type="text" class="form-control"
									id="sale-price" placeholder="Sale price" />
								<label for="sale-price">Giá bán</label>
							</div>
							<div class="form-floating mb-3">
								<sf:input path="material" type="text" class="form-control"
									id="material" placeholder="Sale price" />
								<label for="material">Chất liệu</label>
							</div>
							<div class="form-floating mb-3">
								<sf:input path="manufactory" type="text" class="form-control"
									id="manufactory" placeholder="Sale price" />
								<label for="manufactory">Nơi sản xuất</label>
							</div>
							<div class="form-floating mb-3">
								<sf:select path="brand.id" class="form-select"
									id="brand-selector">
									<sf:options items="${brands}" itemValue="id"
										itemLabel="brandName" />
								</sf:select>
								<label for="brand-selector">Thương hiệu</label>
							</div>

							<label for="size-selector" style="margin-bottom: 20px !important">Chọn
								Sizes</label>
							<div style="display: flex; align-items: center; gap: 10px;"
								class="form-floating mb-3" id="size-selector">
								<c:forEach items="${sizes}" var="size">
									<input style="margin-left: 20px !important"
										class=" form-check-input m-0" type="checkbox" id="${size.id }"
										value="${size.id }" name="sizesList">${size.sizeName}
				</c:forEach>
							</div>

							<div class="form-floating mb-3">
								<sf:select path="color.id" class="form-select"
									id="color-selector">
									<sf:options items="${colors}" itemValue="id"
										itemLabel="colorName" />
								</sf:select>
								<label for="color-selector">Màu sắc</label>
							</div>

							<div class="form-floating mb-3">
								<sf:select path="type.id" class="form-select"
									id="shoe-type-selector">
									<sf:options items="${types}" itemValue="id"
										itemLabel="typeName" />
								</sf:select>
								<label for="shoe-type-selector">Phân loại</label>
							</div>

							<div class="form-floating mb-3">
								<p class="gap-3 d-flex align-items-center">
									<label class="text-danger" for="hot"> Sản phẩm hot ?</label> <input
										class=" form-check-input m-0" value="true" type="checkbox" id="hot"
										name="hotProduct">
								</p>

							</div>

							<div class="form-floating">
								<sf:textarea path="productDescription" class="form-control"
									placeholder="Description" id="floatingTextarea"
									style="height: 150px"></sf:textarea>
								<label for="floatingTextarea">Mô tả</label>
							</div>
							<div class="mb-3">
								<label for="formFile" class="form-label">Avatar</label> <input
									class="form-control bg-dark" type="file" id="formFile"
									name="avatarP" />
							</div>
							<div class="mb-3">
								<label for="formFileMultiple" class="form-label">Ảnh sản
									phẩm</label> <input class="form-control bg-dark" type="file"
									id="formFileMultiple" multiple name="productImagess" />
							</div>
							<button class="btn btn-primary w-100" type="submit">Xác
								nhận</button>
						</sf:form>
						<!-- Form end -->
					</div>
				</div>
			</div>
			<!-- Main End -->

			<!-- Footer Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
			<!-- Footer End -->
		</div>
		<!-- Content End -->

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<jsp:include page="/WEB-INF/views/administrator/layout/jsLibrary.jsp"></jsp:include>

	<!-- Template Javascript -->
	<jsp:include page="/WEB-INF/views/administrator/layout/templateJS.jsp"></jsp:include>
</body>
</html>
