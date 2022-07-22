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
      <h1>Laporan Kegiatan</h1>
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
                <table class="table table-sm" id="table-1">
                    <thead>
                      <tr>
					  	<th>No.</th>
                        <th id="btn-action" >Action</th>
                        <th>Konfirmasi Desa</th>
                        <th>Status Laporan</th>
						<th>Perusahaan Pelaksana CSR</th>
                        <th>Penanggung Jawab</th>
						<th>Anggaran Dana Terpenuhi</th>
						<th>Jumlah Target Terpenuhi</th>
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
							
							<?php
								foreach($laporan as $item):
									if ($data->id == $item->usulan_id) {
							?>
							<?php if ($item->status_validasi == 1){ ?>
							<td class="td-btn">
								<a href="<?php echo site_url('csr/laporan_kegiatan/edit/'.$data->csr_id);?>"
								class="btn btn-primary btn-sm"><i class="far fa-edit"></a></i>
							</td>
							<?php }elseif ($item->status_validasi == 2){ ?>
							<td class="td-btn">
								<a href="<?php echo site_url('csr/laporan_kegiatan/edit/'.$data->csr_id);?>"
								class="btn btn-primary btn-sm"><i class="far fa-edit"></a></i>
							</td>
							<?php }else{ ?>
							<td>
								<div class="badge badge-success"><i class="fas fa-check"></i></div>
							</td>
							<?php } ;?>
							
                            <td><?php if ($item->konfirmasi_desa == 1){
									echo '<div class="badge badge-warning" data-toggle="tooltip" data-placement="top"
								title="" data-original-title="Belum ada konfirmasi"><i class="far fa-hourglass"></i>
								</div>';
								}elseif ($item->konfirmasi_desa == 2){
									echo '<div class="badge badge-danger" data-toggle="tooltip" data-placement="top"
								title="" data-original-title="Belum Terlaksana"><i class="fas fa-times"></i></div>';
								}else{
									echo '<div class="badge badge-success" data-toggle="tooltip" data-placement="top"
								title="" data-original-title="Terlaksana"><i class="fas fa-check"></i></div>';
								};?>
							</td>
							<td><?php if ($item->status_validasi == 1){
									echo '<div class="badge badge-dark">Belum Terlapor</div>';
								}elseif ($item->status_validasi == 2){
									echo '<div class="badge badge-info">Terlapor</div>';
								}else{
									echo '<div class="badge badge-success">Diterima</div>';
								};?>
							</td>
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
							$fill = $item->file_laporan;
							$aksi = site_url('csr/laporan_kegiatan/addFile');
							$tampil = 
<<<HEREDOCS
							<form action="$aksi" method="post" enctype="multipart/form-data" >
								<input type="file" name="file_laporan">             
								<input type="hidden" name="csr_id" value="$item->csr_id">
								<br>
								<button type="submit" class="btn btn-primary btn-sm"
								data-toggle="tooltip" data-placement="top"> Upload File</button>
							</form>
HEREDOCS;
							echo $tampil;
							}else{?>
								<button onclick='open("<?php echo site_url('csr/laporan_kegiatan/embed/'.$item->file_laporan);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm tooltip-info" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							<td><?php date_default_timezone_set('Asia/Jakarta');
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
