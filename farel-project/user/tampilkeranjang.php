<?php
include '../koneksi.php';

$keranjang = array();
$total = 0;
if (isset($_SESSION['keranjang'])) 
{
    foreach ($_SESSION['keranjang'] as $id_produk => $jumlah) {
        $ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
        $produk = $ambil->fetch_assoc();
        $produk['jumlah'] = $jumlah;
        $keranjang[] = $produk;
        $total+=$produk['jual_produk'] * $jumlah;
    }
}
?>
<?php
foreach ($keranjang as $key => $perproduk): ?>
 <div class="row">
    <div class="col-md-11">
        <h6><?php echo $perproduk["nama_produk"] ?></h6>
        <span class="small text-muted"> <?php echo number_format($perproduk['jual_produk']) ?> </span>
        <p class="small"> X <?php echo $perproduk['jumlah'] ?> </p>
    </div>
    <div class="col-md-1">
        <button type="button" class="btn btn-outline-primary btn-sm">
            <i class="bi bi-plus tambahi" idnya="<?php echo $perproduk['id_produk'] ?>"></i>
        </button>
        <button type="button" class="btn btn-outline-primary btn-sm">
            <i class="bi bi-dash kurangi" idnya="<?php echo $perproduk['id_produk'] ?>"></i>
        </button>
    </div>
 </div>
 <hr>
<?php endforeach ?>

<form method="POST" action="checkout.php" target="_blank" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="">Total</label>
        <Input type="number" name="total" class="form-control total" value="<?php echo $total ?>" readonly></Input>
    </div>
    <div class="mb-3">
        <label for="">Bayar</label>
        <Input type="number" name="bayar" class="form-control bayar" required></Input>
    </div>
    <div class="mb-3">
        <label for="">Kembalian</label>
        <Input type="number" name="kembalian" class="form-control kembalian" readonly></Input>
    </div>
    <div class="mb-3">
        <label for="">Telepon Pelanggan</label>
        <input type="text" name="telepon" class="form-control" placeholder="+62 ">
    </div>
    <div class="mb-3">
        <label for="">Bukti Pembayaran</label>
        <input type="file" id="buktitf" name="bukti" class="form-control bukti" required accept="image/png, image/gif, image/jpeg"></input>
    </div>
    <button class="btn btn-primary btn-sm" name="bukti">Checkout</button>
</form>