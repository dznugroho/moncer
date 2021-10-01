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
                        <th>Anggaran Dibutuhkan</th>
                        <th>Status Pengajuan</th>
                        <th id="btn-action">&nbsp;</th>
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
                            <td><?php echo $data->tgl_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php if($data->status_pengajuan == '1'){
									echo  '<div class="badge badge-warning badge-lg">Proses Review</div>';
								}else if ($data->status_pengajuan == '2'){
									echo '<div class="badge badge-success">Diterima</div>';
								}else{
									echo '<div class="badge badge-danger">Ditolak</div>';
								};?>
							</td>
							<td class="td-btn">
								<a href="<?php echo site_url('usulan/usulan_ditolak/show/'.$data->id);?>" class="btn btn-info btn-md"> Detail</a>
							</td>
							<td class="td-btn">
								<a onclick="approveConfirm('<?php echo site_url('usulan/usulan_ditolak/terima/'.$data->id) ;?>')" 
								href="#" class="btn btn-success btn-md"> Terima</a>
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

<?php
	foreach ($usulans as $row):
?>
<div class="modal fade" id="rejectModal<?php echo $row->id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal_edit">Are You Sure?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('usulan/usulan_masuk/tolak')?>">
			  <div class="modal-body">
				<div class="form-group">
					<label class="control-label col-xs-3">Keterangan</label>
					<div class="col-xs-8">
                    	<input name="id" value="<?php echo $row->id;?>" class="form-control" type="hidden">
						<input type="text" class="form-control" name="ket_pengajuan" placeholder="Keterangan data yang belum tercukupi ...">
					</div>
				</div>
			  </div>
                <input name="status" class="form-control" type="hidden" value="1">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Reject</button>
                    <button class="btn btn-warning" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </form>
            </div>
            </div>
        </div>

<?php endforeach;?>

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
		
		function approveConfirm(url){
		$('#btn-terima').attr('href', url);
		$('#approveModal').modal();
		}
 

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
