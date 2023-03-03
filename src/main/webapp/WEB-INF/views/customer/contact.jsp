<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />


    <meta name="description" content="" />
    <meta name="keywords" content="" />
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
	
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- CSS -->
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <title>Liên hệ chúng tôi</title>
  </head>

  <body>
    <!-- search bar and nav bar -->
  	<jsp:include page="/WEB-INF/views/customer/layout/searchBar_navBar.jsp"></jsp:include>
  	<!-- /search bar and nav bar -->

    <div class="page-heading bg-light">
      <div class="container">
        <div class="row align-items-end text-center">
          <div class="col-lg-7 mx-auto">
            <h3 class="mb-4 font-weight-bold mb-5">LIÊN HỆ</h3>
            <p class="mb-4">
              <a href="${base}/home">Trang chủ</a> / <strong>Liên hệ</strong>
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="untree_co-section">
      <div class="container">
        <div class="row mb-5">
          <div
            class="col-lg-12 mr-auto order-1"
            data-aos="fade-up"
            data-aos-delay="200"
          >
          <!-- normal form -->
            <%-- <form action="${base}/contact" method="post">
              <div class="row">
                <div class="col-6 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    name="fullName"
                    placeholder="Tên của bạn"
                  />
                </div>
                <div class="col-6 mb-3">
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="Email"
                  />
                </div>
                <div class="col-12 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    name="requestType"
                    placeholder="Yêu cầu"
                  />
                </div>
                <div class="col-12 mb-3">
                  <textarea
                    name="message"
                    id=""
                    cols="30"
                    rows="7"
                    class="form-control"
                    placeholder="Lời nhắn"
                  ></textarea>
                </div>

                <div class="col-12">
                  <input
                    type="submit"
                    value="Gửi yêu cầu"
                    class="btn btn-black"
                  />
                </div>
              </div>
            </form> --%>
            
            
            <!-- use spring form -->
            <sf:form modelAttribute="contact" action="${base}/contact" method="post">
              <div class="row">
                <div class="col-6 mb-3">
                  <sf:input
                  	path="fullName"
                    type="text"
                    class="form-control"
                    name="fullName"
                    placeholder="Tên của bạn"
                  />
                </div>
                <div class="col-6 mb-3">
                  <sf:input
                  	path="email"
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="Email"
                  />
                </div>
                <div class="col-12 mb-3">
                  <sf:input
                  	path="requestType"
                    type="text"
                    class="form-control"
                    name="requestType"
                    placeholder="Yêu cầu"
                  />
                </div>
                <div class="col-12 mb-3">
                  <sf:textarea
                  	path="message"
                    name="message"
                    id=""
                    cols="30"
                    rows="7"
                    class="form-control"
                    placeholder="Lời nhắn"
                  ></sf:textarea>
                </div>

                <div class="col-12">
                <button onclick="thanks();"  type="submit"
                    class="btn btn-black">Gửi yêu cầu</button>
                </div>
              </div>
            </sf:form>
            <script type="text/javascript">
            function thanks() {
				alert("Cảm ơn bạn đã liên hệ với chúng tôi!")
			}
            	
            </script>
            <!-- use ajax -->
            <!-- normal form -->
            <!-- <form method="post">
              <div class="row">
                <div class="col-6 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    name="fullName"
                    id="idFullName"
                    placeholder="Tên của bạn"
                  />
                </div>
                <div class="col-6 mb-3">
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="Email"
                    id="idEmail"
                  />
                </div>
                <div class="col-12 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    name="requestType"
                    placeholder="Yêu cầu"
                    id="idRequestType"
                  />
                </div>
                <div class="col-12 mb-3">
                  <textarea
                    name="message"
                    id="idMessage"
                    cols="30"
                    rows="7"
                    class="form-control"
                    placeholder="Lời nhắn"
                    
                  ></textarea>
                </div>

                <div class="col-12">
                  <input
                    type="button"
                    onclick="callAjax()"
                    value="Gửi yêu cầu"
                    class="btn btn-black"
                  />
                </div>
              </div>
              <script>
                	function callAjax() {
						var requestBody = {
								email: $("#idEmail").val(), // get element by id
								fullName: $("#idFullName").val()
						};
						jQuery.ajax({
							url: "${base}/ajax/contact",
							type:"post",
							contentType: "application/json",
							data: JSON.stringify(requestBody),
							dataType: "json",
							success: function(jsonResult){
								Swal.fire('Thank you!',
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
            </form> -->
          </div>
        </div>
      </div>
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
