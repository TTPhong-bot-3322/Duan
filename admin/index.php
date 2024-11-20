<?php
if (isset($_GET['action']) && $_GET['action'] != '') {
    $action = $_GET['action'];
    switch ($action) {
        case "adddm":  
            include_once 'controller/danhmuc/add.php';     
            break;
        case "listDanhMuc":
            include_once 'controller/danhmuc/index.php';
            break;
        case "xoadm":
            include_once 'controller/danhmuc/delete.php';
            break;
        case "suadm":
            include_once 'controller/danhmuc/update.php';
            break;
        case "updatedm":
            include_once 'controller/danhmuc/update.php';
            break;
        case "listSanPham":
            include_once 'controller/sanpham/index.php';
            break;
        case "addsp":  
            include_once 'controller/sanpham/add.php';     
            break;
        case "xoasp":
            include_once 'controller/sanpham/delete.php';
            break;
            case "updatesp":
                include_once 'controller/sanpham/update.php';
                break;
        default:
            include_once 'controller/dashboard/index.php';
            break;
    }
} else {
    include_once 'controller/dashboard/index.php';
}
