<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/09/2023
  Time: 2:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Giỏ hàng</title>
    <style type="text/css">
        td {
            vertical-align: middle;
        }

        @media screen and (max-width: 1000px) {
            table#cart tbody td .form-control {
                width: 20%;
                display: inline !important;
            }

            .actions .btn {
                width: 36%;
                margin: 1.5em 0;
            }

            .actions .btn-info {
                float: left;
            }

            .actions .btn-danger {
                float: right;
            }

            table#cart thead {
                display: none;
            }

            table#cart tbody td {
                display: block;
                padding: .6rem;
                min-width: 320px;
            }

            table#cart tbody tr td:first-child {
                background: #333;
                color: #fff;
            }

            table#cart tbody td:before {
                content: attr(data-th);
                font-weight: bold;
                display: inline-block;
                width: 8rem;
            }

            table#cart tfoot td {
                display: block;
            }

            table#cart tfoot td .btn {
                display: block;
            }

        }
        body{
            background: #FFF5EE;
        }
    </style>
</head>
<body>
<%--<h1>Giỏ hàng chi tiết</h1>--%>
<%--<table border="1px" style="width: 100%">--%>

<%--    <tr>--%>
<%--        <th>STT</th>--%>
<%--        <th>Ảnh sản phẩm</th>--%>
<%--        <th>Tên sản phẩm</th>--%>
<%--        <th>Số lượng</th>--%>
<%--        <th>Đơn giá</th>--%>
<%--        <th>Thành tiền</th>--%>
<%--        <th>Hành động</th>--%>
<%--    </tr>--%>
<%--    <c:set var="o" value="${sessionScope.cart}"/>--%>
<%--    <c:set var="t" value="0"/>--%>
<%--    <c:forEach items="${o.items}" var="i">--%>
<%--        <c:set var="t" value="${t+1}"/>--%>
<%--        <tr>--%>
<%--            <td>${t}</td>--%>
<%--            <td><img src="/img_product/${i.product.imagesUrl}"></td>--%>
<%--            <td>${i.product.productName}</td>--%>
<%--            <td>--%>
<%--                <button><a href="/process?num=-1&id=${i.product.productId}">-</a></button>--%>
<%--                <input type="text" readonly value="${i.quantity}">--%>
<%--                <button><a href="/process?num=1&id=${i.product.productId}">+</a></button>--%>
<%--            </td>--%>
<%--            <td><fmt:formatNumber  value="${i.price}"/></td>--%>
<%--            <td><fmt:formatNumber  value="${i.quantity * i.price}"/> </td>--%>
<%--            <td>--%>
<%--                <form action="/process" method="post">--%>
<%--                    <input type="hidden" name="id" value="${i.product.productId}"/>--%>
<%--                    <input type="submit" value="Xoá sản phẩm"/>--%>
<%--                </form>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--<p></p>--%>
<%--<form action="/checkout" method="post">--%>
<%--    <input type="submit" value="Tiến hành đặt hàng"/>--%>
<%--</form>--%>
<%--<hr>--%>
<%--<h2><a href="/user_home.jsp">Quay về trang chủ</a></h2>--%>
<h2 class="text-center">Giỏ hàng chi tiết</h2>
<div class="container">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">Tên sản phẩm</th>
            <th style="width:10%">Giá</th>
            <th style="width:8%">Số lượng</th>
            <th style="width:22%" class="text-center">Thành tiền</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>
        <c:set var="o" value="${sessionScope.cart}"/>
        <c:set var="t" value="0"/>
        <c:forEach items="${o.items}" var="i">
            <c:set var="t" value="${t+1}"/>
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs"><img src="/img_product/${i.product.imagesUrl}" width="100">
                        </div>
                        <div class="col-sm-10">
                            <h4 class="nomargin">${i.product.productName}</h4>
                        </div>
                    </div>
                </td>
                <td data-th="Price"><fmt:formatNumber  value="${i.price}"/>đ</td>
                <td data-th="Quantity"><input class="form-control text-center" value="${i.quantity}" type="number">
                </td>
                <td data-th="Subtotal" class="text-center"><fmt:formatNumber  value="${i.quantity * i.price}"/>đ</td>
                <td class="actions" data-th="">
                    <button class="btn btn-info btn-sm" fdprocessedid="9oipmk"><i class="fa-solid fa-pen-to-square"></i>Sửa</i>
                    </button>
<%--                    <form action="/process" method="post">--%>
<%--                        <input type="hidden" name="id" value="${i.product.productId}"/>--%>
<%--                    <button type="submit" class="btn btn-primary text-dark"  data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="sendInfoToModal('${user.id}','${user.name}')">--%>
                        <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                onclick="sendInfoToModal('${i.product.productId}','${i.product.productName}')" >Xoá
                    </button>
<%--                    </form>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr class="visible-xs">
            <td class="text-center"><strong> đ</strong>
            </td>
        </tr>
        <tr>
            <td><a href="/index.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua
                hàng</a>
            </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong><fmt:formatNumber value="${sessionScope.totalMoney}"/>đ</strong>
            </td>

            <td><a href="/checkout" class="btn btn-success btn-block">Thanh toán <i
                    class="fa fa-angle-right"></i></a>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<%--------Modal-----%>
<div class="modal" tabindex="-1" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/process" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Delete user</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id" name="id">
                    Do you want to delete user? <span id="name_delete" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function sendInfoToModal(id,name){
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id").value =id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">

</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
</body>


</html>

