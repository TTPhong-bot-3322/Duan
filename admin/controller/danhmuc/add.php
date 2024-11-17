<?php
include_once './model/danhmuc.php';

// Kiểm tra nếu form được gửi
if (isset($_POST['them']) && $_POST['them']) {
    $tenloai = $_POST['tenloai'];
    adddm($tenloai);
    $thongbao = "Thêm danh mục thành công!";
}

// Ném qua view để hiển thị form cho người dùng
include_once './view/danhmuc/add.php';
