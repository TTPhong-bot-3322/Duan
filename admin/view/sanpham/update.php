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
                    <h3>Sửa Sản Phẩm</h3>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-body">
                <form action="index.php?action=updatesp" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="id_danh_muc" class="form-label">Danh mục:</label>
        <select name="id_danh_muc" id="id_danh_muc" class="form-control" required>
            <?php foreach ($listDanhMuc as $danhmuc): ?>
                <option value="<?= $danhmuc['id_danh_muc'] ?>" <?= (isset($sp['id_danh_muc']) && $sp['id_danh_muc'] == $danhmuc['id_danh_muc']) ? 'selected' : '' ?>>
                    <?= htmlspecialchars($danhmuc['ten_danh_muc']) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

    <!-- Input hidden chỉ cần một lần -->
    <input type="hidden" name="id" value="<?= isset($sp['id']) ? htmlspecialchars($sp['id']) : '' ?>">

    <!-- Tên sản phẩm -->
    <div class="mb-3">
        <label for="ten_san_pham" class="form-label">Tên sản phẩm:</label>
        <input type="text" name="ten_san_pham" id="ten_san_pham"
               value="<?= isset($sp['ten_san_pham']) ? htmlspecialchars($sp['ten_san_pham']) : '' ?>"
               class="form-control" required>
    </div>
                        
                        <!-- Giá -->
                        <div class="mb-3">
                            <label for="gia" class="form-label">Giá:</label>
                            <input type="number" name="gia" id="gia"
                                   value="<?= isset($sp['gia']) ? htmlspecialchars($sp['gia']) : '' ?>"
                                   class="form-control" required>
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
                            <?php if (isset($sp['hinh_anh']) && !empty($sp['hinh_anh'])): ?>
                                <div class="mt-2">
                                    <p>Ảnh hiện tại:</p>
                                    <img src="upload/<?= htmlspecialchars($sp['hinh_anh']) ?>" 
                                         alt="Hình sản phẩm" 
                                         width="100"
                                         class="img-thumbnail">
                                </div>
                            <?php endif; ?>
                        </div>
                        
                        <!-- Thương hiệu -->
                        <div class="mb-3">
                            <label for="thuong_hieu" class="form-label">Thương hiệu:</label>
                            <input type="text" name="thuong_hieu" id="thuong_hieu"
                                   value="<?= isset($sp['thuong_hieu']) ? htmlspecialchars($sp['thuong_hieu']) : '' ?>"
                                   class="form-control" required>
                        </div>
                        
                        <!-- Số lượng -->
                        <div class="mb-3">
                            <label for="so_luong" class="form-label">Số lượng:</label>
                            <input type="number" name="so_luong" id="so_luong"
                                   value="<?= isset($sp['so_luong']) ? htmlspecialchars($sp['so_luong']) : '' ?>"
                                   class="form-control" required>
                        </div>
                        
                        <!-- Danh mục -->
                        

                        <!-- Nút hành động -->
                        <div class="d-flex gap-2">
                            <input type="submit" name="capnhat" value="Cập nhật" class="btn btn-primary">
                            <input type="reset" value="Nhập lại" class="btn btn-secondary">
                            <a href="index.php?action=listSanPham" class="btn btn-secondary">Danh Sách</a>
                        </div>
                        
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<?php include_once("./view/layouts/footer.php"); ?>
