<?php
include '../koneksi.php'; 
//dapatkan id_toko dari user yang login 
$id_toko = $_SESSION['User']['id_toko'];

//dapatkan produk sesuai id toko ini
$produk =array();
$ambil = $koneksi ->query("SELECT * FROM produk WHERE id_toko='$id_toko' ORDER BY id_produk DESC LIMIT 8 ");
while($tiap = $ambil -> fetch_assoc())
{
    $produk[] = $tiap;
}

// echo"<pre>";
// print_r($produk);
// echo"</pre>";
?>
<div class="row">
                <?php foreach ($produk as $key => $value): ?>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="package-item bg-white mb-2" >
                        <img class="img-fluid" src="../asset/image/image-admin/produk/<?php echo $value["foto_produk"] ?>" alt="" style="height:250px;width=600px;">
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
                <div class="col-md-3">
                    <div class="card border-0 shadow">
                        <div class="card-body keranjang"></div>
                    </div>
                </div>
            </div>
            <script>
        $(document).ready(function() {
            $(".link-produk").on("click", function(){
                // Dapatkan idnya
                var id_produk = $(this).attr("idnya");
                $.ajax({
                    type : 'post',
                    url : 'masukkeranjang.php',
                    data : 'id_produk='+id_produk,
                    success: function(hasil){
                            $.ajax({
                                url: 'tampilkeranjang.php',
                                success:function(hasil){
                                $(".keranjang").html(hasil);
                            }
                        })
                    }
                })
            })
        });
    </script>