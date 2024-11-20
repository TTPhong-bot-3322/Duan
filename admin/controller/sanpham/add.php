<?php
include_once './model/sanpham.php';
include_once './model/danhmuc.php'; // Để lấy danh mục cho form

if (isset($_POST['them'])) {
    $id_danh_muc = $_POST['id_danh_muc']; 
    $tensp = $_POST['tensp'];
    $gia = $_POST['gia'];
    $mota = $_POST['mota'];
    $filename = $_FILES['hinhanh']['name'];
    $target_dir = "upload/";
    $target_file = $target_dir . basename($_FILES["hinhanh"]["name"]);
    
    // Upload file hình ảnh
    if (move_uploaded_file($_FILES["hinhanh"]["tmp_name"], $target_file)) {
        // File upload thành công
    } else {
        $filename = ""; // Nếu upload thất bại, để trống
    }

    $thuonghieu = $_POST['thuonghieu'];
    $soluong = $_POST['soluong'];

    // Gọi hàm thêm sản phẩm từ model
    $result = addsp($tensp, $gia, $mota, $filename, $thuonghieu, $soluong, $id_danh_muc);
    
    // Thông báo kết quả
    if ($result) {
        $thongbao = "Thêm sản phẩm thành công!";
    } else {
      //  $thongbao = "Thêm sản phẩm thất bại!";
    }
}

// Lấy danh sách danh mục để hiển thị
$danhmucs = listDanhMuc();
include_once './view/sanpham/add.php';
?>
