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
                <table class="table table-sm" id="mytable">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Action</th>
                        <th>Status Pengajuan</th>
                        <th>Nama Bidang</th>
                        <th>Nama Subbidang</th>
                        <th>Tahun Pengusulan</th>
                        <th>Nama Kegiatan</th>
                        <th>Output Kegiatan</th>
                        <th>Pagu Anggaran</th>
                        <th>Target</th>
                        <th>Lokasi Kegiatan</th>
                        <th>Institusi Pengusul</th>
                        <th>File</th>
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
							<td class="td-btn">
								<button data-toggle="modal" data-target="#validasiModal<?php echo $data->id;?>" 
								class="btn btn-primary btn-sm"> Validasi</button>
							</td>
							<td>
								<?php if ($data->status_pengajuan == '1'){
									echo '<div class="badge badge-warning">Proses</div>';

								}else if ($data->status_pengajuan == '2'){
									echo '<div class="badge badge-success">Setuju</div>';

								}else if ($data->status_pengajuan == '3'){
									echo '<div class="badge badge-danger">Tolak</div>';
								}
								;?>
							</td>
							<td><?php echo $data->nama_bidang;?></td>
                            <td><?php echo $data->nama_sub;?></td>
                            <td><?php echo $data->thn_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
                            <td><?php echo $data->hasil_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php echo $data->jumlah_target.'&nbsp;'.$data->nama_satuan; ?></td>
							<td><?php echo $data->alamat_kegiatan;?></td>
                            <td><?php echo $data->name;?></td>
							<td><?php if($data->file=="default.pdf" OR $data->file==""){
								echo "Proposal belum diupload";
							}else{?>
								<button onclick='open("<?php echo site_url('usulan/datausulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm tooltip-info" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							
							<!-- <td class="td-btn">
								<a href="<?php echo site_url('usulan/validasi_usulan/show/'.$data->id);?>" class="btn btn-info btn-md"> Detail</a>
							</td> -->
                    							
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
<div class="modal fade" id="validasiModal<?php echo $row->id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal_edit">Validasi Usulan</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('usulan/validasi_usulan/validasi')?>">
			  <div class="modal-body">
			  	<div class="form-group">
					<label>Status Pengajuan</label>
					<select class="form-control" name="status_pengajuan" id="status_pengajuan">
						<option selected disabled>--Pilih Status--</option>
						<option value="2">Terima</option>
						<option value="3">Tolak</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-3">Keterangan</label>
					<div class="col-xs-8">
                    	<input name="id" value="<?php echo $row->id;?>" class="form-control" type="hidden">
						<textarea class="form-control" name="ket_pengajuan" placeholder="Keterangan data yang belum tercukupi ..."></textarea>
					</div>
				</div>
			  </div>
                <input name="status" class="form-control" type="hidden" value="3">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Validasi</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </form>
            </div>
            </div>
        </div>

<?php endforeach;?>

  <?php $this->load->view('include/footer.php') ?>

  <?php $this->load->view('include/script.php') ?>
	<!-- Page Specific JS File -->

	<script src="<?= base_url('assets/modules/jquery.dataTables.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/dataTables.bootstrap4.min.js')?>"></script>
  <script src="<?= base_url('assets/modules/select.bootstrap4.min.js')?>"></script>
	
  <script src="<?= base_url('assets/js/page/modules-datatables.js')?>"></script>
	

	<script type="text/javascript">
    $(document).ready( function () {
        $('#mytable').DataTable();
		} );
		
		// function approveConfirm(url){
		// $('#btn-terima').attr('href', url);
		// $('#approveModal').modal();
		// }
 
  </script>
</body>
</html>
