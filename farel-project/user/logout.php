<?php include '../koneksi.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
</head>
<body>
    <!-- Sweet Alert 2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../asset/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <!-- Sweet Alert 2 END -->
<?php 
session_destroy();
// echo "<script>alert('Anda Telah Logout!..')</script>";
// echo "<script>location='../index.php'</script>";
echo "<script>
        Swal.fire({
            icon: 'success',
            title: 'ANDA BERHASIL LOGOUT',
            text: 'Jangan Lupa Mampir Lagi ❤️'
        }).then((result) => {
            window.location.href = '../index.php'
        })
</script>";
?>
</body>
</html>