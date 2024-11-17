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
    }
} else {
    include_once 'controller/dashboard/index.php';
}
