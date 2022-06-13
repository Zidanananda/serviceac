-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.4-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6469
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for semester4
CREATE DATABASE IF NOT EXISTS `semester4` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `semester4`;

-- Dumping structure for table semester4.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '0',
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(25) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.admin: ~0 rows (approximately)
INSERT IGNORE INTO `admin` (`id_admin`, `username`, `password`, `nama`, `alamat`, `email`, `no_telp`, `role_id`) VALUES
	(1, 'admin', 'eaccb8ea6090a40a98aa28c071810371', 'Imam', 'Imam', 'imam@imam.com', '09', 1);

-- Dumping structure for table semester4.detail
CREATE TABLE IF NOT EXISTS `detail` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) NOT NULL,
  `ukuran` varchar(20) NOT NULL,
  `toping` varchar(20) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.detail: ~8 rows (approximately)
INSERT IGNORE INTO `detail` (`id_detail`, `kode_produk`, `ukuran`, `toping`, `deskripsi`) VALUES
	(1, 'pz-XL-sosp', 'XL', 'sosp', 'testing deskripsi'),
	(2, 'pz-XS-sosp', 'XS', 'sosp', 'deskripsi'),
	(3, 'pz-gyvaNA5o8Ximfir', 'M', 'sosp', 'deskripsi lagi'),
	(4, 'pz-DS39PZRqj7imfir', 'S', 'dag', 'Daging sapi pilihan'),
	(5, 'pz-3nJ4dYv7L2imfir', 'M', 'toping-OGYE6ey8PXfik', 'Sayur KOl ala anak medan'),
	(6, 'pz-7QyenumF8Efikar', 'XS', 'kej', 'di hiasi toping keju'),
	(7, 'pz-cUYORQeFNVfikar', 'M', 'dag', 'Di hiasi dengan topingan bakso iris'),
	(8, 'pz-5OuGxjrFXifikar', 'L', 'dag', 'Pizza Mewah yang dihiasi dengan lapisan keju');

-- Dumping structure for table semester4.lap_pemesanan
CREATE TABLE IF NOT EXISTS `lap_pemesanan` (
  `id_lap_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  PRIMARY KEY (`id_lap_pesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.lap_pemesanan: ~0 rows (approximately)

-- Dumping structure for table semester4.pesan
CREATE TABLE IF NOT EXISTS `pesan` (
  `id_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pesanan` varchar(50) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `kode_produk` varchar(50) NOT NULL DEFAULT '',
  `jumlah` int(11) NOT NULL,
  `alamat` tinytext NOT NULL,
  `notelp` tinytext NOT NULL,
  `total` float NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `buktitrf` text NOT NULL,
  `status` enum('selesai','batal','menunggu pembayaran','bukti bayar sudah diupload','pembayaran diverifikasi','proses','pesanan sedang di antar') NOT NULL,
  PRIMARY KEY (`id_pesan`),
  UNIQUE KEY `kode_pesanan` (`kode_pesanan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.pesan: ~2 rows (approximately)
INSERT IGNORE INTO `pesan` (`id_pesan`, `kode_pesanan`, `id_user`, `kode_produk`, `jumlah`, `alamat`, `notelp`, `total`, `tgl_pesan`, `buktitrf`, `status`) VALUES
	(1, 'p-3R9pDG14KN8', 3, 'pz-DS39PZRqj7imfir', 5, '', '', 175000, '2022-06-05 13:46:18', '', 'bukti bayar sudah diupload'),
	(2, 'p-3MKRR1ZIQfE', 3, 'pz-DS39PZRqj7imfir', 5, 'alamat lamahkhkhkhk', '012821812812787887878778', 175000, '2022-06-05 14:02:04', 'img1654415871.jpg', 'bukti bayar sudah diupload');

-- Dumping structure for table semester4.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) NOT NULL DEFAULT '',
  `nama_produk` varchar(50) NOT NULL,
  `harga` float NOT NULL,
  `image` text NOT NULL,
  `stok` int(5) NOT NULL,
  `terjual` int(11) NOT NULL,
  PRIMARY KEY (`id_produk`),
  UNIQUE KEY `kode_produk` (`kode_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.produk: ~4 rows (approximately)
INSERT IGNORE INTO `produk` (`id_produk`, `kode_produk`, `nama_produk`, `harga`, `image`, `stok`, `terjual`) VALUES
	(12, 'pz-DS39PZRqj7imfir', 'Pizza mini', 35000, 'img1654008935.png', 3, 0),
	(14, 'pz-7QyenumF8Efikar', 'Pizza Keju', 30000, 'Pizza_Keju_min_pz-7QyenumF8Eimfir.jpg', 4, 0),
	(15, 'pz-cUYORQeFNVfikar', 'Pizza Bakso', 40000, 'img1654407247.png', 6, 0),
	(16, 'pz-5OuGxjrFXifikar', 'Pizza mewah', 50000, 'Pizza_mewah_pz-5OuGxjrFXiimfir.jpg', 6, 0);

-- Dumping structure for table semester4.toping
CREATE TABLE IF NOT EXISTS `toping` (
  `id_toping` int(11) NOT NULL AUTO_INCREMENT,
  `kode_toping` varchar(100) NOT NULL,
  `nama_toping` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga_toping` float DEFAULT NULL,
  PRIMARY KEY (`id_toping`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.toping: ~4 rows (approximately)
INSERT IGNORE INTO `toping` (`id_toping`, `kode_toping`, `nama_toping`, `deskripsi`, `harga_toping`) VALUES
	(2, 'dag', 'daging', 'daging sapi', 15000),
	(6, 'ters', 'terasi', 'terasi udang', NULL),
	(7, 'sos', 'Sosis ayam', 'Sosis daging ayam', NULL),
	(8, 'kej', 'Keju', 'Keju meleleh', NULL),
	(9, 'toping-OmZsFxL1Qrfikar', 'Sosis Ayam', 'Sosis Ayam Lezatos', NULL);

-- Dumping structure for table semester4.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.transaksi: ~0 rows (approximately)

-- Dumping structure for table semester4.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(50) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table semester4.user: ~4 rows (approximately)
INSERT IGNORE INTO `user` (`id`, `nama`, `alamat`, `email`, `username`, `image`, `password`, `role_id`, `is_active`, `no_telp`) VALUES
	(1, 'admin', 'alamat', 'admin@admin.com', '', 'a.jpg', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '0812812812812'),
	(2, '', '', 'zulfikarmahmudlubis@gmail.com', 'fikar', '', '827ccb0eea8a706c4c34a16891f84e7b', 2, 0, ''),
	(3, 'imam', 'alamat lama', 'imam@gmail.com', 'imam', 'img1654407173.jpg', 'eaccb8ea6090a40a98aa28c071810371', 2, 1, '012821812812'),
	(4, 'imam', '-', '-', 'admin', '-', 'eaccb8ea6090a40a98aa28c071810371', 1, 1, '-');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
