<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- Back to Top -->
<div class="site-footer">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="widget mb-4">
              <h3 class="mb-2"><a class="logo" href="${base}/home">CrazyShoes</a></h3>
              <p>
                Địa chỉ: 132 Đường Cầu Giấy, Phường Quan Hoa, Quận Cầu Giấy, Hà
                Nội <br />
                Số điện thoại: 0348641180
              </p>
            </div>
            <div class="widget">
              <h3>
                Đăng kí để nhận thông tin mới nhất về sản phẩm của chúng tôi
              </h3>
              <form class="subscribe">
                <div class="d-flex">
                  <input
                    type="email"
                    class="form-control"
                    id="idEmailSub"
                    placeholder="Email address"
                  />
                  <input
                    type="button"
                    onclick="callSubAjax()"
                    class="btn btn-black"
                    value="Subscribe"
                  />
                </div>
    
              </form>
              <script type="text/javascript">
                	function callSubAjax() {
                		
                		var requestBody = {
                				suber_email: $("#idEmailSub").val()
                        	}
                        	jQuery.ajax({
        						url: "${base}/ajax/subcribe",
        						type:"post",
        						contentType: "application/json",
        						data: JSON.stringify(requestBody),
        						dataType: "json",
        						success: function(jsonResult){
        							Swal.fire('Success!',
        									  jsonResult.statusMessage,
        									  'success')
        						},
        						error: function(jqXhrm, textStatus, errorMessage) {
        							Swal.fire('Error!',
        									  "Đã có lỗi xảy ra",
        									  'error')
        						}
        					});
					}
                </script>
            </div>
          </div>
          <div class="col-lg-2">
            <div class="widget">
              <h3>Hỗ trợ</h3>
              <ul class="list-unstyled">
                <li><a href="${base}/contact">Liên hệ với chúng tôi</a></li>
                <li><a href="#">Các câu hỏi thường gặp</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2">
            <div class="widget">
              <h3>About</h3>
              <ul class="list-unstyled">
                <li><a href="#">Về chúng tôi</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2">
            <div class="widget">
              <h3>Shop</h3>
              <ul class="list-unstyled">
                <li><a href="${base}/shop">Cửa hàng</a></li>
                <li><a href="#">Chương trình giảm giá</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- /.container -->
    </div>
    <!-- /.site-footer -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>