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
      <h1>Pengajuan Usulan</h1>
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
				<a href="<?= site_url('desa/pengajuan_usulan/create')?>" class="btn btn-icon icon-left btn-primary">
				<i class="fas fa-plus"> Tambah Usulan</a></i>
              </div>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-sm" id="table-1">
				<thead>
                      <tr>
                        <th>No.</th>
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
                        <th>Status Pengajuan</th>
                        <!-- <th>Keterangan</th> -->
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
                            <td><?php echo $data->thn_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
                            <td><?php echo $data->hasil_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php echo $data->jumlah_target.'&nbsp;'.$data->nama_satuan; ?></td>
							<td><?php echo $data->alamat_kegiatan;?></td>
                            <td><?php echo $data->name;?></td>
							<td><?php if($data->file=="default.pdf"
							OR $data->file==""){
							$fill = $data->file;
							$aksi = site_url('desa/pengajuan_usulan/addFile');
							$tampil = 
<<<HEREDOCS
							<form action="$aksi" method="post" enctype="multipart/form-data" >
								<input type="file" name="file">             
								<input type="hidden" name="id" value="$data->id">
								<br>
								<button type="submit" class="btn btn-primary btn-sm"
								data-toggle="tooltip" data-placement="top"> Tambah File</button>
							</form>
HEREDOCS;
							echo $tampil;
							}else{?>
								<button onclick='open("<?php echo site_url('desa/pengajuan_usulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							<?php if($data->status_pengajuan == 1){ ?>
								<td><div class="badge badge-warning"> PROSES</div>
								</td>
							<?php } elseif($data->status_pengajuan == 2){ ?>
								<td><div class="badge badge-success"> DITERIMA</div>
								</td>

							<?php } else{ ?>
								<td><div class="badge badge-danger" data-toggle="tooltip" data-placement="top" title="" 
								data-original-title="<?= strtoupper($data->ket_pengajuan) ;?>"> DITOLAK</div>
								</td>
								
							<?php }; ?>
                            
							
							
							<?php if($data->status_pengajuan == 1){ ?>
							
							<td class="td-btn">
							<div class="btn-group mb-3 btn-group-sm" role="group" aria-label="Basic example">

								<a href="<?php echo site_url('desa/pengajuan_usulan/show/'.$data->id);?>" 
								class="btn btn-success btn-md"><i class="fas fa-search"></a></i>

								<a href="<?php echo site_url('desa/pengajuan_usulan/edit/'.$data->id);?>"
								class="btn btn-primary btn-md"><i class="far fa-edit"></a></i>
							
								<a onclick="deleteConfirm('<?php echo site_url('desa/pengajuan_usulan/delete/'.$data->id) ;?>')" 
								class="btn btn-danger btn-md" href="#"><i class="fas fa-trash"></a></i>
							</div>
							</td>
							
							<?php } elseif($data->status_pengajuan == 2){ ?>
							
							<td class="td-btn">
							<div class="btn-group mb-3 btn-group-sm" role="group" aria-label="Basic example">
							
								<a href="<?php echo site_url('desa/pengajuan_usulan/show/'.$data->id);?>" 
								class="btn btn-success btn-md"><i class="fas fa-search"></a></i>
							</div>
							</td>
							
							<?php } else{ ?>
								
							<td class="td-btn">
							<div class="btn-group mb-3 btn-group-sm" role="group" aria-label="Basic example">

								<a href="<?php echo site_url('desa/pengajuan_usulan/show/'.$data->id);?>" 
								class="btn btn-success btn-md"><i class="fas fa-search"></a></i>

								<a href="<?php echo site_url('desa/pengajuan_usulan/edit/'.$data->id);?>"
								class="btn btn-primary btn-md"><i class="far fa-edit"></a></i>

								<a onclick="deleteConfirm('<?php echo site_url('desa/pengajuan_usulan/delete/'.$data->id) ;?>')" 
								class="btn btn-danger btn-md" href="#"><i class="fas fa-trash"></a></i>
								
							</div>
							</td>
							<?php }; ?>

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
		

		function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}
 
  </script>
</body>
</html>
