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
      <h1>Tambah Admin</h1>
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
				<a href="<?= site_url('usulan/datausulan')?>" class="btn btn-primary">
				<i class="fas fa-arrow-left"> Kembali</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
			<table class="table table-striped" id="table-1">

				<tr>
					<th colspan="3">Nama Bidang</th>
					<?php foreach($bidangs as $data):?>
					<?php if($data->id == $usulan->bidang_id){ ?>
						<td><?php echo $data->nama_bidang; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Nama Subbidang</th>
					<?php foreach($subbidangs as $data):?>
					<?php if($data->id == $usulan->subbidang_id){ ?>
						<td><?php echo $data->nama_sub; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Tahun Pengusulan</th>
					<td><?php echo $usulan->tgl_pengusulan;?></td>
				</tr>
				<tr>
					<th colspan="3">Nama Kegiatan</th>
					<td><?php echo $usulan->nama_kegiatan;?></td>
				</tr>
				
				<tr>
					<th colspan="3">Anggaran Dibutuhkan</th>
					<td><?php echo 'Rp. '.number_format($usulan->anggaran);?></td>
				</tr>
				<tr>
					<th colspan="3">Kecamatan Kegiatan</th>
					<?php foreach($kecamatans as $data):?>
					<?php if($data->id == $usulan->kecamatan_id){ ?>
						<td><?php echo $data->nama_kecamatan; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Desa Kegiatan</th>
					<?php foreach($desas as $data):?>
					<?php if($data->id == $usulan->desa_id){ ?>
						<td><?php echo $data->nama_desa; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Alamat Kegiatan</th>
					<td><?php echo $usulan->alamat_kegiatan;?></td>
				</tr>
				<tr>
					<th colspan="3">Deskripsi Kegiatan</th>
					<td><?php echo $usulan->deskripsi;?></td>
				</tr>
				<tr>
					<th colspan="3">Nama Pengusul</th>
					<td><?php echo $usulan->nama_pengusul;?></td>
				</tr>
				
				<tr>
					<th colspan="3">Nama Institusi Pengusul</th>
					<td><?php echo $this->session->userdata('name');?></td>
				</tr>
				<tr>
					<th colspan="3">Kecamatan Pengusul</th>
					<?php foreach($kecamatans as $data):?>
					<?php if($data->id == $this->session->userdata('kecamatan')){ ?>
						<td><?php echo $data->nama_kecamatan; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Desa Pengusul</th>
					<?php foreach($desas as $data):?>
					<?php if($data->id == $this->session->userdata('desa')){ ?>
						<td><?php echo $data->nama_desa; }?></td>
					<?php endforeach;?>
				</tr>
				<tr>
					<th colspan="3">Alamat Pengusul</th>
					<td><?php echo $this->session->userdata('alamat') ;?>
					</td>
				</tr>
				<tr>
					<th colspan="3">No. Telp</th>
					<td><?php echo $this->session->userdata('no_telp');?></td>
				</tr>
				<tr>
					<th colspan="3">File</th>
					<td><?php if($usulan->file=="default.pdf"){
							$fill = $usulan->file;
							$aksi = site_url('usulan/datausulan/addFile');
							$tampil = 
<<<HEREDOCS
							<form action="$aksi" method="post" enctype="multipart/form-data" >
								<input type="file" name="file">             
								<input type="hidden" name="id" value="$usulan->id">
								<br>
								<button type="submit" class="btn btn-primary btn-sm tooltip-primary"
								data-toggle="tooltip" data-placement="top"> Tambah File</button>
							</form>
HEREDOCS;
							echo $tampil;
							}else{?>
								<button onclick='open("<?php echo site_url('usulan/datausulan/embed/'.$usulan->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-md tooltip-primary" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ;?>

					</td>
				</tr>

			</table>
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
