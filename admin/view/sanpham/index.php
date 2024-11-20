<?php
    include_once("./view/layouts/header.php");
    ?>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>DataTable</h3>
                        <p class="text-subtitle text-muted">For user to check they list</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        Danh sách sản phẩm
                    </div>
                    <a href="index.php?action=addsp" class="btn btn-primary">Thêm Sản Phẩm</a>

                    <div class="card-body">
                        <table class="table table-striped" id="table1">
                            <thead>
                                <tr>
                                    <th class="col-2">ID</th>
                                    <th>Tên sản phẩm </th>
                                    <th class="col-2">Giá</th>
                                    <th class="col-2">Mô tả</th>
                                    <th>id danh mục</th>
                                    <th>hình ảnh</th>
                                    <th class="col-2">thương hiệu</th>
                                    <th class="col-2">số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php  foreach ($listSanPham as $key => $value){ ?>
                            <tr>
                                <td><?= $value['id'] ?></td>
                                <td><?= $value['ten_san_pham'] ?></td>
                                <td><?= $value['gia'] ?></td>
                                <td><?= $value['mo_ta'] ?></td>
                                <td><?= $value['id_danh_muc'] ?></td>
                                <td><?= $value['hinh_anh'] ?></td>
                                <td><?= $value['thuong_hieu'] ?></td>
                                <td><?= $value['so_luong'] ?></td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="index.php?action=updatesp&id=<?= $value['id'] ?>" 
                                           class="btn btn-secondary">Sửa</a>
                                        <a href="index.php?action=xoasp&id=<?= $value['id'] ?>" 
                                           class="btn btn-danger">Xóa</a>
                                           
                                    </div>
                                </td>
                            </tr>
                        <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </section>
        </div>

        <?php
        include_once("./view/layouts/footer.php");
        ?>