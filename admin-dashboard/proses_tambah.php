<?php 
    include('koneksi.php');

    $nama_roti = $_POST['nama_roti'];
    $deskripsi = $_POST['deskripsi'];
    $harga_satuan_roti = $_POST['harga_satuan_roti'];
    $gambar = $_FILES['gambar']['name'];

    if($gambar != ""){
        $ekstensi_diperbolehkan = array('png', 'jpg', 'jpeg');
        $x = explode('.', $gambar);
        $ekstensi = strtolower(end($x));
        $file_tmp = $_FILES['gambar']['tmp_name'];
        $angka_acak = rand(1, 999);
        $nama_gambar_baru = $angka_acak.'-'.$gambar;

        if(in_array($ekstensi, $ekstensi_diperbolehkan) === true){
            move_uploaded_file($file_tmp, 'admin-dashboard/gambar/'.$nama_gambar_baru);

            $query = "INSERT INTO produk_umum (nama_roti, gambar, harga_satuan_roti, deskripsi) VALUES ('$nama_roti', 
            '$nama_gambar_baru', '$harga_satuan_roti', '$deskripsi')";
            $result = mysqli_query($koneksi, $query);

            if(!$result) {
                die("Query Error : ".mysqli_errno($koneksi)."-".mysqli_error($koneksi));
            } else {
                echo "<script>Alert('Data berhasil ditambahkan!');.window.location='data.member.php'</script>";
            }
        } else {
            echo "<script>alert('Ekstensi Gambar Hanya Bisa jpg, png, dan jpeg!');window.location='tambah_produk.php';</script>";
        }
    } else {
        $query = "INSERT INTO produk_umum (nama_roti, harga_satuan_roti, deskripsi) VALUES ('$nama_roti', 
            '$harga_satuan_roti', '$deskripsi')";
            $result = mysqli_query($koneksi, $query);

            if(!$result) {
                die("Query Error : ".mysqli_errno($koneksi)."-".mysqli_error($koneksi));
            } else {
                echo "<script>Alert('Data berhasil ditambahkan!');.window.location='data.member.php'</script>";
            }
    }
?>