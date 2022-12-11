-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220604.11e8242d04
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2022 pada 08.18
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.5

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
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_toko`, `nama_kategori`) VALUES
(1, 1, 'Roti Kering'),
(2, 1, 'Roti Basah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `email_pelanggan` varchar(255) NOT NULL,
  `telp_pelanggan` varchar(255) NOT NULL,
  `alamat_pelanggan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `tanggal_penjualan` datetime NOT NULL,
  `tanggal_ambil_penjualan` datetime NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `bayar_penjualan` int(11) NOT NULL,
  `kembalian_penjualan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_user`, `id_toko`, `tanggal_penjualan`, `tanggal_ambil_penjualan`, `total_penjualan`, `bayar_penjualan`, `kembalian_penjualan`) VALUES
(1, 3, 1, '2022-12-06 18:38:23', '2022-12-07 18:38:23', 15000, 20000, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_produk`
--

CREATE TABLE `penjualan_produk` (
  `id_penjualan_produk` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `biaya_produk` int(11) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `subtotal_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan_produk`
--

INSERT INTO `penjualan_produk` (`id_penjualan_produk`, `id_penjualan`, `id_produk`, `id_toko`, `nama_produk`, `biaya_produk`, `harga_produk`, `jumlah_produk`, `subtotal_produk`) VALUES
(1, 1, 1, 1, 'Roti Anjay', 1500, 2000, 5, 10000),
(2, 1, 2, 1, 'Roti Munaroh', 4000, 5000, 1, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
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
  `stock_produk` int(11) NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `keterangan_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_supplier`, `id_toko`, `kode_produk`, `nama_produk`, `biaya_produk`, `jual_produk`, `stock_produk`, `foto_produk`, `keterangan_produk`) VALUES
(1, 1, 1, 1, '100', 'Roti Anjay', 1500, 2000, 10, 'rotianjay.jpg\r\n\r\n', 'Rasa :\r\n- Pedas\r\n- Gurih\r\n- Asin\r\n- Manis\r\n- Kecut'),
(2, 1, 1, 1, '101', 'Roti Munaroh', 4000, 5000, 15, 'rotimunaroh.jpg', 'Rasa Yang Pernah Ada :\r\n- Pedas\r\n- Gurih\r\n- Asin\r\n- Manis\r\n- Kecut');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(255) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `id_toko`, `nama_supplier`) VALUES
(1, 1, 'SRC'),
(2, 1, 'HMS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(255) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamt_toko` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamt_toko`) VALUES
(1, 'Yooks Bakery Cabang Balung', 'Jl. Balung Raya Nomer 92');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(255) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `alamat_user` text NOT NULL,
  `telepon_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `level_user` enum('Admin','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_toko`, `id_penjualan`, `nama_user`, `alamat_user`, `telepon_user`, `email_user`, `password_user`, `level_user`) VALUES
(1, 1, 0, 'Hendy Mawarid\r\n', 'Jl. Kranjingan Saja No.19', '081231819233', 'hendymrd@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Admin'),
(2, 1, 0, 'Ridho Akmal N.W', 'Jl. jalan tapi gak jadian No.24', '081331889324', 'ridho@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Admin'),
(3, 1, 1, 'Andriana Putri D.', 'Jl. Roh Kudus No.29', '083244952200', 'andriana@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  ADD PRIMARY KEY (`id_penjualan_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  MODIFY `id_penjualan_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



