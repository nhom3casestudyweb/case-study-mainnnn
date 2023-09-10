<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 01/09/2023
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="text-center">


<form class="form-signin" action="/account?action=login" method="post">
    <div class="row">
        <div class="col col-xl">
            <div class="wrapper">
                <div class="class-img">
                    <img src="/login_img/user.jpg"/>
                </div>
                <div class="input-box">
                    <input id="inputEmail" name="userName" type="text" placeholder="Tên đăng nhập hoặc email" required
                           autofocus>
                    <i class='bx bxs-user-circle'></i>
                    <c:if test="${errMap != null}">
                        <label class="text-danger">${errMap.errUserName}</label>
                    </c:if>
                </div>
                <div class="input-box">
                    <input id="inputPassword" name="password" type="password" placeholder="Mật khẩu" required>
                    <i class='bx bxs-lock'></i>
                    <c:if test="${errMap != null}">
                        <label class="text-danger">${errMap.errPassword}</label>
                    </c:if>
                    <div style="color: darkred;margin-top: 18px;font-size: 18px;"
                         data-bs-toggle="modal"
                         data-bs-target="#exampleModal">
                        ${msg}
                    </div>

                </div>
                <div class="remember-forgot" style="margin-top: -67px;">
                    <span class="col-md-6 col-xl" style="margin: -20px 17px 6px -9px;">
                        <label style="color: black;font-size: 21px;margin: 110px 9px 22px -57px;">
                            <input type="checkbox" style="font-size: 24px;"> Nhớ mật khẩu
                        </label>
                    </span>
                    <span class="col-md-6 col-xl" style="margin: -20px 17px 6px -9px;">
                         <label style="color: black;font-size: 21px;margin: 107px -151px 24px -55px;}">
                        <a style="font-size: 19px; color: black;padding: 25px;"
                           href="/account?action=forgotPassword">Quên mật khẩu?</a>
                              </label>
                    </span>
                </div>
                <button class="btn" type="submit">
                    Đăng nhập
                </button>

                <div class="register-link">
                    <p>Không có tài khoản ? <a href="create.jsp">Đăng ký</a></p>
                </div>
            </div>
        </div>
    </div>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>
