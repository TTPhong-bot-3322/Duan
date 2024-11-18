<?php include_once("./view/layouts/header.php"); ?>

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
                    <h3>Sửa Danh Mục</h3>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <form action="index.php?action=updatedm" method="post">
                        <!-- Input hidden chỉ cần một lần -->
                        <input type="hidden" name="id_danh_muc" 
                               value="<?= isset($dm['id_danh_muc']) ? $dm['id_danh_muc'] : '' ?>">
                        
                        <div class="mb-3">
                            <label for="ten_danh_muc" class="form-label">Tên danh mục:</label>
                            <input type="text" name="ten_danh_muc" id="ten_danh_muc"
                                   value="<?= isset($dm['ten_danh_muc']) ? $dm['ten_danh_muc'] : '' ?>"
                                   class="form-control" required>
                        </div>
                        
                        <div class="d-flex gap-2">
                            <input type="submit" name="capnhat" value="Cập nhật" class="btn btn-primary">
                            <input type="reset" value="Nhập lại" class="btn btn-secondary">
                            <a href="index.php?action=listDanhMuc" class="btn btn-secondary">Danh Sách</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<?php include_once("./view/layouts/footer.php"); ?>