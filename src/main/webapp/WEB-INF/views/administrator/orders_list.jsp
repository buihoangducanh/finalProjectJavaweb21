<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Danh sách đơn hàng</title>
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
	<style type="text/css">
.page-link, .current {
	padding: 10px 20px !important;
}

.current {
	color: red !important;
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
						action="${base }/admin/orders_management/orders_list"
						method="get">
					<div class="bg-secondary rounded h-100 p-4">
					<input hidden="hidden" id="page" name="page"
								class="form-control " >
						<div class="form-floating mb-3">
							<select class="form-select" id="selectSearch"
								aria-label="Floating label select example" name="selectSearch">
								<option value="0" selected="selected">-- All --</option>
								<option value="1" >Đang giao</option>
								<option value="2" >Chưa giao</option>
								<option value="3" >Bị huỷ</option>
								<option value="4" >Yêu cầu huỷ</option>
								<option value="5" >Đã giao hàng</option>
							</select> <label for="floatingSelect">Chọn danh mục</label>
							<button type="submit" id="btnSearch" class="btn btn-primary mt-3">
								Search</button>
						</div>
					</div>
					<div class="bg-secondary rounded h-100 p-4 pt-0">
						<div class="col-12">
							<div class="bg-secondary rounded h-100 p-4 pt-0">
								<h2 class="mb-4 text-center">Danh sách đơn hàng</h2>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Họ tên</th>
												<th scope="col">Địa chỉ</th>
												<th scope="col">Số điện thoại</th>
												<th scope="col">Chi tiết đơn hàng</th>
												<th scope="col">Trạng thái</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${saleOrders.data}" var="order">
												<tr>
													<td>${order.id }</td>
													<td>${order.customerName }</td>
													<td><span
														style="display: inline-block; width: 200px; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;">${order.customerAddress}</span></td>
													<td>${order.customerPhone}</td>
													<td><a type="button"
														href="${base }/admin/orders_management/orders_list/order_details/${order.id }"
														class="btn btn-light">Xem chi tiết</a></td>
													<td><c:choose>

															<c:when
																test="${order.status && !order.cancel_status && !order.recieved && 
																!order.cancel_request}">
																<button type="button" class="btn btn-warning">Chưa
																	giao hàng</button>
															</c:when>
															<c:when
																test="${!order.recieved &&  !order.status && 
																!order.cancel_status && 
																!order.cancel_request}">
																<button type="button" class="btn btn-success">Đang
																	giao hàng</button>
															</c:when>
															<c:when
																test="${order.cancel_status && !order.recieved }">
																<button type="button" class="btn btn-danger">Đã
																	bị huỷ</button>
															</c:when>
															<c:when
																test="${order.recieved && 
																!order.cancel_request}">
																<button type="button" class="btn btn-success">Đã
																	nhận hàng</button>
															</c:when>
															<c:when
																test="${order.cancel_request && !order.recieved}">
																<button type="button" class="btn btn-danger">Yêu cầu huỷ</button>
															</c:when>
															
														</c:choose></td>
												</tr>
											</c:forEach>


										</tbody>
									</table>
								</div>
							</div>
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
			<!-- script pagination -->
		<script type="text/javascript">
		$(document).ready(function() {
			$("#selectSearch").val(${searchModel.type});
			$("#paging").pagination({
				currentPage:${saleOrders.currentPage}, //trang hiện tại
				items : ${saleOrders.totalItems},
				itemsOnPage : ${saleOrders.sizeOfPage},
				cssStyle : 'dark-theme',
				onPageClick: function(pageNumber,event){
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				}
			});
		});
	</script>
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
