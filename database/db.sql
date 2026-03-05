-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table siap.angsuran_piutang
CREATE TABLE IF NOT EXISTS `angsuran_piutang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `piutang_id` int NOT NULL DEFAULT (0),
  `tanggal` date NOT NULL,
  `angsuran` double NOT NULL DEFAULT (0),
  `ket` varchar(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.angsuran_piutang: ~3 rows (approximately)
INSERT INTO `angsuran_piutang` (`id`, `piutang_id`, `tanggal`, `angsuran`, `ket`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '2025-10-30', 250000, 'Angsuran ke 1', '2025-10-30 11:55:41', '2025-10-30 11:55:41', NULL),
	(2, 1, '2025-10-30', 250000, 'Angsuran ke 2', '2025-10-30 11:57:49', '2025-10-30 11:58:40', '2025-10-30 11:58:40'),
	(3, 1, '2025-10-30', 750000, 'Angsuran ke 2', '2025-10-30 11:58:53', '2025-10-30 11:58:53', NULL);

-- Dumping structure for table siap.bulan
CREATE TABLE IF NOT EXISTS `bulan` (
  `id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siap.bulan: ~12 rows (approximately)
INSERT INTO `bulan` (`id`, `name`, `sorting`) VALUES
	('1', 'Januari', 7),
	('10', 'Oktober', 4),
	('11', 'November', 5),
	('12', 'Desember', 6),
	('2', 'Februari', 8),
	('3', 'Maret', 9),
	('4', 'April', 10),
	('5', 'Mei', 11),
	('6', 'Juni', 12),
	('7', 'Juli', 1),
	('8', 'Agustus', 2),
	('9', 'September', 3);

-- Dumping structure for table siap.chart_of_accounts
CREATE TABLE IF NOT EXISTS `chart_of_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` enum('Asset','Liability','Equity','Revenue','Expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_category` enum('finance','payment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `next_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_main` enum('credit','debit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `FK_chart_of_accounts_schools` (`school_id`),
  CONSTRAINT `chart_of_accounts_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `chart_of_accounts` (`id`),
  CONSTRAINT `FK_chart_of_accounts_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.chart_of_accounts: ~46 rows (approximately)
INSERT INTO `chart_of_accounts` (`id`, `school_id`, `account_code`, `account_name`, `account_type`, `account_category`, `parent_id`, `next_code`, `description`, `account_main`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'a204f79d-3bec-420b-985b-dc656f688a8d', '100', 'Aset', 'Asset', NULL, NULL, '108', 'Akun induk untuk aset', 'debit', 1, '2025-11-18 04:54:24', '2025-11-20 04:47:01', NULL),
	(2, 'a204f79d-3bec-420b-985b-dc656f688a8d', '101', 'Kas', 'Asset', 'finance', 1, NULL, 'Kas tunai sekolah', 'debit', 1, '2025-11-18 04:54:24', '2025-11-21 02:42:15', NULL),
	(3, 'a204f79d-3bec-420b-985b-dc656f688a8d', '102', 'Bank', 'Asset', 'finance', 1, NULL, 'Saldo rekening bank', 'debit', 1, '2025-11-18 04:54:24', '2025-11-21 02:42:24', NULL),
	(4, 'a204f79d-3bec-420b-985b-dc656f688a8d', '103', 'Piutang SPP', 'Asset', 'finance', 1, NULL, 'Tagihan SPP yang belum dibayar', 'debit', 1, '2025-11-18 04:54:24', '2025-11-20 04:47:08', NULL),
	(5, 'a204f79d-3bec-420b-985b-dc656f688a8d', '200', 'Kewajiban', 'Liability', NULL, NULL, '203', 'Akun induk kewajiban', 'credit', 1, '2025-11-18 04:54:24', '2025-11-18 04:54:24', NULL),
	(6, 'a204f79d-3bec-420b-985b-dc656f688a8d', '201', 'Utang Usaha', 'Liability', 'finance', 5, NULL, 'Utang kepada pemasok', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:47:04', NULL),
	(7, 'a204f79d-3bec-420b-985b-dc656f688a8d', '202', 'Utang Gaji', 'Liability', 'finance', 5, NULL, 'Gaji guru yang belum dibayar', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:47:14', NULL),
	(8, 'a204f79d-3bec-420b-985b-dc656f688a8d', '300', 'Ekuitas', 'Equity', NULL, NULL, '302', 'Modal sekolah', 'credit', 1, '2025-11-18 04:54:24', '2025-11-18 04:54:24', NULL),
	(9, 'a204f79d-3bec-420b-985b-dc656f688a8d', '301', 'Saldo Awal', 'Equity', 'finance', 8, NULL, 'Saldo awal tahun berjalan', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:47:25', NULL),
	(10, 'a204f79d-3bec-420b-985b-dc656f688a8d', '400', 'Pendapatan', 'Revenue', NULL, NULL, '405', 'Akun induk pendapatan', 'credit', 1, '2025-11-18 04:54:24', '2025-11-20 06:31:15', NULL),
	(11, 'a204f79d-3bec-420b-985b-dc656f688a8d', '401', 'Pendapatan SPP', 'Revenue', 'payment', 10, NULL, 'Pendapatan dari SPP siswa', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:48:45', NULL),
	(12, 'a204f79d-3bec-420b-985b-dc656f688a8d', '402', 'Donasi', 'Revenue', 'payment', 10, NULL, 'Pendapatan dari donasi', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:48:53', NULL),
	(13, 'a204f79d-3bec-420b-985b-dc656f688a8d', '403', 'Pendapatan Ekstrakurikuler', 'Revenue', 'finance', 10, NULL, 'Pendapatan dari kegiatan tambahan', 'credit', 1, '2025-11-18 04:54:24', '2025-11-21 02:49:03', NULL),
	(14, 'a204f79d-3bec-420b-985b-dc656f688a8d', '500', 'Beban', 'Expense', NULL, NULL, '505', 'Akun induk beban', 'debit', 1, '2025-11-18 04:54:24', '2025-11-19 17:14:13', NULL),
	(15, 'a204f79d-3bec-420b-985b-dc656f688a8d', '501', 'Gaji Guru', 'Expense', 'finance', 14, NULL, 'Beban gaji guru', 'debit', 1, '2025-11-18 04:54:24', '2025-11-21 02:48:15', NULL),
	(16, 'a204f79d-3bec-420b-985b-dc656f688a8d', '502', 'Perlengkapan', 'Expense', 'finance', 14, NULL, 'Beban perlengkapan sekolah', 'debit', 1, '2025-11-18 04:54:24', '2025-11-21 02:48:23', NULL),
	(17, 'a204f79d-3bec-420b-985b-dc656f688a8d', '503', 'Listrik & Air', 'Expense', 'finance', 14, NULL, 'Beban utilitas sekolah', 'debit', 1, '2025-11-18 04:54:24', '2025-11-21 02:48:30', NULL),
	(18, 'a204f79d-3bec-420b-985b-dc656f688a8d', '104', 'Piutang SPP', 'Asset', 'finance', 1, NULL, 'ini piutang spp', 'debit', 0, '2025-11-19 16:43:16', '2025-11-20 04:16:26', NULL),
	(19, 'a204f79d-3bec-420b-985b-dc656f688a8d', '105', 'Piutang Uang buku', 'Asset', 'finance', 1, NULL, 'test', 'debit', 0, '2025-11-19 16:51:30', '2025-11-20 04:16:22', NULL),
	(20, 'a204f79d-3bec-420b-985b-dc656f688a8d', '106', 'Piutang Kas', 'Asset', 'finance', 1, NULL, 'biaya layanan aplikasi driver', 'debit', 0, '2025-11-19 16:51:49', '2025-11-21 02:47:39', NULL),
	(21, 'a204f79d-3bec-420b-985b-dc656f688a8d', '504', 'Gaji Guru Tetap', 'Expense', 'finance', 14, NULL, 'Gaji Guru 2025', 'debit', 1, '2025-11-19 17:14:13', '2025-11-21 02:49:23', NULL),
	(22, 'a204f79d-3bec-420b-985b-dc656f688a8d', '107', 'Piutang Uang Gedung', 'Asset', 'finance', 1, NULL, 'Piutang Uang Gedung.', 'debit', 1, '2025-11-20 04:47:01', '2025-11-20 06:30:36', NULL),
	(23, 'a204f79d-3bec-420b-985b-dc656f688a8d', '404', 'Pendapatan Uang Gedung', 'Revenue', 'payment', 10, NULL, 'test', 'credit', 1, '2025-11-20 06:31:15', '2025-11-21 02:49:12', NULL),
	(24, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '1000', 'Aset', 'Asset', NULL, NULL, '1002', 'Akun induk untuk aset', 'debit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(25, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '1001', 'Kas', 'Asset', 'finance', 24, NULL, 'Kas tunai sekolah', 'debit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(26, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '2000', 'Kewajiban', 'Liability', NULL, NULL, '2002', 'Akun induk kewajiban', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(27, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '2001', 'Utang Sekolah', 'Liability', 'finance', 26, NULL, 'Utang Sekolah Kepada External', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(28, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '3000', 'Ekuitas', 'Equity', NULL, NULL, '3002', 'Modal pemilik/sekolah', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(29, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '3001', 'Saldo Awal', 'Equity', 'finance', 28, NULL, 'Saldo awal tahun berjalan', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(30, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '4000', 'Pendapatan', 'Revenue', NULL, NULL, '4002', 'Akun induk pendapatan dari SPP dan lain-lain', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(31, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '4001', 'Pendapatan SPP', 'Revenue', 'payment', 30, NULL, 'Pendapatan dari SPP siswa', 'credit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(32, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '5000', 'Beban Operasional', 'Expense', NULL, NULL, '5005', 'Beban gaji, listrik, perlengkapan dll', 'debit', 1, '2025-11-21 04:00:00', '2025-11-21 09:14:12', NULL),
	(33, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '5001', 'Gaji Guru', 'Expense', 'finance', 32, NULL, 'Beban gaji guru', 'debit', 1, '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(34, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '5002', 'Sewa Gedung', 'Expense', 'finance', 32, NULL, 'Sewa Gedung Pertahun', 'debit', 1, '2025-11-21 08:53:01', '2025-11-21 08:53:01', NULL),
	(35, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '5003', 'Perlengkapan Kantor', 'Expense', 'finance', 32, NULL, 'Perlengkapan Kantor Awal', 'debit', 1, '2025-11-21 08:55:50', '2025-11-21 08:55:50', NULL),
	(36, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '5004', 'Peralatan Kantor', 'Expense', 'finance', 32, NULL, 'Peralatan Kantor', 'debit', 1, '2025-11-21 09:14:12', '2025-11-21 09:14:12', NULL),
	(37, '681fb72b-652e-4f3f-8fec-e688846bf6df', '1000', 'Aset', 'Asset', NULL, NULL, '1002', 'Akun induk untuk aset', 'debit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(38, '681fb72b-652e-4f3f-8fec-e688846bf6df', '1001', 'Kas', 'Asset', 'finance', 37, NULL, 'Kas tunai sekolah', 'debit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(39, '681fb72b-652e-4f3f-8fec-e688846bf6df', '2000', 'Kewajiban', 'Liability', NULL, NULL, '2002', 'Akun induk kewajiban', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(40, '681fb72b-652e-4f3f-8fec-e688846bf6df', '2001', 'Utang Sekolah', 'Liability', 'finance', 39, NULL, 'Utang Sekolah Kepada External', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(41, '681fb72b-652e-4f3f-8fec-e688846bf6df', '3000', 'Ekuitas', 'Equity', NULL, NULL, '3002', 'Modal pemilik/sekolah', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(42, '681fb72b-652e-4f3f-8fec-e688846bf6df', '3001', 'Saldo Awal', 'Equity', 'finance', 41, NULL, 'Saldo awal tahun berjalan', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(43, '681fb72b-652e-4f3f-8fec-e688846bf6df', '4000', 'Pendapatan', 'Revenue', NULL, NULL, '4002', 'Akun induk pendapatan dari SPP dan lain-lain', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(44, '681fb72b-652e-4f3f-8fec-e688846bf6df', '4001', 'Pendapatan SPP', 'Revenue', 'payment', 43, NULL, 'Pendapatan dari SPP siswa', 'credit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(45, '681fb72b-652e-4f3f-8fec-e688846bf6df', '5000', 'Beban Operasional', 'Expense', NULL, NULL, '5002', 'Beban gaji, listrik, perlengkapan dll', 'debit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	(46, '681fb72b-652e-4f3f-8fec-e688846bf6df', '5001', 'Gaji Guru', 'Expense', 'finance', 45, NULL, 'Beban gaji guru', 'debit', 1, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL);

-- Dumping structure for table siap.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table siap.inventory_category
CREATE TABLE IF NOT EXISTS `inventory_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inventory_category_schools` (`school_id`),
  CONSTRAINT `FK_inventory_category_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.inventory_category: ~3 rows (approximately)
INSERT INTO `inventory_category` (`id`, `school_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Furnitur', 'test', '2025-11-06 16:01:39', '2025-11-06 16:04:32', '2025-11-06 16:04:32'),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Furnitur', NULL, '2025-11-06 16:04:42', '2025-11-06 16:06:23', NULL),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Meja', 'meja siswa', '2025-11-06 16:05:48', '2025-11-06 16:05:48', NULL);

-- Dumping structure for table siap.inventory_location
CREATE TABLE IF NOT EXISTS `inventory_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inventory_location_schools` (`school_id`),
  CONSTRAINT `FK_inventory_location_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.inventory_location: ~3 rows (approximately)
INSERT INTO `inventory_location` (`id`, `school_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Ruang Guru', NULL, '2025-11-06 16:13:14', '2025-11-06 16:13:14', NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Kelas X A', 'test', '2025-11-06 16:13:25', '2025-11-06 16:14:43', '2025-11-06 16:14:43'),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Kelas X B', 'pojok', '2025-11-06 16:14:35', '2025-11-06 16:14:35', NULL);

-- Dumping structure for table siap.inventory_product
CREATE TABLE IF NOT EXISTS `inventory_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_category_id` int NOT NULL,
  `inventory_location_id` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int DEFAULT '0',
  `date_in` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_trx` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_category_id` (`inventory_category_id`),
  KEY `inventory_location_id` (`inventory_location_id`),
  KEY `FK_inventory_product_schools` (`school_id`),
  CONSTRAINT `FK_inventory_product_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `inventory_product_ibfk_1` FOREIGN KEY (`inventory_category_id`) REFERENCES `inventory_category` (`id`),
  CONSTRAINT `inventory_product_ibfk_2` FOREIGN KEY (`inventory_location_id`) REFERENCES `inventory_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.inventory_product: ~3 rows (approximately)
INSERT INTO `inventory_product` (`id`, `school_id`, `inventory_category_id`, `inventory_location_id`, `code`, `name`, `description`, `stock`, `date_in`, `created_at`, `updated_at`, `deleted_at`, `no_trx`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 2, 3, 'CODE1', 'Meja Belajar', 'ini meja belajar murid', 9, '2025-11-07', '2025-11-07 06:45:16', '2025-11-07 08:27:21', NULL, NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 3, 1, 'APAL1', 'Bangku1', 'Bangku belajar1', 0, '2025-11-08', '2025-11-07 07:11:44', '2025-11-07 07:12:20', '2025-11-07 07:12:20', NULL),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 3, 1, 'CODE11', 'Papan Tulis', 'test', 12, '2025-11-08', '2025-11-08 06:19:45', '2025-11-08 06:20:43', NULL, NULL);

-- Dumping structure for table siap.inventory_transaction
CREATE TABLE IF NOT EXISTS `inventory_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_product_id` int NOT NULL,
  `no_trx` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `type` enum('masuk','keluar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_product_id` (`inventory_product_id`),
  KEY `FK_inventory_transaction_schools` (`school_id`),
  CONSTRAINT `FK_inventory_transaction_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `inventory_transaction_ibfk_1` FOREIGN KEY (`inventory_product_id`) REFERENCES `inventory_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.inventory_transaction: ~4 rows (approximately)
INSERT INTO `inventory_transaction` (`id`, `school_id`, `inventory_product_id`, `no_trx`, `type`, `amount`, `description`, `transaction_date`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 'INVT20251107TQRHEA', 'masuk', 10, 'testing', '2025-11-07 15:21:39', 'Super Admin', '2025-11-07 08:21:39', '2025-11-07 08:21:39'),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 'INVT20251107IFFX5M', 'masuk', 1, NULL, '2025-11-07 15:26:11', 'Super Admin', '2025-11-07 08:26:11', '2025-11-07 08:26:11'),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 'INVT20251107PP1IXV', 'keluar', 2, 'test', '2025-11-07 15:27:21', 'Super Admin', '2025-11-07 08:27:21', '2025-11-07 08:27:21'),
	(4, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 3, 'INVT20251108IK3G6H', 'masuk', 12, 'test', '2025-11-08 13:20:43', 'Super Admin', '2025-11-08 06:20:43', '2025-11-08 06:20:43');

-- Dumping structure for table siap.jenis_bayar
CREATE TABLE IF NOT EXISTS `jenis_bayar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos_bayar_id` int DEFAULT NULL,
  `tahun_ajaran_id` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type` enum('bulanan','bebas') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'bulanan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_pos` (`pos_bayar_id`) USING BTREE,
  KEY `fk_tahun` (`tahun_ajaran_id`) USING BTREE,
  KEY `FK_jenis_bayar_schools` (`school_id`),
  CONSTRAINT `FK_jenis_bayar_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `fk_pos` FOREIGN KEY (`pos_bayar_id`) REFERENCES `pos_bayar` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tahun` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.jenis_bayar: ~6 rows (approximately)
INSERT INTO `jenis_bayar` (`id`, `school_id`, `pos_bayar_id`, `tahun_ajaran_id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 2, 1, 'Uang Pangkal Kelas X', 'bebas', '2025-10-30 10:41:54', '2025-10-30 10:41:54', NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 1, 'SPP Kelas X', 'bulanan', '2025-10-30 10:45:34', '2025-10-30 10:45:34', NULL),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 2, 'SPP 2027', 'bulanan', '2025-10-31 04:21:57', '2025-10-31 04:21:57', NULL),
	(4, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 3, 'SPP MA 2025', 'bulanan', '2025-11-20 04:33:23', '2025-11-20 04:33:23', NULL),
	(5, 'a204f79d-3bec-420b-985b-dc656f688a8d', 4, 3, 'pendapatan dari uang gedung', 'bebas', '2025-11-20 06:32:18', '2025-11-20 06:32:18', NULL),
	(6, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 5, 4, 'SPP 2025/2026', 'bulanan', '2025-11-21 09:00:54', '2025-11-21 09:00:54', NULL);

-- Dumping structure for table siap.jurnal_umum
CREATE TABLE IF NOT EXISTS `jurnal_umum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_ajaran_id` int DEFAULT NULL,
  `coa_id` int DEFAULT NULL,
  `type` enum('pengeluaran','penerimaan') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `ket` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '0 blm approved, 1 approved, 2 canceled',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_canceled` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_cash_flow` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_jurnal_umum_schools` (`school_id`) USING BTREE,
  KEY `FK_jurnal_umum_tahun_ajaran` (`tahun_ajaran_id`),
  KEY `FK_jurnal_umum_chart_of_accounts` (`coa_id`),
  CONSTRAINT `FK_jurnal_umum_chart_of_accounts` FOREIGN KEY (`coa_id`) REFERENCES `chart_of_accounts` (`id`),
  CONSTRAINT `FK_jurnal_umum_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `FK_jurnal_umum_tahun_ajaran` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.jurnal_umum: ~75 rows (approximately)
INSERT INTO `jurnal_umum` (`id`, `school_id`, `tahun_ajaran_id`, `coa_id`, `type`, `nominal`, `ket`, `no_ref`, `status`, `created_by`, `approved_by`, `reason_canceled`, `is_cash_flow`, `created_at`, `updated_at`) VALUES
	(83, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030AW926A', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:26:35', '2025-10-30 11:26:35'),
	(84, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030JM3ITG', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:26:35', '2025-10-30 11:26:35'),
	(85, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN2025103002YOIL', '2', 'dewi123', 'Generate by system', 'ssss (3/dewi123)', 0, '2025-10-30 11:26:35', '2025-10-30 14:21:01'),
	(86, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030KAZ3AB', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:26:35', '2025-10-30 11:26:35'),
	(87, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030GV82TD', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:26:36', '2025-10-30 11:26:36'),
	(88, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030PPWWM6', '2', 'dewi123', 'Generate by system', 'test (6/dewi123)', 0, '2025-10-30 11:26:36', '2025-10-30 11:27:03'),
	(89, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251030UJ639Q', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:27:25', '2025-10-30 11:27:25'),
	(90, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 12000, 'Uang Pangkal Kelas X', 'INVBB20251030QD1BIL', '2', 'dewi123', 'Generate by system', 'sdsf (2/dewi123)', 0, '2025-10-30 11:28:38', '2025-10-30 11:29:35'),
	(91, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 10000, 'Uang Pangkal Kelas X', 'INVBB20251030YQL4VW', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:30:16', '2025-10-30 11:30:16'),
	(92, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 22400, 'Uang Pangkal Kelas X', 'INVBB20251030KYC7AW', '1', 'dewi123', 'Generate by system', NULL, 0, '2025-10-30 11:30:42', '2025-10-30 11:30:42'),
	(93, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 50000, 'Dana Bayar', 'Ref469567867', '2', 'dewi123', NULL, 'test', 1, '2025-10-30 11:40:32', '2025-10-30 11:47:22'),
	(94, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'pengeluaran', 30000, 'test', 'RF3453535', '1', 'dewi123', 'dewi123', NULL, 1, '2025-10-30 13:47:37', '2025-10-30 13:47:49'),
	(95, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 150000, 'SPP Kelas X', 'INVBLN20251031VDH432', '1', 'adminmailcom', 'Generate by system', NULL, 0, '2025-10-31 04:13:17', '2025-10-31 04:13:17'),
	(96, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 200000, 'SPP Kelas X', 'INVBLN20251031Z2L5PJ', '1', 'adminmailcom', 'Generate by system', NULL, 0, '2025-10-31 04:15:30', '2025-10-31 04:15:30'),
	(97, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 2, NULL, 'penerimaan', 0, 'SPP 2027', 'INVBLN20251031UW7LOU', '1', 'adminmailcom', 'Generate by system', NULL, 0, '2025-10-31 04:25:33', '2025-10-31 04:25:33'),
	(98, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 12000, 'test', '3463', '1', 'Super Admin', 'Super Admin', NULL, 1, '2025-11-04 15:28:59', '2025-11-04 15:30:20'),
	(99, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'pengeluaran', 1114401, 'fhfght', 'fgr', '1', 'Super Admin', 'Super Admin', NULL, 1, '2025-11-04 15:29:47', '2025-11-04 15:30:53'),
	(100, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, NULL, 'penerimaan', 4000, 'Uang Pangkal Kelas X', 'INVBB202511115J9XD0', '1', 'Super Admin', 'Generate by system', NULL, 0, '2025-11-11 09:10:26', '2025-11-11 09:10:26'),
	(101, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120X41HQ4', '2', 'azka', 'Generate by system', 'testing (31/azka)', 0, '2025-11-20 04:59:29', '2025-11-20 06:02:09'),
	(102, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120X41HQ4', '2', 'azka', 'Generate by system', NULL, 0, '2025-11-20 04:59:29', '2025-11-20 04:59:29'),
	(103, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120Y0PXCW', '2', 'azka', 'Generate by system', 'csdsdf (31/azka)', 0, '2025-11-20 06:23:11', '2025-11-20 06:23:27'),
	(104, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120Y0PXCW', '2', 'azka', 'Generate by system', 'csdsdf (31/azka)', 0, '2025-11-20 06:23:11', '2025-11-20 06:23:27'),
	(105, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120GTH04Y', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(106, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120GTH04Y', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(107, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN202511200RAM33', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(108, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN202511200RAM33', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(109, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120U125N9', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(110, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120U125N9', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(111, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120BZXYHY', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(112, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120BZXYHY', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(113, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120BYR1RE', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(114, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120BYR1RE', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(115, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120YQG5PG', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(116, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120YQG5PG', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(117, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120A0A3AW', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(118, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120A0A3AW', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(119, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120N160DO', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(120, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120N160DO', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(121, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120LWZDHE', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(122, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120LWZDHE', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(123, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN202511208GZM80', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(124, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN202511208GZM80', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(125, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120Y8NJ4A', '2', 'azka', 'Generate by system', 's (41/azka)', 0, '2025-11-20 06:23:53', '2025-11-20 06:25:32'),
	(126, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120Y8NJ4A', '2', 'azka', 'Generate by system', 's (41/azka)', 0, '2025-11-20 06:23:53', '2025-11-20 06:25:32'),
	(127, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120ZPGO94', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(128, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120ZPGO94', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:23:53', '2025-11-20 06:23:53'),
	(129, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'penerimaan', 250000, 'SPP MA 2025', 'INVBLN20251120329LLA', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:29:30', '2025-11-20 06:29:30'),
	(130, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 11, 'pengeluaran', 250000, 'SPP MA 2025', 'INVBLN20251120329LLA', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:29:30', '2025-11-20 06:29:30'),
	(131, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 22, 'penerimaan', 50000, 'pendapatan dari uang gedung', 'INVBB202511207301KZ', '2', 'azka', 'Generate by system', 's (6/azka)', 0, '2025-11-20 06:44:28', '2025-11-20 06:45:00'),
	(132, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 23, 'pengeluaran', 50000, 'pendapatan dari uang gedung', 'INVBB202511207301KZ', '2', 'azka', 'Generate by system', 's (6/azka)', 0, '2025-11-20 06:44:28', '2025-11-20 06:45:00'),
	(133, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 22, 'penerimaan', 350000, 'pendapatan dari uang gedung', 'INVBB20251120ZS9J79', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:45:29', '2025-11-20 06:45:29'),
	(134, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 23, 'pengeluaran', 350000, 'pendapatan dari uang gedung', 'INVBB20251120ZS9J79', '1', 'azka', 'Generate by system', NULL, 0, '2025-11-20 06:45:29', '2025-11-20 06:45:29'),
	(135, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 16, 'penerimaan', 5000000, 'Pembelian perlengkapan', '3546546546', '2', 'azka', 'azka', 'test', 1, '2025-11-20 11:59:45', '2025-11-20 12:13:38'),
	(136, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 2, 'pengeluaran', 1500000, 'bayar dp', '3546546546', '2', 'azka', 'azka', 'test', 1, '2025-11-20 11:59:45', '2025-11-20 12:13:38'),
	(137, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 6, 'pengeluaran', 3500000, 'sisa utang', '3546546546', '2', 'azka', 'azka', 'test', 1, '2025-11-20 11:59:45', '2025-11-20 12:13:38'),
	(138, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 2, 'penerimaan', 10000, 'testing', '3546546546', '2', 'azka', 'azka', 'test', 1, '2025-11-20 12:13:06', '2025-11-20 12:13:38'),
	(139, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 4, 'pengeluaran', 10000, 'test', '3546546546', '2', 'azka', 'azka', 'test', 1, '2025-11-20 12:13:06', '2025-11-20 12:13:38'),
	(140, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 3, 'penerimaan', 120000, 'test', '3546546546', '1', 'azka', 'azka', NULL, 1, '2025-11-20 12:14:41', '2025-11-20 12:14:55'),
	(141, 'a204f79d-3bec-420b-985b-dc656f688a8d', 3, 16, 'pengeluaran', 120000, 'eee', '3546546546', '1', 'azka', 'azka', NULL, 1, '2025-11-20 12:14:41', '2025-11-20 12:14:55'),
	(142, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'penerimaan', 50000000, 'modal awal dari pak andi', 'REFJU-20251121PUDGJB', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:48:42', '2025-11-21 08:48:56'),
	(143, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 29, 'pengeluaran', 50000000, 'modal dari pak andi', 'REFJU-20251121PUDGJB', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:48:42', '2025-11-21 08:48:56'),
	(144, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 34, 'penerimaan', 24000000, 'test', 'REFJU-20251121LBVJIA', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:54:37', '2025-11-21 08:54:44'),
	(145, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'pengeluaran', 24000000, 'keluar kas buat sewa', 'REFJU-20251121LBVJIA', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:54:37', '2025-11-21 08:54:44'),
	(146, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 35, 'penerimaan', 1500000, 'pembelian perlengkapan kantor', 'REFJU-20251121JQG3F6', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:56:50', '2025-11-21 08:56:57'),
	(147, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'pengeluaran', 1500000, 'pembelian perlengkapan kantor', 'REFJU-20251121JQG3F6', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 08:56:50', '2025-11-21 08:56:57'),
	(148, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'penerimaan', 5000000, 'SPP 2025/2026', 'INVBLN202511215YJVHK', '1', 'buanayopmailcom', 'Generate by system', NULL, 0, '2025-11-21 09:02:28', '2025-11-21 09:02:28'),
	(149, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 31, 'pengeluaran', 5000000, 'SPP 2025/2026', 'INVBLN202511215YJVHK', '1', 'buanayopmailcom', 'Generate by system', NULL, 0, '2025-11-21 09:02:28', '2025-11-21 09:02:28'),
	(150, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 33, 'penerimaan', 15000000, 'penggajian guru bulan januari', 'REFJU-202511211OYM5V', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 09:04:42', '2025-11-21 09:13:11'),
	(151, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'pengeluaran', 15000000, 'penggajian guru bulan januari', 'REFJU-202511211OYM5V', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 09:04:42', '2025-11-21 09:13:11'),
	(152, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'penerimaan', 2500000, 'SPP 2025/2026', 'INVBLN20251121LKOTRM', '1', 'buanayopmailcom', 'Generate by system', NULL, 0, '2025-11-21 09:06:26', '2025-11-21 09:06:26'),
	(153, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 31, 'pengeluaran', 2500000, 'SPP 2025/2026', 'INVBLN20251121LKOTRM', '1', 'buanayopmailcom', 'Generate by system', NULL, 0, '2025-11-21 09:06:26', '2025-11-21 09:06:26'),
	(154, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 36, 'penerimaan', 10000000, 'test', 'REFJU-20251121BPROD3', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 09:15:44', '2025-11-21 09:15:51'),
	(155, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 27, 'pengeluaran', 10000000, 'test', 'REFJU-20251121BPROD3', '1', 'buanayopmailcom', 'buanayopmailcom', NULL, 1, '2025-11-21 09:15:44', '2025-11-21 09:15:51'),
	(156, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 27, 'penerimaan', 10000000, 'bayar utang sekolah', 'REFJU-20251122ZRP3EA', '1', 'Super Admin', 'Super Admin', NULL, 1, '2025-11-21 18:20:00', '2025-11-21 18:20:05'),
	(157, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 4, 25, 'pengeluaran', 10000000, 'test', 'REFJU-20251122ZRP3EA', '1', 'Super Admin', 'Super Admin', NULL, 1, '2025-11-21 18:20:00', '2025-11-21 18:20:05');

-- Dumping structure for table siap.kelas_siswa
CREATE TABLE IF NOT EXISTS `kelas_siswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_kelas_siswa_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.kelas_siswa: ~8 rows (approximately)
INSERT INTO `kelas_siswa` (`id`, `school_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'VI A', '-', '2025-10-29 04:52:30', '2025-10-29 04:52:30', NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'VI', 'enam a', '2025-10-29 04:52:46', '2025-10-29 04:52:53', '2025-10-29 04:52:53'),
	(3, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'VI', 'enam a', '2025-10-29 04:52:46', '2025-10-29 04:52:51', '2025-10-29 04:52:51'),
	(4, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'VI B', '-', '2025-10-29 04:53:43', '2025-10-29 04:53:43', NULL),
	(5, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'VII A', '7A', '2025-10-30 18:08:05', '2025-10-30 18:08:05', NULL),
	(6, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Kelas Abdurrahman WahidKelas Abdurrahman Wahid', 'tets', '2025-11-01 03:44:32', '2025-11-01 03:44:32', NULL),
	(7, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'X A', 'Kelas X A', '2025-11-20 04:33:45', '2025-11-20 04:33:45', NULL),
	(8, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 'X A', 'sepuluh a', '2025-11-21 08:44:37', '2025-11-21 08:44:37', NULL);

-- Dumping structure for table siap.kwitansi
CREATE TABLE IF NOT EXISTS `kwitansi` (
  `id_kwitansi` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `tgl_cetak` date NOT NULL,
  PRIMARY KEY (`id_kwitansi`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.kwitansi: 0 rows
/*!40000 ALTER TABLE `kwitansi` DISABLE KEYS */;
/*!40000 ALTER TABLE `kwitansi` ENABLE KEYS */;

-- Dumping structure for table siap.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.migrations: ~10 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2023_11_19_091456_create_dashboard_banner_table', 2),
	(5, '2023_11_20_161952_create_showcase_table', 3),
	(6, '2023_11_23_152236_create_products_table', 4),
	(7, '2023_11_23_163809_create_sub_products_table', 4),
	(8, '2023_11_23_164155_create_content_products_table', 4),
	(9, '2023_11_23_165549_create_specification_products_table', 4),
	(10, '2023_12_01_153927_create_support_table', 5);

-- Dumping structure for table siap.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.password_resets: ~0 rows (approximately)

-- Dumping structure for table siap.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.permissions: ~26 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	('00159664-c2b1-460c-a75f-5371c5267fa8', 'laporanrekappengeluaran', '-', '2025-10-29 03:55:55', '2025-10-29 03:55:55'),
	('01072ea2-3b37-4120-8cfc-4df7a9265be5', 'inventorycategory', '-', '2025-11-06 16:19:52', '2025-11-06 16:19:52'),
	('170d9cd6-8c38-4544-a84f-4005215d17e2', 'keuanganjenisbayar', '-', '2025-10-29 03:51:51', '2025-10-29 03:57:22'),
	('1e03bce9-3f2c-46c4-bccb-4c2d2747c1ea', 'tabunganlaporan', '-', '2025-10-29 03:53:51', '2025-10-29 03:53:51'),
	('2324def2-6c1e-44c5-8823-895494942ae7', 'tahunajaran', '-', '2025-10-28 16:57:45', '2025-10-28 16:57:45'),
	('2d656bcd-0857-48c7-9fc1-328866443060', 'keuangantagihansiswa', '-', '2025-10-29 03:52:01', '2025-10-29 03:57:29'),
	('30ecfaba-5cd7-45e4-a340-19775a31f98a', 'laporanpembayaransiswa', '-', '2025-10-29 03:54:29', '2025-10-29 03:54:29'),
	('33cdacde-a896-45ac-a7fe-b617033a5687', 'keuanganjurnalumum', '-', '2025-10-29 03:52:14', '2025-10-29 03:57:35'),
	('3654e4e0-3f27-48d4-9065-6645a22f9f3c', 'piutang', '-', '2025-10-29 03:54:18', '2025-10-29 03:54:18'),
	('37da01da-2780-4f1b-b1b7-8742b9e2f4b6', 'laporantagihan', '-', '2025-10-29 03:55:23', '2025-10-29 03:55:23'),
	('498cefb1-fd1d-4c6e-bbed-17f398a38290', 'kelas', '-', '2025-10-29 03:46:57', '2025-10-29 03:46:57'),
	('49ec2979-8838-4761-9512-3baa0bf85374', 'laporankondisikeuangan', '-', '2025-10-29 03:56:07', '2025-10-29 03:56:07'),
	('507ffec1-cbb5-4f1e-b0cf-8bdf192cddc6', 'kelulusan', '-', '2025-10-29 03:47:38', '2025-10-29 03:47:38'),
	('53efa8ae-340b-492a-895c-e916aa52bacf', 'laporanpembayaranperpos', '-', '2025-10-29 03:54:42', '2025-10-29 03:55:04'),
	('567d6aed-35ec-46c3-992c-c797ada4040c', 'keuanganposbayar', '-', '2025-10-29 03:51:37', '2025-10-29 03:57:16'),
	('6db66087-992e-4a6a-9a4e-9cc43eab8f8b', 'tabungantransaksi', '-', '2025-10-29 03:53:37', '2025-10-29 03:53:37'),
	('88f768ad-e98f-4b39-b905-a345555e2008', 'tabungannasabah', '-', '2025-10-29 03:52:30', '2025-10-29 03:52:30'),
	('a39a3bc5-1f56-4a2c-9da9-a613ec31eb28', 'naikpindahkelas', '-', '2025-10-29 03:47:25', '2025-10-29 03:47:25'),
	('a85d6394-0afc-4dc5-8efa-cef04f88c16b', 'keuanganaruskas', '-', '2025-10-29 03:52:13', '2025-10-29 04:07:11'),
	('ad8657d0-c27b-47d6-a708-426a288f78f2', 'laporanrekappembayaran', '-', '2025-10-29 03:55:38', '2025-10-29 03:55:38'),
	('b4820200-b056-4a64-82d5-79ce1807da9b', 'keuangancoa', '-', '2025-11-22 08:49:19', '2025-11-22 08:49:19'),
	('d28b3716-99db-4b5c-a560-e6ad1b60b14f', 'inventorytransaction', '-', '2025-11-06 16:20:25', '2025-11-06 16:20:25'),
	('e603528e-938c-4103-bf45-a20ee8a05b94', 'siswa', '-', '2025-10-29 03:47:13', '2025-10-29 03:47:13'),
	('e8e54f5e-e9a8-4597-be33-1a9647efb916', 'inventorylocation', '-', '2025-11-06 16:20:02', '2025-11-06 16:20:02'),
	('ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport', '-', '2025-11-11 15:12:36', '2025-11-11 15:12:36'),
	('ed9d543b-4f30-4c87-a380-9ba07c5bbe5d', 'inventoryproduct', '-', '2025-11-06 16:20:13', '2025-11-06 16:20:13');

-- Dumping structure for table siap.piutang
CREATE TABLE IF NOT EXISTS `piutang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kreditor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `debitur` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `ket` varchar(100) NOT NULL,
  `nominal` double NOT NULL DEFAULT (0),
  `sisa` double NOT NULL DEFAULT (0),
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_piutang_schools` (`school_id`),
  CONSTRAINT `FK_piutang_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table siap.piutang: ~2 rows (approximately)
INSERT INTO `piutang` (`id`, `school_id`, `kreditor`, `debitur`, `tanggal`, `ket`, `nominal`, `sisa`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Sandy Store HP', 'Hari Sanja S.pd', '2025-10-30', 'cashbon untuk pembayaran kredit handphone', 1500000, 500000, 'dewi123', '2025-10-30 11:53:51', '2025-10-30 11:58:53', NULL),
	(2, '681fb72b-652e-4f3f-8fec-e688846bf6df', 'Non corrupti ut sin', 'Ad vel sunt ratione', '1977-11-11', 'Exercitation obcaeca', 9000, 9000, 'jayayopmaildotcom', '2025-11-22 07:47:18', '2025-11-22 07:47:36', '2025-11-22 07:47:36');

-- Dumping structure for table siap.pos_bayar
CREATE TABLE IF NOT EXISTS `pos_bayar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coa_id` int NOT NULL,
  `coa_piutang_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pos_bayar_schools` (`school_id`),
  KEY `FK_pos_bayar_chart_of_accounts_2` (`coa_piutang_id`),
  KEY `FK_pos_bayar_chart_of_accounts` (`coa_id`),
  CONSTRAINT `FK_pos_bayar_chart_of_accounts` FOREIGN KEY (`coa_id`) REFERENCES `chart_of_accounts` (`id`),
  CONSTRAINT `FK_pos_bayar_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.pos_bayar: ~5 rows (approximately)
INSERT INTO `pos_bayar` (`id`, `school_id`, `coa_id`, `coa_piutang_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 1, 'SPP', 'SPP Semua Kelas', '2025-10-30 10:36:24', '2025-10-30 10:36:24', NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 1, 1, 'Uang Pangkal', 'Uang Pangkal Semua Kelas', '2025-10-30 10:38:00', '2025-10-30 10:38:00', NULL),
	(3, 'a204f79d-3bec-420b-985b-dc656f688a8d', 11, 4, 'SPP 2025', 'spp 2025', '2025-11-20 04:27:54', '2025-11-20 04:27:54', NULL),
	(4, 'a204f79d-3bec-420b-985b-dc656f688a8d', 23, 22, 'Uang Gedung', '-', '2025-11-20 06:31:55', '2025-11-21 02:54:03', NULL),
	(5, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 31, 25, 'Pembayaran SPP 2025/2026', 'pembayaran spp tahun 2025/2026', '2025-11-21 09:00:23', '2025-11-21 09:00:23', NULL);

-- Dumping structure for table siap.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.roles: ~2 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	('1471e795-261e-4792-b302-94dcc859764d', 'Bendahara', 1, '2025-10-28 16:58:00', '2025-10-28 16:58:00'),
	('f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'Administrasi', 1, '2025-10-29 04:21:49', '2025-10-29 04:21:49');

-- Dumping structure for table siap.roles_permissions
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permissions_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.roles_permissions: ~81 rows (approximately)
INSERT INTO `roles_permissions` (`id`, `role_id`, `permission_id`, `name`, `created_at`, `updated_at`) VALUES
	('03878188-40c2-4a4c-8c62-cea2ebfffbef', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ed9d543b-4f30-4c87-a380-9ba07c5bbe5d', 'inventoryproduct:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('03b16899-bfaf-461a-a7fc-4a0344211ae1', '1471e795-261e-4792-b302-94dcc859764d', '33cdacde-a896-45ac-a7fe-b617033a5687', 'keuanganjurnalumum:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('04b52316-03fd-4f60-a1f2-3a1ec74f135e', '1471e795-261e-4792-b302-94dcc859764d', '170d9cd6-8c38-4544-a84f-4005215d17e2', 'keuanganjenisbayar:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('09ab1052-4943-4b2c-8bb7-d1a77f9dbfec', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e603528e-938c-4103-bf45-a20ee8a05b94', 'siswa:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('0f54da76-91f9-431a-b291-409b319077aa', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '2324def2-6c1e-44c5-8823-895494942ae7', 'tahunajaran:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('1015afb9-29f7-42bf-ab7b-0e017b7a591a', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '2324def2-6c1e-44c5-8823-895494942ae7', 'tahunajaran:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('113ce052-8ec1-42bf-98b5-65bb2b27954d', '1471e795-261e-4792-b302-94dcc859764d', '1e03bce9-3f2c-46c4-bccb-4c2d2747c1ea', 'tabunganlaporan:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('13feaf1c-c728-46ce-8415-ca6f7a5002d8', '1471e795-261e-4792-b302-94dcc859764d', '88f768ad-e98f-4b39-b905-a345555e2008', 'tabungannasabah:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('17945767-ef87-4758-a97d-c945407283fd', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '2324def2-6c1e-44c5-8823-895494942ae7', 'tahunajaran:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('1950c0e9-fd80-49d6-95a6-7a2872cb4718', '1471e795-261e-4792-b302-94dcc859764d', '567d6aed-35ec-46c3-992c-c797ada4040c', 'keuanganposbayar:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('1f3c930e-4a0e-475f-800a-6cd313539db6', '1471e795-261e-4792-b302-94dcc859764d', '567d6aed-35ec-46c3-992c-c797ada4040c', 'keuanganposbayar:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('235ccec7-c1bf-46ba-86d0-ee7e9dbcf810', '1471e795-261e-4792-b302-94dcc859764d', 'ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('25dd823f-59f8-4072-923a-33c4ecbc3e2c', '1471e795-261e-4792-b302-94dcc859764d', '2d656bcd-0857-48c7-9fc1-328866443060', 'keuangantagihansiswa:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('2cc5d072-9c23-4897-9064-69cae9659397', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '498cefb1-fd1d-4c6e-bbed-17f398a38290', 'kelas:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('31286d5c-726f-45a7-a85b-abe988a43a47', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ed9d543b-4f30-4c87-a380-9ba07c5bbe5d', 'inventoryproduct:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('3273efb7-bfd2-483b-ad0f-164505d5d622', '1471e795-261e-4792-b302-94dcc859764d', '1e03bce9-3f2c-46c4-bccb-4c2d2747c1ea', 'tabunganlaporan:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('34f6bf0d-2662-4a31-8425-39dd102b03a8', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e8e54f5e-e9a8-4597-be33-1a9647efb916', 'inventorylocation:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('397f9ee2-582e-4b2f-bb82-009404e79132', '1471e795-261e-4792-b302-94dcc859764d', '33cdacde-a896-45ac-a7fe-b617033a5687', 'keuanganjurnalumum:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('3c1236fa-74ea-44fa-a45b-48fcde4c724b', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e603528e-938c-4103-bf45-a20ee8a05b94', 'siswa:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('3d759eda-3e39-47ce-9fcc-358fbe0fc533', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '01072ea2-3b37-4120-8cfc-4df7a9265be5', 'inventorycategory:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('3f6276cc-0749-4150-8e41-6ab70edafd8b', '1471e795-261e-4792-b302-94dcc859764d', '6db66087-992e-4a6a-9a4e-9cc43eab8f8b', 'tabungantransaksi:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('41985a0a-1b3e-4bca-803c-f2e5de203b3d', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '01072ea2-3b37-4120-8cfc-4df7a9265be5', 'inventorycategory:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('42aeec7e-1f5d-474d-b5a9-91a6285f975d', '1471e795-261e-4792-b302-94dcc859764d', '1e03bce9-3f2c-46c4-bccb-4c2d2747c1ea', 'tabunganlaporan:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('48f74401-9e0c-400f-a369-26014ca168d1', '1471e795-261e-4792-b302-94dcc859764d', '170d9cd6-8c38-4544-a84f-4005215d17e2', 'keuanganjenisbayar:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('51c0edfc-3036-4df5-89ec-8405a13ab1f3', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'a39a3bc5-1f56-4a2c-9da9-a613ec31eb28', 'naikpindahkelas:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('53f3ed5c-eb0c-4d84-9c87-16ae2e183fe4', '1471e795-261e-4792-b302-94dcc859764d', '3654e4e0-3f27-48d4-9065-6645a22f9f3c', 'piutang:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('54a87ce9-6140-412e-b2cb-b6005088691e', '1471e795-261e-4792-b302-94dcc859764d', 'a85d6394-0afc-4dc5-8efa-cef04f88c16b', 'keuanganaruskas:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('586b2c75-0ba5-4e8c-8cdf-0f08a1eba738', '1471e795-261e-4792-b302-94dcc859764d', '2d656bcd-0857-48c7-9fc1-328866443060', 'keuangantagihansiswa:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('60208cfb-0f6a-4e0d-9f5e-d5e81833c938', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('60e33d84-52a4-4033-be4e-9ae89a2f9576', '1471e795-261e-4792-b302-94dcc859764d', '170d9cd6-8c38-4544-a84f-4005215d17e2', 'keuanganjenisbayar:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('61e53690-6b44-41ca-b3d5-5f2315cdecc7', '1471e795-261e-4792-b302-94dcc859764d', '88f768ad-e98f-4b39-b905-a345555e2008', 'tabungannasabah:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('648f6945-f01d-49d4-9201-66bf89f69472', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e603528e-938c-4103-bf45-a20ee8a05b94', 'siswa:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('69342899-10dc-471e-beab-1c1bc352a581', '1471e795-261e-4792-b302-94dcc859764d', '30ecfaba-5cd7-45e4-a340-19775a31f98a', 'laporanpembayaransiswa:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('6a30c3f6-1cb7-41d4-b7c0-918f13cc4b72', '1471e795-261e-4792-b302-94dcc859764d', '6db66087-992e-4a6a-9a4e-9cc43eab8f8b', 'tabungantransaksi:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('6b54ebd3-6409-414b-8b8b-b432852000a6', '1471e795-261e-4792-b302-94dcc859764d', '170d9cd6-8c38-4544-a84f-4005215d17e2', 'keuanganjenisbayar:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('6db902df-acda-4927-a738-63f8741478de', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('6ec1eeb7-c08a-4f1b-b413-9dae82861ae3', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '2324def2-6c1e-44c5-8823-895494942ae7', 'tahunajaran:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('70f67173-8b7b-4199-b8b7-578fbf220442', '1471e795-261e-4792-b302-94dcc859764d', '37da01da-2780-4f1b-b1b7-8742b9e2f4b6', 'laporantagihan:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('761f1a71-f4e4-4f20-a272-87fed0e0fcd3', '1471e795-261e-4792-b302-94dcc859764d', '2d656bcd-0857-48c7-9fc1-328866443060', 'keuangantagihansiswa:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('7635b0a5-c470-4dc3-8c6c-9cfd6790339b', '1471e795-261e-4792-b302-94dcc859764d', '1e03bce9-3f2c-46c4-bccb-4c2d2747c1ea', 'tabunganlaporan:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('7cd0a180-e611-41a7-9177-c0f949bf53df', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '507ffec1-cbb5-4f1e-b0cf-8bdf192cddc6', 'kelulusan:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('7d11e759-7d00-4a7a-baef-92cd6df8d0cf', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'd28b3716-99db-4b5c-a560-e6ad1b60b14f', 'inventorytransaction:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('7f28a640-ebb5-4e77-ac0c-957df8fb4ae1', '1471e795-261e-4792-b302-94dcc859764d', 'b4820200-b056-4a64-82d5-79ce1807da9b', 'keuangancoa:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('805b96de-5c19-4d9a-9d98-749080f77e17', '1471e795-261e-4792-b302-94dcc859764d', '6db66087-992e-4a6a-9a4e-9cc43eab8f8b', 'tabungantransaksi:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('876c5eca-851d-4562-b9b1-d08bc58b13f9', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e603528e-938c-4103-bf45-a20ee8a05b94', 'siswa:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('905b9569-fc99-4b13-8f85-9a56482fd15d', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('9cc3e105-6aee-436b-92c7-924215cd2451', '1471e795-261e-4792-b302-94dcc859764d', '567d6aed-35ec-46c3-992c-c797ada4040c', 'keuanganposbayar:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('9d913841-8b27-471f-becf-e6eaa7ca7274', '1471e795-261e-4792-b302-94dcc859764d', '3654e4e0-3f27-48d4-9065-6645a22f9f3c', 'piutang:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('9f03310c-2ec1-497d-a0d6-379c617ace8e', '1471e795-261e-4792-b302-94dcc859764d', '2d656bcd-0857-48c7-9fc1-328866443060', 'keuangantagihansiswa:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('aa0b3f31-4068-43b1-ab14-95c046aee957', '1471e795-261e-4792-b302-94dcc859764d', '53efa8ae-340b-492a-895c-e916aa52bacf', 'laporanpembayaranperpos:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('ae8fa3b2-f29c-4401-9a43-a1a040be60fb', '1471e795-261e-4792-b302-94dcc859764d', 'a85d6394-0afc-4dc5-8efa-cef04f88c16b', 'keuanganaruskas:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('b1a87431-36c6-4dc3-9171-c1ce2244dfc5', '1471e795-261e-4792-b302-94dcc859764d', 'b4820200-b056-4a64-82d5-79ce1807da9b', 'keuangancoa:create', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('b36345ce-bf7d-4988-82a3-d58f81b31fc6', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ecfe6f51-dc2f-41ab-b1a1-a874e2317e02', 'inventoryreport:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('b5ec3be5-07fa-443c-9d14-15796d4decab', '1471e795-261e-4792-b302-94dcc859764d', '567d6aed-35ec-46c3-992c-c797ada4040c', 'keuanganposbayar:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('bef5c894-3671-4a29-989b-4fa38abb1b4a', '1471e795-261e-4792-b302-94dcc859764d', 'ad8657d0-c27b-47d6-a708-426a288f78f2', 'laporanrekappembayaran:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('c1aea07e-fabd-468b-9701-2ed8cb64a418', '1471e795-261e-4792-b302-94dcc859764d', '88f768ad-e98f-4b39-b905-a345555e2008', 'tabungannasabah:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('c50478b8-baa1-459e-ac79-60f75c7bffe1', '1471e795-261e-4792-b302-94dcc859764d', '33cdacde-a896-45ac-a7fe-b617033a5687', 'keuanganjurnalumum:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('c685464f-5b04-49ca-a305-035b1abc7957', '1471e795-261e-4792-b302-94dcc859764d', '33cdacde-a896-45ac-a7fe-b617033a5687', 'keuanganjurnalumum:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('cb2990ae-ad7c-4acb-8bbf-59420168335d', '1471e795-261e-4792-b302-94dcc859764d', '3654e4e0-3f27-48d4-9065-6645a22f9f3c', 'piutang:create', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('cece8378-9d4b-4024-831c-b258ee4549f5', '1471e795-261e-4792-b302-94dcc859764d', '88f768ad-e98f-4b39-b905-a345555e2008', 'tabungannasabah:update', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('cf41ed21-ed4d-467c-8fcf-d812461e5503', '1471e795-261e-4792-b302-94dcc859764d', '6db66087-992e-4a6a-9a4e-9cc43eab8f8b', 'tabungantransaksi:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('cfe6217a-77ef-47a5-aea6-4c6d754571a4', '1471e795-261e-4792-b302-94dcc859764d', '00159664-c2b1-460c-a75f-5371c5267fa8', 'laporanrekappengeluaran:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('cff9795c-98fb-4bbd-a09a-3fa4045f4dc2', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '498cefb1-fd1d-4c6e-bbed-17f398a38290', 'kelas:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('d166d6a5-9aa0-4ff9-ae3d-cba9fa403d3d', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '01072ea2-3b37-4120-8cfc-4df7a9265be5', 'inventorycategory:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('d2e07d72-144f-4d3e-9110-d0615c2a49fc', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'd28b3716-99db-4b5c-a560-e6ad1b60b14f', 'inventorytransaction:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('d86ec5cc-b793-479e-81e5-5c6c9834878d', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '498cefb1-fd1d-4c6e-bbed-17f398a38290', 'kelas:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('de4fb993-947f-4b3b-adef-9df70742e284', '1471e795-261e-4792-b302-94dcc859764d', '3654e4e0-3f27-48d4-9065-6645a22f9f3c', 'piutang:delete', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('dec4b1d4-0fdc-4709-a3aa-fb50b61f9d27', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e8e54f5e-e9a8-4597-be33-1a9647efb916', 'inventorylocation:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('df778466-3138-40a0-8a95-ad4290432e16', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'd28b3716-99db-4b5c-a560-e6ad1b60b14f', 'inventorytransaction:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('df88b4bc-983a-40b2-b29e-84aa5b2c06b3', '1471e795-261e-4792-b302-94dcc859764d', 'b4820200-b056-4a64-82d5-79ce1807da9b', 'keuangancoa:update', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('df9d0094-db05-40bc-89c4-7ae0aff839a1', '1471e795-261e-4792-b302-94dcc859764d', 'a85d6394-0afc-4dc5-8efa-cef04f88c16b', 'keuanganaruskas:delete', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('e0b4dac2-5333-4bb4-865e-a39a6098b9ea', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ed9d543b-4f30-4c87-a380-9ba07c5bbe5d', 'inventoryproduct:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('e1ecf851-5aa3-4815-838a-58080cea2b53', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'ed9d543b-4f30-4c87-a380-9ba07c5bbe5d', 'inventoryproduct:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('e416351d-df9d-4edd-b501-65489c1f0a8d', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e8e54f5e-e9a8-4597-be33-1a9647efb916', 'inventorylocation:update', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('e4b8ea71-c4c5-4196-9fed-4b5331910809', '1471e795-261e-4792-b302-94dcc859764d', '49ec2979-8838-4761-9512-3baa0bf85374', 'laporankondisikeuangan:read', '2025-11-22 08:58:23', '2025-11-22 08:58:23'),
	('e604000b-1963-4834-a46a-f4029491b980', '1471e795-261e-4792-b302-94dcc859764d', 'a85d6394-0afc-4dc5-8efa-cef04f88c16b', 'keuanganaruskas:read', '2025-11-22 08:58:22', '2025-11-22 08:58:22'),
	('e6af5672-076a-4884-acf3-4194a33025cc', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'e8e54f5e-e9a8-4597-be33-1a9647efb916', 'inventorylocation:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('e74a0e24-ade6-4652-a46a-cb57efffa833', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '01072ea2-3b37-4120-8cfc-4df7a9265be5', 'inventorycategory:read', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('e7d51c51-89ae-4313-8fbf-37c9da0bb31c', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'd28b3716-99db-4b5c-a560-e6ad1b60b14f', 'inventorytransaction:create', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('ec188ca5-07df-454b-a381-f348f1cfd1e2', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', '498cefb1-fd1d-4c6e-bbed-17f398a38290', 'kelas:delete', '2025-11-22 08:58:00', '2025-11-22 08:58:00'),
	('f925ae79-e3e2-4567-bef9-cd47717358e0', '1471e795-261e-4792-b302-94dcc859764d', 'b4820200-b056-4a64-82d5-79ce1807da9b', 'keuangancoa:delete', '2025-11-22 08:58:23', '2025-11-22 08:58:23');

-- Dumping structure for table siap.schools
CREATE TABLE IF NOT EXISTS `schools` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `npsn` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_kepsek` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_kepsek` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_katu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_katu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_bendahara` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bendahara` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.schools: ~6 rows (approximately)
INSERT INTO `schools` (`id`, `npsn`, `name`, `district`, `city`, `provincy`, `address`, `phone`, `nip_kepsek`, `name_kepsek`, `nip_katu`, `name_katu`, `nip_bendahara`, `name_bendahara`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('681fb72b-652e-4f3f-8fec-e688846bf6df', '', 'SD Jaya Anugrah', 'Cipete', 'Tangerang Selatan', 'Banten', 'kp cipete 5', '08762344234234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL),
	('a204f79d-3bec-420b-985b-dc656f688a8d', '34534', 'MA ISTIQOMAH', 'gresik', '', 'jawa timur', 'jl paguyuban no 44', '087723435345353', '34534535353', 'Dinta', '6654645646', 'kapso', 'ertertete', 'sakop', NULL, '2025-10-28 16:53:00', '2025-10-28 16:53:00', NULL),
	('b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '385545', 'MTS. AL-HIDAYAH', 'SUKABUMI', '', 'JAWA BARAT', 'JL. SUKA MAKMUR NO. 15', '0877234234', '3454546456456', 'IR. H. AMAR KHOLID', '43324353453', 'SINTA APRILIA', '4335345', 'SRI SUKYANTI', '1762850656images.png', '2025-10-28 11:40:20', '2025-11-11 08:44:16', NULL),
	('c348223e-5e3b-4c89-94e3-c437f82256f5', '', 'Chelsea Pope', 'Marcia Dickson', 'Kyra Charles', 'Forrest Hoffman', 'Grace Foley', '0883434534344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 06:39:43', '2025-11-21 18:42:55', '2025-11-21 18:42:55'),
	('d67948dc-6897-4b4a-8343-6e95f1474026', '', 'Lee Keith', 'Gareth Schmidt', 'Blake Vance', 'Nadine Mcmahon', 'Alexa Mathis', '087832535345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 06:10:40', '2025-11-21 18:43:05', '2025-11-21 18:43:05'),
	('f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '45645644', 'SMA Cerdas Mulia', 'Cugenang', 'Cianjur', 'Jawa Barat', 'Kp. Cihs', '08773453453535', '45645645645', 'cerdasoi', '345345463463', 'koko', '454646464', 'siti', NULL, '2025-11-21 04:00:00', '2025-11-21 08:43:58', NULL);

-- Dumping structure for table siap.schools_of_user
CREATE TABLE IF NOT EXISTS `schools_of_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_schools_of_user_schools` (`school_id`),
  KEY `FK_schools_of_user_users` (`user_id`),
  CONSTRAINT `FK_schools_of_user_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `FK_schools_of_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.schools_of_user: ~11 rows (approximately)
INSERT INTO `schools_of_user` (`id`, `school_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '795a1ed4-8a0f-4d86-a9a4-aae017266d5f', '2025-10-28 11:56:54', '2025-10-28 11:56:54', NULL),
	(3, 'a204f79d-3bec-420b-985b-dc656f688a8d', '7e8954e1-b5a2-47a6-84de-9943b6ff8745', '2025-10-28 17:32:16', '2025-10-28 17:32:16', NULL),
	(4, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'e3ae7f06-c0be-4fa2-8ce5-fabfd248d0da', '2025-10-28 17:33:31', '2025-10-28 17:33:31', NULL),
	(5, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'e72c87ff-a725-4f26-b398-a85296679510', '2025-10-28 17:34:55', '2025-10-28 17:34:55', NULL),
	(6, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '7e8954e1-b5a2-47a6-84de-9943b6ff8745', '2025-10-28 17:41:53', '2025-10-28 17:41:53', NULL),
	(7, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'e3ae7f06-c0be-4fa2-8ce5-fabfd248d0da', '2025-10-28 17:43:17', '2025-10-28 17:43:25', '2025-10-28 17:43:25'),
	(8, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '7fdc252d-466f-49e6-96f7-7821a4e8165c', '2025-10-28 17:46:20', '2025-10-28 17:46:20', NULL),
	(9, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '85155246-947e-4c80-a6b5-a4ce58185fe9', '2025-10-29 04:34:50', '2025-10-29 04:34:51', NULL),
	(10, 'c348223e-5e3b-4c89-94e3-c437f82256f5', '6bce752f-ecb1-4776-836e-f22bba89bcd8', '2025-11-13 06:39:43', '2025-11-13 06:39:43', NULL),
	(12, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '507ba56c-4a85-481f-81ca-52dafde6d511', '2025-11-21 04:00:00', '2025-11-21 04:00:00', NULL),
	(13, '681fb72b-652e-4f3f-8fec-e688846bf6df', 'f2d65cea-6341-4b20-ba84-6a8e4c3d20fb', '2025-11-22 07:11:24', '2025-11-22 07:11:24', NULL);

-- Dumping structure for table siap.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idKelas` int DEFAULT NULL,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `nis` varchar(25) DEFAULT NULL,
  `nisn` varchar(25) DEFAULT NULL,
  `gender` enum('P','L') DEFAULT NULL,
  `religion` varchar(15) DEFAULT NULL,
  `status` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_name` varchar(40) DEFAULT NULL,
  `parent_address` varchar(100) DEFAULT NULL,
  `parent_phone` varchar(20) DEFAULT NULL,
  `wallet_balance` double unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nis` (`nis`),
  UNIQUE KEY `nisn` (`nisn`),
  KEY `fk_kelas` (`idKelas`),
  KEY `fk_status` (`status`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_siswa_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.siswa: ~4 rows (approximately)
INSERT INTO `siswa` (`id`, `idKelas`, `school_id`, `name`, `nis`, `nisn`, `gender`, `religion`, `status`, `username`, `password`, `level`, `parent_name`, `parent_address`, `parent_phone`, `wallet_balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 5, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Linda Cook', 'Ratione iure error u', '4564565464645', 'L', 'Hindu', 'Non-aktif', 'siswa', '$2y$10$JuDEPwqhlIlwW/7yGVzgk.a7FaUChmg97fld2BbqaVdJGxzJD1Bdi', 'Siswa', 'Barrett Meyers', 'Vero commodi velit p', '085469337302', 500000, '2025-10-30 10:31:16', '2025-11-13 06:46:39', NULL),
	(2, 7, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'Salman', '48965868', '48658746456456', 'L', 'Islam', 'Aktif', 'siswa_ma', '$2y$10$d/XbO5ghBKxKhdFdCw/OruUWfFZlxOEO0F2lWp9/WIRY2VFnfh.U6', 'Siswa', 'Jihan', 'kp cagak', '0878345345', 0, '2025-11-20 04:37:25', '2025-11-20 04:37:25', NULL),
	(3, 7, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'Santi amirah', '968785785', '984533243324', 'L', 'Islam', 'Aktif', 'siswi_ma', '$2y$10$04AJsKtcwdodO052kNKDlegNXii5kOGCTiFRLzzcxrZcuJP4ELZGS', 'Siswa', 'siti', 'jl cikunir', '087733453453', 0, '2025-11-20 04:38:29', '2025-11-20 04:38:29', NULL),
	(4, 8, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 'Blossom Graham', 'Odit sunt dignissimo', '6664645645646', 'L', 'Hindu', 'Aktif', '6664645645646', '$2y$10$jm/yYXxdNbC.jZgDDI8qZuHrVr8BKH3cxGsV4m/KtJy4QfuUOU2Dy', 'Siswa', 'Lillith Riley', 'Minus quos corporis', '0879535062', 0, '2025-11-21 08:45:43', '2025-11-21 08:45:43', NULL);

-- Dumping structure for table siap.tagihan_bebas
CREATE TABLE IF NOT EXISTS `tagihan_bebas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis_bayar_id` int DEFAULT NULL,
  `siswa_id` int DEFAULT NULL,
  `kelas_id` int DEFAULT NULL,
  `total_tagihan` double DEFAULT NULL,
  `ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '2 diangsur',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_t_jenis` (`jenis_bayar_id`) USING BTREE,
  KEY `fk_t_siswa` (`siswa_id`) USING BTREE,
  KEY `fk_t_kelas` (`kelas_id`) USING BTREE,
  CONSTRAINT `tagihan_bebas_ibfk_2` FOREIGN KEY (`jenis_bayar_id`) REFERENCES `jenis_bayar` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tagihan_bebas_ibfk_3` FOREIGN KEY (`kelas_id`) REFERENCES `kelas_siswa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tagihan_bebas_ibfk_4` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.tagihan_bebas: ~3 rows (approximately)
INSERT INTO `tagihan_bebas` (`id`, `jenis_bayar_id`, `siswa_id`, `kelas_id`, `total_tagihan`, `ref`, `status_bayar`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 32400, NULL, '1', '2025-10-29 10:44:38', '2025-10-30 11:30:42'),
	(2, 1, 1, 5, 323000, NULL, '2', '2025-11-11 09:07:17', '2025-11-11 09:10:26'),
	(3, 5, 2, 7, 350000, NULL, '1', '2025-11-20 06:33:11', '2025-11-20 06:45:29');

-- Dumping structure for table siap.tagihan_bebas_bayar
CREATE TABLE IF NOT EXISTS `tagihan_bebas_bayar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagihan_bebas_id` int DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `inv` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cara_bayar` enum('Tunai','Transfer') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Tunai',
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `reason_canceled` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fkbayarbebas` (`tagihan_bebas_id`) USING BTREE,
  CONSTRAINT `fkbayarbebas` FOREIGN KEY (`tagihan_bebas_id`) REFERENCES `tagihan_bebas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.tagihan_bebas_bayar: ~7 rows (approximately)
INSERT INTO `tagihan_bebas_bayar` (`id`, `tagihan_bebas_id`, `tgl_bayar`, `total_bayar`, `inv`, `keterangan`, `cara_bayar`, `status`, `reason_canceled`, `created_at`, `updated_at`) VALUES
	(1, 1, '2025-10-31', 10000, 'INVBB20251030K40MOW', 'Angsuran ke-1', 'Tunai', '0', 'dcsdvs', '2025-10-30 11:15:58', '2025-10-30 11:16:28'),
	(2, 1, '2025-10-29', 12000, 'INVBB20251030QD1BIL', 'Angsuran ke-2', 'Tunai', '0', 'sdsf', '2025-10-30 11:28:38', '2025-10-30 11:29:35'),
	(3, 1, '2025-10-29', 10000, 'INVBB20251030YQL4VW', 'Angsuran ke-3', 'Tunai', '1', NULL, '2025-10-29 11:30:16', '2025-10-30 11:30:16'),
	(4, 1, '2025-10-30', 22400, 'INVBB20251030KYC7AW', 'Lunas', 'Tunai', '1', NULL, '2025-10-30 11:30:42', '2025-10-30 11:30:42'),
	(5, 2, '2025-11-11', 4000, 'INVBB202511115J9XD0', 'Angsuran ke-1', 'Tunai', '1', NULL, '2025-11-11 09:10:26', '2025-11-11 09:10:26'),
	(6, 3, '2025-11-20', 50000, 'INVBB202511207301KZ', 'Angsuran ke-1', 'Tunai', '0', 's', '2025-11-20 06:44:28', '2025-11-20 06:45:00'),
	(7, 3, '2025-11-20', 350000, 'INVBB20251120ZS9J79', 'Lunas', 'Tunai', '1', NULL, '2025-11-20 06:45:29', '2025-11-20 06:45:29');

-- Dumping structure for table siap.tagihan_bulanan
CREATE TABLE IF NOT EXISTS `tagihan_bulanan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis_bayar_id` int DEFAULT NULL,
  `siswa_id` int DEFAULT NULL,
  `kelas_id` int DEFAULT NULL,
  `bulan_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_bayar` int DEFAULT NULL,
  `tgl_bayar` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `inv` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '2 dibatalkan',
  `cara_bayar` enum('Tunai','Transfer') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Tunai',
  `keterangan` varchar(100) DEFAULT NULL,
  `reason_canceled` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_t_jenis` (`jenis_bayar_id`) USING BTREE,
  KEY `fk_t_siswa` (`siswa_id`) USING BTREE,
  KEY `fk_t_kelas` (`kelas_id`) USING BTREE,
  KEY `fk_t_bulan` (`bulan_id`) USING BTREE,
  CONSTRAINT `fk_t_bulan` FOREIGN KEY (`bulan_id`) REFERENCES `bulan` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_t_jenis` FOREIGN KEY (`jenis_bayar_id`) REFERENCES `jenis_bayar` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_t_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas_siswa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_t_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.tagihan_bulanan: ~66 rows (approximately)
INSERT INTO `tagihan_bulanan` (`id`, `jenis_bayar_id`, `siswa_id`, `kelas_id`, `bulan_id`, `jumlah_bayar`, `tgl_bayar`, `inv`, `status_bayar`, `cara_bayar`, `keterangan`, `reason_canceled`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 1, '1', 150000, '2025-10-30 00:00:00', 'INVBLN20251030AW926A', '1', 'Tunai', 'pembayaran bulky', 'test batal (INVBLN202510305ZJA34)', '2025-10-30 10:46:25', '2025-10-30 11:26:35'),
	(2, 2, 1, 1, '2', 150000, '2025-10-29 21:13:14', 'INVBLN20251030JM3ITG', '1', 'Tunai', 'pembayaran bulky', 'test (INVBLN20251030ZEP21V)', '2025-10-29 10:46:25', '2025-10-30 11:26:35'),
	(3, 2, 1, 1, '3', 150000, '2025-10-30 00:00:00', 'INVBLN20251031VDH432', '1', 'Tunai', 'test', 'ssss (INVBLN2025103002YOIL)', '2025-10-29 10:46:25', '2025-10-31 04:13:17'),
	(4, 2, 1, 1, '4', 150000, '2025-10-30 00:00:00', 'INVBLN20251030KAZ3AB', '1', 'Tunai', 'pembayaran bulky', NULL, '2025-10-30 10:46:25', '2025-10-30 11:26:35'),
	(5, 2, 1, 1, '5', 150000, '2025-10-30 00:00:00', 'INVBLN20251030GV82TD', '1', 'Tunai', 'pembayaran bulky', NULL, '2025-10-30 10:46:25', '2025-10-30 11:26:36'),
	(6, 2, 1, 1, '6', 150000, '2025-10-30 00:00:00', 'INVBLN20251030UJ639Q', '1', 'Tunai', 'test', 'test (INVBLN20251030PPWWM6)', '2025-10-30 10:46:25', '2025-10-30 11:27:25'),
	(7, 2, 1, 5, '7', 200000, '2025-10-31 00:00:00', 'INVBLN20251031Z2L5PJ', '1', 'Tunai', 'test', NULL, '2025-10-30 18:25:42', '2025-10-31 04:15:30'),
	(8, 2, 1, 5, '8', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(9, 2, 1, 5, '9', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(10, 2, 1, 5, '10', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(11, 2, 1, 5, '11', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(12, 2, 1, 5, '12', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(13, 2, 1, 5, '1', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(14, 2, 1, 5, '2', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(15, 2, 1, 5, '3', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(16, 2, 1, 5, '4', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(17, 2, 1, 5, '5', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(18, 2, 1, 5, '6', 200000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-30 18:25:42', '2025-10-30 18:25:42'),
	(19, 3, 1, 5, '7', 0, '2025-10-31 00:00:00', 'INVBLN20251031UW7LOU', '1', 'Tunai', 'test', NULL, '2025-10-31 04:22:29', '2025-10-31 04:25:33'),
	(20, 3, 1, 5, '8', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(21, 3, 1, 5, '9', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(22, 3, 1, 5, '10', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(23, 3, 1, 5, '11', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(24, 3, 1, 5, '12', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(25, 3, 1, 5, '1', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(26, 3, 1, 5, '2', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(27, 3, 1, 5, '3', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(28, 3, 1, 5, '4', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(29, 3, 1, 5, '5', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(30, 3, 1, 5, '6', 100000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-10-31 04:22:29', '2025-10-31 04:22:29'),
	(31, 4, 2, 7, '7', 250000, '2025-11-20 00:00:00', 'INVBLN20251120GTH04Y', '1', 'Tunai', 'test bulky', 'csdsdf (INVBLN20251120Y0PXCW)', '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(32, 4, 2, 7, '8', 250000, '2025-11-20 00:00:00', 'INVBLN202511200RAM33', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(33, 4, 2, 7, '9', 250000, '2025-11-20 00:00:00', 'INVBLN20251120U125N9', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(34, 4, 2, 7, '10', 250000, '2025-11-20 00:00:00', 'INVBLN20251120BZXYHY', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(35, 4, 2, 7, '11', 250000, '2025-11-20 00:00:00', 'INVBLN20251120BYR1RE', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(36, 4, 2, 7, '12', 250000, '2025-11-20 00:00:00', 'INVBLN20251120YQG5PG', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(37, 4, 2, 7, '1', 250000, '2025-11-20 00:00:00', 'INVBLN20251120A0A3AW', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(38, 4, 2, 7, '2', 250000, '2025-11-20 00:00:00', 'INVBLN20251120N160DO', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(39, 4, 2, 7, '3', 250000, '2025-11-20 00:00:00', 'INVBLN20251120LWZDHE', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(40, 4, 2, 7, '4', 250000, '2025-11-20 00:00:00', 'INVBLN202511208GZM80', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(41, 4, 2, 7, '5', 250000, '2025-11-20 00:00:00', 'INVBLN20251120329LLA', '1', 'Tunai', 'TRF3446456', 's (INVBLN20251120Y8NJ4A)', '2025-11-20 04:48:04', '2025-11-20 06:29:30'),
	(42, 4, 2, 7, '6', 250000, '2025-11-20 00:00:00', 'INVBLN20251120ZPGO94', '1', 'Tunai', 'test bulky', NULL, '2025-11-20 04:48:04', '2025-11-20 06:23:53'),
	(43, 4, 3, 7, '7', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(44, 4, 3, 7, '8', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(45, 4, 3, 7, '9', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(46, 4, 3, 7, '10', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(47, 4, 3, 7, '11', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(48, 4, 3, 7, '12', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(49, 4, 3, 7, '1', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(50, 4, 3, 7, '2', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(51, 4, 3, 7, '3', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(52, 4, 3, 7, '4', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(53, 4, 3, 7, '5', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(54, 4, 3, 7, '6', 250000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-20 04:48:04', '2025-11-20 04:48:04'),
	(55, 6, 4, 8, '7', 5000000, '2025-11-21 00:00:00', 'INVBLN202511215YJVHK', '1', 'Tunai', 'TF4564575', NULL, '2025-11-21 09:01:52', '2025-11-21 09:02:28'),
	(56, 6, 4, 8, '8', 2500000, '2025-11-21 00:00:00', 'INVBLN20251121LKOTRM', '1', 'Tunai', 'TF55333433', NULL, '2025-11-21 09:01:52', '2025-11-21 09:06:26'),
	(57, 6, 4, 8, '9', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(58, 6, 4, 8, '10', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(59, 6, 4, 8, '11', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(60, 6, 4, 8, '12', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(61, 6, 4, 8, '1', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(62, 6, 4, 8, '2', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(63, 6, 4, 8, '3', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(64, 6, 4, 8, '4', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(65, 6, 4, 8, '5', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52'),
	(66, 6, 4, 8, '6', 5000000, NULL, NULL, '0', 'Tunai', NULL, NULL, '2025-11-21 09:01:52', '2025-11-21 09:01:52');

-- Dumping structure for table siap.tahun_ajaran
CREATE TABLE IF NOT EXISTS `tahun_ajaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_tahun_ajaran_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.tahun_ajaran: ~5 rows (approximately)
INSERT INTO `tahun_ajaran` (`id`, `school_id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '2025/2026', 1, '2025-10-29 04:42:07', '2025-10-29 04:42:07', NULL),
	(2, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', '2026/2027', 1, '2025-10-30 17:37:04', '2025-10-30 17:37:04', NULL),
	(3, 'a204f79d-3bec-420b-985b-dc656f688a8d', '2025/2026', 1, '2025-11-20 04:32:24', '2025-11-20 04:32:24', NULL),
	(4, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '2025/2026', 1, '2025-11-21 08:44:18', '2025-11-21 08:44:18', NULL),
	(5, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', '2026/2027', 1, '2025-11-21 18:28:55', '2025-11-21 18:28:55', NULL);

-- Dumping structure for table siap.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siswa_id` int DEFAULT NULL,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_trx` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nisn` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` enum('debit','kredit') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `date` date NOT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wallet_balance_before` double DEFAULT NULL,
  `wallet_balance_after` double DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_transaksi_siswa` (`siswa_id`),
  KEY `FK_transaksi_schools` (`school_id`),
  CONSTRAINT `FK_transaksi_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `FK_transaksi_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table siap.transaksi: ~1 rows (approximately)
INSERT INTO `transaksi` (`id`, `siswa_id`, `school_id`, `no_trx`, `nisn`, `type`, `nominal`, `date`, `keterangan`, `wallet_balance_before`, `wallet_balance_after`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'TRX202510304EM72N', '4564565464645', 'kredit', 500000, '2025-10-30', 'testing', 0, 500000, 'dewi123', '2025-10-30 11:50:39', '2025-10-30 11:50:39', NULL);

-- Dumping structure for table siap.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `level` enum('superadmin','admin','staff') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siap.users: ~11 rows (approximately)
INSERT INTO `users` (`id`, `reference_user_id`, `role_id`, `current_school_id`, `name`, `email`, `username`, `phone`, `email_verified_at`, `level`, `is_active`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	('0a957bb6-6fe2-4bef-8a4d-e30c6c0d5a42', '0a957bb6-6fe2-4bef-8a4d-e30c6c0d5a42', NULL, 'd67948dc-6897-4b4a-8343-6e95f1474026', 'Benjamin Simpson', 'dyzyt@mailinator.com', 'dyzyt', '087832535345', NULL, 'admin', 1, '$2y$10$HlsE3Ct8bCau.Uy72RrnwOcljOQOwT15TDuq.MAnQKmPtE2p4jXjC', NULL, '2025-11-13 06:10:40', '2025-11-13 06:37:37'),
	('183a1615-623f-443c-9cec-7870d061cac4', NULL, '', 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 'Super Admin', 'super-admin@mail.com', NULL, '', NULL, 'superadmin', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-11-22 09:00:31'),
	('507ba56c-4a85-481f-81ca-52dafde6d511', '507ba56c-4a85-481f-81ca-52dafde6d511', NULL, 'f5fe6d22-e50f-4ff9-8b74-84d5f5e06fb4', 'Buana', 'buana@yopmail.com', 'buanayopmailcom', '08773453453535', NULL, 'admin', 1, '$2y$10$dojz27cMpFznpLF8Vka6lOmO44QfDRLU4YeyKz5KDAq/vWmpl4lA.', NULL, '2025-11-21 04:00:00', '2025-11-21 04:04:23'),
	('6bce752f-ecb1-4776-836e-f22bba89bcd8', '6bce752f-ecb1-4776-836e-f22bba89bcd8', NULL, 'c348223e-5e3b-4c89-94e3-c437f82256f5', 'Hollee Mercer', 'kifafozu@mailinator.com', 'dgrtgrhgrth', '0883434534344', NULL, 'admin', 0, '$2y$10$S04/qLP9bc0oGY5TaWml6ukPcFxuVM4NeN.LHwIXtvpQzeUmaqkY2', NULL, '2025-11-13 06:39:43', '2025-11-13 06:43:16'),
	('795a1ed4-8a0f-4d86-a9a4-aae017266d5f', '795a1ed4-8a0f-4d86-a9a4-aae017266d5f', NULL, 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'Hamzah', 'admin@mail.com', 'adminmailcom', '08873453553453', NULL, 'admin', 1, '$2y$10$vNtm7d89NXvFhQXhnxk/Ru0as.R.HMSEPx8aApUA34dPP5mHGbei.', NULL, '2025-10-28 11:55:20', '2025-10-29 04:32:08'),
	('7e8954e1-b5a2-47a6-84de-9943b6ff8745', '7e8954e1-b5a2-47a6-84de-9943b6ff8745', NULL, 'a204f79d-3bec-420b-985b-dc656f688a8d', 'azka staff', 'azka@mail.com', 'azka', '0877353453453', NULL, 'admin', 1, '$2y$10$KpzsSe7IilQK1Eh.aQzhpeuPLwmLQ1K4Y2YN1Ll7V2O/3nl8035R2', NULL, '2025-10-28 17:32:16', '2025-10-28 17:32:16'),
	('7fdc252d-466f-49e6-96f7-7821a4e8165c', '795a1ed4-8a0f-4d86-a9a4-aae017266d5f', '1471e795-261e-4792-b302-94dcc859764d', 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'dewi', 'dewi@yopmail.com', 'dewi123', '08777456464', NULL, 'staff', 1, '$2y$10$blzyed41.MNgEsewBC3P.uKH7zLVMwQk9jeR.b4QN/s4n5wqv39Gq', NULL, '2025-10-28 17:04:31', '2025-10-28 17:04:31'),
	('85155246-947e-4c80-a6b5-a4ce58185fe9', '795a1ed4-8a0f-4d86-a9a4-aae017266d5f', 'f7955f1d-70d3-4222-b89a-5b797e2c7db8', 'b0ca0f59-5afe-40c7-87be-7cabdb17cba8', 'jiwos', 'jiwo@mail.com', 'jiwoaja', '08774535445', NULL, 'staff', 1, '$2y$10$TSKiUgKNqEN4thPryP9MReyEiE8uag63f2NREryoC9DKs0KeFmt/m', NULL, '2025-10-28 17:22:30', '2025-10-29 04:33:00'),
	('e3ae7f06-c0be-4fa2-8ce5-fabfd248d0da', '7e8954e1-b5a2-47a6-84de-9943b6ff8745', '1471e795-261e-4792-b302-94dcc859764d', 'a204f79d-3bec-420b-985b-dc656f688a8d', 'aska', 'aska@mail.com', 'aska', '08788435354', NULL, 'staff', 1, '$2y$10$LzJC5Ih0T2RUzzFm04BltOvQgfBwDGt/CHJGmJ9NUWUKcTHESOR9C', NULL, '2025-10-28 17:33:31', '2025-10-28 17:33:31'),
	('e72c87ff-a725-4f26-b398-a85296679510', '7e8954e1-b5a2-47a6-84de-9943b6ff8745', '1471e795-261e-4792-b302-94dcc859764d', 'a204f79d-3bec-420b-985b-dc656f688a8d', 'samsul', 'samsul@mail.com', 'samsul', '08772828822', NULL, 'staff', 1, '$2y$10$0Vn932rUAeXIA7rcHCDlrOrHCN8nIPgyUOy8xCqLaQqVjIAlhjvJu', NULL, '2025-10-28 17:34:55', '2025-10-28 17:34:55'),
	('f2d65cea-6341-4b20-ba84-6a8e4c3d20fb', 'f2d65cea-6341-4b20-ba84-6a8e4c3d20fb', NULL, '681fb72b-652e-4f3f-8fec-e688846bf6df', 'jaya anugrah', 'jaya@yopmail.com', 'jayayopmaildotcom', '08762344234234', NULL, 'admin', 1, '$2y$10$ObFXWASZfC4TS6E7u7r7z.uSp9aSWzSzTTuVclfea/ds/.Q0HmZQW', NULL, '2025-11-22 07:11:24', '2025-11-22 07:13:01');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
