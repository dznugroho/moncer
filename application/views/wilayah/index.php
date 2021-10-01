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
      <h1>Data Wilayah</h1>
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
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped hover" id="table-1">
                    <thead>
                      <tr>
                        <th>Nomor </th>
                        <th>Kode Wilayah</th>
                        <th>Desa</th>
                        <th>Kecamatan</th>
                        <th>Kabupaten</th>
                        <th>Provinsi</th>
                        <!-- <th id="btn-action">Action</th> -->
                      </tr>
                    </thead>
                    <tbody>
					<?php
						$no = 0;
						foreach($wilayahs as $data):
						$no++;
					?>
						<tr>
							<td><?= $no;?></td>
							<td><?= $data->id;?></td>
							<td><?= $data->nama_desa;?></td>
							<td><?= $data->nama_kecamatan;?></td>
							<td><?= $data->kabupaten;?></td>
							<td><?= $data->provinsi;?></td>
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
    $(document).ready(function(){
			$('#table-1').DataTable();
		});
		
		function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}
 
	// <?php if($this->session->userdata('role') == "1"){ ?>
	
	// 		$(document).ready(function(){
		
	// 			$(".btn-danger").remove();
		
	// 		});
		
	// 	<?php } else if($this->session->userdata('role') == "0"){ ?>
		
	// 		$(document).ready(function(){
		
	// 			$("#btn-action").remove();
		
	// 			$(".td-btn").remove();
		
	// 		});
	
	// <?php } else {}; ?>
 
  </script>
</body>
</html>