<div class="main-panel">
  <div class="content-wrapper">
    <div class="page-header">
      <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
          <i class="mdi mdi-pizza"></i>
        </span> Ubah Pemesanan Service AC
      </h3>

    </div>
    <div class="row">
      <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <h4 class="card-title">Pemesanan Service AC</h4>
            <?php if (validation_errors()) { ?>
              <div class="alert alert-danger" role="alert">
                <?= validation_errors(); ?>
              </div>
            <?php } ?>
            <?= $this->session->flashdata('pesan'); ?>
            <?php foreach ($produk as $p) { ?>
              <form class="forms-sample" action="<?= base_url(); ?>admin/u_pemesanan/<?= $p['id_pesan'] ?>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label for="exampleInputName1">Nama Produk </label>
                  <input type="hidden" name="id_pesan" id="id_pesan" value="<?php echo $p['id_pesan']; ?>">
                  <input type="text" readonly class="form-control" name="nama_produk" id="nama_produk" placeholder="Nama produk Mie Meleyot" value="<?= $p['nama_produk']; ?>" required>
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Jumlah</label>
                  <input type="text" readonly class="form-control form-control-user" id="jumlah" name="jumlah" placeholder="Masukkan nominal stok" value="<?= $p['jumlah']; ?>">
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Total</label>
                  <input type="text" readonly class="form-control form-control-user" id="total" name="total" placeholder="Masukkan Harga Produk" value="<?= $p['harga'] * $p['jumlah']; ?>">
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Bukti Bayar</label><br>
                  <picture class=" form-control-user" data-toggle="modal" data-target="#addProdukModal">
                    <source srcset="" type="image/svg+xml">
                    <img src="<?= base_url('assets/uploads/member/') . $p['buktitrf']; ?>" class="rounded mx-auto mb-3 d-blok" alt="...">
                  </picture>
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Status Pesanan</label>
                  <select name="status" id="status" class="form-control form-control-user">
                    <option value="<?= $p['status']; ?>"><?= $p['status']; ?></option>
                    <option value="pembayaran sudah diverifikasi">Pembayaran sudah diverifikasi</option>
                    <option value="pesanan sedang di proses">Pesanan sedang di proses</option>
                    <option value="pesanan selesai">Pesanan selesai</option>
                    <option value="pesanan batal">Pesanan batal</option>
                  </select>
                </div>

                <div class="modal-footer">
                  <button type="submit" class="btn btn-success">Ubah</button>
                  <a href="<?= base_url(); ?>admin/v_produk" class="btn btn-light" data-dismiss="modal">Cancel</a>
                </div>
              </form>
              <!-- Modal add toping -->
              <div class="modal fade" id="addProdukModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-body">
                      <picture class=" form-control-user">
                        <source srcset="" type="image/svg+xml">
                        <img src="<?= base_url('assets/uploads/member/') . $p['buktitrf']; ?>" class="rounded mx-auto mb-3 d-blok" alt="..." style="width: 100%; height:420px">
                      </picture>
                    </div>
                  </div>
                </div>
                <!-- Modal Ends -->
              <?php } ?>
              </div>
          </div>
        </div>
      </div>
    </div>