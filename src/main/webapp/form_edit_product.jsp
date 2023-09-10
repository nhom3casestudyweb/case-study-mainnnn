<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body style="background: #FFF5EE ">
<div class="content-fluid">
    <div class="content">
        <div style="text-align: center; margin-top: 15px">
            <h1>SỬA THÔNG TIN SẢN PHẨM</h1>
        </div>
        <form method="post" action="/product-servlet?action=editProduct&code=${product.productId}"
              style="display: flex">
            <div class="col-md-6" style="text-align: center ">
                <img src="/img_product/${product.images_url}" style="margin: 5%;">
                <p style="padding: 10px;">${product.productDescription}</p>
            </div>
            <div style="margin: 2%">
                <div>
                    <h3 style="color: black ; text-align: center">&nbsp${product.productName}&nbsp</h3>
                </div>
                <br>
                <div style="padding-left: 10px">
                    <br>
                    <div>
                        <h4>Tên sản phẩm : <input value="${product.productName}" name="product_name"
                                                  id="product_name" required minlength="10" maxlength="1000"
                                                  type="text"></h4><br>
                    </div>
                    <div>
                        <h4>Giá sản phẩm : <input value="${productPrice}" type="number" name="price"
                                                  id="price" min="1" max="100000000" required>
                        </h4>
                        <br>
                    </div>
                    <div style="display: flex">
                        <h4>Loại sản phẩm : &nbsp</h4>
                        <c:choose>
                            <c:when test="${product.productTypeId == 1}">
                                <select name="product_type">
                                    <option value="1">Bàn thông minh</option>
                                    <option value="2">Ghế công thái học</option>
                                    <option value="3">Phụ kiện</option>
                                </select>
                            </c:when>
                            <c:when test="${product.productTypeId == 2}">
                                <select name="product_type">
                                    <option value="2">Ghế công thái học</option>
                                    <option value="1">Bàn thông minh</option>
                                    <option value="3">Phụ kiện</option>
                                </select>
                            </c:when>
                            <c:when test="${product.productTypeId == 3}">
                                <select name="product_type">
                                    <option value="3">Phụ kiện</option>
                                    <option value="1">Bàn thông minh</option>
                                    <option value="2">Ghế công thái học</option>
                                </select>
                            </c:when>
                        </c:choose>
                    </div>
                    <br>
                    <div>
                        <h4>Số lượng sản phẩm : &nbsp <input value="${product.productInventory}"
                                                             style="width: 100px"
                                                             name="product_inventory" id="product_inventory" required min="1" max="10000" type="number"></h4>
                    </div>
                    <div style="display: flex ; padding-top: 20%">
                        <div style="padding-left: 22% ; font-size: 150%">
                            <button style="background: blue ; border-radius: 10px">
                                <a href="product-servlet" style="text-decoration: none ; color: azure">Thoát</a>
                            </button>
                        </div>
                        <div style="padding-left: 40% ; font-size: 170%">
                            <button type="submit"
                                    style="background: blue ; border-radius: 10px ; width: 80px ; height: 42px ;color: azure" >
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
<script>
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>