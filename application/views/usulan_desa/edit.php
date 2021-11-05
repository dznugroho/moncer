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
      <h1>Edit Usulan</h1>
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
		    <div class="card-header">
              <div class="container">
                <div class="row">
              </div>
              <div class="row">
                <a href="<?= site_url('desa/pengajuan_usulan')?>" class="btn btn-primary"><i class="fas fa-arrow-left"> Kembali</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
			<form method="POST" action="<?php echo base_url('desa/pengajuan_usulan/update')?>" enctype="multipart/form-data">
				
				<input type="hidden" class="form-control" name="id" value="<?= $usulan->id ?>">
				<div class="section-title mt-0">DATA USULAN</div>
				<div class="row">
					<div class="form-group col-6">
					  <label>Bidang Kegiatan</label>
					  <select class="form-control bidang" name="bidang" id="bidang">
						  <option selected disabled>--Pilih Bidang--</option>
					  <?php foreach($bidangs as $data):?>
						  <option <?php if($data->id == $usulan->bidang_id)
						  { echo 'selected="selected"'; 
						  } ?> value="<?php echo $data->id ?>">
						  <?php echo $data->nama_bidang;?></option>
					  <?php endforeach;?>
					  </select>
				  </div>
				  <div class="form-group col-6">
					  <label>Subbidang Kegiatan</label>
					  <select class="form-control subbidang" name="subbidang" id="subbidang">
					  <option selected disabled>--Pilih Subbidang--</option>
					  <?php foreach($subbidangs as $data):?>
						  <?php if ($data->id == $usulan->subbidang_id) { ?>
						  <option <?php if ($data->id == $usulan->subbidang_id) {
									  echo 'selected="selected"';
								  } ?> value="<?php echo $data->id ?>">
							  <?php echo $data->nama_sub; ?></option>
  
						  <!-- <?php echo $data->nama_sub; ?></option> -->
  
						  <?php } ?>
  
					  <?php endforeach;?>
					  </select>
				  </div>
				</div>
  
				<div class="row">
					<div class="form-group col-6">
					  <label for="">Nama Kegiatan</label>
					  <input type="text" class="form-control <?php echo form_error('nama_kegiatan') ? 'is-invalid':'' ?>" 
					  name="nama_kegiatan" value="<?= $usulan->nama_kegiatan ?>">
					  <div class="invalid-feedback">
						  <?php echo form_error('nama_kegiatan') ?>
					  </div>
				  </div>
				   <div class="form-group col-6">
					  <label for="">Pagu Anggaran</label>
					  <input type="text" class="form-control <?php echo form_error('anggaran') ? 'is-invalid':'' ?>" 
					  name="anggaran" id="anggaran" value="<?= $usulan->anggaran ?>">
					  <div class="invalid-feedback">
						  <?php echo form_error('anggaran') ?>
					  </div>
				  </div>
				</div>
				<div class="row">
					<div class="form-group col-6">
					  <label for="">Jumlah Target</label>
					  <input type="text" class="form-control <?php echo form_error('jumlah_target') ? 'is-invalid':'' ?>" 
					  name="jumlah_target" value="<?= $usulan->jumlah_target ?>">
					  <div class="invalid-feedback">
						  <?php echo form_error('jumlah_target') ?>
					  </div>
				  </div>
				  <div class="form-group col-6">
					   <label>Satuan</label>
					  <select class="form-control" name="satuan_id" id="satuan_id">
					  <option selected disabled >--Pilih Satuan--</option>
					  <?php foreach($satuan as $data):?>
						  <option <?php if($data->satuan_id == $usulan->satuan_id){ echo 'selected="selected"'; } ?>
						  value="<?php echo $data->satuan_id ?>">
						  <?php echo $data->nama_satuan;?></option>
					  <?php endforeach;?>
					  </select>
				  </div>
				</div>
				<div class="row">	
				  <div class="form-group col-12">
					  <label for="">Output Kegiatan</label>
					  <input type="text" class="form-control <?php echo form_error('hasil_kegiatan') ? 'is-invalid':'' ?>" 
					  name="hasil_kegiatan" value="<?php echo $usulan->hasil_kegiatan;?>">
					  <div class="invalid-feedback">
					  <?php echo form_error('hasil_kegiatan') ?>
					  </div>
				  </div>
				  <input type="hidden" class="form-control" name="tahun_pengusulan" 
				  value="<?php echo $usulan->thn_pengusulan;?>">
				</div>
				<!-- <div class="row">
				 <div class="form-group col-6">
					  <label for="">Waktu Mulai</label>
					  <input type="date" class="form-control <?php echo form_error('waktu_mulai') ? 'is-invalid':'' ?>" 
					  name="waktu_mulai" value="">
					  <div class="invalid-feedback">
					  <?php echo form_error('waktu_mulai') ?>
					  </div>
				  </div>
				  <div class="form-group col-6">
					  <label for="">Waktu Selesai</label>
					  <input type="date" class="form-control <?php echo form_error('waktu_selesai') ? 'is-invalid':'' ?>" 
					  name="waktu_selesai" value="">
					  <div class="invalid-feedback">
					  <?php echo form_error('waktu_selesai') ?>
					  </div>
				  </div>
				</div> -->
				<div class="row">
				  <div class="form-group col-6">
					  <label>Kecamatan</label>
					  <select class="form-control kecamatan" name="kecamatan" id="kecamatan">
					  <option value="">No Selected</option>
					  <?php foreach($kecamatans as $data):?>
						  <option <?php if($data->id == $usulan->kecamatan_id){ echo 'selected="selected"'; } ?> value="<?php echo $data->id ?>">
						  <?php echo $data->nama_kecamatan;?></option>
					  <?php endforeach;?>
					  </select>
				  </div>
				  <div class="form-group col-6">
					  <label>Desa</label>
					  <select class="form-control desa" name="desa" id="desa">
						  <option selected disabled>--Pilih Desa--</option>
  
						  <?php foreach($desas as $data):?>
  
						  <?php if ($data->id == $usulan->desa_id) { ?>
  
						  <option <?php if ($data->id == $usulan->desa_id) {
									  echo 'selected="selected"';
								  } ?> value="<?php echo $data->id ?>">
							  <?php echo $data->nama_desa; ?></option>
  
						  <!-- <?php echo $data->nama_desa; ?></option> -->
  
						  <?php } ?>
  
						  <?php endforeach;?>
					  </select>
				  </div>
				</div>
				
				<div class="row">
				  <div class="form-group col-6">
					  <label for="">Alamat Kegiatan</label>
					  <input type="text" class="form-control <?php echo form_error('alamat_kegiatan') ? 'is-invalid':'' ?>" 
					  name="alamat_kegiatan" value="<?= $usulan->alamat_kegiatan ?>">
					  <div class="invalid-feedback">
					  <?php echo form_error('alamat_kegiatan') ?>
					  </div>
				  </div>
				  <div class="form-group col-6">
					  <label for="">File*</label><span class="text-danger mb-1"> PDF|DOC|DOCX (Masukkan file jika ingin mengubah)</span>
					  <input type="file" class="form-control" name="file">
					  <input type="hidden" name="old_file" value="<?php echo $usulan->file ?>" />
				  </div>
				</div>
  
				<div class="section-title mt-0">DATA PENGUSUL</div>
				<div class="row">
				  <div class="form-group col-6">
					  <label for="">Nama Pengusul</label>
					  <input type="text" class="form-control <?php echo form_error('nama_pengusul') ? 'is-invalid':'' ?>" 
					  name="nama_pengusul" value="<?= $usulan->nama_pengusul ?>">
					  <div class="invalid-feedback">
					  <?php echo form_error('nama_pengusul') ?>
					  </div>
				  </div>
				  <div class="form-group col-6">
					  <label for="">Nama Institusi Pengusul</label>
					  <input type="text" class="form-control" name="nama_institusi" 
					  value="<?= $usulan->name ?>" readonly>
				  </div>
				</div>
				
				<div class="row">
				  <div class="form-group col-6">
					  <label>Kecamatan Pengusul</label>
					  <select class="form-control kecamatan_pengusul" name="kecamatan_pengusul" id="kecamatan_pengusul">
					  <option disabled>No Selected</option>
					  <?php foreach($kecamatans as $data):?>
						  <option <?php if($data->id == $usulan->kecamatan)
						  { echo 'selected="selected"'; } ?> value="<?php echo $data->id ?>">
						  <?php echo $data->nama_kecamatan;?></option>
					  <?php endforeach;?>
					  </select>
				  </div>	
				  <div class="form-group col-6">
					  <label>Desa Pengusul</label>
					  <select class="form-control desa_pengusul" name="desa_pengusul" id="desa_pengusul">
					  <option disabled>No Selected</option>
					  <?php foreach($desas as $data):?>
						  <option <?php if($data->id == $usulan->desa)
						  { echo 'selected="selected"'; } ?> 
						  value="<?php echo $data->id ?>">
						  <?php echo $data->nama_desa;?></option>
					  <?php endforeach;?>
					  </select>
				  </div>	
				</div>
  
				<div class="row">			  
				  <div class="form-group col-6">
					  <label for="">Alamat Pengusul</label>
					  <input type="text" class="form-control" name="alamat_pengusul" 
					  value="<?= $usulan->alamat; ?>" readonly>
				  </div>
				  <div class="form-group col-6">
					  <label for="">No Telp</label>
					  <input type="text" class="form-control" name="no_telp" readonly
					  value="<?= $usulan->no_telp; ?>">
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
</section>
</div>

  <?php $this->load->view('include/footer.php') ?>

	<?php $this->load->view("include/modal.php") ?>

  <?php $this->load->view('include/script.php') ?>
	<!-- Page Specific JS File -->

<script type="text/javascript">
	$(document).ready(function(){

		$('#kecamatan_pengusul').attr('disabled',true);
		$('#desa_pengusul').attr('disabled',true);

		$('#kecamatan').change(function(){ 
			var id=$(this).val();
			$.ajax({
				url : "<?php echo site_url('wilayah/getdesa');?>",
				method : "POST",
				data : {id: id},
				async : true,
				dataType : 'json',
				success: function(data){
					
					var html = '';
					var i;
					for(i=0; i<data.length; i++){
						html += '<option value='+data[i].id+'>'+data[i].nama_desa+'</option>';
					}
					$('#desa').html(html);

				}
			});
			return false;
		}); 

		$('#bidang').change(function(){ 
			var id=$(this).val();
			$.ajax({
				url : "<?php echo site_url('desa/pengajuan_usulan/getsubbidang');?>",
				method : "POST",
				data : {id: id},
				async : true,
				dataType : 'json',
				success: function(data){
					
					var html = '';
					var i;
					for(i=0; i<data.length; i++){
						html += '<option value='+data[i].id+'>'+data[i].nama_sub+'</option>';
					}
					$('#subbidang').html(html);

				}
			});
			return false;
		}); 
		
		var rupiah = document.getElementById('anggaran');
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

	});
</script>

</body>
</html>
