<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 02/09/2023
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/form_product.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="/css/product_accessories.css">
    <link rel="stylesheet" href="/css/cart.css">
</head>
<body>
<div class="header">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="logo ">
            <img src="product/logo_pixian.png"
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
                    <li><a href="user_home.jsp">Trang chủ</a></li>

                    <li>
                        <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                            Sản phẩm
                        </a>
                    </li>

                    <li><a href="/profilecard.jsp" target="_blank">Liên hệ</a></li>
                    </li>
                </div>

                <div class="nav-btns">
                    <!--                   tên admin-->
                    <p style="font-size: 20px;height: 61px; border: 1px solid; border-radius: 9px; padding: 6px 14px 29px 16px ;margin: 6px 10px;top: 11px;cursor: default">
                        <c:out value="${account.userName}"/>
                        <a data-bs-toggle="modal"
                           data-bs-target="#exampleModal">
                            <i id="log-out" style="cursor: pointer;font-size: 30px; margin: 5px 7px;"
                               class="fa-solid fa-right-from-bracket"></i>
                        </a>
                    </p>

                    <!--                     tìm kiếm-->
                    <form action="/product-servlet?action=search" method="post">
                        <div class="search-box">
                            <input name="product_name" id="product_name" list="topics" class="search-box-input" type="search"
                                   placeholder="Tìm tên sản phẩm...">
                            <datalist id="topics">
                                <option value="Ghế Văn Phòng Tay Gập Chân Xoay Xiaomi Manson Oasis Màu Đen">
                                <option value="Gác Chân Công Thái Học Ergonomic Footrest Ghế Kê Chân Văn Phòng">
                                <option value="Ghế Công Thái Học Manson Vera Lưới Vân Rồng Đen">
                                <option value="Ghế Văn Phòng Tay Gập Xiaomi Manson Ergonomic">
                                <option value="Bàn SMARTDESK GAMING">
                                <option value="Bàn SMARTDESK GAMING BLACK PC">
                                <option value="Bàn SMARTDESK STUDIO PRO">
                                <option value="Bàn SMARTDESK STUDIO PIANO">
                                <option value="BỘ BÁNH XE CHỊU LỰC BÀN SMARTDESK">
                                <option value="Giá Treo CPU Buddy">
                            </datalist>
                            <button type="button" class="search-box-btn">
                                <i class='bx bx-search-alt'></i>
                            </button>
                        </div>
                    </form>


                    <!--                          giỏ hàng-->
                    <c:if test="${sessionScope.account.roleName != 'admin'}">
                        <button class="search-box-cart" class="btn btn-primary" type="button"
                                class="btn position-relative">
                            <c:set var="size" value="${sessionScope.size}"/>
                            <a style="color: black" href="/order/order.jsp"><i
                                    class="fa-solid fa-cart-plus"></i></a>
                            <c:if test="${sessionScope.size > 0}">
                            <span style="margin: 81px -10px;font-size: 11px;"
                                  class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                          ${size}
                                <span class="visually-hidden">unread messages</span>
                             </c:if>
                            </span>
                        </button>
                    </c:if>
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
                <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListChairUser">Ghế công thái học</a></li>
                <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListDeskUser">Bàn công thái học</a></li>
                <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListAccessoriesUser">Phụ kiện công thái học</a></li>
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

<!--    menu giỏ hàng-->
<form action="" method="">
    <div style="background: grey" class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            <h3 class="offcanvas-title" id="offcanvasRightLabel">Giỏ hàng của bạn</h3>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            Giỏ hàng của bạn đang trống !
        </div>
        <hr>
        <div class="price-product">
            <h4 class="total-price">Tổng tiền</h4>
            <h4 class="price">0 đ</h4>
        </div>
        <p style="font-size: 13px; margin: 19px 14px">Phí vận chuyển sẽ được tính khi bạn thanh toán sản phẩm</p>
        <button class="buy-product" type="submit">
            Thanh Toán
        </button>
    </div>
</form>
<!--    hết-->

<div class="none"></div>
<br>

<!--header-->
<div class="class-deader-product">
    <h1>Sản phẩm</h1>
    <p>các phụ kiện công thái học có mặt tại cửa hàng</p>
</div>

<div class="container text-center">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
        <c:forEach var="product" items="${listAccessories}">
            <div class="col">
                <div class="card">
                    <div class="card-img">
                        <img src="/erasing_img_product/${product.erasingImg}"/>

                    </div>
                    <div class="card-title">
                        <p><c:out value="${product.productName}"/></p>
                    </div>
                    <div class="card-price">
                        <p><fmt:formatNumber value="${product.productPrice}"/> đ</p>
                    </div>
                    <div class="card-action">
                        <button type="submit" name="productId" value="${product.productId}"><a  href="/product-servlet?action=showProductDetail&productId=${product.productId}" style="text-decoration: none; color: white">Xem chi tiết sản phẩm</a></button>
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
<script src="product/search.js"></script>
</body>
</html>
