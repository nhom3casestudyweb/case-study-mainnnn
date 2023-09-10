<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/09/2023
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/pay.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body style="background: #fff5ee">
<!--phần header bỏ tạm-->
<jsp:include page="header.jsp"/>
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
                            <input type="text" class="form-control" placeholder="Nhập tên của bạn" >
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
                            <input type="text" class="form-control" placeholder="Nhập vào địa chỉ" >
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số điện thoại</label>
                            <input type="number" class="form-control" placeholder="Nhập sdt của bạn" >
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Họ tên</label>
                            <input type="email" class="form-control" placeholder="Nhập email của bạn" >
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày sinh</label>
                            <input type="date" class="form-control" >
                        </div>
                        <div class="mb-3">
                            <label class="form-label">CMND</label>
                            <input type="text" class="form-control" placeholder="Nhập CMND của bạn" >
                        </div>
                        <div class="type-pay">
                            <h3>Hình thức thanh toán</h3>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Tiền mặt
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Chuyển khoản
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
                                <label class="form-check-label" for="flexRadioDefault3">
                                    Ship COD
                                </label>
                            </div>
                        </div>
                        <hr>


                        <button data-bs-target="#cartModal" style=" width: 100%;height: 43px;" type="button" class="btn btn-secondary" data-bs-toggle="modal">
                            ĐẶT HÀNG
                        </button>


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
                    <h3>Giỏ hàng</h3>
                    <div class="info-cart">
                        <h4 style="float: left">Ghế orgomic E3</h4>
                        <p style="text-align: right">20000 vnd</p>
                        <p>Số lượng : 3</p>
                    </div>
                    <div class="info-cart">
                        <h4 style="float: left">Bàn orgomic E3</h4>
                        <p style="text-align: right">50000 vnd</p>
                        <p>Số lượng : 10</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
