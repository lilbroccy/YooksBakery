<?php
if(isset($_POST['register'])){
$nama = $_POST['name'];
$email = $_POST['email'];
$alamat = $_POST['address'];
$telp = $_POST['telp'];
$password = sha1($_POST['password']);

$ambil = $koneksi->query("INSERT INTO user (id_toko, nama_user, alamat_user, telepon_user, email_user, password_user, level_user) VALUES (1, '$nama', '$alamat', '$telp', '$email', '$password', 'User')");
if (isset($ambil)){
   // echo "<script>location='index.php?level=admin&success=true'</script>";
   echo "<script>
           Swal.fire({
               icon: 'success',
               title: 'ANDA BERHASIL LOGIN',
               text: 'Semoga Harinya Menyenangkan ❤️'
           }).then((result) => {
               window.location.href = 'index.php'
           })
   </script>";
    }
}
?>
