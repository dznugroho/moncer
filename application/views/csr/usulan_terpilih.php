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
                        <th>Tahun Pengusulan</th>
                        <th>Nama Kegiatan</th>
                        <th>Waktu Mulai</th>
                        <th>Waktu Selesai</th>
                        <th>Anggaran Dibutuhkan</th>
                        <th>File</th>
                        <th>Status Pilihan</th>
                        <th id="btn-action">Action</th>
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
                            <td><?php echo $data->tahun_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
                            <td><?php echo $data->waktu_mulai;?></td>
                            <td><?php echo $data->waktu_selesai;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php if($data->file=="default.pdf"){
								echo "File tidak ada";
							}else{?>
								<button onclick='open("<?php echo site_url('usulan/datausulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-primary btn-md tooltip-primary" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							<td><?php if($data->status_pilihan == '1'){
									echo  '<div class="badge badge-warning badge-lg">Dalam Proses</div>';
								}else if ($data->status_pilihan == '2'){
									echo '<div class="badge badge-success">Telah Diproses</div>';
								}else if ($data->status_pilihan == '1' OR $data->status_pilihan == '3' ){
									echo '<div class="badge badge-warning">Dalam Proses</div>';
								};?>
							</td>
							<td class="td-btn">
								<a href="<?php echo site_url('csr/usulan_terpilih/show/'.$data->id);?>" class="btn btn-info btn-md"> Tinjau</a>
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
		

	// <?php if($this->session->userdata('id') == $data->id){ ?>
	
	// 		$(document).ready(function(){
		
	// 			$("#btn-action").remove();
		
	// 			$(".td-btn").remove();
		
	// 		});
	// <?php ?>
		
	// 	// <?php } else if($this->session->userdata('role') == "0"){ ?>
		
	// 	// 	$(document).ready(function(){
		
	// 	// 		$("#btn-action").remove();
		
	// 	// 		$(".td-btn").remove();
		
	// 	// 	});
	
	// <?php } else {}; ?>
 
  </script>
</body>
</html>
