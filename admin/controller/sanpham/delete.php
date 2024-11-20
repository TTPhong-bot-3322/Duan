<?php
include_once './model/sanpham.php';
if(isset($_GET['id'])&&($_GET['id']>0)){
    $id = $_GET['id'];  // Chỉ cần thêm dòng này
    xoasp($id);
}
$listSanPham = listSanPham();
include_once './view/sanpham/index.php';