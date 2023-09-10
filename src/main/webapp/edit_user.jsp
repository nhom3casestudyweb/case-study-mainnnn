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

            <a href="/index.jsp">Trang chủ</a>
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
          <a href="/account">Quản lí Sản phẩm</a>
        </li>
      </div>
    </ul>
  </div>
</div>

<%--    hết--%>

<div class="none"></div>
<br>

<!--content-->
<div>
  <form style="margin: 0 auto;
    width: 465px;
    color: white;
    background: burlywood;
    border: 2px solid rgba(255, 255, 255, .2);
    border-radius: 13px;
    padding: 34px 11px;
    box-shadow: 4px 5px 5px black;" method="post" action="/customer?action=editUser">

    <div class="mb-3">
      <label class="form-label">Id người dùng</label>
      <input name="user_id" value="${customer.getId()}" type="number" class="form-control" aria-describedby="emailHelp" readonly autofocus>
    </div>
    <div class="mb-3">
      <label class="form-label">Tên người dùng</label>
      <input autofocus name="user_name" value="${customer.getName()}" type="text" class="form-control" >
    </div>
    <div class="mb-3">
      <label class="form-label">Ngày sinh</label>
      <input name="user_dob" value="${customer.getdOB()}" type="date" class="form-control">


      </td>
    </div>
    <div class="mb-3">
      <label class="form-label">Giới tính</label>
      <c:if test="${customer.isGender() == true}">
        <input readonly  name="user_gender"  placeholder="Nam" type="text" class="form-control">
      </c:if>
      <c:if test="${customer.isGender() == false}">
        <input readonly name="user_gender" placeholder="Nữ" value="${Nữ}" type="text" class="form-control">
      </c:if>
    </div>



    <div class="mb-3">
      <label class="form-label">Số điện thoại</label>
      <input name="user_phone_number" value="${customer.getPhoneNumber()}" type="number" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input name="user_mail" value="${customer.getEmail()}" type="email" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Địa chỉ</label>
      <input name="user_address" value="${customer.getAddress()}" type="text" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Tài khoản người dùng</label>
      <input name="account_user_name" value="${customer.getAccUserName()}" type="text" class="form-control">
    </div>
    <button style="    background: black;
    margin: 14px 132px;
    height: 57px;
    width: 163px;
    font-size: 25px;" type="submit" class="btn btn-primary">Xác nhận</button>
  </form>
</div>



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
