<?php
include_once("./view/layouts/header.php");
?>
<div id="main">
    <div class="page-heading">
        <div class="page-title">
            <h3>Thêm Sản Phẩm</h3>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <form action="index.php?action=addsp" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">Danh Mục</label>
                            <select name="id_danh_muc" class="form-control">
                                <?php foreach ($danhmucs as $danh_muc): ?>
                                <option value="<?= $danh_muc['id_danh_muc'] ?>">
                                    <?= $danh_muc['ten_danh_muc'] ?>
                                </option>
                                <?php endforeach; ?>
                            </select>

                            <label class="form-label">Tên Sản Phẩm</label>
                            <input type="text" name="tensp" class="form-control" required>

                            <label class="form-label">Giá</label>
                            <input type="number" name="gia" class="form-control" required>

                            <label class="form-label">Mô Tả</label>
                            <textarea name="mota" class="form-control"></textarea>

                            <label class="form-label">Hình Ảnh</label>
                            <input type="file" name="hinhanh" class="form-control">

                            <label class="form-label">Thương Hiệu</label>
                            <input type="text" name="thuonghieu" class="form-control">

                            <label class="form-label">Số Lượng</label>
                            <input type="number" name="soluong" class="form-control" required>
                        </div>
                        <div class="d-flex gap-2">
                            <input type="submit" name="them" value="Thêm" class="btn btn-primary">
                            <input type="reset" value="Nhập Lại" class="btn btn-secondary">
                            <a href="index.php?action=listSanPham" class="btn btn-info">Danh Sách</a>
                        </div>
                        <?php if (isset($thongbao)): ?>
                        <div class='alert alert-success mt-3'><?= $thongbao ?></div>
                        <?php endif; ?>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<?php include_once("./view/layouts/footer.php"); ?>
