<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 9/5/2023
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
  body {
    background: beige;
  }
</style>
<body>
<div class="content-fluid">
  <div class="content">
    <div style="text-align: center; margin-top: 15px">
      <button style="background: none;text-align: center ; margin: 5px"><h1>SỬA THÔNG TIN SẢN PHẨM</h1></button></div>
    <form method="post" action="/product-servlet?action=editProduct&code=${product.productId}"
          style="display: flex">
      <div class="col-md-6" style="text-align: center ">
        <img src="img_product/${product.images_url}" style="margin: 5%;">
        <p style="padding: 10px;">${product.productDescription}</p>
      </div>
      <div style="margin: 2%">
        <div>
          <h3 style="color: blue ; text-align: center">&nbsp${product.productName}&nbsp</h3>
        </div>
        <br>
        <div style="padding-left: 10px">
          <br>
          <div>
            <h4>Tên sản phẩm : <input value="${product.productName}" name="product_name"
                                      id="product_name" required maxlength="1000" minlength="10"
                                      type="text"></h4><br>
          </div>
          <div>
            <h4>Giá sản phẩm : <input value="${product.productPrice}" type="number" name="price"
                                      id="price" min="5" max="100000000" required></h4><br>
          </div>
          <div style="display: flex">
            <h4>Loại sản phẩm : &nbsp</h4>
            <select name="product_type">
              <option value="1">Bàn thông minh</option>
              <option value="2">Ghế công thái học</option>
              <option value="3">Phụ kiện</option>
            </select>
          </div>
          <br>
          <div>
            <h4>Số lượng sản phẩm : &nbsp <input value="${product.productInventory}"
                                                 style="width: 100px"
                                                 name="product_inventory" id="product_inventory"></h4>
          </div>
          <div style="display: flex ; padding-top: 20%">
            <div style="padding-left: 22% ; font-size: 150%">
              <button style="background: blue ; border-radius: 10px">
                <a href="product-servlet" style="text-decoration: none ; color: azure">Thoát</a>
              </button>
            </div>
            <div style="padding-left: 40% ; font-size: 170%">
              <button type="submit" style="background: brown ; border-radius: 10px ; width: 80px ; height: 42px">
                Sửa
              </button>
            </div>
          </div>
          <br>
        </div>
      </div>
    </form>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>