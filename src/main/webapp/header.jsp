<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/09/2023
  Time: 9:14 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <style>
        a{
            text-decoration: none;
            color: black;
            text-align: center;
        }
    </style>
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
<%--Phân quyền--%>
    <c:if test="${sessionScope.account.roleName == 'admin'}">
<%--        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">--%>
<%--            <div class="offcanvas-header">--%>
<%--                <h3 style="margin: 10px 209px;text-align: center;font-weight: bold; color: black;" class="offcanvas-title" id="offcanvasTopLabel">Danh sách quản lý bởi Admin</h3>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>--%>
<%--            </div>--%>

<%--            <div class="offcanvas-body">--%>
<%--                <ul class="nav-list navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                    <div class="nav-links">--%>
<%--                        <li>--%>
<%--                            <a href="/customer">Quản lí người dùng</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="/product-servlet">Quản lí Sản phẩm</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="/order?action=showCart">Quản lí đơn hàng</a>--%>
<%--                        </li>--%>
<%--                    </div>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="dropdown">
            <button class="btn btn-muted dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                 Admin
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/customer">Quản lí người dùng</a></li>
                <li><a class="dropdown-item" href="/product-servlet">Quản lí Sản phẩm</a></li>
                <li><a class="dropdown-item" href="/order?action=showCart">Quản lí đơn hàng</a></li>
            </ul>
        </div>
    </c:if>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav-list navbar-nav me-auto mb-2 mb-lg-0">
                <div class="nav-links">
                    <li><a href="index.jsp">Trang chủ</a></li>

                    <li>
                        <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                           aria-controls="offcanvasExample">
                            Sản phẩm
                        </a>
                    </li>

                    <li><a href="/profilecard.jsp" target="_blank">Liên hệ</a></li>
                </div>

                <div class="nav-btns">
                    <c:if test="${sessionScope.account == null}">
                    <!--                   đăng nhập-->
                    <button class="btn btn-primary" type="submit"><a
                            href="/login.jsp">Đăng
                        nhập</a></button>
                    </c:if>


<%--                    Tên user--%>
                    <c:if test="${sessionScope.account != null}">
                        <p style="font-size: 20px;height: 61px; border: 1px solid; border-radius: 9px; padding: 6px 14px 29px 16px ;margin: 6px 10px;top: 11px;cursor: default">
                            <c:out value="${sessionScope.account.userName}"/>
                            <a data-bs-toggle="modal"
                               data-bs-target="#exampleModal">
                                <i id="log-out" style="cursor: pointer;font-size: 30px; margin: 5px 7px;"
                                   class="fa-solid fa-right-from-bracket"></i>
                            </a>
                        </p>
                    </c:if>
                    <!--                     tìm kiếm-->
                    <form action="/product-servlet?action=search" method="post">
                        <div class="search-box">
                            <input name="product_name" id="product_name" list="topics" class="search-box-input"
                                   type="search"
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

<%--    modal xoá--%>
    <div class="modal" tabindex="-1" id="exampleModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/account" method="get">
                    <input type="hidden" name="action" value="logout">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden">
                        <span class="text-danger"><c:out value="${sessionScope.account.userName}"/> có chắc chắn muốn đăng xuất không ?</span>
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
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"
                    style="font-weight: bold;font-size: 33px;margin: 20px -4px;">
                    Ergonomic3 Store
                    <i class="fa-brands fa-sass fa-bounce fa-sm" style="color: #7c889c;font-size: 39px;"></i>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div style="font-size: 21px">

                    <i class="fa-brands fa-think-peaks fa-beat-fade fa-sm"></i>
                </div>
<%--                <div class="dropdown mt-3">--%>
<%--                    <button style="background: grey" id="selection-product" class="btn btn-secondary dropdown-toggle"--%>
<%--                            type="button"--%>
<%--                            data-bs-toggle="dropdown">--%>
<%--                        Xem sản phẩm của shop tại đây--%>
<%--                    </button>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <li><a style="font-weight: bold" class="dropdown-item"--%>
<%--                               href="/product-servlet?action=showListChair">Ghế--%>
<%--                            công thái học</a></li>--%>
<%--                        <li><a style="font-weight: bold" class="dropdown-item"--%>
<%--                               href="/product-servlet?action=showListDesk">Bàn--%>
<%--                            công thái học</a></li>--%>
<%--                        <li><a style="font-weight: bold" class="dropdown-item"--%>
<%--                               href="/product-servlet?action=showListAccessories">Phụ kiện công thái học</a></li>--%>
<%--                        <li>--%>
<%--                            <hr class="dropdown-divider">--%>
<%--                        </li>--%>
<%--                        <li><a style="font-weight: bold" class="dropdown-item" href="#">--%>
<%--                            Sản phẩm HOT--%>
<%--                            <i class="fa-solid fa-fire"></i>--%>
<%--                        </a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
                <div class="list-group">
                    <button class="btn btn-secondary"><a style="text-decoration: none" href="/product-servlet?action=showListChair" class="text-dark">Ghế</a></button>
                    <button class="btn btn-secondary"><a style="text-decoration: none" href="/product-servlet?action=showListDesk " class="text-dark">Bàn</a></button>
                    <button class="btn btn-secondary"><a style="text-decoration: none" href="/product-servlet?action=showListAccessories" class="text-dark">Phụ kiện công thái học</a></button>
                </div>
            </div>
        </div>
    </div>
</head>

