<?php
include_once 'pdo.php';

// Hàm liệt kê tất cả sản phẩm
function listSanPham() {
    $sql = 'SELECT * FROM san_pham';
    return pdo_query($sql);
}

// Hàm thêm sản phẩm
function addsp($tensp, $gia, $mota, $filename, $thuonghieu, $soluong, $id_danh_muc) {
    $sql = "INSERT INTO san_pham (ten_san_pham, gia, mo_ta, hinh_anh, thuong_hieu, so_luong, id_danh_muc) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    return pdo_execute($sql, $tensp, $gia, $mota, $filename, $thuonghieu, $soluong, $id_danh_muc);
}

// Hàm xóa sản phẩm
function xoasp($id) {
    $sql = "DELETE FROM san_pham WHERE id = ?";
    return pdo_execute($sql, $id);
}

// Lấy thông tin sản phẩm theo ID
function getOneSanPham($id) {
    $sql = "SELECT * FROM san_pham WHERE id = ?";
    return pdo_query_one($sql, $id);
}

// Cập nhật thông tin sản phẩm
function updateSanPham($id, $ten_san_pham, $gia, $mo_ta, $filename, $thuong_hieu, $so_luong, $id_danh_muc) {
    $sql = "UPDATE san_pham 
            SET ten_san_pham = ?, 
                gia = ?, 
                mo_ta = ?, 
                hinh_anh = ?, 
                thuong_hieu = ?, 
                so_luong = ?, 
                id_danh_muc = ? 
            WHERE id = ?";
    return pdo_execute($sql, $ten_san_pham, $gia, $mo_ta, $filename, $thuong_hieu, $so_luong, $id_danh_muc, $id);
}
?>
