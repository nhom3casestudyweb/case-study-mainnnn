<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/khung_suon/form_product.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="/khung_suon/form.css">
    <link rel="stylesheet" href="/khung_suon/cart.css">
</head>
<body>
<div class="header">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="logo ">
            <img src="/khung_suon/img.png"
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
                    <li>
                        <div class="dropdown" id="admin">
                            <a style="font-weight: bold; border: unset" class="btn" type="button"
                               data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                                Admin
                            </a>
                        </div>
                    </li>

                    <li>
                        <a href="/admin_home.jsp">Trang chủ</a>
                    </li>
                    <h2 style="margin: 15px 123px;">Danh sách người dùng</h2>
                </div>

            </ul>
        </div>
    </nav>
</div>

<%--    danh sách phân quyền admin--%>
<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title" id="offcanvasTopLabel">Danh sách quản lý bởi Admin</h3>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="nav-list navbar-nav me-auto mb-2 mb-lg-0">
            <div class="nav-links">
                <li>
                    <a href="/customer">Quản lí người dùng</a>
                </li>
                <li>
                    <a href="">Quản lí Sản phẩm</a>
                </li>
            </div>
        </ul>
    </div>
</div>
<%--    hết--%>

<div class="none"></div>
<br>

<!--content-->

<table id="user" class="table table-striped table-hover" style="text-align: center">
    <thead>
    <tr style="font-weight: bold">
        <th>STT</th>
        <th>Tên người dùng</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Tài khoản người dùng</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${customer.getName()}"/></td>

<%--            xử lí ngày tháng năm--%>
            <c:set var="dateString" value="${customer.getdOB()}"/>
            <fmt:parseDate value="${dateString}" var="date" pattern="yyyy-MM-dd"/>
            <td>
                <fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/>
            </td>

            <c:if test="${customer.isGender() == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${customer.isGender() == false}">
                <td>Nữ</td>
            </c:if>
            <td><c:out value="${customer.getPhoneNumber()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>
            <td><c:out value="${customer.getAccUserName()}"/></td>
            <td>
                <button style="height: 29px;padding: unset;background: transparent;border: none;margin-top: -1px;" type="submit" class="btn btn-primary text-dark"><a href="customer?action=edit&id=${customer.id}" style="color: black">
                    <i class="fa-solid fa-user-pen"></i>
                </a></button>
                <button style="height: 29px;padding: unset;background: transparent;border: none;margin-top: -1px;" type="submit" class="btn btn-primary text-dark" data-bs-toggle="modal"
                        data-bs-target="#exampleModal" onclick="sendInfoToModal('${customer.id}','${customer.name}')">
                    <i class="fa-solid fa-trash"></i>
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<%--modal--%>
<div class="modal" tabindex="-1" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="customer?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Xóa user</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id" name="id">
                    Bạn có chắc muốn xóa <span id="name_delete" class="text-danger"></span> ?
                    <div class="text-danger">Lưu ý: người dùng này sẽ bị xóa vĩnh viễn</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button style="background: grey;height: 43px;width: 77px;" type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function sendInfoToModal(id,name){
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id").value = id;
    }
</script>

<%--hết--%>



<!--footer-->
<footer class="py-3 my-4">
    <hr>
    <p class="text-center text-body-secondary">© C0523G1 Group3</p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>
