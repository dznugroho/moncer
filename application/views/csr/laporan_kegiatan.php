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
      <h1>Laporan Kegiatan CSR</h1>
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

		<div class="row"> 
          <div class="form-group col-3">
		<form action="<?php echo site_url('csr/laporan_kegiatan/cari'); ?>" method=POST>

            <select class="form-control" name="bidang" id="bidang">
              <option value="">--Pilih Bidang--</option>
			  	<?php foreach($bidangs as $data):?>
					<option value="<?php echo $data->id;?>">
					<?php echo $data->nama_bidang;?></option>
				<?php endforeach;?>
            </select>
          </div>
          <!-- <div class="form-group col-3">
			<select class="form-control" type="text" name="status_validasi" id="status_validasi" required>
			<option value="">--Pilih Status--</option>
			<option value="1">Belum Terlapor</option>
			<option value="2">Terlapor</option>
			<option value="3">Revisi</option>
			</select>
		  </div> -->
		  
			<input type="hidden" class="form-control" name="status_validasi" 
			id="status_validasi" value="3"> 
	
		  <div class="form-group col-3">
			<select class="form-control" type="text" name="cari" id="cari" required>
			<option value="">--Pilih Aksi--</option>
			<option value=1>Cari</option>
			<option value=2>Print</option>
			</select>
		  </div>
		  <div class="form-group col-3">
		    <div class="btn-group mb-3 btn-group-md" role="group" aria-label="Basic example">
			<button class="btn btn-icon icon-left btn-primary" type="submit" data-toggle="tooltip"
                data-placement="top" title="" data-original-title="Cari / Print"><i class="fa fa-search"></i>
            </button>
			<a href="<?php echo site_url('csr/laporan_kegiatan'); ?>" class="btn btn-icon icon-left btn-danger" 
			    data-toggle="tooltip" data-placement="top" title="" data-original-title="Reset">
			    <i class="fas fa-sync"></i>
			</a>
			</div>
		</form>
		  </div>

		</div>

          <div class="card">
		  
		  
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-sm" id="table-1">
                    <thead>
                      <tr>
					  	<th>No.</th>
                        <!-- <th id="btn-action" >Action</th> -->
                        <!--<th>Status Validasi</th>-->
						<th>Perusahaan Pelaksana CSR</th>
                        <th>Penanggung Jawab CSR</th>
						<th>Anggaran Dana Terpenuhi</th>
						<th>Target Terpenuhi</th>
						<th>Tanggal Rencana Mulai</th>
						<th>Tanggal Selesai</th>
						<!-- <th>Rincian kegiatan</th> -->
						<th>File Laporan</th>
						<th>Status Pelaksanaan</th>
                        <th>===</th>
					  	<th>Nama Bidang</th>
                        <th>Nama Subbidang</th>
                        <th>Tahun Pengusulan</th>
                        <th>Nama Kegiatan</th>
                        <th>Output Kegiatan</th>
                        <th>Pagu Anggaran</th>
                        <th>Target</th>
                        <th>Lokasi Kegiatan</th>
                        <th>Institusi Pengusul</th>
                        
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
							<!-- <td class="td-btn">
								<button data-toggle="modal" data-target="#statusDana<?php echo $data->csr_id;?>" 
								class="btn btn-primary btn-sm"> Validasi</button>
							</td> -->
							<?php
								foreach($laporan as $item):
									if ($data->id == $item->usulan_id) {
							?>
							
				 		
							<td><?php echo $item->name;?></td>
							<td><?php if($item->penanggung_jawab == ""){
									echo '-';
								}else {
									echo strtoupper($item->penanggung_jawab);	
								}?>
							</td>
							<td><?php echo 'Rp.'.number_format($item->dana_akhir);?></td>
							<td><?php if($item->jumlah_target == ""){
									echo '-'.'&nbsp; '.$data->nama_satuan; 
								}else{
									echo "$item->jumlah_target".'&nbsp; '.$data->nama_satuan; 
								}?>
							</td>
							<td><?php echo $item->tgl_mulai;?></td>
							<td><?php if($item->tgl_selesai == ""){
									echo '-';
								}else{
									echo $item->tgl_selesai;
								}?>				
							</td>
							<!-- <td><?php if($item->rincian_kegiatan == ""){
									echo '-';
								}else {
									echo $item->rincian_kegiatan;
								}?>
							</td> -->
							<td><?php if($item->file_laporan=="default.pdf" OR 
							$item->file_laporan==""){
								echo '<div class="badge badge-danger" data-toggle="tooltip" 
									data-placement="top" title="" data-original-title="Laporan Belum Diupload">
									<i class="fas fa-times"></i></div>';
							}else{?>
								<button onclick='open("<?php echo site_url('csr/validasi_laporan/embed/'.$item->file_laporan);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm tooltip-info" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							<td><?php date_default_timezone_set('Asia/Jakarta');;
								if($item->tgl_selesai == ""){
									if(date('Y-m-d') < $item->tgl_mulai){
										echo '<div class="badge badge-danger">Belum Terlaksana</div>';

									}elseif(date('Y-m-d') >= $item->tgl_mulai){
										echo '<div class="badge badge-info">Dalam Pelaksanaan</div>';
									
									}
								}else{
									echo '<div class="badge badge-success">Terlaksana</div>';
								}?>		
							</td>
							
							<?php }endforeach;?>
							
							<!-- <td class="td-btn">
								<a href="<?php echo site_url('csr/validasi_laporan/show/'.$data->id);?>" class="btn btn-info btn-sm"> Detail</a>
							</td> -->
                            <td>===</td>
							
							<td><?php echo $data->nama_bidang;?></td>
                            <td><?php echo $data->nama_sub;?></td>
                            <td><?php echo $data->thn_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
                            <td><?php echo $data->hasil_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php echo "$data->jumlah_target".'&nbsp; '.$data->nama_satuan;?></td>
							<td><?php echo $data->alamat_kegiatan;?></td>
                            <td><?php echo $data->name;?></td>
                            
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
	foreach ($laporan as $row):
?>
<div class="modal fade" id="statusDana<?php echo $row->csr_id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_edit">Validasi Laporan Kegiatan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('csr/validasi_laporan/validasilaporan')?>">
			  <div class="modal-body">
			  	<div class="form-group">
					<label>Validasi Status</label>
					<select class="form-control" name="status_validasi" id="status_validasi">
						<option selected disabled>--Pilih Status---</option>
						<option value="2">Terlapor</option>
						<option value="3>Valid</option>
					</select>
				</div>
				<div class="form-group">
                    <label for="">Keterangan</label>
					<textarea class="form-control" name="ket_validasi" value=""></textarea>
				</div>
			  </div>
                <input type="hidden" name="csr_id" value="<?php echo $row->csr_id;?>">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Batal</button>
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
        $('#table-1').DataTable();

		
			
	} );

  </script>
</body>
</html>
