
// Thêm sản phẩm vào trong giỏ hàng với productId và số lượng mua sản phẩm đó
function AddToCart(baseUrl, productId, quantity,size) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quantity: quantity, // Số lượng cho vào giỏ hàng
		size: size,
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			//alert(jsonResult.totalItems)
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#item-in-cart").html(jsonResult.totalItems);
			Swal.fire(
				'Thêm vào giỏ hàng thành công!',
				'',
				'success'
			)
			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

// Thêm sản phẩm vào trong giỏ hàng với productId và số lượng mua sản phẩm đó
function buyNow(baseUrl, productId, quantity,size) {
	let data = {
		productId: productId, // Id sản phẩm
		quantity: quantity, // Số lượng cho vào giỏ hàng
		size: size,
	};

	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", 
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#item-in-cart").html(jsonResult.totalItems);
			window.location = baseUrl + "/cart/checkout";
			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}