<?php
include_once 'pdo.php';

// Lấy danh sách danh mục
function listDanhMuc() {
    $sql = 'SELECT * FROM danh_muc';
    return pdo_query($sql);
}

// Thêm danh mục mới
function adddm($tenloai) {
    $sql = "INSERT INTO danh_muc (ten_danh_muc) VALUES ('$tenloai')";
    return pdo_execute($sql);
}
