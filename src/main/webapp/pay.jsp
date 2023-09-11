<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/pay.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body style="background: #fff5ee">
<!--phần header bỏ tạm-->

<!--hết-->

<!--header thanh toán-->
<div class="header-pay">
    <i class="fa-solid fa-store fa-fade"></i>
    <h2>Thanh toán</h2>
    <h6>Vui lòng kiểm tra thông tin khách hàng, thông tin Giỏ hàng trước khi đặt hàng</h6>
</div>


<div class="container">
    <div class="header-content">
        <div class="row">
            <div class="col-xl col-lg-6">
                <div class="header-info">
                    <h2>Thông tin khách hàng</h2>
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Họ tên</label>
                            <input type="text" class="form-control" value="<c:out value="${customer.name}"/>">
                            <div id="emailHelp" class="form-text">Chúng tôi sẽ không bao giờ chia sẻ thông tin của bạn với bất kỳ ai khác.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giới tính</label>
                            <select class="form-control">
                                <option>Nam</option>
                                <option>Nữ</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Địa chỉ</label>
                            <input type="text" class="form-control" value="<c:out value="${customer.address}"/>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số điện thoại</label>
                            <input type="number" class="form-control" value="<c:out value="${customer.phoneNumber}"/>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Địa chỉ email</label>
                            <input type="email" class="form-control" value="<c:out value="${customer.email}"/>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày sinh</label>
                            <input type="text" class="form-control" >
                        </div>
                        <div class="mb-3">
                            <label class="form-label">CMND</label>
                            <input type="text" class="form-control" value="<c:out value="${customer.idCard}"/>">
                        </div>
                        <div class="type-pay">
                            <h3>Hình thức thanh toán</h3>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
                                <label class="form-check-label" for="flexRadioDefault3">
                                    Ship COD
                                </label>
                            </div>
                        </div>
                        <hr>


                        <button data-bs-target="#cartModal" style=" width: 100%;height: 43px;" type="button" class="btn btn-secondary" data-bs-toggle="modal">
                            <a style="color: black;text-decoration: none"  href="/checkout?action=checkout">Đặt hàng</a>
                        </button>

                        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                            <div class="d-flex align-items-center">
                                <p>© Erogomic3 Store - Phục vụ bạn hết mình</p>
                            </div>
                        </footer>
                    </form>
                </div>
            </div>



            <!--            giỏ hàng-->
            <div class="col-xl col-lg-6">
                <div class="header-cart">
                    <c:set var="o" value="${sessionScope.cart}"/>
                    <c:forEach items="${o.items}" var="i">
                    <h3>Giỏ hàng</h3>
                    <div class="info-cart">
                        <h4 style="float: left">${i.product.productName}</h4>
                        <p style="text-align: right"><fmt:formatNumber  value="${i.price}"/>đ</p>
                        <p>Số lượng : ${i.quantity}</p>
                    </div>
                      </c:forEach>
                </div>
                <div>Tổng Cộng : <fmt:formatNumber value="${sessionScope.totalMoney}"/>đ</div>
            </div>
        </div>
    </div>
</div>

<%--modal--%>
<div class="modal" tabindex="-1" id="cartModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ergomic3 Store thông báo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3 class="text-dark">Bạn đã đặt hàng thành công !</h3>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
