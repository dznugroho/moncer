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
      <h1>Data Usulan Kegiatan</h1>
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
            <select class="form-control" name="bidang" id="bidang">
              <option value="">Pilih Bidang</option>
			  	<?php foreach($bidangs as $data):?>
					<option value="<?php echo $data->id;?>">
					<?php echo $data->nama_bidang;?></option>
				<?php endforeach;?>
            </select>
          </div>
          <div class="form-group col-3">
            <form action="<?php echo site_url('perusahaan/datausulan/cari'); ?>" method=POST>
              <select class="form-control" type="text" name="subbidang" id="subbidang">
                <option value="">Pilih Subbidang</option>
              </select>
            </div>
            <div class="form-group col-3">
              <input type="text" class="form-control" name="thn_pengusulan" 
			  id="thn_pengusulan" placeholder="Masukkan Tahun Usulan"> 
            </div>
              <div class="form-group col-3">
                  <button class="btn btn-icon icon-left btn-primary" type="submit"><i class="fa fa-search"></i></button>
                  <a href="<?php echo site_url('perusahaan/datausulan'); ?>" class="btn btn-icon icon-left btn-danger" ><i class="fas fa-sync"></i> Reset</a>
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
                        <!-- <th id="btn-action">&nbsp;</th> -->
                        <th id="btn-action">Action</th>
                        <!-- <th id="btn-action">&nbsp;</th> -->
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
								echo '<div class="badge badge-danger">Proposal Belum Diupload</div>';
							}else{?>
								<button onclick='open("<?php echo site_url('perusahaan/datausulan/embed/'.$data->file);?>",
								"displayWindow","width=700,height=600,status=no,toolbar=no,menubar=no,left=355");'
								class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Lihat Data">LihatFile</button>
							<?php } ?>

							</td>
							
							<td class="td-btn">
								<a href="<?php echo site_url('perusahaan/datausulan/pilih/'.$data->id);?>" 
								class="btn btn-primary btn-md">Pilih</a>
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
    $(document).ready( function () {
        $('#table-1').DataTable();

		$('#bidang').change(function(){ 
			var id=$(this).val();
			$.ajax({
				url : "<?php echo site_url('perusahaan/datausulan/getsubbidang');?>",
				method : "POST",
				data : {id: id},
				async : true,
				dataType : 'json',
				success: function(data){
					
					var html = '';
					var i;
					for(i=0; i<data.length; i++){
						html += '<option value='+data[i].id+'>'+data[i].nama_sub+'</option>';
					}
					$('#subbidang').html(html);

				}
			});
			return false;

		}); 	
		
	} );
		
		function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}
 
 
  </script>
</body>
</html>
