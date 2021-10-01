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
      <h1>Detail Pendanaan</h1>
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
			<?php echo $this->session->flashdata('success'); ?>
			</div>
		</div>
		<?php endif;?>

          <div class="card">
		    <div class="card-header">
              <div class="container">
                <div class="row">
              </div>
              <div class="row">
				<a href="<?= site_url('csr/dana_csr')?>" class="btn btn-primary">
				<i class="fas fa-arrow-left"> Kembali</a></i>
              </div>			  
				
              </div>
			  <?if ($usulan->status_pendanaan == '1'){
						echo '<div class="badge badge-success">Dibuka</div>';
					}else if ($usulan->status_pendanaan == '2'){
						echo '<div class="badge badge-danger">Ditutup</div>';
					};?>
            </div>
			
            

            <div class="card-body">
			<div class="table-responsive">
                <table class="table table-striped hover" id="table-1">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Nama Perusahaan</th>
                        <th>Kecamatan</th>
                        <th>Alamat</th>
                        <th>No. Telp</th>
                        <th>Email</th>
                        <th>Dana CSR</th>
                      </tr>
                    </thead>
                    <tbody>
					<?php
						$no = 0;
						foreach($perusahaan as $data):
							$dana[] = $data->dana;
							$total_dana = array_sum($dana);

						$no++;
					?>
						<tr>
							<td><?php echo $no;?></td>
                            <td><?php echo $data->name;?></td>
                            <td><?php echo $data->nama_kecamatan;?></td>
                            <td><?php echo $data->alamat;?></td>
                            <td><?php echo $data->no_telp;?></td>
                            <td><?php echo $data->email;?></td>
							<td><?php echo 'Rp.'.number_format($data->dana);?></td>
						
							
							<!-- <td class="td-btn">
								<button data-toggle="modal" data-target="#acceptModal<?php echo $data->id;?>" href="#" class="btn btn-success"> Terima</button>
							</td>
							<td class="td-btn">
								<button data-toggle="modal" data-target="#rejectModal<?php echo $data->id;?>" href="#" class="btn btn-danger"> Tolak</button>

							</td> -->
							
						</tr>
					<?php endforeach; ?>
					</tbody>
							
						<tr>
							<th colspan="6">Total Dana</th>
							<td><?php echo 'Rp.'.number_format($total_dana);?></td>
						</tr>
			
				</table>
			  </div>
            </div>
		  </div>
		  	  
          <div class="card">
          <div class="container">
			
            <div class="row">		  
		  
		  
            <div class="card-body">		  
			<table class="table table-striped" id="table-1">
						
				<tr>
					<th colspan="3">Nama Bidang</th>
					<td><?php echo $usulan->nama_bidang; ?></td>
					
					<th colspan="3">Nama Subbidang</th>
					<td><?php echo $usulan->nama_sub; ?></td>
				</tr>
				<tr>
					<th colspan="3">Tahun Pengusulan</th>
					<td><?php echo $usulan->tgl_pengusulan;?></td>
				
					<th colspan="3">Nama Kegiatan</th>
					<td><?php echo $usulan->nama_kegiatan;?></td>
				</tr>
				<tr>
					<th colspan="3">Anggaran Dibutuhkan</th>
					<td><?php echo 'Rp. '.number_format($usulan->anggaran);?></td>
				
					<th colspan="3">Kecamatan Kegiatan</th>
					<td><?php echo $usulan->nama_kecamatan; ?></td>

				</tr>
				<tr>
					<th colspan="3">Desa Kegiatan</th>
					<td><?php echo $usulan->nama_desa; ?></td>

					<th colspan="3">Alamat Kegiatan</th>
					<td><?php echo $usulan->alamat_kegiatan;?></td>
				</tr>
				<tr>
					<th colspan="3">Deskripsi Kegiatan</th>
					<td><?php echo $usulan->deskripsi;?></td>
				
					<th colspan="3">Nama Pengusul</th>
					<td><?php echo $usulan->nama_pengusul;?></td>
				</tr>
				<tr>
					<th colspan="3">Nama Institusi Pengusul</th>
					<td><?php echo $this->session->userdata('name');?></td>
				
					<th colspan="3">Kecamatan Pengusul</th>
					<td><?php echo $usulan->nama_kecamatan; ?></td>

				</tr>
				<tr>
					<th colspan="3">Desa Pengusul</th>
					<td><?php echo $usulan->nama_desa; ?></td>

				
					<th colspan="3">Alamat Pengusul</th>
					<td><?php echo $this->session->userdata('alamat') ;?>
					</td>
				</tr>
				<tr>
					<th colspan="3">No. Telp</th>
					<td><?php echo $this->session->userdata('no_telp');?></td>
				
					<th colspan="3">File</th>
					<td><?php if($usulan->file=="default.pdf"){
							echo "File tidak ada";
							}else{?>
								<button onclick='open("<?php echo site_url('usulan/datausulan/embed/'.$usulan->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-md tooltip-primary" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ;?>

					</td>
				</tr>
			</table>
			</div>
			

			</div>		
          </div>
        </div>
      </div>
    </div>
</section>
</div>

<!-- <?php
	foreach ($perusahaan as $row):
?>
<div class="modal fade" id="acceptModal<?php echo $row->id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal_edit">Are You Sure?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('csr/usulan_terpilih/terima')?>">
			  <div class="modal-body">
			  	<input type="hidden" name="id" value="<?php echo $row->id;?>" class="form-control">
			  	<input type="hidden" name="usulan_id" value="<?php echo $row->usulan_id;?>" class="form-control">
				
				<div class="form-group">
					<label class="control-label col-xs-3">Nama Perusahaan</label>
					<div class="col-xs-8">
						<input name="nama_perusahaan" value="<?php echo $row->name;?>" class="form-control" type="text" readonly>
					</div>
				</div>
			  	<div class="form-group">
					<label class="control-label col-xs-3" >Status Perusahaan</label>
					<div class="col-xs-8">
						<select name="status_pilihan" class="form-control" required>
						<option value="2">Terima</option>
						</select>
					</div>
				</div>
			  </div>
                <input name="status" class="form-control" type="hidden" value="3">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </form>
            </div>
            </div>
        </div>

<?php endforeach;?>

<?php
	foreach ($perusahaan as $row):
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
            <form class="form-horizontal" method="post" action="<?php echo base_url('csr/usulan_terpilih/tolak')?>">
			  <div class="modal-body">
			  	<input type="hidden" name="id" value="<?php echo $row->id;?>" class="form-control">
				
				<div class="form-group">
					<label class="control-label col-xs-3">Nama Perusahaan</label>
					<div class="col-xs-8">
						<input name="nama_perusahaan" value="<?php echo $row->name;?>" class="form-control" type="text" readonly>
					</div>
				</div>
			  	<div class="form-group">
					<label class="control-label col-xs-3" >Status Perusahaan</label>
					<div class="col-xs-8">
						<select name="status_pilihan" class="form-control" required>
						<option value="3">Tolak</option>
						</select>
					</div>
				</div>
			  </div>
                <input name="status" class="form-control" type="hidden" value="3">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </form>
            </div>
            </div>
        </div>

<?php endforeach;?> -->



  <?php $this->load->view('include/footer.php') ?>

	<?php $this->load->view("include/modal.php") ?>

  <?php $this->load->view('include/script.php') ?>
	<!-- Page Specific JS File -->

<script type="text/javascript">
	$(document).ready( function () {
        $('#table-1').DataTable();
		} );
	
	function approveConfirm(url){
		$('#btn-terima').attr('href', url);
		$('#approveModal').modal();
		}
</script>

</body>
</html>
