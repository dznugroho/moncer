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
      <h1>Data Usulan</h1>
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
				<?php echo $this->session->flashdata('success') ?>
				</div>
			</div>
		<?php endif;?>
		<?php if($this->session->flashdata('fail')): ?>
			<div class="alert alert-danger alert-dismissible show fade">
				<div class="alert-body">
				<button class="close" data-dismiss="alert">
					<span>×</span>
				</button>
				<?php echo $this->session->flashdata('fail') ?>
				</div>
			</div>
		<?php endif;?>
          <div class="card">
           
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped hover" id="table-1">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Nama Bidang</th>
                        <th>Nama Subbidang</th>
                        <th>Tanggal Pengusulan</th>
                        <th>Nama Kegiatan</th>
                        <th>Anggaran Dibutuhkan</th>
                        <th>File</th>
                        <th id="btn-action">&nbsp;</th>
                        <th id="btn-action">Action</th>
                        <th id="btn-action">&nbsp;</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php
						$no = 0;
						foreach($usulans as $data):
						$no++;
					?>
						<tr>
							<td><?php echo $no;?></td>
                            <td><?php echo $data->nama_bidang;?></td>
                            <td><?php echo $data->nama_sub;?></td>
                            <td><?php echo $data->tgl_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php if($data->file=="default.pdf"){
							$fill = $data->file;
							echo 'Tidak Ada File Tersedia';
							}else{?>
								
								<button onclick='open("<?php echo site_url('perusahaan/datausulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm tooltip-primary" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							<td>
								<?php if($data->status_pengajuan == 1) {
									echo '<div class="badge badge-warning">Proses Review</div>';
								}
									elseif($data->status_pengajuan == 2) {
										echo '<div class="badge badge-success">Disetujui</div>';
								}	elseif($data->status_pengajuan == 3) {
										echo '<div class="badge badge-danger">Ditolak</div>';
								}
								?>
							</td>
							<td class="td-btn">
								<a href="<?php echo site_url('perusahaan/pengajuan_usulan/show/'.$data->id);?>" class="btn btn-success btn-sm"><i class="fas fa-search"></a></i>
							</td>
							
							<td>
								<a onclick="deleteConfirm('<?php echo site_url('desa/pengajuan_usulan/delete/'.$data->id) ;?>')" class="btn btn-primary btn-sm" 
								href="#"><i class="fas fa-edit"></a></i>
							</td>
						</tr>
					<?php endforeach; ?>
					</tbody>
				</table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
</div>

  <?php $this->load->view('include/footer.php') ?>

  <?php $this->load->view('include/script.php') ?>
	<!-- Page Specific JS File -->

  <script src="<? echo base_url()?>assets/modules/jquery.dataTables.min.js"></script>
  <script src="<?= base_url()?>assets/modules/dataTables.bootstrap4.min.js"></script>
  <script src="<?= base_url()?>assets/modules/select.bootstrap4.min.js"></script>
	
  <script src="<?= base_url()?>assets/js/page/modules-datatables.js"></script>

	<script type="text/javascript">
    $(document).ready( function () {
        $('#table-1').DataTable();
		} );
		
		function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}
 
  </script>
</body>
</html>
