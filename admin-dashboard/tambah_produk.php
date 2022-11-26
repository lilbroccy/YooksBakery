
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tambah Produk</title>
    <style type="text/css">
        * {
            font-family: "Trebuchet MS";
        }
        h1{
            text-transform: uppercase;
            color: salmon;
        }
        .base{
            width: 400px;
            padding: 20px;
            margin-left: auto;
            margin-right: auto;
            background-color: #ededed;
        }
        label {
            margin-top: 10px;
            float: left;
            text-align: left;
            width: 100%;
        }
        input{
            padding: 6px;
            width: 100%;
            box-sizing: border-box;
            background-color: #f8f8f8;
            border: 2px solid #ccc;
            outline-color: salmon;
        }
        button {
            background-color: salmon;
            color: #fff;
            padding: 10px;
            font-size: 12px;
            border: 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <center><h1>Tambah Produk</h1></center>
    <form action="proses_tambah.php" method="POST" enctype="multipart/form-data">
    <section class="base">
        <div>
            <label>Nama Produk</label>
            <input type="text" name="nama_roti" outofocus="" required="">
        </div>
        <div>
            <label>Deskripsi</label>
            <input type="text" name="deskripsi" outofocus="" required="">
        </div>
        <div>
            <label>Harga</label>
            <input type="text" name="harga_satuan_roti" outofocus="" required="">
        </div>
        <div>
            <label>Gambar</label>
            <input type="file" name="gambar" outofocus="" required="">
        </div>
        <div>
            <button type="submit">Simpan Produk</button>
            </div>
    </section>
    </form>
</body>
</html>