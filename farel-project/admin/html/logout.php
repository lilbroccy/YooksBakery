    <!-- Sweet Alert 2 -->
    <link rel="stylesheet" href="../../asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../asset/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../../asset/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="../../asset/js/bootstrap.bundle.min.js"></script>
    <!-- Sweet Alert 2 END -->
<?php
session_start();
$ambil = session_destroy();

echo "<script>alert('Anda Telah Logout!..')</script>";
echo "<script>location='../../index.php'</script>";
// if (isset($ambil)) {
//     echo "<script>
//             Swal.fire({
//                 icon: 'success',
//                 title: 'ANDA BERHASIL LOG OUT',
//                 text: 'Jangan Lupa Bahagia ❤️'
//             }).then((result) => {
//                 window.location.href = '../../index.php'
//             })
//         </script>";
// }
?>