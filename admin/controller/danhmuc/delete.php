<?php
include_once './model/danhmuc.php';
if(isset($_GET['id_danh_muc'])&&($_GET['id_danh_muc']>0)){
    $id_danh_muc = $_GET['id_danh_muc'];  // Chỉ cần thêm dòng này
    xoadm($id_danh_muc);
}
$listDanhMuc = listDanhMuc();
include_once './view/danhmuc/index.php';