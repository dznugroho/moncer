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
      <h1>Tambah Desa</h1>
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
                <a href="<?= site_url('user/desa')?>" class="btn btn-primary"><i class="fas fa-arrow-left"> Kembali</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
              <form method="POST" action="<?php echo base_url('user/desa/store')?>" enctype="multipart/form-data">
			  
			  <div class="row">
                <div class="form-group col-6">
                    <label for="">Username*</label>
					<input type="text" class="form-control <?php echo form_error('username') ? 'is-invalid':'' ?>" 
					name="username" placeholder="Masukkan Username Anda" value="<?= set_value('username') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('username') ?>
					</div>
                </div>
                <div class="form-group col-6">
                    <label for="">Nama Desa*</label>
					<input type="text" class="form-control <?php echo form_error('name') ? 'is-invalid':'' ?>" 
					name="name" placeholder="Masukkan Nama Anda" value="<?= set_value('name') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('name') ?>
					</div>
				</div>
			  </div>

			  <div class="row">
			   <div class="form-group col-6">
                    <label for="">Email Desa*</label>
					<input type="text" class="form-control <?php echo form_error('email') ? 'is-invalid':'' ?>" 
					name="email" placeholder="Masukkan Email Anda" value="<?= set_value('email') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('email') ?>
					</div>
				</div>
				<div class="form-group col-6">
                    <label for="">Password*</label>
					<input type="password" class="form-control <?php echo form_error('password') ? 'is-invalid':'' ?>" 
					name="password" placeholder="Masukkan Password Anda" value="<?= set_value('password') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('password') ?>
					</div>
				</div>
			  </div>

			  <div class="row">
				<div class="form-group col-6">
					<label>Kecamatan*</label>
					<select class="form-control kecamatan" name="kecamatan" id="kecamatan">
					<option value="">No Selected</option>
					<?php foreach($kecamatans as $data):?>
						<option value="<?php echo $data->id;?>"><?php echo $data->nama_kecamatan;?></option>
					<?php endforeach;?>
					</select>
				</div>
				<div class="form-group col-6">
					<label>Desa*</label>
					<select class="form-control desa" name="desa" id="desa">
						<option value="">No Selected</option>
					</select>
				</div>
			  </div>
			  
			  <div class="row">
				<div class="form-group col-6">
                    <label for="">Alamat*</label>
					<input type="text" class="form-control <?php echo form_error('alamat') ? 'is-invalid':'' ?>" 
					name="alamat" placeholder="Masukkan Alamat Anda" value="<?= set_value('alamat') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('alamat') ?>
					</div>
				</div>
				<div class="form-group col-6">
                    <label for="">No_Telp*</label>
					<input type="text" class="form-control <?php echo form_error('no_telp') ? 'is-invalid':'' ?>" 
					name="no_telp" placeholder="Masukkan No.Telp Anda" value="<?= set_value('no_telp') ?>">
					<div class="invalid-feedback">
					<?php echo form_error('no_telp') ?>
					</div>
				</div>
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
		
	});
</script>

</body>
</html>
