<?php include 'koneksi.php';

$nama = $_POST['name'];
$email = $_POST['email'];
$alamat = $_POST['address'];
$telp = $_POST['telp'];
$password = $_POST['password'];

echo "<pre>";
   print_r($nama);
   print_r($email);
   print_r($alamat);
   print_r($telp);
   print_r($password);
echo "</pre>";



?>
