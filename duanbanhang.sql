-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 18, 2024 lúc 02:40 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duanbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

DROP TABLE IF EXISTS `binh_luan`;
CREATE TABLE IF NOT EXISTS `binh_luan` (
  `id_binh_luan` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `noi_dung` text NOT NULL,
  `ngay_binh_luan` datetime NOT NULL,
  PRIMARY KEY (`id_binh_luan`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`id_binh_luan`, `id_nguoi_dung`, `id_san_pham`, `noi_dung`, `ngay_binh_luan`) VALUES
(1, 1, 1, 'Máy ảnh tuyệt vời, hình ảnh rất sắc nét!', '2024-11-18 10:40:00'),
(2, 2, 2, 'Nikon D850 là máy ảnh tuyệt vời cho các nhiếp ảnh gia chuyên nghiệp.', '2024-11-19 12:10:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_hoa_don`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
CREATE TABLE IF NOT EXISTS `chi_tiet_hoa_don` (
  `id_chi_tiet_hoa_don` int NOT NULL AUTO_INCREMENT,
  `id_hoa_don` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `so_luong` int NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_chi_tiet_hoa_don`),
  KEY `id_hoa_don` (`id_hoa_don`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_hoa_don`
--

INSERT INTO `chi_tiet_hoa_don` (`id_chi_tiet_hoa_don`, `id_hoa_don`, `id_san_pham`, `so_luong`, `gia`) VALUES
(1, 1, 1, 1, 25000000.00),
(2, 1, 3, 2, 3500000.00),
(3, 2, 2, 1, 27000000.00),
(4, 2, 4, 3, 1200000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
CREATE TABLE IF NOT EXISTS `danh_muc` (
  `id_danh_muc` int NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(255) NOT NULL,
  PRIMARY KEY (`id_danh_muc`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id_danh_muc`, `ten_danh_muc`) VALUES
(1, 'Máy ảnh'),
(2, 'Ống kính'),
(3, 'Phụ kiện'),
(4, 'Nến Thái Công');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
CREATE TABLE IF NOT EXISTS `gio_hang` (
  `id_gio_hang` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `so_luong` int NOT NULL,
  PRIMARY KEY (`id_gio_hang`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id_gio_hang`, `id_nguoi_dung`, `id_san_pham`, `so_luong`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 2, 4, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `id_hoa_don` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int DEFAULT NULL,
  `ngay_dat` datetime NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `trang_thai` enum('dang_xu_ly','hoan_thanh','da_huy') NOT NULL,
  PRIMARY KEY (`id_hoa_don`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hoa_don`
--

INSERT INTO `hoa_don` (`id_hoa_don`, `id_nguoi_dung`, `ngay_dat`, `tong_tien`, `trang_thai`) VALUES
(1, 1, '2024-11-18 10:30:00', 29000000.00, 'dang_xu_ly'),
(2, 2, '2024-11-19 12:00:00', 32000000.00, 'hoan_thanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
CREATE TABLE IF NOT EXISTS `nguoi_dung` (
  `id_nguoi_dung` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(15) NOT NULL,
  `vai_tro` enum('admin','khach_hang') NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nguoi_dung`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id_nguoi_dung`, `ten`, `email`, `mat_khau`, `so_dien_thoai`, `vai_tro`, `dia_chi`, `hinh_anh`) VALUES
(1, 'Nguyen Anh Tu', 'nguyen.tu@email.com', 'password123', '0912345678', 'khach_hang', '123 Phan Đình Phùng, HN', 'nguyen_tu.jpg'),
(2, 'Tran Thi Mai', 'mai.tran@email.com', 'password456', '0987654321', 'khach_hang', '456 Hai Bà Trưng, HN', 'mai_tran.jpg'),
(3, 'Admin', 'admin@email.com', 'admin123', '0901234567', 'admin', '10 Đinh Tiên Hoàng, HN', 'admin.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
CREATE TABLE IF NOT EXISTS `san_pham` (
  `id_san_pham` int NOT NULL AUTO_INCREMENT,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  `mo_ta` text,
  `id_danh_muc` int DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `thuong_hieu` varchar(255) DEFAULT NULL,
  `so_luong` int NOT NULL,
  PRIMARY KEY (`id_san_pham`),
  KEY `id_danh_muc` (`id_danh_muc`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id_san_pham`, `ten_san_pham`, `gia`, `mo_ta`, `id_danh_muc`, `hinh_anh`, `thuong_hieu`, `so_luong`) VALUES
(1, 'Canon EOS 5D Mark IV', 25000000.00, 'Máy ảnh DSLR cao cấp, chất lượng ảnh tuyệt vời', 1, 'canon_5d_mark_iv.jpg', 'Canon', 100),
(2, 'Nikon D850', 27000000.00, 'Máy ảnh DSLR full-frame, tốc độ chụp nhanh', 1, 'nikon_d850.jpg', 'Nikon', 80),
(3, 'Sony FE 24-70mm f/2.8 GM', 3500000.00, 'Ống kính zoom chất lượng cao dành cho máy ảnh Sony', 2, 'sony_fe_24_70mm.jpg', 'Sony', 150),
(4, 'Đế tripod Manfrotto', 1200000.00, 'Đế tripod hỗ trợ ổn định cho máy ảnh', 3, 'manfrotto_tripod.jpg', 'Manfrotto', 200);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
