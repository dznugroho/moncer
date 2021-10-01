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
				<a href="<?= site_url('usulan/usulan_ditolak')?>" class="btn btn-primary">
				<i class="fas fa-arrow-left"> Kembali</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
			<table class="table table-striped" id="table-1">
				
				<tr>
					<th colspan="3">Status Pengajuan</th>
					<td><?php if($usulan->status_pengajuan == '1'){
							echo  '<div class="badge badge-warning badge-lg">Proses Review</div>';
						}else if ($usulan->status_pengajuan == '2'){
							echo '<div class="badge badge-success">Diterima</div>';
						}elseif ($usulan->status_pengajuan == '3'){
							echo '<div class="badge badge-danger">Ditolak</div>';
						};?>
					</td>
				</tr>
				<tr>
					<th colspan="3">Keterangan Penolakan</th>
					<td><div class="badge badge-info"><?php echo strtoupper($usulan->ket_pengajuan); ?></div></td>
				</tr>
				<tr>
					<th colspan="3">Nama Bidang</th>
					<td><?php echo $usulan->nama_bidang; ?></td>
					
				</tr>
				<tr>
					<th colspan="3">Nama Subbidang</th>
					<td><?php echo $usulan->nama_sub; ?></td>
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
					<td><?php echo $usulan->nama_kecamatan; ?></td>

				</tr>
				<tr>
					<th colspan="3">Desa Kegiatan</th>
					<td><?php echo $usulan->nama_desa; ?></td>

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
					<td><?php echo $usulan->nama_kecamatan; ?></td>

				</tr>
				<tr>
					<th colspan="3">Desa Pengusul</th>
					<td><?php echo $usulan->nama_desa; ?></td>

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
							echo "File tidak ada";
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