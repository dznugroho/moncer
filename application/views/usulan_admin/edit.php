<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view('include/head.php') ?>
	<!-- CSS Libraries -->
  <link rel="stylesheet" href="<?= base_url()?>assets/modules/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="<?= base_url()?>assets/modules/select.bootstrap4.min.css">  
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
      <h1>Ubah Usulan</h1>
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
                <a href="<?= site_url('usulan/datausulan')?>" class="btn btn-primary"><i class="fas fa-arrow-left"> Kembali</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
              <form method="POST" action="<?php echo base_url('usulan/datausulan/update')?>" enctype="multipart/form-data">
			  
			  <div class="row">
			  	<div class="form-group col-6">
					<label>Bidang*</label>
					<select class="form-control bidang" name="bidang" id="bidang">
						<option value="">No Selected</option>
					<?php foreach($bidangs as $data):?>
						<option <?php if($data->id == $usulan->bidang_id)
						{ echo 'selected="selected"'; 
						} ?> value="<?php echo $data->id ?>">
						<?php echo $data->nama_bidang;?></option>
					<?php endforeach;?>
					</select>
				</div>
				<div class="form-group col-6">
					<label>Subbidang*</label>
					<select class="form-control subbidang" name="subbidang" id="subbidang">
						<option value="">No Selected</option>
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
                    <label for="">Tanggal Pengusulan</label>
					<input type="date" class="form-control <?php echo form_error('tgl_pengusulan') ? 'is-invalid':'' ?>" 
					name="tgl_pengusulan" value="<?= $usulan->tgl_pengusulan ?>">
					<div class="invalid-feedback">
					<?php echo form_error('tgl_pengusulan') ?>
				</div>
				<div class="form-group col-6">
                    <label for="">Nama Kegiatan</label>
					<input type="text" class="form-control <?php echo form_error('nama_kegiatan') ? 'is-invalid':'' ?>" 
					name="nama_kegiatan" value="<?= $usulan->nama_kegiatan ?>">
					<div class="invalid-feedback">
					<?php echo form_error('nama_kegiatan') ?>
					</div>
				</div>
			  </div>
			
			  <!-- <div class="row">
			   <div class="form-group col-6">
                    <label for="">Waktu Mulai</label>
					<input type="date" class="form-control <?php echo form_error('waktu_mulai') ? 'is-invalid':'' ?>" 
					name="waktu_mulai" value="<?= $usulan->waktu_mulai ?>">
					<div class="invalid-feedback">
					<?php echo form_error('waktu_mulai') ?>
					</div>
				</div>
				<div class="form-group col-6">
                    <label for="">Waktu Selesai</label>
					<input type="date" class="form-control <?php echo form_error('waktu_selesai') ? 'is-invalid':'' ?>" 
					name="waktu_selesai" value="<?= $usulan->waktu_selesai ?>">
					<div class="invalid-feedback">
					<?php echo form_error('waktu_selesai') ?>
					</div>
				</div>
			  </div> -->
			  <div class="row">
				<div class="form-group col-6">
					<label>Kecamatan*</label>
					<select class="form-control kecamatan" name="kecamatan" id="kecamatan">
					<option value="">No Selected</option>
					<?php foreach($kecamatans as $data):?>
						<option <?php if($data->id == $usulan->kecamatan_id){ echo 'selected="selected"'; } ?> value="<?php echo $data->id ?>">
						<?php echo $data->nama_kecamatan;?></option>
					<?php endforeach;?>
					</select>
				</div>
				<div class="form-group col-6">
					<label>Desa*</label>
					<select class="form-control desa" name="desa" id="desa">
						<option value="">No Selected</option>
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
                    <label for="">Anggaran Dibutuhkan</label>
					<input type="text" class="form-control <?php echo form_error('anggaran') ? 'is-invalid':'' ?>" 
					name="anggaran" value="<?= $usulan->anggaran ?>">
					<div class="invalid-feedback">
					<?php echo form_error('anggaran') ?>
					</div>
				</div>
			  </div>

			  <div class="row">
				<div class="form-group col-12">
                    <label for="">Deskripsi Kegiatan</label>
					<textarea class="form-control <?php echo form_error('deskripsi') ? 'is-invalid':'' ?>" 
					name="deskripsi"><?= $usulan->deskripsi ?></textarea>
					<div class="invalid-feedback">
					<?php echo form_error('deskripsi') ?>
					</div>
				</div>
			  </div>

			  <div class="row">
				<div class="form-group col-6">
                    <label for="">Nama Pengusul</label>
					<input type="text" class="form-control <?php echo form_error('nama_pengusul') ? 'is-invalid':'' ?>" 
					name="nama_pengusul" value="<?= $usulan->nama_pengusul ?>">
					<div class="invalid-feedback">
					<?php echo form_error('nama_pengusul') ?>
					</div>
				</div>
			  </div>
			  
			  <div class="row">
				<div class="form-group col-6">
                    <label for="">Nama Institusi Pengusul</label>
					<input type="text" class="form-control" name="nama_institusi" 
					value="<?= $usulan->name ?>" readonly>
				</div>
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
			  </div>

			  <div class="row">
			  <div class="form-group col-6">
					<label>Desa Pengusul</label>
					<select class="form-control desa_pengusul" name="desa_pengusul" id="desa_pengusul">
					<option disabled>No Selected</option>
					<?php foreach($desas as $item):?>
						<option <?php if($item->id == $usulan->desa)
						{ echo 'selected="selected"'; } ?> value="<?php echo $item->id ?>">
						<?php echo $item->nama_desa;?></option>
					<?php endforeach;?>
					</select>
				</div>	
				<div class="form-group col-6">
                    <label for="">Alamat Pengusul</label>
					<input type="text" class="form-control" name="alamat_pengusul" 
					value="<?= $usulan->alamat; ?>" readonly>
				</div>
			  </div>

			  <div class="row">
				<div class="form-group col-6">
                    <label for="">No Telp</label>
					<input type="text" class="form-control" name="no_telp" readonly
					value="<?= $usulan->no_telp; ?>">
				</div>
				<div class="form-group col-6">
                    <label for="">File*</label><span class="text-danger mb-1"> PDF|DOC|DOCX</span>
					<input type="file" class="form-control" name="file">
					<input type="hidden" name="old_file" value="<?php echo $usulan->file ?>" />
				</div>
				<input type="hidden" class="form-control" name="id" value="<?= $usulan->id ?>">
			  </div>
			    <div class="form-group small text-danger">
					* required fields
                <div class="card-footer text-right">
                  <button type="submit" class="btn btn-primary btn-lg">
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
				url : "<?php echo site_url('usulan/datausulan/getsubbidang');?>",
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
		
	});
</script>

</body>
</html>
