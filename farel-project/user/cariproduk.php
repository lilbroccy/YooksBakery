    <?php
    include '../koneksi.php';
    //dapatkan id_toko dari user yang login 
    $id_toko = $_SESSION['User']['id_toko'];
    $cari = $_POST['cari'];

    //dapatkan produk sesuai id toko ini
    $produk =array();
    $ambil = $koneksi ->query("SELECT * FROM produk WHERE id_toko='$id_toko' AND nama_produk LIKE '%$cari%'  ");
    while($tiap = $ambil -> fetch_assoc())
    {
        $produk[] = $tiap;
    }

    // echo"<pre>";
    // print_r($produk);
    // echo"</pre>";
    ?>
    
    <!-- Packages Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Packages</h6>
                <h1>Pefect Tour Packages</h1>
            </div>
            <div class="row">
                <?php foreach ($produk as $key => $value): ?>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="package-item bg-white mb-2" >
                        <img class="img-fluid" src="../asset/image/image-admin/produk/<?php echo $value["foto_produk"] ?>" alt="">
                        <div class="p-4">
                            <div class="d-flex justify-content-between mb-3">
                                <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i>Thailand</small>
                                <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>3 days</small>
                                <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>2 Person</small>
                            </div>
                            <a class="h5 text-decoration-none link-produk" href="#" idnya="<?php echo $value["id_produk"] ?>">
                                <?php echo $value["nama_produk"] ?></a>
                            <div class="border-top mt-4 pt-4">
                                <div class="d-flex justify-content-between">
                                    <h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i>Stock <small>( <?php echo $value["stock_produk"] ?> )</small></h6>
                                    <h5 class="m-0">Rp. <?php echo number_format($value["jual_produk"]) ?></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach ?>
            </div>
        </div>
    </div>
    <!-- Packages End -->