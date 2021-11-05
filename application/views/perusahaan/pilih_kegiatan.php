<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view('include/head.php') ?>
	<!-- CSS Libraries -->
	<link rel="stylesheet" href="<?= base_url('assets/modules/dataTables.bootstrap4.min.css')?>">
  	<link rel="stylesheet" href="<?= base_url('assets/modules/select.bootstrap4.min.css')?>">  
</head>
<body>
  <div id="app">
    <div class="main-wrapper">
	  <div class="navbar-bg"></div>
	  
	  <?php $this->load->view('include/navbar.php') ?>
	  
	  <?php $this->load->view('include/sidebar.php') ?>

<!-- Main Content -->
<div class="main-content">
<section class="section">
    <div class="section-header">
      <h1>Pilih Kegiatan</h1>
	  <?php $this->load->view('include/breadcrumb.php') ?>
    </div>

    <div class="section-body">
      
      <div class="row">
	  	<div class="col-12">

		<?php if($this->session->flashdata('success')): ?>
		<div class="alert alert-success alert-dismissible show fade">
			<div class="alert-body">
			<button class="close" data-dismiss="alert">
				<span>×</span>
			</button>
			<?php echo $this->session->flashdata('success'); ?>
			</div>
		</div>
		<?php endif;?>

          <div class="card">
		    <!-- <div class="card-header">
				<h4><a href="<?= site_url('perusahaan/datausulan')?>" class="btn btn-primary">
				<i class="fas fa-arrow-left"> Kembali</a></i></h4>
				<h4>PENAWARAN KESEPAKATAN PELAKSANAAN KEGIATAN CSR</h4>           	
              
			</div> -->

            <div class="card-body">
			<div class="table-responsive">
                <table class="table table-sm" id="table-1">
					<tr>
						<th colspan ="6">	
						<div class="alert alert-primary mb-2 mt-0" role="alert">PENAWARAN KESEPAKATAN PELAKSANAAN KEGIATAN CSR</div>
						</th>	
					</tr>
					<tr>
						<th colspan="2">Nama Bidang</th>
						<td> : </td>
						<?php foreach($bidangs as $data):?>
						<?php if($data->id == $usulan->bidang_id){ ?>
							<td><b><?php echo strtoupper($data->nama_bidang); }?></b></td>
						<?php endforeach;?>
					</tr>
					
					<tr>
						<th colspan="2">Nama Kegiatan </th>
						<td> : </td>
						<td><b><?php echo strtoupper($usulan->nama_kegiatan);?></b></td>
					</tr>
					<tr>
						<th colspan="2">Output Kegiatan</th>
						<td> : </td>
						<td><?php echo strtoupper($usulan->hasil_kegiatan);?></td>
					</tr>
					<tr>
						<th colspan="2">Anggaran Dibutuhkan</th>
						<td> : </td>
						<td><?php echo 'Rp. '.number_format($usulan->anggaran);?></td>
					</tr>
					<tr>
						<th colspan="2">Jumlah Target</th>
						<td> : </td>
						<td><?php echo $usulan->jumlah_target.'&nbsp;'.$usulan->nama_satuan;?></td>
					</tr>
					<tr>
						<th colspan="2">Alamat Kegiatan</th>
						<td> : </td>
						<td><?php echo strtoupper($usulan->alamat_kegiatan);?></td>
					</tr>
					<tr>
						<th colspan="2">Nama Pengusul</th>
						<td> : </td>
						<td><?php echo strtoupper($usulan->nama_pengusul);?></td>
					</tr>
					
					<tr>
						<th colspan="2">Nama Institusi Pengusul</th>
						<td> : </td>
						<td><?php echo $usulan->name;?></td>
					</tr>

					
					</tbody>
					<tfoot>
					<tr>
						<td>
							<a href="<?= site_url('perusahaan/datausulan')?>" class="btn btn-primary btn-sm">
							<i class="fas fa-arrow-left"> Kembali</a></i>
						</td>
					</tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					</tfoot>
				</table>
			  </div>				
			
			<form method="POST" action="<?php echo base_url('perusahaan/datausulan/pilihkegiatan')?>" enctype="multipart/form-data">
			<div class="alert alert-primary mb-3 mt-0" role="alert">Silahkan lengkapi formulir laporan pekerjaan dibawah ini</div>
				
			<input type="hidden" class="form-control" name="usulan_id" 
			value="<?php echo $usulan->id ;?>">
			
			<input type="hidden" class="form-control" name="perusahaan_id" 
			value="<?php echo $this->session->userdata('id') ;?>">
			
			<!-- <input type="hidden" class="form-control" name="csr_id" 
				value="<?php echo $csr->csr_id ;?>"> -->
			  <div class="row">
			 	<div class="form-group col-12">
                    <label for="">Penanggung Jawab</label>
					<input type="text" class="form-control <?php echo form_error('penanggung_jawab') ? 'is-invalid':'' ?>" 
					name="penanggung_jawab" value="<?= set_value('penanggung_jawab') ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('penanggung_jawab') ?>
					</div>
				</div>
			  </div>
			  <div class="row">
			  	<div class="form-group col-6">
                    <label for="">Rencana Jumlah Target Terpenuhi</label>
					<input type="text" class="form-control <?php echo form_error('jumlah_target') ? 'is-invalid':'' ?>" 
					name="jumlah_target" value="<?= set_value('jumlah_target') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('jumlah_target') ?>
					</div>
				</div>
				<div class="form-group col-6">
                    <label for="">Rencana Pagu Anggaran Terpenuhi</label>
					<input type="text" class="form-control <?php echo form_error('dana') ? 'is-invalid':'' ?>" 
					name="dana" id="dana" value="<?= set_value('dana') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('dana') ?>
					</div>
				</div>
			  </div>

			  <div class="row">
			   <div class="form-group col-6">
                    <label for="">Tanggal rencana kegiatan mulai</label>
					<input type="date" class="form-control <?php echo form_error('tgl_mulai') ? 'is-invalid':'' ?>" 
					name="tgl_mulai" value="<?= set_value('tgl_mulai') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('tgl_mulai') ?>
					</div>
				</div>
				<div class="form-group col-6">
                    <label for="">Tanggal rencana kegiatan selesai</label>
					<input type="date" class="form-control <?php echo form_error('tgl_selesai') ? 'is-invalid':'' ?>" 
					name="tgl_selesai" value="<?= set_value('tgl_selesai') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('tgl_selesai') ?>
					</div>
				</div>
			  </div>
			  
                <div class="card-footer text-right">
                  <button type="submit" class="btn btn-primary btn-md">
                      Simpan
                  </button>
                </div>
            </form>	
					
            </div>
		  </div>
		  	  
			

			</div>		
          </div>
        </div>
      </div>
    </div>
</section>
</div>



<!-- <div class="modal fade" id="pilih<?php echo $usulan->id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal_edit">Status Pendanaan</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('perusahaan/datausulan/inputdana')?>">
			  <div class="modal-body">
			  	<div class="form-group">
                    <label for="">Dana CSR</label>
					<input type="currency" class="form-control" name="dana" value="0"
					placeholder="Masukkan Dana lalu klik Luar">				
				</div>
			  </div>
                <input type="text" name="usulan_id" value="<?php echo $usulan->id;?>">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <button class="btn btn-light" data-dismiss="modal" aria-hidden="true">Batal</button>
                </div>
            </form>
            </div>
            </div>
        </div> -->



  <?php $this->load->view('include/footer.php') ?>

	<?php $this->load->view("include/modal.php") ?>

  <?php $this->load->view('include/script.php') ?>
	<!-- Page Specific JS File -->
	<script src="<?= base_url('assets/modules/jquery.dataTables.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/dataTables.bootstrap4.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/select.bootstrap4.min.js')?>"></script>
	
  <script src="<?= base_url('assets/js/page/modules-datatables.js')?>"></script>

<script type="text/javascript">
	$(document).ready( function () {
        $('#table-1').DataTable();
		} );
	
	var rupiah = document.getElementById('dana');
	rupiah.addEventListener('keyup', function(e){
		// tambahkan 'Rp.' pada saat form di ketik
		// gunakan fungsi formatRupiah() untuk mengubah angka yang di ketik menjadi format angka
		rupiah.value = formatRupiah(this.value, 'Rp. ');
	});

	/ Fungsi formatRupiah /
	function formatRupiah(angka, prefix){
		var number_string = angka.replace(/[^,\d]/g, '').toString(),
		split   		= number_string.split(','),
		sisa     		= split[0].length % 3,
		rupiah     		= split[0].substr(0, sisa),
		ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);

		// tambahkan titik jika yang di input sudah menjadi angka ribuan
		if(ribuan){
			separator = sisa ? '.' : '';
			rupiah += separator + ribuan.join('.');
		}

		rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
		return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
	}

</script>

</body>
</html>
