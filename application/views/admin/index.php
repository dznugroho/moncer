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
      <h1>Data Admin</h1>
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
            <div class="card-header">
              <div class="container">
                <div class="row">
              </div>
              <div class="row">
                <a href="<?= site_url('user/admin/create')?>" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"> Tambah Admin</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped hover" id="mytable">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>Kecamatan</th>
                        <th>Desa</th>
                        <th>Alamat</th>
                        <th>No. Telp</th>
                        <th id="btn-action" width="60px">Action</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php
						$no = 0;
						foreach($admins as $data):

						$no++;
					?>
						<tr>
							<td><?= $no;?></td>
							<td><?= $data->username;?></td>
							<td><?= $data->name;?></td>
							<td><?= $data->email;?></td>
							<td><?= $data->nama_kecamatan;?></td>
							<td><?= $data->nama_desa;?></td>
							<td><?= $data->alamat;?></td>
							<td><?= $data->no_telp;?></td>
							</td>
							<td class="td-btn">
							<a href="<?php echo site_url('user/admin/edit/'.$data->id);?>" class="btn btn-primary btn-sm"><i class="far fa-edit"></a></i>
							<a onclick="deleteConfirm('<?php echo site_url('user/admin/delete/'.$data->id) ;?>')" class="btn btn-danger btn-sm" 
								href="#"><i class="fas fa-trash"></a></i>
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
//   function timedRefresh(timeoutPeriod) {
// 	setTimeout("location.reload(true);",timeoutPeriod);
// 	}

// 	window.onload = timedRefresh(5000);

   $(document).ready(function(){
			$('#mytable').DataTable();
		});	
		
		function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}

 
  </script>
</body>
</html>
