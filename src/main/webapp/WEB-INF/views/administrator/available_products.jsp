<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Available products</title>
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
<!-- Favicon -->

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet" />
<style type="text/css">
.page-link, .current {
	padding: 10px 20px !important;
}

.current {
	color: red !important;
}
</style>

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
<style>
.avatar {
	max-width: 200px;
	max-height: 100px;
}
</style>
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
					<form
						action="${base }/admin/products_management/available_products"
						method="get">
						<div class="bg-secondary rounded h-100 p-4 ">
							<input hidden="hidden" id="page" name="page"
								class="form-control " value="${searchModel.keyword}"><input
								class="form-control bg-dark border-0" type="search"
								placeholder="Nhập từ khoá để tìm kiếm" name="keyword"
								id="keyword" value="${searchModel.keyword}" />
						</div>
						<div class="bg-secondary rounded h-100 p-4">
							<div class="form-floating mb-3">

								<select class="form-select" id="selectSearch"
									aria-label="Floating label select example" name="selectSearch">
									<option value="0" selected="selected">-- All --</option>
									<c:forEach items="${brands}" var="brand">
										<option value="${brand.id }">${brand.brandName}</option>
									</c:forEach>
								</select> <label for="floatingSelect">Chọn danh mục</label>
								<button type="submit" id="btnSearch"
									class="btn btn-primary  mt-3">Search</button>
								<a type="button" style="margin-left: 30px" id="addProduct"
									href="${base}/admin/products_management/add_product"
									class="btn btn-success mt-3"> Thêm mới sản phẩm </a>
							</div>
						</div>

						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">Các sản phẩm đang có sẵn</h6>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Avatar</th>
											<th scope="col">Tên sản phẩm</th>
											<th scope="col">Giá bán</th>
											<th scope="col">Nhãn hiệu</th>
											<th scope="col">Trạng thái</th>
											<th scope="col">Tuỳ chỉnh</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${products.data}" var="product">
											<tr>
												<th scope="row"><c:out value="ID${product.id}" /></th>
												<td><img class="avatar"
													src="${base}/upload/${product.avatar}" alt="avatar_product" /></td>
												<td>${product.productName}</td>
												<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
														value="${product.salePrice}" type="currency" /></td>
												<td>${product.brand.brandName}</td>
												<td><c:choose>
														<c:when test="${product.status}">
															<span class="text-success" id="status_id_${product.id}">
																<c:out value="Còn hàng" />
															</span>
														</c:when>
														<c:otherwise>
															<span class="text-danger" id="status_id_${product.id}">
																<c:out value="Hết hàng" />
															</span>
														</c:otherwise>
													</c:choose></td>
												<td>
													<div class="m-n2">
														<a type="button"
															onclick="callDeleteProductAjax(${product.id})"
															class="btn btn-danger m-2"> Xoá </a> <a type="button"
															href="${base}/admin/products_management/edit_products/${product.id}"
															class="btn btn-warning m-2"> Chỉnh sửa </a>
													</div>
												</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<!-- pagination -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Main End -->


			<!-- Footer Start -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
			<!-- Footer End -->
		</div>
		<!-- Content End -->

		<!-- script pagination -->
		<script type="text/javascript">
		$(document).ready(function() {
			$("#selectSearch").val(${searchModel.brandId});
			$("#paging").pagination({
				currentPage:${products.currentPage}, //trang hiện tại
				items : ${products.totalItems},
				itemsOnPage : ${products.sizeOfPage},
				cssStyle : 'dark-theme',
				onPageClick: function(pageNumber,event){
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				}
			});
		});
	</script>

		<script type="text/javascript">
                	function callDeleteProductAjax(productId) {
                		if (confirm("Bạn muốn xoá sản phẩm này?")) {
    						$.ajax({
    									type : "post",
    									url : "/ajax/admin/deleteProduct/"+productId,
    									success : function(data) {
    										alert("Xoá sản phẩm thành công")
    										location.reload();
    									},
    									error : function(errorThrown) {
    										alert("Xoá sản phẩm thất bại")
    									}
    								})
    					}
					}
                </script>
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
