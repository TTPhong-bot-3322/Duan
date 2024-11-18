<?php
require_once "./model/danhmuc.php";

// Lấy thông tin danh mục cần sửa
if (isset($_GET['id_danh_muc']) && ($_GET['id_danh_muc'] > 0)) {
    $id_danh_muc = $_GET['id_danh_muc'];
    $dm = getOneDanhMuc($id_danh_muc);
}

// Xử lý cập nhật
if (isset($_POST['capnhat'])) {
    $id_danh_muc = $_POST['id_danh_muc'];
    $ten_danh_muc = $_POST['ten_danh_muc'];
    
    if (empty($ten_danh_muc)) {
        $thongbao = "Vui lòng nhập tên danh mục!";
    } else {
        if (updateDanhMuc($id_danh_muc, $ten_danh_muc)) {
            $thongbao = "Cập nhật thành công!";
            $dm = getOneDanhMuc($id_danh_muc); // Lấy lại thông tin sau khi cập nhật
        } else {
            $thongbao = "Cập nhật thất bại!";
        }
    }
}

include "./view/danhmuc/update.php";
?>