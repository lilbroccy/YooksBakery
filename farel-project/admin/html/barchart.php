<?php require("../../koneksi.php"); 
$penjualan = $koneksi ->query("SELECT nama_produk,stock_produk FROM produk ");
?>