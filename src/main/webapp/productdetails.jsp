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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="/css/productdetails.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<div class="header">
    <jsp:include page="header.jsp"/>
    <%--    <nav class="navbar navbar-expand-lg bg-body-tertiary">--%>
    <%--        <div class="logo">--%>
    <%--            <img src="product_details/logo_pixian.png"--%>
    <%--                 alt="">--%>
    <%--        </div>--%>
    <%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
    <%--                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
    <%--                aria-expanded="false" aria-label="Toggle navigation">--%>
    <%--            <span class="navbar-toggler-icon"></span>--%>
    <%--        </button>--%>
    <%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
    <%--            <ul class="nav-list navbar-nav me-auto mb-2 mb-lg-0">--%>
    <%--                <div class="nav-links">--%>
    <%--                    <li><a href="index.jsp">Trang chủ</a></li>--%>

    <%--                    <li>--%>
    <%--                        <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"--%>
    <%--                           aria-controls="offcanvasExample">--%>
    <%--                            Sản phẩm--%>
    <%--                        </a>--%>
    <%--                    </li>--%>

    <%--                    <li><a href="/profilecard.jsp" target="_blank">Liên hệ</a></li>--%>
    <%--                    </li>--%>
    <%--                </div>--%>


    <%--                    <!--                     tìm kiếm-->--%>
    <%--                    <form action="/product-servlet?action=search" method="post">--%>
    <%--                        <div class="search-box">--%>
    <%--                            <input name="product_name" id="product_name" list="topics" class="search-box-input" type="search"--%>
    <%--                                   placeholder="Tìm tên sản phẩm...">--%>
    <%--                            <datalist id="topics">--%>
    <%--                                <option value="Ghế Văn Phòng Tay Gập Chân Xoay Xiaomi Manson Oasis Màu Đen">--%>
    <%--                                <option value="Gác Chân Công Thái Học Ergonomic Footrest Ghế Kê Chân Văn Phòng">--%>
    <%--                                <option value="Ghế Công Thái Học Manson Vera Lưới Vân Rồng Đen">--%>
    <%--                                <option value="Ghế Văn Phòng Tay Gập Xiaomi Manson Ergonomic">--%>
    <%--                                <option value="Bàn SMARTDESK GAMING">--%>
    <%--                                <option value="Bàn SMARTDESK GAMING BLACK PC">--%>
    <%--                                <option value="Bàn SMARTDESK STUDIO PRO">--%>
    <%--                                <option value="Bàn SMARTDESK STUDIO PIANO">--%>
    <%--                                <option value="BỘ BÁNH XE CHỊU LỰC BÀN SMARTDESK">--%>
    <%--                                <option value="Giá Treo CPU Buddy">--%>
    <%--                            </datalist>--%>
    <%--                            <button type="button" class="search-box-btn">--%>
    <%--                                <i class='bx bx-search-alt'></i>--%>
    <%--                            </button>--%>
    <%--                        </div>--%>
    <%--                    </form>--%>


    <%--                    <!--                          giỏ hàng-->--%>
    <%--                    <c:if test="${sessionScope.account.roleName != 'admin'}">--%>
    <%--                        <button class="search-box-cart" class="btn btn-primary" type="button"--%>
    <%--                                class="btn position-relative">--%>
    <%--                            <c:set var="size" value="${sessionScope.size}"/>--%>
    <%--                            <a style="color: black" href="/order/order.jsp"><i--%>
    <%--                                    class="fa-solid fa-cart-plus"></i></a>--%>
    <%--                            <c:if test="${sessionScope.size > 0}">--%>
    <%--                            <span style="margin: 81px -10px;font-size: 11px;"--%>
    <%--                                  class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">--%>
    <%--                                          ${size}--%>
    <%--                                <span class="visually-hidden">unread messages</span>--%>
    <%--                             </c:if>--%>
    <%--                            </span>--%>
    <%--                        </button>--%>
    <%--                    </c:if>--%>
    <%--                </div>--%>
    <%--            </ul>--%>


    <%--    </nav>--%>
    <%--</div>--%>

    <%--<!--    danh sách option sản phẩm-->--%>
    <%--<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">--%>
    <%--    <div class="list-product">--%>
    <%--        <div class="offcanvas-header">--%>
    <%--            <h5 class="offcanvas-title" id="offcanvasExampleLabel" style="font-weight: bold;font-size: 33px;margin: 20px -4px;">--%>
    <%--                Ergonomic3 Store--%>
    <%--                <i class="fa-brands fa-sass fa-bounce fa-sm" style="color: #7c889c;font-size: 39px;"></i>--%>
    <%--            </h5>--%>
    <%--            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>--%>
    <%--        </div>--%>
    <%--        <div class="offcanvas-body" >--%>
    <%--            <div style="font-size: 21px">--%>
    <%--                Chúng tôi đặt quyền lợi khách hàng lên hàng đầu,--%>
    <%--                cung cấp các dịch vụ và trải nghiệm tuyệt vời nhất cho khách hàng về sản phẩm tại shop--%>
    <%--                <i class="fa-brands fa-think-peaks fa-beat-fade fa-sm"></i>--%>
    <%--            </div>--%>
    <%--            <div class="dropdown mt-3">--%>
    <%--                <button style="background: grey" id="selection-product" class="btn btn-secondary dropdown-toggle" type="button"--%>
    <%--                        data-bs-toggle="dropdown">--%>
    <%--                    Xem sản phẩm của shop tại đây--%>
    <%--                </button>--%>
    <%--                <ul class="dropdown-menu">--%>
    <%--                    <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListChair">Ghế--%>
    <%--                        công thái học</a></li>--%>
    <%--                    <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListDesk">Bàn--%>
    <%--                        công thái học</a></li>--%>
    <%--                    <li><a style="font-weight: bold" class="dropdown-item"--%>
    <%--                           href="/product-servlet?action=showListAccessories">Phụ kiện công thái học</a></li>--%>
    <%--                    <li>--%>
    <%--                        <hr class="dropdown-divider">--%>
    <%--                    </li>--%>
    <%--                    <li><a style="font-weight: bold" class="dropdown-item" href="#">--%>
    <%--                        Sản phẩm HOT--%>
    <%--                        <i class="fa-solid fa-fire"></i>--%>
    <%--                    </a></li>--%>
    <%--                </ul>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</div>
<!--    hết-->

<!--    menu giỏ hàng-->
<!--    hết-->

<div class="none"></div>
<br>

<!--header-->


<div class="header">
    <!--//chi tiết sản phẩm-->
    <div class="header-content">
        <form action="order" name="f" method="post">
            <input type="hidden" name="action" value="addToCart">
            <input hidden="hidden" name="id" value="${product.productId}">
            <div class="row">
                <!--        ảnh-->
                <div class="col-xl-5 col-md-12">
                    <div class="hero-img">
                        <img src="/img_product/${product.imagesUrl}"/>
                    </div>
                </div>
                <div class="col-xl-7 col-md-12">
                    <div class="intro-text col-md-12">
                        <h1>
                            <c:out value="${product.productName}"/>
                        </h1>
                        <div class="container text-center">
                            <div class="row">
                                <p id="old-price">
                                    <fmt:formatNumber value="${product.oldPrice}"/> đ
                                </p>
                                <p id="new-price">
                                    <fmt:formatNumber value="${product.productPrice}"/> đ
                                </p>
                            </div>
                        </div>
                        <h3 id="intro">
                            <c:out value="${product.productDescription}"/>
                        </h3>
                        <c:if test="${sessionScope.account.roleName != 'admin'}">
                            <label for="quantity">Số lượng</label>
                            <input type="number" name="quantity" id="quantity" min="1" max="${product.productInventory}"
                                   value="1">
                            <div class="btns">
                                <button class="btn-primary" type="submit" onclick="buy('${product.productId}')">
                                    Thêm vào giỏ hàng
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </button>
                                <button class="btn-primary" type="submit">
                                    Mua ngay
                                    <i class="fa-brands fa-rebel"></i>
                                    <p style="font-size: 14px; text-align: center; font-style: italic">Ship cod tại nhà
                                        toàn
                                        quốc</p>
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%--        hết--%>
</div>


<!--footer-->
<footer class="py-3 my-4">
    <hr>
    <p class="text-center text-body-secondary">© C0523G1 Group3</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="/product/search.js"></script>
</body>

</html>
<script type="text/javascript">
    function buy(id) {
        document.f.action = "order?id=" + id;
        document.f.submit();
    }
</script>