<?php
require_once 'model/sanpham.php';
require_once 'model/danhmuc.php';

if (isset($_GET['id']) && ($_GET['id'] > 0)) {
    $id = $_GET['id'];
    $sp = getOneSanPham($id); // Lấy thông tin sản phẩm cần sửa
}

if (isset($_POST['capnhat'])) {
    // Lấy dữ liệu từ form
    $id = $_POST['id'];
    $ten_san_pham = $_POST['ten_san_pham'];
    $gia = $_POST['gia'];
    $mo_ta = $_POST['mo_ta'];

    // Kiểm tra nếu có hình ảnh mới được tải lên
    if (isset($_FILES['filename']) && $_FILES['filename']['error'] == UPLOAD_ERR_OK) {
        // Lấy tên file mới
        $filename = $_FILES['filename']['name'];
        $target_dir = "upload/";
        $target_file = $target_dir . basename($_FILES["filename"]["name"]);

        // Di chuyển tệp tin vào thư mục upload
        if (move_uploaded_file($_FILES["filename"]["tmp_name"], $target_file)) {
            // Cập nhật hình ảnh mới nếu upload thành công
        } else {
            $filename = ""; // Nếu upload thất bại, giữ lại ảnh cũ
        }
    } else {
        // Nếu không có ảnh mới, giữ lại ảnh cũ
        $filename = $sp['hinh_anh'];  // Lấy ảnh cũ từ cơ sở dữ liệu
    }

    // Các thông tin khác
    $thuong_hieu = $_POST['thuong_hieu'];
    $so_luong = $_POST['so_luong'];
    $id_danh_muc = $_POST['id_danh_muc'];

    // Cập nhật sản phẩm
    if (updateSanPham($id, $ten_san_pham, $gia, $mo_ta, $filename, $thuong_hieu, $so_luong, $id_danh_muc)) {
        $thongbao = "Cập nhật sản phẩm thành công!";
    } else {
        $thongbao = "Cập nhật sản phẩm thất bại!";
    }

    $sp = getOneSanPham($id); // Lấy lại thông tin sản phẩm sau khi cập nhật
}

// Lấy danh sách danh mục để hiển thị
$listDanhMuc = listDanhMuc();
include "view/sanpham/update.php";
?>
