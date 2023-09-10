<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="css/home_page2.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
<div class="header">
    <!--    header-menu-->
    <!--    người viết: hậu-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <!--        logo wed-->
        <div class="logo">
            <img src="home_img/logo.png">
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
                        <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                           aria-controls="offcanvasExample">
                            Sản phẩm
                        </a>
                    </li>

                    <li><a href="/profilecard.jsp" target="_blank">Liên hệ</a></li>
                </div>

                <div class="nav-btns">

                    <%--          tên user--%>
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
    <!--    hết-->


    <%--modal đăng xuất--%>
    <div class="modal" tabindex="-1" id="exampleModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="index.jsp">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden">
                        <span class="text-danger">Bạn có chắc chắn muốn đăng xuất không ?</span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Đăng xuất</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!--    danh sách option sản phẩm-->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="list-product">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel" style="font-weight: bold;font-size: 33px;margin: 20px -4px;">
                    Ergonomic3 Store
                    <i class="fa-brands fa-sass fa-bounce fa-sm" style="color: #7c889c;font-size: 39px;"></i>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" >
                <div style="font-size: 21px">
                    Chúng tôi đặt quyền lợi khách hàng lên hàng đầu,
                    cung cấp các dịch vụ và trải nghiệm tuyệt vời nhất cho khách hàng về sản phẩm tại shop
                    <i class="fa-brands fa-think-peaks fa-beat-fade fa-sm"></i>
                </div>
                <div class="dropdown mt-3">
                    <button style="background: grey" id="selection-product" class="btn btn-secondary dropdown-toggle" type="button"
                            data-bs-toggle="dropdown">
                        Xem sản phẩm của shop tại đây
                    </button>
                    <ul class="dropdown-menu">
                        <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListChairUser">Ghế
                            công thái học</a></li>
                        <li><a style="font-weight: bold" class="dropdown-item" href="/product-servlet?action=showListDeskUser">Bàn
                            công thái học</a></li>
                        <li><a style="font-weight: bold" class="dropdown-item"
                               href="/product-servlet?action=showListAccessoriesUser">Phụ kiện công thái học</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a style="font-weight: bold" class="dropdown-item" href="#">
                            Sản phẩm HOT
                            <i class="fa-solid fa-fire"></i>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--    hết-->

    <!--    menu giỏ hàng-->
    <form action="" method="">
        <div style="background: grey" class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
             aria-labelledby="offcanvasRightLabel">
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

    <!--//header2-->
    <div class="header-content">
        <div class="row">
            <div class="col-xl-5 col-md-12">
                <div class="intro-text col-md-12">
                    <h1>Thưởng thức sự tiện nghi</h1>
                    <p>Sự kết hợp mới mẻ</p>
                    <div class="btns">
                        <button class="btn-primary" style="width: 150px; font-size: 23px" onclick="introFunction()"
                                id="start" title="Go to top">Bắt đầu
                        </button>
                    </div>
                </div>
            </div>

            <!--             ảnh phần header-->
            <div class="col-xl-7 col-md-12">
                <div id="carouselExampleFade" class="carousel slide carousel-fade">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="hero-img">
                                <img src="home_img/header10.jpg" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header6.png" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header7.jpg" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header8.png" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header9.jpg" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header5.jpg" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header11.jpg" alt="">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="hero-img">
                                <img src="home_img/header12.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--    hết-->

    <!--    mô tả 1-->
    <div class="row class-content">
        <div class="col-md-12 col-xl-6">
            <!--        nội dung mô tả công thái học-->
            <div class="content-text">
                <h2>Ergonomic3 Store</h2>
                <p>Nội thất công thái học là một phong cách thiết kế nội thất phổ biến
                    trong công nghiệp hiện đại. Phong cách này thường tập trung vào sự tiện nghi,
                    tính chất thực tế và sự hài hòa giữa chức năng và thẩm mỹ.</p>
                <p>Trong nội thất công thái học, không gian được sắp xếp một cách hợp lý và tối ưu hóa .
                    Các đồ vật và nội thất được sắp xếp sao cho phù hợp với chức năng sử dụng và
                    tận dụng tối đa không gian có sẵn. Nguyên tắc sắp xếp và tổ chức được chú trọng để
                    tạo ra sự thông thoáng và thoải mái cho người sử dụng.</p>
                <p>Phong cách này tạo ra không gian thoáng đãng, gọn gàng và tạo cảm giác thoải
                    mái cho người sử dụng.</p>
            </div>
        </div>
        <div class="col-md-12 col-xl-6">
            <!--        hình ảnh mô tả-->
            <div class="content-img">
                <img src="https://banghevanphong.net.vn/wp-content/uploads/2020/12/khong-gian-hoc-tap-lam-viec-tai-nha-5.jpg"
                     alt="">
            </div>
        </div>
    </div>

    <!--mô tả 2-->
    <div class="row class-content">
        <div class="col-md-12 col-xl-6">
            <!--        nội dung mô tả công thái học-->
            <div class="content-text">
                <h2 id="h2">Tại sao nên chọn <b>Ergonomic3 Store</b> ?</h2>
                <ul class="class-ul">
                    <li>Đảm bảo chất lượng sản phẩm luôn là số 1</li>
                    <li>Hoàn tiền lập tức nếu không hài lòng về sản phẩm</li>
                    <li>Giảm 30% ngay từ lần mua đầu tiên</li>
                    <li>Sản phẩm nhập khẩu hoàn toàn chính hãng</li>
                    <li>Luôn cung cấp các giá trị có lợi ích cho khách hàng</li>
                </ul>
            </div>
        </div>
        <div class="col-md-12 col-xl-6">
            <!--        hình ảnh mô tả-->
            <div class="content-img">
                <img src="home_img/header1.jpg" alt="">
            </div>
        </div>
    </div>
</div>
<!--hết-->

<!--giới thiệu sp bán chạy-->
<div class="row">
    <div class="col" style="text-align: center">
        <h2>Top các sản phẩm công thái học bán cháy hàng nhất tại shop</h2>
    </div>
</div>

<!--xem ảnh sản phẩm bán chạy-->
<div id="carouselExampleCaptions" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"
                aria-label="Slide 4"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4"
                aria-label="Slide 5"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5"
                aria-label="Slide 6"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6"
                aria-label="Slide 7"></button>
    </div>
    <div class="carousel-inner" id="text">
        <div class="carousel-item active">
            <img src="home_img/top8.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h3 class="text">Ergochair pro 1 Gray</h3>
                <p class="text">Đã bán 103 ghế</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/top1.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="text">Ergochair Pro 2</h5>
                <p class="text">Đã bán 194 ghế</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/top3.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="text">KD-09</h5>
                <p class="text">Đã bán 123 ghế</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/topp4jpg.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="text">ERGOHUMAN PLATINUM</h5>
                <p class="text">Đã bán 201 ghế</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/header3.webp" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="text">ERGONOMIC E6</h5>
                <p class="text">Đã bán 163 bàn</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/top6.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 style="color: black">SMARTDESK GAMING WHITE BLACK PC</h5>
                <p style="color: black">Đã bán 351 bàn</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="home_img/top7.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="text">Ergochair Pro 3</h5>
                <p class="text">Đã bán 122 ghế</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!--hết-->
<br>


<!--    footer-->
<div class="row">
    <div class="col-md-12 col-lg-3 ">
        <div class="class-endow">
            <div class="class-endow-i">
                <i class="fa-brands fa-android"></i>
                <h3>Phương thức đổi trả</h3>
                <hr>
                <p>Đổi trả miễn phí trong 30 ngày</p>
            </div>
            <!--        i-->
        </div>
    </div>


    <div class="col-md-12 col-lg-3 ">
        <div class="class-endow">
            <div class="class-endow-i">
                <i class="fa-solid fa-truck-fast"></i>
                <h3>Miễn phí giao hàng</h3>
                <hr>
                <p>Áp dụng khi mua tại shop</p>
            </div>
            <!--        i-->
        </div>
    </div>

    <div class="col-md-12 col-lg-3 ">
        <div class="class-endow">
            <div class="class-endow-i">
                <i class="fa-brands fa-shopify"></i>
                <h3>Ưu đãi và khuyến mãi</h3>
                <hr>
                <p>Luôn có nhiều voucher cho bạn</p>
            </div>
            <!--        i-->
        </div>
    </div>

    <div class="col-md-12 col-lg-3 ">
        <div class="class-endow">
            <div class="class-endow-i">
                <i class="fa-solid fa-money-check-dollar"></i>
                <h3>Giá cả phải chăng</h3>
                <hr>
                <p>Mức giá hợp lý về mọi sản phẩm</p>
            </div>
            <!--        i-->
        </div>
    </div>
</div>

<!--nhãn-->
<div class="none"></div>
<footer class="py-3 my-4">
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

    function introFunction() {
        document.body.scrollTop = 780;
        document.documentElement.scrollTop = 780;
    }
</script>
<!--Ký tên: Nguyễn Hữu Hậu-->
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="search.js"></script>
</html>