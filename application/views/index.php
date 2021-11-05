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
      <h1>Dashboard</h1>
    </div>
    <div class="row">
    <?php if( $this->session->userdata('role') == 1){ ?>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-primary">
            <i class="far fa-user"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Perusahaan</h4>
            </div>
            <div class="card-body">
             
                 <?php echo count($total_perusahaan); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-danger">
            <i class="fas fa-comment-alt"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Usulan Kegiatan</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_masuk); ?>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-warning">
            <i class="fas fa-check"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Usulan Belum Validasi</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_validasi); ?>

            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-success">
            <i class="fas fa-tasks"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Laporan</h4>
            </div>
            <div class="card-body">
            <?php echo count($laporan); ?>
              
            </div>
          </div>
        </div>
      </div>
    <?php }else { ?>

      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-primary">
            <i class="far fa-user"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Perusahaan</h4>
            </div>
            <div class="card-body">
             
                 <?php echo count($total_perusahaan); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-danger">
            <i class="fas fa-comment-alt"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Usulan Kegiatan</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_diterima); ?>
            </div>
          </div>
        </div>
      </div>

    <?php } ?>

    </div>    
</section>
</div>

  <?php $this->load->view('include/footer.php') ?>

	<?php $this->load->view('include/script.php') ?>
	
  <!-- Page Specific JS File -->
  <!-- <script src="<?= base_url()?>assets/js/page/index-0.js"></script> -->

</body>
</html>
