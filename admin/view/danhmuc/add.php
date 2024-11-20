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
                    <h3>Thêm Danh Mục</h3>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-header">
                Form thêm sản phẩm 
                </div>
                <div class="card-body">
                    <form action="index.php?action=adddm" method="post">
                        <div class="mb-3">
                            <label for="tenloai" class="form-label">Tên danh mục:</label>
                            <input type="text" name="tenloai" id="tenloai" class="form-control">
                        </div>
                        <div class="d-flex">
                            <input type="submit" name="them" value="Thêm" class="btn btn-primary">
                            <input type="reset" value="Nhập lại" class="btn btn-secondary">
                            <a href="index.php?action=listDanhMuc" ><input type="button" class="btn btn-secondary" value="Danh Sách"></a>
                        </div>
                        <?php
                        if (isset($thongbao) && $thongbao != "") {
                            echo "<div class='alert alert-success mt-3'>$thongbao</div>";
                        }
                        ?>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<?php
include_once("./view/layouts/footer.php");
?>
