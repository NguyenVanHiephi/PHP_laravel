-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 01, 2024 lúc 10:16 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhom_h`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `addres`
--

CREATE TABLE `addres` (
  `id` int(11) NOT NULL,
  `Names` varchar(225) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `addres` varchar(225) NOT NULL,
  `statuss` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `addres`
--

INSERT INTO `addres` (`id`, `Names`, `sdt`, `addres`, `statuss`, `id_user`) VALUES
(1, 'Nguyễn Hiệp', '0902367890', 'Hoài Đức, Hà Nội', 0, 6),
(2, 'Nguyễn Huy', '0909743628', 'Hoài Đức , Hà Nội', 1, 6),
(3, 'Phong', '0932893287', 'Hà Nội', 0, 8),
(4, 'Hi', '0903764872', 'An Khánh , Hoài Đức , Hà Nội', 0, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categoryrelations`
--

CREATE TABLE `categoryrelations` (
  `relation_id` int(11) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `child_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categoryrelations`
--

INSERT INTO `categoryrelations` (`relation_id`, `parent_category_id`, `child_category_id`) VALUES
(1, 11, 3),
(2, 11, 1),
(3, 13, 6),
(4, 13, 4),
(5, 10, 7),
(6, 10, 2),
(8, 11, 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classify_sp`
--

CREATE TABLE `classify_sp` (
  `id` int(11) NOT NULL,
  `Names` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `sl` int(11) NOT NULL,
  `gia` double NOT NULL,
  `img` varchar(100) NOT NULL,
  `id_ncc` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `up_by` int(11) NOT NULL,
  `up_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `commenter` varchar(100) NOT NULL,
  `comment_date` datetime NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_data`
--

CREATE TABLE `contact_data` (
  `id` int(11) NOT NULL,
  `your_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `comment` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact_data`
--

INSERT INTO `contact_data` (`id`, `your_name`, `email`, `title`, `comment`) VALUES
(1, 'Phong', 'trungphong@gmail.com', 'Test', 'Shop chưa hoàn thiện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `name`, `url`) VALUES
(1, 'Quản lý sản phẩm', 'manager\r\n'),
(2, 'Danh mục loại sản phẩm', 'catalog\r\n'),
(3, 'Nhà cung cấp', 'ncc\r\n'),
(4, 'Kho hàng', 'manager/?action=classify\r\n'),
(5, 'Quản lý tài khoản', 'qltk');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dates` datetime NOT NULL,
  `ma_dh` varchar(14) NOT NULL,
  `gia` float NOT NULL,
  `sl` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `id_ncc` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `payment_method` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `id_user`, `dates`, `ma_dh`, `gia`, `sl`, `id_sp`, `id_ncc`, `id_address`, `payment_method`) VALUES
(7, 8, '2024-05-18 00:59:36', '240518D136VG8D', 113.5, 1, 13, 3, 3, 'Thanh toán khi nhận hàng'),
(8, 8, '2024-05-18 00:59:36', '240518F11MUP65', 357, 1, 11, 3, 3, 'Thanh toán khi nhận hàng'),
(9, 7, '2024-05-28 22:42:56', '240528B15ZAY4A', 9.9, 1, 15, 1, 1, 'Thanh toán khi nhận hàng'),
(10, 9, '2024-05-28 22:58:57', '240528718MLBMR', 341.5, 1, 18, 3, 1, 'Thanh toán khi nhận hàng'),
(12, 8, '2024-06-09 11:47:52', '240609S12LDZQR', 769.5, 1, 12, 2, 3, 'Thanh toán khi nhận hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(11) NOT NULL,
  `Names` varchar(100) NOT NULL,
  `sl` int(11) NOT NULL,
  `gia` double NOT NULL,
  `img` varchar(100) NOT NULL,
  `id_ncc` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `Names`, `sl`, `gia`, `img`, `id_ncc`, `id_sp`, `id_user`) VALUES
(25, 'Laptop HP 14s-em0086AU R5 7520U/16GB/512GB/14&#039', 1, 529.9, 'images/LaptopHP14sem0086AUR57520U16GB512GB14039039FHDAMDRadeonGraphicsWin1166408846ed84d.webp', 0, 7, 7),
(26, 'Samsung Galaxy Tab S9 FE 5G 6GB 128GB', 1, 357, 'images/SamsungGalaxyTabS9FE5G6GB128GB6640879e14d2e.webp', 0, 11, 7),
(27, 'Laptop HP 14s-em0086AU R5 7520U/16GB/512GB/14&#039', 1, 529.9, 'images/LaptopHP14sem0086AUR57520U16GB512GB14039039FHDAMDRadeonGraphicsWin1166408846ed84d.webp', 0, 7, 9),
(28, 'Macbook Air M2 13 inch 2022 8CPU 10GPU/16GB/256GB', 1, 1177.9, 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4e7548.webp', 0, 9, 9),
(32, 'PC Gaming E-Power G4060 i5 12400F/16GB/500GB/650W/', 1, 769.5, 'images/PCGamingEPowerG4060i512400F16GB500GB650WGeForceRTX40606640f84ce20db.webp', 0, 12, 6),
(33, 'Macbook Air M2 13 inch 2022 8CPU 10GPU/16GB/256GB', 1, 1177.9, 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4e7548.webp', 0, 9, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_sp`
--

CREATE TABLE `image_sp` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `Images` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `image_sp`
--

INSERT INTO `image_sp` (`id`, `id_sp`, `Images`) VALUES
(6, 14, 'images/Tai_chùm.jpg'),
(82, 13, 'images/MasstelTab10.1Pro66404920cb817.webp'),
(83, 13, 'images/MasstelTab10.1Pro66404920db6c4.webp'),
(84, 13, 'images/MasstelTab10.1Pro66404920dd5d3.webp'),
(85, 18, 'images/iPhone1164GBChnhhngVNA664056facda29.webp'),
(86, 18, 'images/iPhone1164GBChnhhngVNA664056fad17c7.webp'),
(87, 18, 'images/iPhone1164GBChnhhngVNA664056fad2912.webp'),
(88, 9, 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4e7548.webp'),
(89, 9, 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4eb1c2.webp'),
(90, 9, 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4ece2e.webp'),
(91, 11, 'images/SamsungGalaxyTabS9FE5G6GB128GB6640879e14d2e.webp'),
(92, 11, 'images/SamsungGalaxyTabS9FE5G6GB128GB6640879e2b1bd.webp'),
(93, 11, 'images/SamsungGalaxyTabS9FE5G6GB128GB6640879e5cb2a.webp'),
(95, 7, 'images/pnJ2zHRk89iSfIDMTLpoUtwfBaRz5mlVKY456hFt.webp'),
(96, 7, 'images/LaptopHP14sem0086AUR57520U16GB512GB14039039FHDAMDRadeonGraphicsWin116640884702d9e.webp'),
(97, 12, 'images/PCGamingEPowerG4060i512400F16GB500GB650WGeForceRTX40606640f84ce20db.webp'),
(98, 12, 'images/PCGamingEPowerG4060i512400F16GB500GB650WGeForceRTX40606640f84ce7e88.webp'),
(99, 12, 'images/PCGamingEPowerG4060i512400F16GB500GB650WGeForceRTX40606640f84ce9561.webp'),
(100, 15, 'images/Mysytc1100WAVARCY70226640f90d3b8d8.jpg'),
(101, 15, 'images/Mysytc1100WAVARCY70226640f90d3cf34.jpg'),
(102, 15, 'images/Mysytc1100WAVARCY70226640f90d3fd12.jpg'),
(103, 16, 'images/MyhtbicmtayDeermaDX115C66598276831b2.jpg'),
(104, 16, 'images/MyhtbicmtayDeermaDX115C66598276886b9.jpg'),
(105, 16, 'images/MyhtbicmtayDeermaDX115C665982768ab96.jpg'),
(106, 20, 'images/realmeC678GB128GB66c8cfe612802.webp'),
(107, 20, 'images/realmeC678GB128GB66c8cfe614d84.webp'),
(108, 20, 'images/realmeC678GB128GB66c8cfe618181.webp'),
(109, 22, 'images/w7MhUlIrrGz2YToDvPS4I28QThQjV7KDd8h65HeG.webp'),
(110, 22, 'images/PlLKuYlo6eGGsTpGU9C9awiWL4UhuD6iZsp70xGq.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_30_085107_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhap_sp`
--

CREATE TABLE `nhap_sp` (
  `id` int(11) NOT NULL,
  `Names` varchar(100) NOT NULL,
  `sl` int(11) NOT NULL,
  `gia` double NOT NULL,
  `color` varchar(100) NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `img` varchar(500) NOT NULL,
  `id_ncc` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dates` datetime NOT NULL,
  `KH` tinyint(1) NOT NULL,
  `actions` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_cung_cap`
--

CREATE TABLE `nha_cung_cap` (
  `ID_Ncc` int(11) NOT NULL,
  `Ten_Ncc` varchar(100) NOT NULL,
  `Dia_chi` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Sdt` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nha_cung_cap`
--

INSERT INTO `nha_cung_cap` (`ID_Ncc`, `Ten_Ncc`, `Dia_chi`, `email`, `Sdt`) VALUES
(1, 'Điện Máy Xanh', 'hanoi', 'khoa123@gmail.com', '0902937125'),
(2, 'FPTShop', 'hanoi', 'hiephi12@gmail.com', '0902193725'),
(3, 'Cellphones', 'hanoi', 'phong1@gmail.com', '90293725');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'auth_token', '15e4f032b2f28021f7e7509953e0eca6fd8aab558201750ba69e5ec2fb60b7c4', '[\"*\"]', '2024-08-30 20:30:33', NULL, '2024-08-30 20:13:26', '2024-08-30 20:30:33'),
(2, 'App\\Models\\User', 6, 'auth_token', 'c971ca655963eed9d38f5928a8d1648478f6a33732a93491df3eb5827c851c7d', '[\"*\"]', NULL, NULL, '2024-08-30 20:13:47', '2024-08-30 20:13:47'),
(3, 'App\\Models\\User', 6, 'auth_token', '81c54347c334a28ed46a319729f5be4a11076e0a4201d5583a678c1560647ec7', '[\"*\"]', '2024-08-30 20:30:00', NULL, '2024-08-30 20:23:47', '2024-08-30 20:30:00'),
(4, 'App\\Models\\User', 6, 'auth_token', '76d7d67439c106261ec8c40a52a7f39963887371689cabf749baf267a3625a2c', '[\"*\"]', '2024-08-30 20:29:39', NULL, '2024-08-30 20:27:59', '2024-08-30 20:29:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `publist_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_nhap_sp`
--

CREATE TABLE `ql_nhap_sp` (
  `id` int(11) NOT NULL,
  `id_nhap_sp` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_sp`
--

CREATE TABLE `ql_sp` (
  `ID_loai_sp` int(11) NOT NULL,
  `Loai_sp` varchar(50) NOT NULL,
  `images` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ql_sp`
--

INSERT INTO `ql_sp` (`ID_loai_sp`, `Loai_sp`, `images`) VALUES
(1, 'Máy Tính', ''),
(2, 'Điện Thoại', ''),
(3, 'Laptop', ''),
(4, 'Tai Nghe', ''),
(6, 'Đồng Hồ', ''),
(7, 'Tablet', ''),
(10, 'Điện Thoại & Tablet', ''),
(11, 'Laptop & Máy Tính', ''),
(12, 'Gia Dụng & Dân Dụng', ''),
(13, 'Phụ Kiện', ''),
(14, 'Âm Thanh & Hình Ảnh', ''),
(15, 'Y Tế', ''),
(16, 'Thể Thao', ''),
(17, 'Game', ''),
(18, 'PC', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_tt_sp`
--

CREATE TABLE `ql_tt_sp` (
  `ID_sp` int(11) NOT NULL,
  `ten_sp` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `ID_loai_sp` int(11) NOT NULL,
  `Gia_sp` float NOT NULL,
  `Nsx` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ql_tt_sp`
--

INSERT INTO `ql_tt_sp` (`ID_sp`, `ten_sp`, `image`, `ID_loai_sp`, `Gia_sp`, `Nsx`) VALUES
(7, 'Laptop HP 14s-em0086AU R5 7520U/16GB/512GB', 'images/LaptopHP14sem0086AUR57520U16GB512GB14039039FHDAMDRadeonGraphicsWin1166408846ed84d.webp', 3, 13299000, 2),
(9, 'Macbook Air M2 13 inch 2022 8CPU 10GPU/16GB/256GB', 'images/MacbookAirM213inch20228CPU10GPU16GB256GB664086a4e7548.webp', 1, 29499000, 2),
(11, 'Samsung Galaxy Tab S9 FE 5G 6GB 128GB', 'images/SamsungGalaxyTabS9FE5G6GB128GB6640879e14d2e.webp', 7, 8950000, 3),
(12, 'PC Gaming E-Power G4060 i5 12400F/16GB/500GB/650W/', 'images/PCGamingEPowerG4060i512400F16GB500GB650WGeForceRTX40606640f84ce20db.webp', 18, 19200000, 2),
(13, 'Masstel Tab 10.1 Pro', 'images/MasstelTab10.1Pro66404920cb817.webp', 7, 2699000, 3),
(14, 'Tai chùm', 'images/Tai_chùm.jpg', 4, 1299000, 1),
(15, 'Máy sấy tóc 1100W AVA RCY-7022', 'images/Mysytc1100WAVARCY70226640f90d3b8d8.jpg', 12, 249000, 1),
(16, 'Máy hút bụi cầm tay Deerma DX115C', 'images/MyhtbicmtayDeermaDX115C66598276831b2.jpg', 12, 225000, 1),
(18, 'iPhone 11 64GB | Chính hãng VN/A', 'images/iPhone1164GBChnhhngVNA664056facda29.webp', 2, 8559000, 3),
(20, 'realme C67 (8GB 128GB)', 'images/realmeC678GB128GB66c8cfe612802.webp', 2, 3299000, 2),
(22, 'Quạt điều hòa Kangaroo KG50F61', 'images/oJwtXg1qz6q2rK2DaYkq1c9RXtG9RT32DFdEszuz.webp', 12, 1650000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5NkoP0wjQ6DyL1nFY2FKmsiA5xCIZSe8cs9tFztA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFJwSkF4alRnTGJwV1NsZU1zckt5OEo3QXpNZGFpTU5WR2M5S1czbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sYXJhdmVsOjgwMDAvZ2V0LWRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1724988341),
('fJid7pJx0Hs6AX3apH6otl1iKY0szPm3qRxLuExl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGxOb0M4Y1YySUU0VHlHSzg1WWQzTDhFTFNWSDJxUDFlYkU4ejFSaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sYXJhdmVsOjgwMDAvZ2V0LWRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1725037981),
('GkTbUDPAmLcWfAAE40kFxGWuljczS6s4P93uGYt0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTJ0VkpnR21reUlEaXNJVkdadU5HV05NYTRhbFFyV2IwNVBQbHVYZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nZXRfY2F0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725006943),
('GU9GaWCY8oFnpLm6EBbEavxKQTejYJluXmCIxYku', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEFOMm5DOUlsS2F5V3hORUpvejh2ZlVncVhtZlQ2Um5aSDlUYmwyaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nZXQtZGF0YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1724989251),
('HpmZpbUtQlDTJb9teDkbAsIpEHcFVAaSyI2yhn4d', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNElwMGljQU5DVVVQU0RQUEVRSVZEQlhrUkE4YUduNU1lTUptWG42VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sYXJhdmVsOjgwMDAvZ2V0LWRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1725075192);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sp_loai`
--

CREATE TABLE `sp_loai` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `id_loai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuss`
--

CREATE TABLE `statuss` (
  `id` int(11) NOT NULL,
  `id_dh` int(11) NOT NULL,
  `dates` datetime NOT NULL,
  `Id_statuss` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `statuss`
--

INSERT INTO `statuss` (`id`, `id_dh`, `dates`, `Id_statuss`) VALUES
(1, 7, '2024-05-18 00:59:36', 0),
(2, 8, '2024-05-18 00:59:36', 0),
(3, 9, '2024-05-28 22:42:56', 0),
(4, 10, '2024-05-28 22:58:57', 0),
(5, 7, '2024-05-18 00:59:37', 1),
(6, 12, '2024-06-09 11:47:52', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuss_ct`
--

CREATE TABLE `statuss_ct` (
  `id` int(11) NOT NULL,
  `id_statuss` float NOT NULL,
  `name_s` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `statuss_ct`
--

INSERT INTO `statuss_ct` (`id`, `id_statuss`, `name_s`) VALUES
(1, 0, 'Đơn hàng đã đặt'),
(2, 1, 'Đã Xác Nhận Thông Tin Thanh Toán'),
(3, 2, 'Đã Giao Cho ĐVVC '),
(4, 3, 'Đã Nhận Được Hàng'),
(5, 4.1, 'Đơn Hàng Đã Hoàn Thành'),
(6, 1.1, 'Đơn Hàng Đã Thanh Toán '),
(7, 4, 'Đánh Giá'),
(8, 4.2, 'Đơn Hàng Đã Được Đánh Giá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Names` varchar(100) NOT NULL,
  `Pass` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `roles` int(11) NOT NULL,
  `remember_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `Names`, `Pass`, `Email`, `sdt`, `roles`, `remember_token`) VALUES
(6, 'hihiep', '$2y$10$jMfzegCF48reh97/mFoOG.agctxeU9NyOW4Dm1mHqC33F/0LhPfMO', 'hihiep2k3@gmail.com', '', 0, ''),
(7, 'Hi', '$2y$10$mkIMi044GT.Mx02ncZoUy.Ju66xPGnnbFhrPhmvu3VkNEhCIZ8BZq', 'hihiep@gmail.com', '', 1, ''),
(8, 'Phong', '$2y$10$bWIDwBmS/W9LNYU1DwOXNeY5GYWlzWx3mnm6N8pYjXnXhQXPFBO0.', 'phong2003@gmail.com', '', 1, ''),
(9, 'Boss', '$2y$10$1/h4aq9cqfMH4ooOIaPreOjpm0f/oEKV66hMKnjk1tskHRxEbsT5m', 'hiepnghi17@gmail.com', '', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_q`
--

CREATE TABLE `user_q` (
  `id` int(11) NOT NULL,
  `quyen` int(11) NOT NULL,
  `id_dm` int(11) NOT NULL,
  `c` tinyint(1) NOT NULL,
  `r` tinyint(1) NOT NULL,
  `u` tinyint(1) NOT NULL,
  `d` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_q`
--

INSERT INTO `user_q` (`id`, `quyen`, `id_dm`, `c`, `r`, `u`, `d`) VALUES
(1, 0, 1, 1, 1, 1, 1),
(2, 0, 2, 1, 1, 1, 1),
(3, 0, 3, 1, 1, 1, 1),
(4, 0, 4, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_tt`
--

CREATE TABLE `user_tt` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `Names` varchar(50) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Ns` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_tt`
--

INSERT INTO `user_tt` (`id`, `id_user`, `Names`, `Sex`, `Ns`) VALUES
(1, 6, '', '', '1990-01-01'),
(2, 7, 'Hiệp', 'Nam', '2003-01-02'),
(3, 8, '', '', '1990-01-01'),
(4, 9, '', '', '1990-01-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `id_sp`, `id_user`) VALUES
(1, 7, 8),
(2, 9, 8);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `addres`
--
ALTER TABLE `addres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `categoryrelations`
--
ALTER TABLE `categoryrelations`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `id_loaispcha` (`parent_category_id`),
  ADD KEY `id_loaispcon` (`child_category_id`);

--
-- Chỉ mục cho bảng `classify_sp`
--
ALTER TABLE `classify_sp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id_post` (`post_id`);

--
-- Chỉ mục cho bảng `contact_data`
--
ALTER TABLE `contact_data`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image_sp`
--
ALTER TABLE `image_sp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sp_anh` (`id_sp`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  ADD PRIMARY KEY (`ID_Ncc`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ql_nhap_sp`
--
ALTER TABLE `ql_nhap_sp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ql_sp`
--
ALTER TABLE `ql_sp`
  ADD PRIMARY KEY (`ID_loai_sp`);

--
-- Chỉ mục cho bảng `ql_tt_sp`
--
ALTER TABLE `ql_tt_sp`
  ADD PRIMARY KEY (`ID_sp`),
  ADD KEY `ID_loai_sp` (`ID_loai_sp`),
  ADD KEY `id_nsx` (`Nsx`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `sp_loai`
--
ALTER TABLE `sp_loai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `statuss`
--
ALTER TABLE `statuss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_statuss_kn` (`Id_statuss`) USING BTREE;

--
-- Chỉ mục cho bảng `statuss_ct`
--
ALTER TABLE `statuss_ct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_id_statuss` (`id_statuss`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_q`
--
ALTER TABLE `user_q`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_tt`
--
ALTER TABLE `user_tt`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `addres`
--
ALTER TABLE `addres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `categoryrelations`
--
ALTER TABLE `categoryrelations`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `classify_sp`
--
ALTER TABLE `classify_sp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact_data`
--
ALTER TABLE `contact_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `image_sp`
--
ALTER TABLE `image_sp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  MODIFY `ID_Ncc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ql_nhap_sp`
--
ALTER TABLE `ql_nhap_sp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ql_sp`
--
ALTER TABLE `ql_sp`
  MODIFY `ID_loai_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `ql_tt_sp`
--
ALTER TABLE `ql_tt_sp`
  MODIFY `ID_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `sp_loai`
--
ALTER TABLE `sp_loai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `statuss`
--
ALTER TABLE `statuss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `statuss_ct`
--
ALTER TABLE `statuss_ct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_q`
--
ALTER TABLE `user_q`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_tt`
--
ALTER TABLE `user_tt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categoryrelations`
--
ALTER TABLE `categoryrelations`
  ADD CONSTRAINT `id_loaispcha` FOREIGN KEY (`parent_category_id`) REFERENCES `ql_sp` (`ID_loai_sp`),
  ADD CONSTRAINT `id_loaispcon` FOREIGN KEY (`child_category_id`) REFERENCES `ql_sp` (`ID_loai_sp`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_id_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Các ràng buộc cho bảng `image_sp`
--
ALTER TABLE `image_sp`
  ADD CONSTRAINT `id_sp_anh` FOREIGN KEY (`id_sp`) REFERENCES `ql_tt_sp` (`ID_sp`);

--
-- Các ràng buộc cho bảng `ql_tt_sp`
--
ALTER TABLE `ql_tt_sp`
  ADD CONSTRAINT `id_nsx` FOREIGN KEY (`Nsx`) REFERENCES `nha_cung_cap` (`ID_Ncc`);

--
-- Các ràng buộc cho bảng `statuss`
--
ALTER TABLE `statuss`
  ADD CONSTRAINT `Id_statuss_kn` FOREIGN KEY (`Id_statuss`) REFERENCES `statuss_ct` (`id_statuss`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
