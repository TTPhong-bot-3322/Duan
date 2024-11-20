<?php
include_once 'pdo.php';

// Lấy danh sách danh mục
function listDanhMuc() {
    $sql = "SELECT * FROM danh_muc";
    return pdo_query($sql);
}

// Thêm danh mục mới
function adddm($tenloai) {
    $sql = "INSERT INTO danh_muc (ten_danh_muc) VALUES ('$tenloai')";
    return pdo_execute($sql);
}

function xoadm($id_danh_muc){
    $sql = "DELETE FROM danh_muc WHERE id_danh_muc=" . $id_danh_muc;  // Sửa chỗ này
    return pdo_execute($sql);
}
function getOneDanhMuc($id_danh_muc) {
    $sql = "SELECT * FROM danh_muc WHERE id_danh_muc = ?";
    return pdo_query_one($sql, $id_danh_muc);
}

function updateDanhMuc($id_danh_muc, $ten_danh_muc) {
    $sql = "UPDATE danh_muc SET ten_danh_muc = ? WHERE id_danh_muc = ?";
    return pdo_execute($sql, $ten_danh_muc, $id_danh_muc);
}
// function changeStatus($id_danh_muc, $status)
// {
//     $sql = "update danh_muc set status = '$status' where id_danh_muc='$id_danh_muc'";
//     pdo_execute($sql);
// }
?>