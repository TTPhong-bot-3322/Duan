<?php include_once("layouts/header.php"); ?>

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
                    <h3>Sửa Sản Phẩm</h3>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <form action="index.php?action=updatedm" method="post" enctype="multipart/form-data">
                        <!-- Input hidden chỉ cần một lần -->
                        <input type="hidden" name="id" value="<?= isset($sp['id']) ? htmlspecialchars($sp['id']) : '' ?>">
                        
                        <!-- Tên sản phẩm -->
                        <div class="mb-3">
                            <label for="ten_san_pham" class="form-label">Tên sản phẩm:</label>
                            <input type="text" name="ten_san_pham" id="ten_san_pham" value="<?= isset($sp['ten_san_pham']) ? htmlspecialchars($sp['ten_san_pham']) : '' ?>" class="form-control" required>
                        </div>
                        
                        <!-- Giá -->
                        <div class="mb-3">
                            <label for="gia" class="form-label">Giá:</label>
                            <input type="number" name="gia" id="gia" value="<?= isset($sp['gia']) ? htmlspecialchars($sp['gia']) : '' ?>" class="form-control" required>
                        </div>
                        
                        <!-- Mô tả -->
                        <div class="mb-3">
                            <label for="mo_ta" class="form-label">Mô tả:</label>
                            <textarea name="mo_ta" id="mo_ta" class="form-control" rows="3" required><?= isset($sp['mo_ta']) ? htmlspecialchars($sp['mo_ta']) : '' ?></textarea>
                        </div>
                        
                        <!-- Hình -->
                        <div class="mb-3">
                            <label for="filename" class="form-label">Hình:</label>
                            <input type="file" name="filename" id="filename" class="form-control">
                            <?php if (isset($sp['hinh_anh']) && $sp['hinh_anh']): ?>
                                <img src="path/to/images/<?= htmlspecialchars($sp['hinh_anh']) ?>" alt="Hình sản phẩm" width="100">
                            <?php endif; ?>
                        </div>
                        
                        <!-- Thương hiệu -->
                        <div class="mb-3">
                            <label for="thuong_hieu" class="form-label">Thương hiệu:</label>
                            <input type="text" name="thuong_hieu" id="thuong_hieu" value="<?= isset($sp['thuong_hieu']) ? htmlspecialchars($sp['thuong_hieu']) : '' ?>" class="form-control" required>
                        </div>
                        
                        <!-- Số lượng -->
                        <div class="mb-3">
                            <label for="so_luong" class="form-label">Số lượng:</label>
                            <input type="number" name="so_luong" id="so_luong" value="<?= isset($sp['so_luong']) ? htmlspecialchars($sp['so_luong']) : '' ?>" class="form-control" required>
                        </div>
                        
                        <!-- Nút hành động -->
                        <div class="d-flex gap-2">
                            <input type="hidden" name="id" value="<?= $id ?>">
                            <input type="submit" name="capnhat" value="Cập nhật" class="btn btn-primary">
                            <input type="reset" value="Nhập lại" class="btn btn-secondary">
                            <a href="index.php?action=listSanPham" class="btn btn-secondary">Danh Sách</a>
                        </div>
                        
                    </form>
                    <?php if (isset($thongbao)): ?>
                        <div class="alert alert-info mt-3"><?= $thongbao ?></div>
                    <?php endif; ?>
                </div>
            </div>
        </section>
    </div>
</div>

<?php include_once("layouts/footer.php"); ?>
