<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" />
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<style type="text/css">
.page-link, .current {
	padding: 10px 20px !important;
}

li.pb-0>label, option {
	cursor: pointer;
}
</style>


<title>Cửa hàng</title>
</head>

<body>
	<!-- search bar and nav bar -->
	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
	<!-- /search bar and nav bar -->

	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h3 class="mb-4 font-weight-bold mb-5">SHOP</h3>
					<p class="mb-4">
						<a href="${base }/home">Trang chủ</a> / <strong>Shop</strong>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="untree_co-section pt-3">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8">
					<h4 class="mb-3 mb-lg-0 font-weight-bold">Danh sách các sản phẩm</h4>
				</div>
				<div class="col-lg-4">
					<div class="d-flex sort align-items-center justify-content-lg-end">
						<strong class="mr-3">Sắp xếp theo:</strong>
						<form action="#">
							<select id="orderBy" onchange="orderFuction(this)"
								class="container-fluid" required>
								<option selected="selected" value="newest">Sản phẩm mới
									nhất</option>
								<option value="trending">Bán chạy</option>
								<option value="increasingPrice">Giá tăng dần</option>
								<option value="decreasingPrice">Giá giảm dần</option>
							</select>
						</form>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<h5 class="category-name font-weight-bold mb-3">
						<ins>Thương hiệu</ins>
					</h5>
					<ul class="list-unstyled categories">
						<c:forEach var="brand" items="${brands }">
							<li class="pretty p-default p-curve pb-0"><input
								onchange="handleChange(this)" type="checkbox"
								id="brand_${brand.id }" />
								<div class="state">
									<label class="ml-1 mb-0 " for="brand_${brand.id }">${brand.brandName }</label>
								</div></li>
						</c:forEach>

					</ul>

					<h5 class="category-name font-weight-bold mb-3 mt-5">
						<ins>Kiểu dáng</ins>
					</h5>
					<ul class="list-unstyled categories">
						<c:forEach var="type" items="${types }">
							<li class="pretty p-default p-curve pb-0"><input
								type="checkbox" onchange="handleChange(this)"
								id="type_${type.id}" />
								<div class="state">
									<label class="ml-1 mb-0" for="type_${type.id}">${type.typeName}</label>
								</div></li>
						</c:forEach>


					</ul>

					<h5 class="category-name font-weight-bold mb-3 mt-5">
						<ins>Màu sắc</ins>
					</h5>
					<ul class="list-unstyled categories">

						<c:forEach var="color" items="${colors}">
							<li class="pb-0 pretty p-default p-curve "><input
								type="checkbox" onchange="handleChange(this)"
								id="color_${color.id}" />
								<div class="state">
									<label class="ml-1 mb-0" for="color_${color.id}">${color.colorName}</label>
								</div></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-md-9">
					<div class="row">
						<!--list products start -->
						<c:forEach items="${products.data}" var="product">
							<!--a product start -->
							<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
								<div class="product-item">
									<a href="${base}/product_details/${product.id}"
										class="product-img"> <img
										src="${base}/upload/${product.avatar}" alt="Image"
										class="img-fluid" />
									</a>
									<h3 class="title">
										<a href="${base}/product_details/${product.id}">${product.productName}</a>
									</h3>
									<div class="price">
										<span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
												value="${product.salePrice}" type="currency" />
										</span>
									</div>
								</div>
							</div>
							<!--a product end -->
						</c:forEach>

						<!--list products end -->
					</div>

					<!-- pagination -->
					<div class="row">
						<div class="col-12 d-flex justify-content-center pt-5">
							<div id="paging"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Search and pagination -->
	<!-- FAKE FORM -->
	<form id="filterAndSearch" style="display: none" action="${base }/shop">
		<input hidden="hidden" id="page" name="page" class="form-control ">
		<c:choose>
			<c:when test="${prodSearchMod.keyword != NULL}">
				<script type="text/javascript">
			$('#keyword').val(${prodSearchMod.keyword});
			</script>
			</c:when>
		</c:choose>
		<input hidden="hidden" id="keyword" value="${prodSearchMod.keyword}"
			name="keyword" class="form-control ">
		<button type="submit" id="btnSearch" style="display: none"
			class="btn btn-primary">Search</button>
	</form>
	<!-- /.untree_co-section -->


	<!-- FILTER AND SEARCH -->
	<script>
	function orderFuction(select){
		var id = select.id;
		var x = document.createElement("INPUT");
		x.setAttribute("id", id + "form");
		var name = id;
		x.setAttribute("name", name);
		x.setAttribute("value", select.value);
		document.getElementById("filterAndSearch").appendChild(x);
	}
	
	
     function handleChange(checkbox) {
      var id = checkbox.id;
      if (checkbox.checked == true) {
        var x = document.createElement("INPUT");
        x.setAttribute("type", "text");
        x.setAttribute("id", id + "form");
        x.checked = true;
        x.value = id;
        var name = id.slice(0, -2);
        x.setAttribute("name", name);
        document.getElementById("filterAndSearch").appendChild(x);
      } else {
        document.getElementById(id + "form").remove();
      }
    } 
 	
     function createInputInFakeForm(value){
    	 var x = document.createElement("INPUT");
		  	x.setAttribute("type", "checkbox");
	        x.setAttribute("id", value + "form");
	        x.checked = true;
	        x.value = value;
	        var name = value.slice(0, -2);
	        x.setAttribute("name", name);
	        document.getElementById("filterAndSearch").appendChild(x);
     }
     
		$(document).ready(function() {
			 
			$("#paging").pagination({
				currentPage:${products.currentPage},
				items : ${products.totalItems},
				itemsOnPage : ${products.sizeOfPage},
				cssStyle : 'light-theme',
				onPageClick: function(pageNumber,event){
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
					
				}
			});
		
			jQuery(function(){
				  jQuery('input[type="checkbox"]').on('change',function(){
					  $('#btnSearch').trigger('click');
				  });
				}); 
			
			jQuery(function(){
				  jQuery('#orderBy').on('change',function(){
					  $('#btnSearch').trigger('click');
				  });
				}); 
		
		});

		$(document).ready(function() {
			$("#orderBy").val('${prodSearchMod.orderBy}')	
		
		$.each(${prodSearchMod.brandID_list}, function( index, value ) {			
				  value = "brand_"+value;			  
				  $('#'+value).prop('checked', true);
				  createInputInFakeForm(value)
				  
				});
		
		$.each(${prodSearchMod.typeID_list}, function( index, value ) {			  
			  value = "type_"+value;			  
			  $('#'+value).prop('checked', true);
			  createInputInFakeForm(value)
			});
		
		$.each(${prodSearchMod.colorsID_list}, function( index, value ) {			 
			  value = "color_"+value;			  
			  $('#'+value).prop('checked', true);
			  createInputInFakeForm(value)
			});
		});
	
	</script>
	<!-- //FILTER AND SEARCH -->

	<div class="untree_co-section pt-0">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h3 class="h3">CÁC SẢN PHẨM PHỔ BIẾN</h3>
				</div>
			</div>
			<!-- /.heading -->
			<div class="owl-4-slider owl-carousel">
				<c:forEach items="${topFiveHot}" var="hotItem">

					<div class="item">
						<div class="product-item">
							<a href="${base}/product_details/${hotItem.id}"
								class="product-img"> <img
								src="${base}/upload/${hotItem.avatar}" alt="Image"
								class="img-fluid" />
							</a>
							<h3 class="title">
								<a href="${base}/product_details/${hotItem.id}">${hotItem.productName}</a>
							</h3>
							<div class="price">
								<span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
										value="${hotItem.salePrice}" type="currency" />
								</span>
							</div>
						</div>
					</div>
					<!-- /.item -->
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
