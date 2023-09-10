<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 9/4/2023
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="css_nav.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="form_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body style="background: #FFF5EE">


<div class="content-full" style="padding: 50px ; text-align: center; ">
    <%--    admin--%>
    <div class="content container">

        <table id="mytable" class="table-borderless table-striped table-earning" style="width: 100% ">
            <a style="    border: 1px solid;
    background: black;
    height: 99px;
    text-decoration: none;
    color: white;
    padding: 20px;
    border-radius: 13px" href="/admin_home.jsp">
                <i class="fa-solid fa-arrow-left fa-fade"></i>
                Quay lại trang Admin
            </a>
            <%--    hết--%>


            <h2 style="margin-top: 43px;margin-bottom: 30px">DANH SÁCH CÁC SẢN PHẨM</h2>
            <button style="background: black;border-radius: 10px;width: 262px;height: 58px;margin-bottom: 45px">
                <a href="form_create_product.jsp" style="text-decoration: none ; color: azure;">
                    Thêm mới sản phẩm
                    <i class="fa-solid fa-plus fa-beat-fade"></i>
                </a>
            </button>
            <thead>
            <tr style="background: black; color: white">
                <th>STT</th>
                <th>Tên Sản Phẩm</th>
                <th>Giá (VNĐ)</th>
                <th>Loại Sản Phẩm</th>
                <th>Số Lượng Tồn Kho</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="product" varStatus="quantityProduct">
                <tr>
                    <td>
                        <c:out value="${quantityProduct.count}"></c:out>
                    </td>
                    <td>
                        <c:out value="${product.productName}"></c:out>
                    </td>
                    <td>
                        <fmt:formatNumber value="${product.productPrice}"/>
                    </td>
                    <c:choose>
                        <c:when test="${product.productTypeId == 1}">
                            <td>Bàn thông Minh</td>
                        </c:when>
                        <c:when test="${product.productTypeId == 2}">
                            <td>Ghế công thái học</td>
                        </c:when>
                        <c:when test="${product.productTypeId == 3}">
                            <td>Phụ kện</td>
                        </c:when>
                    </c:choose>
                    <td>
                        <c:out value="${product.productInventory}"></c:out>
                    </td>
                    <td>
                        <button style="background: red" type="button" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#delete"
                                onclick="idProduct('${product.productId}','${product.productName}')">
                            Xóa
                        </button>
                    </td>
                    <td>
                        <button style="background: blue" type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="window.location.href = '/product-servlet?action=editProduct&code=${product.productId}'">
                            Sửa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <form action="/product-servlet?action=deleteProduct" method="post">
            <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xóa Sản Phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input name="id" id="id" type="hidden">
                            Bạn có muốn xóa sản phẩm : <samp id="thongBao" style="color: red"></samp>
                            <br><br>
                            <h6 style="color: red">Lưu ý : Khi xóa thì sản phẩm sẽ không được hoàn tác lại</h6>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                    style="background: blue ; width: 100px ; height: 39px ;border-radius: 7px">Thoát
                            </button>
                            <button type="submit" class="btn btn-primary" style="background: red ; width: 100px ; height: 39px ; border-radius: 10px ;border-radius: 7px ;padding: initial">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="search.js"></script>
<script>
    $(document).ready(function () {
        $('#mytable').DataTable({language: {url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Vietnamese.json"}});

    });

    function idProduct(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("thongBao").innerText = name + "?";
    }
</script>
</body>
</html>
