-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 30 Jun 2023 pada 13.12
-- Versi server: 8.0.21
-- Versi PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbelssories`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ADMINS ID',
  `admin_name` varchar(64) NOT NULL,
  `admin_email` varchar(64) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `admin_type` enum('Root Admin','Content Manager','Sales Manager','Technical Operator') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`, `admin_status`, `admin_type`, `created_at`, `updated_at`) VALUES
(5, 'Elsa Novita', 'elsanovitaca@gmail.com', 'ADMINIMAGE_20230629150641_elsaa.jpeg', 'f9ad666b2462eaeef109b4c1f88d09c220fa6400', 'Active', 'Root Admin', '2023-06-28 05:07:34', NULL),
(6, 'Content Manager ', 'content@elssories.id', 'ADMINIMAGE_20230629150703_1.png', '40689482233d79f823e6d87893544c51f600eb80', 'Active', 'Content Manager', '2023-06-28 05:19:11', NULL),
(7, 'Sales Manager ', 'sales@elssories.id', 'ADMINIMAGE_20230629150428_girl.jpg', '40689482233d79f823e6d87893544c51f600eb80', 'Inactive', 'Sales Manager', '2023-06-28 05:20:48', NULL),
(8, 'Operator', 'operator@elssories.id', 'ADMINIMAGE_20230629150351_user2.jpg', '40689482233d79f823e6d87893544c51f600eb80', 'Active', 'Technical Operator', '2023-06-28 05:21:58', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'CATEGORIES ID',
  `category_name` varchar(64) NOT NULL,
  `category_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'ACCESSORIES ', 'Active', '2023-06-27 23:10:45', '2023-06-27 23:10:45'),
(2, 'KEYCHAIN', 'Active', '2023-06-27 23:15:28', '2023-06-27 23:15:28'),
(8, 'GIFTS', 'Active', '2023-06-27 23:20:25', '2023-06-27 06:20:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'CONTACTS ID',
  `contacts_name` varchar(64) NOT NULL,
  `contacts_email` varchar(64) NOT NULL,
  `contacts_phone` varchar(32) NOT NULL,
  `contacts_overview` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'CUSTOMERS ID',
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(64) NOT NULL,
  `customer_mobile` varchar(16) NOT NULL,
  `customer_address` varchar(256) NOT NULL,
  `customer_password` varchar(128) NOT NULL,
  `customer_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `customer_password`, `customer_status`, `created_at`, `updated_at`) VALUES
(16, 'pelanggan elssories', 'pelanggan@mail.com', '1234567890', 'Serang', '40689482233d79f823e6d87893544c51f600eb80', 'Active', '2023-06-28 05:44:43', NULL),
(17, 'Nafila Audina', 'naf@mail.com', '78904532908', 'Rangkasbitung ', '40689482233d79f823e6d87893544c51f600eb80', 'Active', '2023-06-29 04:32:09', NULL),
(18, 'putri yani', 'put@mail.com', '876542890', 'Pandeglang', '40689482233d79f823e6d87893544c51f600eb80', 'Active', '2023-06-29 22:56:45', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE IF NOT EXISTS `deliveries` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'DELIVERIES ID',
  `customer_id` int NOT NULL,
  `shipping_charge` enum('50','120') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `deliveries`
--

INSERT INTO `deliveries` (`id`, `customer_id`, `shipping_charge`, `created_at`, `updated_at`) VALUES
(7, 16, '', '2023-06-29 21:45:08', NULL),
(8, 17, '', '2023-06-30 14:41:09', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'DISCOUNT ID',
  `discount_code` varchar(256) NOT NULL,
  `price_discount_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'INVOICE ID',
  `invoice_id` varchar(128) NOT NULL,
  `customer_id` int NOT NULL,
  `shipping_id` int NOT NULL,
  `order_id` int NOT NULL,
  `transaction_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_id` (`shipping_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'NEWSLETTER ID',
  `newsletter_email` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ORDERS ID',
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `sub_total` double NOT NULL,
  `tax` double NOT NULL,
  `delivery_charge` int NOT NULL,
  `discount_amount` double NOT NULL,
  `grand_total` double NOT NULL,
  `payment_method` enum('SSL COMMERZ','PayPal','Cash On Delivery') NOT NULL DEFAULT 'Cash On Delivery',
  `transaction_id` varchar(256) NOT NULL,
  `transaction_status` enum('Paid','Unpaid') NOT NULL DEFAULT 'Paid',
  `order_item_status` enum('Pending','Processing','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `sub_total`, `tax`, `delivery_charge`, `discount_amount`, `grand_total`, `payment_method`, `transaction_id`, `transaction_status`, `order_item_status`, `created_at`, `updated_at`) VALUES
(12, 16, '2023-06-29 21:08:51', 18300, 1372.5, 120, 0, 19793, 'Cash On Delivery', '', 'Paid', 'Pending', '2023-06-29 21:08:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ORDER ITEMS ID',
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_price` double NOT NULL,
  `prod_quantity` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `customer_id`, `order_id`, `product_id`, `product_price`, `prod_quantity`, `created_at`, `updated_at`) VALUES
(11, 16, 12, 90, 18300, 1, '2023-06-29 21:08:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'PAGES ID',
  `page_title` text NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'PRODUCTS ID',
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_summary` text NOT NULL,
  `product_details` text NOT NULL,
  `product_master_image` text NOT NULL,
  `product_quantity` int NOT NULL,
  `product_price` double NOT NULL,
  `product_discount_price` double NOT NULL,
  `discount_start` datetime NOT NULL,
  `discount_ends` datetime NOT NULL,
  `product_status` enum('In Stock','Out of Stock') NOT NULL DEFAULT 'In Stock',
  `product_featured` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `product_tags` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `products_image_one` text,
  `products_image_two` text,
  `products_image_three` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_summary`, `product_details`, `product_master_image`, `product_quantity`, `product_price`, `product_discount_price`, `discount_start`, `discount_ends`, `product_status`, `product_featured`, `product_tags`, `created_at`, `updated_at`, `products_image_one`, `products_image_two`, `products_image_three`) VALUES
(83, 1, 2, 'JEPIT ALLOY MUTIARA ', '<p><span style=\"font-weight: 700; color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">Jepit Rambut Alooy</span><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">&nbsp;Korea Mutiara Permata Logam Warna Emas |</span><span style=\"font-weight: 700; color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">&nbsp;uk 2.5cm</span><br></p>', '<p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Jepit Rambut ini memiliki penampilan yang mewah dan elegan, sangat cocok digunakan pada acara acara formal seperti ke pesta, kondangan maupun menghadiri acara keluarga. Terbuat dari campuran beberapa jenis logam membuat jepitan rambut ini sangat kokoh dan tangguh, dilengkapi dengan engsel yang sangat kencang menambah ketahanan dari jepit rambut ini </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Deskripsi : </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Bahan : Alloy Steele dengan pewarnaan Gold Chrome </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Aksesoris : Syntetic Pearl &amp; Gem Stone (sesuai Gambar) </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Banyakanya cakar / taring : 5 buah (atas bawah) Engsel Kuat dan Kencang </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Ukuran Lebar : 2,5cm </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Ukuran Panjang : 2,5cm </span></p><p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Tinggi : 2.5cm</span><br></p>', 'PRODUCT_20230629151518_jepit.jpeg', 80, 9000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'jedai,jedaikorea', '2023-06-29 15:15:18', NULL, 'PRODUCTONE_20230629151518_jepit.jpeg', 'PRODUCTTWO_20230629151518_jepit.jpeg', 'PRODUCTTHREE_20230629151518_jepit.jpeg'),
(84, 1, 2, 'JEPIT ALLOY MUTIARA  PERMATA', '<p><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px; font-weight: 700;\">Jepit Rambut Alooy</span><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">&nbsp;Korea Mutiara Permata Logam Warna Emas |</span><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px; font-weight: 700;\">&nbsp;uk 2.5cm</span><br></p>', '<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Jepit Rambut ini memiliki penampilan yang mewah dan elegan, sangat cocok digunakan pada acara acara formal seperti ke pesta, kondangan maupun menghadiri acara keluarga. Terbuat dari campuran beberapa jenis logam membuat jepitan rambut ini sangat kokoh dan tangguh, dilengkapi dengan engsel yang sangat kencang menambah ketahanan dari jepit rambut ini</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Deskripsi :</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Bahan : Alloy Steele dengan pewarnaan Gold Chrome</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Aksesoris : Syntetic Pearl &amp; Gem Stone (sesuai Gambar)</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Banyakanya cakar / taring : 5 buah (atas bawah) Engsel Kuat dan Kencang</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Ukuran Lebar : 2,5cm</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Ukuran Panjang : 2,5cm</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Tinggi : 2.5cm</p>', 'PRODUCT_20230629151728_jepit3.jpeg', 80, 9000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'jedai,jedaikorea', '2023-06-29 15:17:28', NULL, 'PRODUCTONE_20230629151728_jepit3.jpeg', 'PRODUCTTWO_20230629151728_jepit3.jpeg', 'PRODUCTTHREE_20230629151728_jepit3.jpeg'),
(85, 1, 4, 'KALUNG BUNGA MUTIARA', '<p>Kalung Bunga Mutiara hijabers</p>', '<p>Kalung yang dirangkai dari manik-manik mutiara dan bunga yang berkualitas&nbsp;</p>', 'PRODUCT_20230629152056_kbunga1.jpeg', 20, 25500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'kalungbunga', '2023-06-29 15:20:56', NULL, 'PRODUCTONE_20230629152056_kbunga1.jpeg', 'PRODUCTTWO_20230629152056_kbunga1.jpeg', 'PRODUCTTHREE_20230629152056_kbunga1.jpeg'),
(86, 8, 7, 'BOUQUET BONEKA MEDIUM', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">buket Bunga+Boenka Wisuda Ukuran Medium</span><br></p>								', '									<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Buket dengan isian Bunga dan boneka wisuda</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">varian warna:</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Pink</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Hijau</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Biru</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">*warna lain silahkan di chat saja</p>								', 'PRODUCT_20230629152545_buket boneka medium.jpg', 30, 95000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket,wisuda', '2023-06-29 15:25:45', NULL, 'PRODUCTONE_20230629152545_buket boneka medium.jpg', 'PRODUCTTWO_20230629152545_buket boneka medium.jpg', 'PRODUCTTHREE_20230629152545_buket boneka medium.jpg'),
(87, 8, 7, 'BOUQUET BONEKA JUMBO', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Buket Boneka Ukuran Jumbo</span><br></p>								', '									<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Buket dengan Isi Boneka Dan  Bunga cocok untuk acara wisuda</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Tersedia varian warna dan bisa Request</p>								', 'PRODUCT_20230629152748_boneka stand hju.jpg', 20, 125000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'buket,wisuda', '2023-06-29 15:27:48', NULL, 'PRODUCTONE_20230629152748_boneka stand hju.jpg', 'PRODUCTTWO_20230629152748_boneka stand hju.jpg', 'PRODUCTTHREE_20230629152748_boneka stand hju.jpg'),
(88, 8, 7, 'BOUQUET UANG MEDIUM', '																		<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Buket ukuran medium<b> tanpa uang</b></span><br></p>																', '																		<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Buket ini hanya dijual buketnya saja tanpa isian uang, jadi temen-temen bisa isi sendiri nominal uangnya.</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\"></p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Jumlah slot uang = 20 lembar</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">variasi warna :</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Hijau</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Pink</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Biru</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Gold</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Grey</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- warna lain tulis di chat</p>																', 'PRODUCT_20230629153011_uang bunga medium hju.jpg', 12, 55000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket,wisuda', '2023-06-29 15:30:11', NULL, 'PRODUCTONE_20230629153011_uang bunga medium hju.jpg', 'PRODUCTTWO_20230629153011_uang bunga medium hju.jpg', 'PRODUCTTHREE_20230629153011_uang bunga medium hju.jpg'),
(89, 1, 4, 'KALUNG CHOKER MUTIARA', '<p><span style=\"font-weight: 700; color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">Kalung Choker</span><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\"> Wanita Rangkai Mutiara\r\nPanjang | </span><span style=\"font-weight: 700; color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">uk 32cm</span><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">\r\n</span><br></p>', '<p><span style=\"font-weight: 700; color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">Kalung Choker</span><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\"> Wanita Rangkai Mutiara\r\nPanjang | </span><span style=\"font-weight: 700; color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">uk 32cm</span><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; letter-spacing: 0.07px; white-space-collapse: preserve;\">\r\nTerlihat mewah saat di pakai \r\nAda 2 varian warna ya kak :\r\n- Gold\r\n- Silver</span><br></p>', 'PRODUCT_20230629153536_kmutiara.jpeg', 45, 16500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'kalung,kalungkorea', '2023-06-29 15:35:36', NULL, 'PRODUCTONE_20230629153536_kmutiara.jpeg', 'PRODUCTTWO_20230629153536_kmutiara.jpeg', 'PRODUCTTHREE_20230629153536_kmutiara.jpeg'),
(90, 1, 2, 'JEDAI KOREA', '<p><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">Jedai import korea</span><br></p>', '<p><span style=\"color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Jedai yang di import langsung dari korea banyak varian dengan desain yang unlimitied, jarang ada yang sama.</span><br></p>', 'PRODUCT_20230629153801_jepit6.jpeg', 20, 18300, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'jedai,,jedaikorea', '2023-06-29 15:38:01', NULL, 'PRODUCTONE_20230629153801_jepit6.jpeg', 'PRODUCTTWO_20230629153801_jepit6.jpeg', 'PRODUCTTHREE_20230629153801_jepit6.jpeg'),
(91, 2, 16, 'KEYCHAIN-COUSTOM NAMA', '<p>Gantungan kunci K-pop huruf aeshtetic</p>', '<p>Gantungan kunci K-pop coustom huruf aeshtetic</p><p>- Max 5 huruf</p><p>- Tulisan silahkan dikirim di chat</p>', 'PRODUCT_20230629154545_ganci.jpeg', 32, 7050, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'ganci,estetik', '2023-06-29 15:45:45', NULL, 'PRODUCTONE_20230629154545_ganci.jpeg', 'PRODUCTTWO_20230629154545_ganci.jpeg', 'PRODUCTTHREE_20230629154545_ganci.jpeg'),
(93, 2, 16, 'KEYCHAIN-PASTEL MACROME', '																		<p>Gantungan kunci warna pastel</p>																', '																		<p>Gantungan kunci handmade dengan pilihan warna pastel</p><p>- blue</p><p>- mint</p><p>- cream</p><p>- warna lain silhakan kirim via chat </p>																', 'PRODUCT_20230629155126_gancipl.jpeg', 15, 13000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'ganci', '2023-06-29 15:51:26', NULL, 'PRODUCTONE_20230629155126_gancipl.jpeg', 'PRODUCTTWO_20230629155126_gancipl.jpeg', 'PRODUCTTHREE_20230629155126_gancipl.jpeg'),
(94, 2, 16, 'KEYCHAIN-RAINBOW MACRAME', '									<p>Gantungan kunci rainbow</p>								', '									<p>Gantungan kunci handmade dengan warna cerah seperti pelangi</p><p>pilihan warna silhkan chat</p>								', 'PRODUCT_20230629155335_gancirnbw.jpg', 32, 13500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'ganci', '2023-06-29 15:53:35', NULL, 'PRODUCTONE_20230629155335_gancirnbw.jpg', 'PRODUCTTWO_20230629155335_gancirnbw.jpg', 'PRODUCTTHREE_20230629155335_gancirnbw.jpg'),
(95, 2, 16, 'KEYCHAIN TALI PANJANG', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Gantungan kunci tali huruf aeshtetic</span><br></p>								', '									<p>Gantungan kunci dengan tali dan huruf yang estetik</p><p>coustom nama Max 5 huruf dan tulisan silahkan kirim chat.</p>								', 'PRODUCT_20230629155625_gancipn.jpeg', 13, 5000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'ganci', '2023-06-29 15:56:25', NULL, 'PRODUCTONE_20230629155625_gancipn.jpeg', 'PRODUCTTWO_20230629155625_gancipn.jpeg', 'PRODUCTTHREE_20230629155625_gancipn.jpeg'),
(96, 2, 16, 'KEYCHAIN-MINT MACROME ', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Gantungan kunci<b> warna mint</b></span><br></p>								', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Gantungan kunci</span><span style=\"font-weight: 700; color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\"> warna mint</span><br></p>								', 'PRODUCT_20230629155928_rainbowmint.jpeg', 9, 13000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'ganci', '2023-06-29 15:59:28', NULL, 'PRODUCTONE_20230629155928_rainbowmint.jpeg', 'PRODUCTTWO_20230629155928_rainbowmint.jpeg', 'PRODUCTTHREE_20230629155928_rainbowmint.jpeg'),
(97, 1, 17, 'STRAP MASKER PITA', '<p>Tali masker berbentuk pita&nbsp;</p>', '<p>Tali masker berbentuk pita besar&nbsp;</p><p>banyak pilihan warna</p>', 'PRODUCT_20230629160320_pita moca.jpg', 5, 20500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'pita', '2023-06-29 16:03:20', NULL, 'PRODUCTONE_20230629160320_pita moca.jpg', 'PRODUCTTWO_20230629160320_pita moca.jpg', 'PRODUCTTHREE_20230629160320_pita moca.jpg'),
(98, 1, 17, 'STRAP MASKER PITA KECIL', '<p><span style=\"color: rgb(118, 127, 132); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.07px;\">Tali masker berbentuk pita&nbsp;</span><br></p>', '<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Tali masker berbentuk pita kecil</p><p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; text-align: justify;\">Warna : hitam &amp; putih</p>', 'PRODUCT_20230629160617_2pita.jpg', 5, 18000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'pita', '2023-06-29 16:06:17', NULL, 'PRODUCTONE_20230629160617_2pita.jpg', 'PRODUCTTWO_20230629160617_2pita.jpg', 'PRODUCTTHREE_20230629160617_2pita.jpg'),
(99, 8, 7, 'BOUQUET BONEKA MEDIUM-LILAC', '									<p>B<span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">uket Bunga+Boneka Wisuda Ukuran Medium</span></p>								', '									<p>B<span style=\"color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">uket dengan isian Bunga dan boneka wisuda</span></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">varian warna:</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Pink</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Hijau</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Biru</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">*warna lain silahkan di chat saja</p>								', 'PRODUCT_20230629160923_boneka unggu.jpg', 2, 95000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket', '2023-06-29 16:09:23', NULL, 'PRODUCTONE_20230629160923_boneka unggu.jpg', 'PRODUCTTWO_20230629160923_boneka unggu.jpg', 'PRODUCTTHREE_20230629160923_boneka unggu.jpg'),
(100, 8, 7, 'BOUQUET BONEKA MEDIUM-PEACH', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">B</span><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">uket Bunga+Boneka Wisuda Ukuran Medium</span><br></p>								', '									<p style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Buket dengan isian Bunga dan boneka wisuda</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">varian warna:</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Pink</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Hijau</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Biru</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">*warna lain silahkan di chat saja</p>								', 'PRODUCT_20230629161141_boneka cream.jpg', 5, 95000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket', '2023-06-29 16:11:41', NULL, 'PRODUCTONE_20230629161141_boneka cream.jpg', 'PRODUCTTWO_20230629161141_boneka cream.jpg', 'PRODUCTTHREE_20230629161141_boneka cream.jpg'),
(101, 8, 7, 'BOUQUET UANG JUMBO', '									<p><span style=\"color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">Buket ukuran jumbo </span><span style=\"font-weight: 700; color: rgb(118, 127, 132); font-family: \"Open Sans\", sans-serif; letter-spacing: 0.07px;\">tanpa uang</span><br></p>								', '									<p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Buket ini hanya dijual buketnya saja tanpa isian uang, jadi temen-temen bisa isi sendiri nominal uangnya.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\"></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">Jumlah slot uang =25 lembar</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">variasi warna :</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Hijau</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Pink</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Biru</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Gold</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- Grey</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 13px;=\"\" text-align:=\"\" justify;\"=\"\" style=\"margin-bottom: 2.2rem; color: rgb(123, 133, 138); font-family: \"Open Sans\", sans-serif; font-size: 13px; text-align: justify;\">- warna lain tulis di chat</p>								', 'PRODUCT_20230629161404_bunga uang jumbo htm.jpg', 9, 135000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'buket', '2023-06-29 16:14:04', NULL, 'PRODUCTONE_20230629161404_bunga uang jumbo htm.jpg', 'PRODUCTTWO_20230629161404_bunga uang jumbo htm.jpg', 'PRODUCTTHREE_20230629161404_bunga uang jumbo htm.jpg'),
(102, 1, 17, 'STRAP MASKER COUSTOM NAMA', '<p>Strap masker huruf coustom nama estetik<br></p>', '<p>Strap masker huruf coustom nama</p><p>warna:</p><p>- hitam</p><p>- putih</p>', 'PRODUCT_20230629235145_strap htmpth.jpg', 17, 7000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Out of Stock', 'NO', 'strap,masker', '2023-06-29 23:51:45', NULL, 'PRODUCTONE_20230629235145_strap htmpth.jpg', 'PRODUCTTWO_20230629235145_strap htmpth.jpg', 'PRODUCTTHREE_20230629235145_strap htmpth.jpg'),
(104, 1, 17, 'STRAP MASKER MUTIARA', '									<p>Strap masker mutiara  berbentuk bunga</p>								', '									<p> Strap masker mutiara  berbentuk bunga </p><p>warna:</p><p> ungu - putih </p><p> Biru-putih</p><p>pink-ungu</p>								', 'PRODUCT_20230630002556_strap mutiara.jpg', 4, 18000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Out of Stock', 'YES', 'strap,masker,mutiara', '2023-06-30 00:25:56', NULL, 'PRODUCTONE_20230630002556_strap mutiara.jpg', 'PRODUCTTWO_20230630002556_strap mutiara.jpg', 'PRODUCTTHREE_20230630002556_strap mutiara.jpg'),
(105, 1, 3, 'GELANG COUPLE HITAM', 'Gelang Couple warna hitam', '<p>Gelang Couple warna hitam dengan icon gembok+kunci</p><p>10Rb Untuk sepasang</p>', 'PRODUCT_20230630074226_htm cpl.jpg', 35, 10000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'gelang,couple', '2023-06-30 07:42:26', NULL, 'PRODUCTONE_20230630074226_htm cpl.jpg', 'PRODUCTTWO_20230630074226_htm cpl.jpg', 'PRODUCTTHREE_20230630074226_htm cpl.jpg'),
(106, 1, 3, 'GELANG DANDELION ', '<p>Gelang icon bunga&nbsp;</p>', '<p>Gelang dngan icon 5 buah bunga', 'PRODUCT_20230630074543_5 dandelion.jpg', 24, 13500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'gelang,dandelion,bunga', '2023-06-30 07:45:43', NULL, 'PRODUCTONE_20230630074543_5 dandelion.jpg', 'PRODUCTTWO_20230630074543_5 dandelion.jpg', 'PRODUCTTHREE_20230630074543_5 dandelion.jpg'),
(107, 1, 3, 'GELANG SUN FLOWER ', '<p>Gelang bunga matahari&nbsp;</p>', '<p>Gelang bunga matahari&nbsp;<br></p>', 'PRODUCT_20230630161943_sun flwr.jpg', 40, 5000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'gelang', '2023-06-30 16:19:43', NULL, 'PRODUCTONE_20230630161943_sun flwr.jpg', 'PRODUCTTWO_20230630161943_sun flwr.jpg', 'PRODUCTTHREE_20230630161943_sun flwr.jpg'),
(108, 8, 7, 'BOUQUET BUNGA MINI', '<p>buket bunga mini</p>', '<p>banyak varian warna silhkan chat</p>', 'PRODUCT_20230630162646_Buketmini.jpg', 7, 35000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket,mini', '2023-06-30 16:26:46', NULL, 'PRODUCTONE_20230630162646_Buketmini.jpg', 'PRODUCTTWO_20230630162646_Buketmini.jpg', 'PRODUCTTHREE_20230630162646_Buketmini.jpg'),
(109, 8, 7, 'BOUQUET UANG MINI', '<p>Buket mini tanpa uang</p>', '<p>Buket mini isi uang (silhkan isi sendiri) isi 10 lembar.</p>', 'PRODUCT_20230630162943_buket mini.jpg', 7, 40000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'buket,mini', '2023-06-30 16:29:43', NULL, 'PRODUCTONE_20230630162943_buket mini.jpg', 'PRODUCTTWO_20230630162943_buket mini.jpg', 'PRODUCTTHREE_20230630162943_buket mini.jpg'),
(111, 2, 16, 'KEYCHAIN CAT', '<p>gantungan kunci kucing</p>', '<p>Gantungan kunci kucing import</p>', 'PRODUCT_20230630163749_keycat.jpg', 21, 14700, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'ganci,cat', '2023-06-30 16:37:49', NULL, 'PRODUCTONE_20230630163749_keycat.jpg', 'PRODUCTTWO_20230630163749_keycat.jpg', 'PRODUCTTHREE_20230630163749_keycat.jpg'),
(114, 2, 14, 'KEYCHAIN KAKAO FRIENDS ', '<p>Gantungan kunci&nbsp; kakao &amp; friend</p>', '<p>produk import korea</p>', 'PRODUCT_20230630165443_kkao.jpg', 17, 16700, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'ganci', '2023-06-30 16:54:43', NULL, 'PRODUCTONE_20230630165443_kkao.jpg', 'PRODUCTTWO_20230630165443_kkao.jpg', 'PRODUCTTHREE_20230630165443_kkao.jpg'),
(115, 2, 14, 'KEYCHAIN ANIMALS CUTE', '<p>Gantungan kunci bentuk animal lucu</p>', '<p>Banyak pilihan animal yang lucu lucu</p>', 'PRODUCT_20230630170021_anml.jpg', 11, 16600, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'ganci', '2023-06-30 17:00:21', NULL, 'PRODUCTONE_20230630170021_anml.jpg', 'PRODUCTTWO_20230630170021_anml.jpg', 'PRODUCTTHREE_20230630170021_anml.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shippings`
--

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'SHIPPING ID',
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shipcstmr_name` varchar(128) NOT NULL,
  `shipcstmr_mobile` varchar(32) NOT NULL,
  `shipcstmr_profession` varchar(256) DEFAULT NULL,
  `shipcstmr_streetadd` varchar(256) NOT NULL,
  `shipcstmr_city` varchar(64) NOT NULL,
  `shipcstmr_zip` varchar(6) NOT NULL,
  `shipcstmr_country` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shippings`
--

INSERT INTO `shippings` (`id`, `customer_id`, `order_id`, `shipcstmr_name`, `shipcstmr_mobile`, `shipcstmr_profession`, `shipcstmr_streetadd`, `shipcstmr_city`, `shipcstmr_zip`, `shipcstmr_country`, `created_at`, `updated_at`) VALUES
(10, 16, 12, 'pelanggan 1', '12345678900', '', 'abcd', 'efgh', '12345', 'Indonesia', '2023-06-29 21:09:56', NULL),
(11, 16, 12, 'pelanggan 1', '12345678900', '', 'abcd', 'efgh', '12345', 'Indonesia', '2023-06-29 21:12:44', NULL),
(12, 16, 12, 'pelanggan 1', '12345678900', '', 'abcd', 'efgh', '12345', 'Indonesia', '2023-06-29 21:16:36', NULL),
(13, 16, 12, 'pelanggan 1', '12345678900', '', 'abcd', 'efgh', '12345', 'Indonesia', '2023-06-29 21:20:09', NULL),
(14, 16, 12, 'pelanggan 1', '12345678900', '', 'abcd', 'efgh', '12345', 'Indonesia', '2023-06-29 21:29:28', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopcarts`
--

DROP TABLE IF EXISTS `shopcarts`;
CREATE TABLE IF NOT EXISTS `shopcarts` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'SHOPCARTS ID',
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shopcarts`
--

INSERT INTO `shopcarts` (`id`, `customer_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(12, 16, 89, 1, '2023-06-29 21:38:08', NULL),
(13, 18, 84, 1, '2023-06-29 22:57:31', NULL),
(14, 17, 85, 1, '2023-06-30 08:53:41', NULL),
(15, 17, 99, 1, '2023-06-30 14:37:41', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'SLIDER ID',
  `slider_title` varchar(128) NOT NULL,
  `slider_file` text NOT NULL,
  `slider_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `slider_sequence` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `slides`
--

INSERT INTO `slides` (`id`, `slider_title`, `slider_file`, `slider_status`, `slider_sequence`, `created_at`, `updated_at`) VALUES
(11, ' ', 'SLIDER_20230630200503_welcome.png', 'Active', 1, NULL, NULL),
(13, ' ', 'SLIDER_20230630200605_bouqet.jpeg', 'Active', 2, NULL, NULL),
(14, ' ', 'SLIDER_20230630200654_jed.jpeg', 'Active', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'SUBCATEGORIES ID',
  `category_id` int NOT NULL,
  `subcategory_name` varchar(128) NOT NULL,
  `subcategory_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `subcategory_banner` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory_name`, `subcategory_status`, `subcategory_banner`, `created_at`, `updated_at`) VALUES
(2, 1, 'JEPIT', 'Active', 'SUBCATBANNER__20230630160955_bjepit.png', '2020-07-06 02:44:06', '2023-06-27 06:20:25'),
(3, 1, 'GELANG', 'Active', 'SUBCATBANNER__20230630161053_bgelang.png', '2020-07-06 02:44:37', NULL),
(4, 1, 'KALUNG ', 'Active', 'SUBCATBANNER__20230630161118_bkalung.png', '2020-07-06 02:45:03', NULL),
(5, 8, 'GRADUATION ', 'Active', 'SUBCATBANNER__20230630161252_bwisuda.png', '2020-07-06 02:45:27', '2023-06-27 06:20:25'),
(7, 8, 'BOUQUETS ', 'Active', 'SUBCATBANNER__20230629233308_bucketttt.jpg', '2023-06-27 23:46:02', '2023-06-27 23:20:25'),
(8, 8, 'HAMPERS ', 'Active', 'SUBCATBANNER__20230630161311_bhampers.png', '2023-06-27 23:20:25', '2023-06-27 23:20:25'),
(14, 2, 'IMPORT ', 'Active', 'SUBCATBANNER__20230630161202_bimport.png', '2020-07-06 02:50:48', '2023-06-27 06:20:25'),
(16, 2, 'HANDMADE', 'Active', 'SUBCATBANNER__20230630161231_bhm.png', '2020-07-06 02:51:40', '2023-06-29 11:12:14'),
(17, 1, 'STRAP', 'Active', 'SUBCATBANNER__20230630161140_bmasker.png', '2023-06-25 02:53:12', '0000-00-00 00:00:00');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shippings_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shopcarts`
--
ALTER TABLE `shopcarts`
  ADD CONSTRAINT `shopcarts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shopcarts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
