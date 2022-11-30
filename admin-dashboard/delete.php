<?php
require('koneksi.php');
$id = $_GET['id_user'];
mysqli_query($koneksi, "DELETE FROM user_detail WHERE id_user='$id'") or die(mysql_error());
header("location: /YooksBakery/admin-dashboard/data_member.php")
?>