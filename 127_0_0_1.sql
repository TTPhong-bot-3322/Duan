-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 17, 2024 lúc 04:17 AM
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
-- Cơ sở dữ liệu: `duan1`
--
CREATE DATABASE IF NOT EXISTS `duan1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `duan1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `name`, `description`, `country`) VALUES
(1, 'Canon', 'Thương hiệu máy ảnh hàng đầu từ Nhật Bản', 'Japan'),
(2, 'Nikon', 'Nổi tiếng với máy ảnh và ống kính chuyên nghiệp', 'Japan'),
(3, 'Sony', 'Thương hiệu mạnh về máy ảnh kỹ thuật số', 'Japan'),
(4, 'Fujifilm', 'Máy ảnh phong cách retro', 'Japan'),
(5, 'Panasonic', 'Chuyên về máy ảnh và thiết bị quay phim', 'Japan'),
(6, 'Leica', 'Máy ảnh cao cấp từ Đức', 'Germany'),
(7, 'Olympus', 'Máy ảnh mirrorless nổi bật', 'Japan'),
(8, 'Pentax', 'Chất lượng bền bỉ, hiệu suất cao', 'Japan'),
(9, 'Hasselblad', 'Máy ảnh trung bình đến từ Thụy Điển', 'Sweden'),
(10, 'GoPro', 'Máy quay hành trình', 'USA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`) VALUES
(1, 101, NULL),
(2, 102, NULL),
(3, 103, NULL),
(4, 104, NULL),
(5, 105, NULL),
(6, 106, NULL),
(7, 107, NULL),
(8, 108, NULL),
(9, 109, NULL),
(10, 110, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 5, 2),
(2, 1, 8, 1),
(3, 2, 3, 3),
(4, 2, 7, 1),
(5, 3, 4, 2),
(6, 4, 9, 1),
(7, 5, 2, 1),
(8, 6, 1, 2),
(9, 7, 6, 1),
(10, 8, 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'DSLR', 'Máy ảnh phản xạ ống kính đơn kỹ thuật số'),
(2, 'Mirrorless', 'Máy ảnh không gương lật nhỏ gọn'),
(3, 'Compact', 'Máy ảnh nhỏ gọn tiện dụng'),
(4, 'Action Camera', 'Máy quay hành trình và thể thao'),
(5, 'Medium Format', 'Máy ảnh định dạng trung bình cao cấp'),
(6, 'Instant Camera', 'Máy ảnh chụp lấy liền'),
(7, 'Drone Camera', 'Máy ảnh tích hợp trên thiết bị bay'),
(8, 'Underwater Camera', 'Máy ảnh chụp dưới nước'),
(9, 'Professional Video Camera', 'Máy quay video chuyên nghiệp'),
(10, 'Camcorder', 'Máy quay phim cá nhân');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total`, `user_id`, `name`, `phone`, `address`) VALUES
(1, '2024-01-15', 1200.00, NULL, NULL, NULL, NULL),
(2, '2024-01-16', 850.00, NULL, NULL, NULL, NULL),
(3, '2024-01-17', 1560.50, NULL, NULL, NULL, NULL),
(4, '2024-01-18', 3000.00, NULL, NULL, NULL, NULL),
(5, '2024-01-19', 990.99, NULL, NULL, NULL, NULL),
(6, '2024-01-20', 450.00, NULL, NULL, NULL, NULL),
(7, '2024-01-21', 2100.75, NULL, NULL, NULL, NULL),
(8, '2024-01-22', 1280.00, NULL, NULL, NULL, NULL),
(9, '2024-01-23', 650.25, NULL, NULL, NULL, NULL),
(10, '2024-01-24', 1750.80, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `brand_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Cơ sở dữ liệu: `duanbanmayanh`
--
CREATE DATABASE IF NOT EXISTS `duanbanmayanh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `duanbanmayanh`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

DROP TABLE IF EXISTS `binh_luan`;
CREATE TABLE IF NOT EXISTS `binh_luan` (
  `id_binh_luan` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int NOT NULL,
  `id_san_pham` int NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_binh_luan` date NOT NULL,
  PRIMARY KEY (`id_binh_luan`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`id_binh_luan`, `id_nguoi_dung`, `id_san_pham`, `noi_dung`, `ngay_binh_luan`) VALUES
(1, 1, 1, 'Sản phẩm này rất tuyệt vời, chất lượng hình ảnh rất sắc nét!', '2024-11-15'),
(2, 1, 2, 'Máy ảnh này có thiết kế nhỏ gọn và dễ sử dụng, rất phù hợp cho người mới bắt đầu.', '2024-11-16'),
(3, 2, 3, 'Sony Alpha A6000 có tốc độ chụp rất nhanh, nhưng giá khá cao.', '2024-11-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_hoa_don`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
CREATE TABLE IF NOT EXISTS `chi_tiet_hoa_don` (
  `id_chi_tiet_hoa_don` int NOT NULL AUTO_INCREMENT,
  `id_hoa_don` int NOT NULL,
  `id_san_pham` int NOT NULL,
  `so_luong` int NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_chi_tiet_hoa_don`),
  KEY `id_hoa_don` (`id_hoa_don`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_hoa_don`
--

INSERT INTO `chi_tiet_hoa_don` (`id_chi_tiet_hoa_don`, `id_hoa_don`, `id_san_pham`, `so_luong`, `gia`) VALUES
(1, 1, 1, 2, 8500000.00),
(2, 1, 3, 1, 11990000.00),
(3, 2, 2, 3, 7800000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

DROP TABLE IF EXISTS `danh_gia`;
CREATE TABLE IF NOT EXISTS `danh_gia` (
  `id_danh_gia` int NOT NULL AUTO_INCREMENT,
  `id_san_pham` int NOT NULL,
  `id_nguoi_dung` int NOT NULL,
  `diem_danh_gia` int NOT NULL,
  `noi_dung` text,
  `ngay_danh_gia` date NOT NULL,
  PRIMARY KEY (`id_danh_gia`),
  KEY `id_san_pham` (`id_san_pham`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`id_danh_gia`, `id_san_pham`, `id_nguoi_dung`, `diem_danh_gia`, `noi_dung`, `ngay_danh_gia`) VALUES
(1, 1, 1, 5, 'Sản phẩm tuyệt vời, chất lượng ảnh sắc nét!', '2024-11-15'),
(2, 2, 1, 4, 'Máy ảnh dễ sử dụng, nhưng thiết kế có phần hơi cồng kềnh.', '2024-11-16'),
(3, 3, 2, 5, 'Sony Alpha A6000 rất phù hợp cho nhiếp ảnh gia chuyên nghiệp!', '2024-11-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
CREATE TABLE IF NOT EXISTS `danh_muc` (
  `id_danh_muc` int NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(100) NOT NULL,
  PRIMARY KEY (`id_danh_muc`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id_danh_muc`, `ten_danh_muc`) VALUES
(1, 'Máy ảnh DSLR'),
(2, 'Máy ảnh Mirrorless'),
(3, 'Ống kính'),
(4, 'Phụ kiện máy ảnh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
CREATE TABLE IF NOT EXISTS `gio_hang` (
  `id_gio_hang` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int NOT NULL,
  `id_san_pham` int NOT NULL,
  `so_luong` int NOT NULL,
  PRIMARY KEY (`id_gio_hang`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id_gio_hang`, `id_nguoi_dung`, `id_san_pham`, `so_luong`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `id_hoa_don` int NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `trang_thai` enum('dang_xu_ly','da_giao','huy') DEFAULT 'dang_xu_ly',
  PRIMARY KEY (`id_hoa_don`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hoa_don`
--

INSERT INTO `hoa_don` (`id_hoa_don`, `id_nguoi_dung`, `ngay_dat`, `tong_tien`, `trang_thai`) VALUES
(1, 1, '2024-11-15', 8500000.00, 'dang_xu_ly'),
(2, 2, '2024-11-16', 7800000.00, 'da_giao'),
(3, 1, '2024-11-17', 11990000.00, 'huy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
CREATE TABLE IF NOT EXISTS `nguoi_dung` (
  `id_nguoi_dung` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `vai_tro` enum('nguoi_dung','quan_tri') DEFAULT 'nguoi_dung',
  `dia_chi` varchar(255) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nguoi_dung`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id_nguoi_dung`, `ten`, `email`, `mat_khau`, `so_dien_thoai`, `vai_tro`, `dia_chi`, `hinh_anh`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@example.com', 'password123', '0123456789', 'nguoi_dung', 'Hà Nội, Việt Nam', 'image_a.jpg'),
(2, 'Trần Thị B', 'tranthib@example.com', 'password456', '0987654321', 'quan_tri', 'TP.HCM, Việt Nam', 'image_b.jpg');

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
  `hinh_anh` varchar(255) DEFAULT NULL,
  `id_thuong_hieu` int NOT NULL,
  `loai_san_pham` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_san_pham`),
  KEY `id_thuong_hieu` (`id_thuong_hieu`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id_san_pham`, `ten_san_pham`, `gia`, `mo_ta`, `hinh_anh`, `id_thuong_hieu`, `loai_san_pham`) VALUES
(1, 'Canon EOS 1500D', 8500000.00, 'Máy ảnh DSLR Canon EOS 1500D với cảm biến APS-C 24.1 MP, thích hợp cho người mới bắt đầu.', 'canon_eos_1500d.jpg', 1, 'Máy ảnh DSLR'),
(2, 'Nikon D3500', 7800000.00, 'Máy ảnh DSLR Nikon D3500, thiết kế nhỏ gọn, dễ sử dụng cho người mới bắt đầu.', 'nikon_d3500.jpg', 2, 'Máy ảnh DSLR'),
(3, 'Sony Alpha A6000', 11990000.00, 'Máy ảnh mirrorless Sony Alpha A6000, tốc độ chụp nhanh, thích hợp cho nhiếp ảnh gia chuyên nghiệp.', 'sony_alpha_a6000.jpg', 3, 'Máy ảnh mirrorless');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuong_hieu`
--

DROP TABLE IF EXISTS `thuong_hieu`;
CREATE TABLE IF NOT EXISTS `thuong_hieu` (
  `id_thuong_hieu` int NOT NULL AUTO_INCREMENT,
  `ten_thuong_hieu` varchar(100) NOT NULL,
  `mo_ta` text,
  PRIMARY KEY (`id_thuong_hieu`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `thuong_hieu`
--

INSERT INTO `thuong_hieu` (`id_thuong_hieu`, `ten_thuong_hieu`, `mo_ta`) VALUES
(1, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(2, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(3, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.'),
(4, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(5, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(6, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.'),
(7, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(8, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(9, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.'),
(10, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(11, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(12, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.'),
(13, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(14, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(15, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.'),
(16, 'Canon', 'Thương hiệu máy ảnh nổi tiếng với các sản phẩm chất lượng cao.'),
(17, 'Nikon', 'Thương hiệu chuyên cung cấp máy ảnh DSLR và ống kính đa dạng.'),
(18, 'Sony', 'Thương hiệu máy ảnh kỹ thuật số, chuyên sản xuất máy ảnh mirrorless.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
