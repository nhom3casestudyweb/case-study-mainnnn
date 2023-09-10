<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/6/2023
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<style>
  *{
    background: #FFF5EE;
  }
  body{
    background: #FFF5EE;
  }
</style>
<body>

<section class="vh-100 bg-light">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img height="100px" src="https://noithatthienminh.vn/wp-content/uploads/2022/02/tms06-7.jpg"
                   alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;"/>
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form action="/account?action=createUser" method="post">
                  <input id="action" name="action" value="createUser" hidden="hidden">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fa-solid fa-crown" style="font-size: 300%;margin-right: 20px"></i>
                    <span class="h1 fw-bold mb-0">Ergonomic3 Store</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng kí tài khoản</h5>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="userName">Tên đăng nhập</label>
                    <input type="email" id="userName" name="userName" value="${userName}"
                           class="form-control form-control-lg"/>
                    <div><c:if test="${errMap != null}">
                      <label class="text-danger">${errMap.errUserName}</label>
                    </c:if></div>
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" value="${password}"
                           class="form-control form-control-lg"/>
                    <c:if test="${errMap != null}">
                      <label class="text-danger">${errMap.errPassword}</label>
                    </c:if>
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label" for="confirmPassword">Xác nhận mật khẩu</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" value="${confirmPassword}"
                           class="form-control form-control-lg"/>
                    <c:if test="${msg != null}">
                      <label class="text-danger">${msg}</label>
                    </c:if>
                    <c:if test="${errMap != null}">
                      <label class="text-danger">${errMap.errConfirmPassword}</label>
                    </c:if>
                  </div>
                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="submit">Đăng kí</button>
                    <a href="/account?action=login"><button class="btn btn-dark btn-lg btn-block"
                                                                   type="button" style="margin-left: 10px">Quay lại
                    </button></a>
                  </div>
                </form>
                <div class="text-danger">${msgSigin}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
