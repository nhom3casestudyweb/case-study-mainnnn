<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 02/09/2023
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="form_product.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
  <link rel="stylesheet" href="product.css">
</head>
<body>
<div class="header">
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="logo ">
      <img src="images/logo_pixian.png"
           alt="">
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="nav-list navbar-nav me-auto mb-2 mb-lg-0">
        <div class="nav-links">
          <li><a href="index.jsp">Trang chủ</a></li>

          <li>
            <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
              Sản phẩm
            </a>
          </li>

          <li><a href="/profile_card/profilecard.jsp" target="_blank">Liên hệ</a></li>
          </li>
        </div>

        <div class="nav-btns">
          <button class="btn-primary"><a
                  href="/login/login.jsp">Đăng
            nhập</a></button>
          <div class="search-box">
            <input class="search-box-input" type="search" placeholder="Tìm tên sản phẩm...">
            <button class="search-box-btn" type="submit">
              <i class='bx bx-search-alt'></i>
            </button>
          </div>
          <button class="search-box-cart">
            <i class='bx bx-cart-add'></i>
          </button>
        </div>
      </ul>
    </div>
  </nav>
</div>

<!--    danh sách option sản phẩm-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel" style="font-weight: bold">
      Ergonomic3 Store
      <i class="fa-solid fa-bag-shopping"></i>
    </h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div>
      Chúng tôi đặt quyền lợi khách hàng lên hàng đầu,
      cung cấp các dịch vụ và trải nghiệm tuyệt vời nhất cho khách hàng về sản phẩm tại shop
    </div>
    <div class="dropdown mt-3">
      <button id="selection-product" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
        Xem sản phẩm của shop tại đây
      </button>
      <ul class="dropdown-menu">
        <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListChair">Ghế công thái học</a></li>
        <li><a style="font-weight: bold" class="dropdown-item" href="#">Bàn công thái học</a></li>
        <li><a style="font-weight: bold" class="dropdown-item" href="#">Phụ kiện công thái học</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a style="font-weight: bold" class="dropdown-item" href="#">
          Sản phẩm HOT
          <i class="fa-solid fa-fire"></i>
        </a></li>
      </ul>
    </div>
  </div>
</div>
<!--    hết-->
<div class="none"></div>
<br>

<!--header-->
<div class="class-deader-product">
  <h1>Sản phẩm</h1>
  <p>các sản phẩm ghế công thái học có mặt tại cửa hàng</p>
</div>

<%--<c:forEach var="product" items="${listChair}">--%>
<%--    <div class="card">--%>
<%--        <div class="card-heart">--%>
<%--            <i class='bx bxs-heart'></i>--%>
<%--        </div>--%>
<%--        <div class="card-cart">--%>
<%--            <i class='bx bxs-cart'></i>--%>
<%--        </div>--%>
<%--        <div class="card-img">--%>
<%--            <img src="ghecongthaihoc.png"/></div>--%>
<%--        <div class="card-title">--%>
<%--            <p><c:out value="${product.product_name}"/></p>--%>
<%--        </div>--%>
<%--        <div class="card-price">--%>
<%--            <p><c:out value="${product.product_price}"/></p>--%>
<%--        </div>--%>
<%--        <div class="card-action">--%>
<%--            <button>Xem chi tiết sản phẩm</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</c:forEach>--%>

<div class="container text-center">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
    <c:forEach var="product" items="${listChair}">
      <div class="col">
        <div class="card">
          <div class="card-heart">
            <i class='bx bxs-heart'></i>
          </div>
          <div class="card-cart">
            <i class='bx bxs-cart'></i>
          </div>
          <div class="card-img">
            <img src="images/ghecongthaihoc.png"/></div>
          <div class="card-title">
            <p><c:out value="${product.product_name}"/></p>
          </div>
          <div class="card-price">
            <p><c:out value="${product.product_price}"/>đ</p>
          </div>
          <div class="card-action">
            <button>Xem chi tiết sản phẩm</button>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>


<!--footer-->
<footer class="py-3 my-4">
  <hr>
  <p class="text-center text-body-secondary">© C0523G1 Group3</p>
</footer>

<!--top-->
<button onclick="topFunction()" id="myBtn" title="Go to top">
  <i class="fa-solid fa-arrow-up"></i>
</button>

<script>
  let mybutton = document.getElementById("myBtn");
  window.onscroll = function () {
    scrollFunction()
  };

  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }

  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="search.js"></script>
</body>
</html>