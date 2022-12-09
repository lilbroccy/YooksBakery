<?php include 'header.php'?>

<div class="container">
    <div class="card border-0 shadow">
        <div class="card-body">
            <form method="post">
                <div class="row">
                    <div class="col-md-3">
                        <label>Mulai</label>
                        <input type="date" name="tglm" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label>Selesai</label>
                        <input type="date" name="tgls" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-primary" name="filter">Filter</button>
                    </div>
                </div>
            </form>
            <hr>
        </div>
    </div>
</div>

<?php include 'footer.php'?>