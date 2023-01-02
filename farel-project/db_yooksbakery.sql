-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 09:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_yooksbakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `foto_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_toko`, `nama_kategori`, `foto_kategori`) VALUES
(1, 1, 'Roti Selai', 'kat-rotiselai.jpg'),
(2, 1, 'Roti Isi', 'kat-rotiisi.jpg'),
(3, 1, 'Roti Sisir', 'kat-rotisisir.jpg'),
(4, 1, 'Donat', 'kat-donat.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `tanggal_penjualan` datetime NOT NULL,
  `tanggal_ambil_penjualan` datetime NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `bukti` varchar(255) NOT NULL,
  `status_pesanan` varchar(255) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_user`, `id_toko`, `tanggal_penjualan`, `tanggal_ambil_penjualan`, `total_penjualan`, `metode_pembayaran`, `bukti`, `status_pesanan`) VALUES
(1, 4, 1, '2023-01-02 14:23:37', '2023-01-03 14:23:37', 8000, 'Bank BCA - 5220304356 a/n Yooks Bakery', 'reg.png', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_produk`
--

CREATE TABLE `penjualan_produk` (
  `id_penjualan_produk` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `biaya_produk` int(11) NOT NULL,
  `harga_produk` int(255) NOT NULL,
  `jumlah_produk` int(255) NOT NULL,
  `subtotal_produk` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_produk`
--

INSERT INTO `penjualan_produk` (`id_penjualan_produk`, `id_penjualan`, `id_produk`, `id_toko`, `nama_produk`, `biaya_produk`, `harga_produk`, `jumlah_produk`, `subtotal_produk`) VALUES
(1, 1, 7, 1, 'Roti Isi Daging', 6500, 8000, 1, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `biaya_produk` int(11) NOT NULL,
  `jual_produk` int(11) NOT NULL,
  `harga_coret` int(11) NOT NULL,
  `stock_produk` int(11) NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `keterangan_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_supplier`, `id_toko`, `kode_produk`, `nama_produk`, `biaya_produk`, `jual_produk`, `harga_coret`, `stock_produk`, `foto_produk`, `keterangan_produk`) VALUES
(1, 1, 1, 1, '100', 'Roti Selai Coklat', 2000, 3000, 4000, 50, 'rotiselaicoklat.jpg', 'Roti lembut dengan lapisan selai coklat yang lezat'),
(2, 1, 1, 1, '101', 'Roti Selai Stroberi', 1500, 2000, 2500, 50, 'rotiselaistroberi.jpg', 'Roti lembut dengan lapisan selai stroberi yang segar'),
(3, 1, 1, 1, '102', 'Roti Selai Nanas', 2500, 3500, 4000, 50, 'rotiselainanas.jpg', 'Roti lembut dengan lapisan selai nanas segar'),
(4, 2, 2, 1, '2200', 'Roti Isi Coklat', 3500, 5000, 6000, 50, 'rotiisicoklat.jpg', 'Roti lembut dengan isi coklat lumerz'),
(5, 2, 2, 1, '2201', 'Roti Isi Coklat Pisang', 4500, 6000, 7000, 50, 'rotiisicoklatpisang.jpeg', 'Roti lembut dengan isi coklat lumer dan pisang segar'),
(7, 2, 2, 1, '2202', 'Roti Isi Daging', 6500, 8000, 9500, 49, 'rotiisidaging.jpg', 'Roti lembut dengan isi daging ayam juicy '),
(8, 3, 2, 1, '9001', 'Roti Sisir Coklat', 7000, 8500, 10000, 50, 'rotisisircoklat.jpg', 'Roti empuk dengan cita rasa coklat yang sangat kental'),
(9, 3, 2, 1, '9002', 'Roti Sisir Mentega', 3500, 5000, 6000, 50, 'rotisisirmentega.jpg', 'Roti sisir dengan lapisan mentega sedap'),
(10, 4, 3, 1, '8801', 'Donat Kentang Coklat', 1000, 1500, 2000, 50, 'donatcoklat.jpg', 'Donat kentang varian coklat yang lumer'),
(11, 4, 3, 1, '8802', 'Donat Kentang Matcha', 1000, 1500, 2500, 50, 'donatmatcha.jpg', 'Donat kentang rasa matcha '),
(12, 4, 3, 1, '8803', 'Donat Kentang Keju', 1000, 1500, 2500, 50, 'donatkeju.jpg', 'Donat kentang dengan lapisan keju segar'),
(13, 4, 3, 1, '8804', 'Paket 10 Donat Kentang', 10000, 13500, 15000, 50, 'paketdonatkentang1.jpg', 'Paket donat kentang yang berisi 10 donat dengan varian rasa yang bermacam-macam');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(255) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `id_toko`, `nama_supplier`) VALUES
(1, 1, 'SRS'),
(2, 1, 'HMS'),
(3, 1, 'Donatkoe');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(255) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamt_toko` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamt_toko`) VALUES
(1, 'Yooks Bakery Pusat', 'Jl. Melon 3 no. 5B, Krajan, Patrang, Kec. Patrang, Kabupaten Jember, Jawa Timur 68111');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(255) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `alamat_user` text NOT NULL,
  `telepon_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `level_user` enum('Admin','User') NOT NULL,
  `foto_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_toko`, `nama_user`, `alamat_user`, `telepon_user`, `email_user`, `password_user`, `level_user`, `foto_user`) VALUES
(1, 1, 'Hendy Mawarid\r\n', 'Jl. Kranjingan Saja No.19', '081231819233', 'hendymrd@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Admin', 'Hendy Mawarid.jpg'),
(2, 1, 'Ridho Akmal N.W', 'Jl. jalan tapi gak jadian No.24', '081331889324', 'ridho@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Admin', 'Ridho Akmal N.W.jpg'),
(3, 1, 'Andriana Putri D', 'Jl. Roh Kudus No.29', '083244952200', 'andriana@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'User', 'Andriana Putri D.jpg'),
(4, 1, 'The Weeknd', 'Jl. Los Angeles No. 21, Jember', '085676574321', 'theweeknd@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'User', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  ADD PRIMARY KEY (`id_penjualan_produk`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_toko` (`id_toko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  MODIFY `id_penjualan_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  ADD CONSTRAINT `penjualan_produk_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `penjualan_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `penjualan_produk_ibfk_3` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`),
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
