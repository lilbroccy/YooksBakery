<!-- Sweet Alert 2 -->
<script src="asset/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../farel-project/asset/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <!-- Sweet Alert 2 END -->

<?php include 'koneksi.php';

if(isset($_POST['register'])){
$nama = $_POST['name'];
$email = $_POST['email'];
$alamat = $_POST['address'];
$telp = $_POST['telp'];
$password = $_POST['password'];

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