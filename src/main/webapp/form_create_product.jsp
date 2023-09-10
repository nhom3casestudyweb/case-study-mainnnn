<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 9/7/2023
  Time: 8:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body style="background: #FFF5EE;">
<div class="container-fluid">
  <div class="container" style="text-align: center ; margin: 6% ;margin-top: 50px">
    <div class="row">
      <div>
        <h2 style="margin: 10px">Thêm mới sản phẩm</h2>
      </div>

      <form method="post" action="/product-servlet?action=createProduct" style="margin-top: 20px;display: flex ; border: black solid 1px ; border-radius: 20px">
        <div class="col-md-6" style="padding-top: 100px">
          <div>
            <img name="imagePreview" id="imagePreview" src="#" alt="Ảnh xem trước" width="300px" height="300px"style="border: black solid 1px" >
          </div>
          <br><br>
          <div>
            <input type="file" id="fileInput" onchange="displayImage(event)" name="fileInput" required>
          </div>

        </div>
        <div class="col-md-6">
          <br><br>
          <br><br>
          <div style="display: flex">
            <h3>Tên sản phẩm : &nbsp</h3>
            <input style="width: 350px ; height: 40px" name="product_name" type="text" required minlength="5" maxlength="255" >
          </div>
          <br>
          <div style="display: flex">
            <h3>Giá sản phẩm : &nbsp</h3>
            <input style="width: 352px;height: 40px" name="product_price" type="number" required min="100000" max="100000000">
          </div>
          <br>
          <div style="display: flex">
            <h3>Mô tả sản phẩm : &nbsp</h3>
            <input style="width: 320px ;height: 40px" name="product_description" type="text" required minlength="10" maxlength="1000000">
          </div>
          <br>
          <div style="display: flex ">
            <h3>Kiểu sản phẩm &nbsp &nbsp &nbsp</h3>
            <select name="product_type" style="height: 40px ; width: 200px" >
              <option value="1">Bàn thông minh</option>
              <option value="2">Ghế công thái học</option>
              <option value="3">Phụ kiện</option>
            </select>
          </div>
          <br>
          <div style="display: flex">
            <h3>Số lượng : &nbsp</h3>
            <input style="width: 100px ; height: 40px" name="product_inventory" type="number" required min="1" max="10000">
          </div>
          <br><br>
          <div style="display: inline flex">
            <div style="padding-right: 250px">
              <button style="border-radius: 10px ; width: 100px ; background: #1e47e5 ;color: white">
                <a style="text-decoration: none ; color: white" href="/product-servlet">Thoát</a>
              </button>
            </div>
            <div>
              <button type="submit"
                      style="border-radius: 10px ; width: 100px ; background: #1e47e5 ; color: white">
                Thêm mới
              </button>
            </div>
          </div>
          <br><br>
        </div>
      </form>
    </div>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
<script>
  function displayImage(event) {
    const fileInput = event.target;
    const imagePreview = document.getElementById('imagePreview');

    const file = fileInput.files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
      imagePreview.src = e.target.result;
    }

    reader.readAsDataURL(file);
  }
</script>
<script>
  var inputFile = document.getElementById('fileInput');

  // Đăng ký sự kiện "change" cho input file
  inputFile.addEventListener('change', function(event) {
    // Lấy danh sách các tệp đã chọn
    var files = event.target.files;

    // Kiểm tra xem đã chọn tệp nào hay chưa
    if (files.length > 0) {
      // Lấy tệp đầu tiên trong danh sách
      var file = files[0];

      // Hiển thị thông tin tệp
      console.log('Tên tệp: ' + file.name);
      console.log('Kích thước: ' + file.size + ' bytes');
      console.log('Loại tệp: ' + file.type);
    }
  });
</script>
</html>
