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
                        <th>Tahun Pengusulan</th>
                        <th>Nama Kegiatan</th>
                        <th>Anggaran Dibutuhkan</th>
                        <!-- <th>File</th> -->
                        <th>Status Pendanaan</th>
                        <th id="btn-action" >Action</th>
                        <th id="btn-action" >Action</th>
                        <th id="btn-action" >&nbsp;</th>
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
							<!-- <td><?php if($data->file=="default.pdf"){
								echo "File tidak ada";
							}else{?>
								<button onclick='open("<?php echo site_url('usulan/datausulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-primary btn-md tooltip-primary" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td> -->
							<td><?php if ($data->status_pendanaan == "1"){
									echo '<div class="badge badge-success">Dibuka</div>';
								}else if ($data->status_pendanaan == '2'){
									echo '<div class="badge badge-danger">Ditutup</div>';
								};?>
							</td>
							<td class="td-btn">
								<a href="<?php echo site_url('csr/dana_csr/show/'.$data->id);?>" class="btn btn-info btn-md"> Tinjau</a>
							</td>
							<td class="td-close">
							
								<a href="<?php echo site_url('csr/dana_csr/tutup/'.$data->id);?>" class="btn btn-danger btn-md"> Tutup</a>
							</td>
							<td class="td-open">
								<a href="<?php echo site_url('csr/dana_csr/buka/'.$data->id);?>" class="btn btn-success btn-md"> Buka</a>
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

	<script src="<?= base_url('assets/modules/jquery.dataTables.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/dataTables.bootstrap4.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/select.bootstrap4.min.js')?>"></script>
	
  <script src="<?= base_url('assets/js/page/modules-datatables.js')?>"></script>

	<script type="text/javascript">
    $(document).ready( function () {
        $('#table-1').DataTable();
		} );
		

	<?php if($data->status_pendanaan == '1'){ ?>
	
			$(document).ready(function(){
	
				$(".td-open").remove();
		
			});
	<?php ?>
		
		<?php } else if($data->status_pendanaan == '2'){ ?>
		
			$(document).ready(function(){
		
				$(".td-close").remove();
		
			});
	
	<?php } else {}; ?>
 
  </script>
</body>
</html>
