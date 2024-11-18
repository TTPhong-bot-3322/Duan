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
    }
} else {
    include_once 'controller/dashboard/index.php';
}
