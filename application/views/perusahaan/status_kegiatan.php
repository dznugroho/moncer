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
      <h1>Status Kegiatan CSR</h1>
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
                        <th>Status Validasi</th>
						<th>Perusahaan Pelaksana CSR</th>
						<th>Penanggung Jawab CSR</th>
						<th>Anggaran Dana CSR</th>
						<th>Rencana Target</th>
						<th>Tanggal Rencana Mulai</th>
						<th>Tanggal Rencana Selesai</th>
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
							<?php if($data->status_csr == 1){ ?>
							<td class="td-btn">
								<div class="btn-group mb-3 btn-group-sm" role="group" aria-label="Basic example">

								<button data-toggle="modal" data-target="#editData<?php echo $data->csr_id;?>" 
								class="btn btn-primary btn-sm"><i class="far fa-edit"></button></i>
								
								<!-- <a onclick="deleteConfirm('<?php echo site_url('csr/status_kegiatan/delete/'.$data->usulan_id) ;?>')" 
								class="btn btn-danger btn-md" href="#" data-toggle="tooltip" data-placement="top"
								title="" data-original-title="Hapus"><i class="fas fa-trash"></a></i> -->

								<form method="POST" action="<?php echo base_url('csr/status_kegiatan/deleteWithStatus')?>" enctype="multipart/form-data">
									<input type="hidden" name="csr_id" value="<?= $data->csr_id ?>">
									<input type="hidden" name="usulan_id" value="<?= $data->usulan_id ?>">
									<button type="submit" class="btn btn-danger btn-sm">
										<i class="fas fa-trash"></i></button>
								</form>
								</div>
							</td>
							<?php }elseif($data->status_csr == 2){ ?>
							<td>
								<div class="badge badge-success"><i class="fas fa-check"></i></div>
							</td>
							<?php }else{ ?>
							<td>
								<a onclick="deleteConfirm('<?php echo site_url('csr/status_kegiatan/delete/'.$data->csr_id) ;?>')" 
								class="btn btn-danger btn-sm" href="#" data-toggle="tooltip" data-placement="top"
								title="" data-original-title="Hapus untuk mengajukan penawaran baru"><i class="fas fa-trash"></a></i>
							</td>
							<?php }?>

							<td><?php if ($data->status_csr == "1"){
									echo '<div class="badge badge-warning">Proses</div>';
								}elseif ($data->status_csr == "2"){
									echo '<div class="badge badge-success">Diterima</div>';
								}else{
									echo '<div class="badge badge-danger" data-toggle="tooltip" data-placement="top"
									title="" data-original-title="Silahkan ajukan penawaran lain">Ditolak</div>';
								};?>
							</td>
							<?php
								foreach($csr as $item):
									if ($data->id == $item->usulan_id) {
							?>
							<td><?php echo $item->name;?></td>
							<td><?php echo strtoupper($item->penanggung_jawab);?></td>
							<td><?php echo 'Rp.'.number_format($item->dana);?></td>
							<td><?php echo $item->jumlah_target.'&nbsp;'.$data->nama_satuan; ?></td>
							<td><?php date('d F Y'); echo $item->tgl_mulai;?></td>
							<td><?php echo $item->tgl_selesai;?></td>
							
							<?php }endforeach;?>
                            <td>===</td>
							<!-- <td class="td-btn">
								<a href="<?php echo site_url('csr/validasi_pendanaan/show/'.$data->id);?>" class="btn btn-info btn-sm"> Detail</a>
							</td> -->
							
							<td><?php echo $data->nama_bidang;?></td>
                            <td><?php echo $data->nama_sub;?></td>
                            <td><?php echo $data->thn_pengusulan;?></td>
                            <td><?php echo $data->nama_kegiatan;?></td>
                            <td><?php echo $data->hasil_kegiatan;?></td>
							<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
							<td><?php echo $data->jumlah_target.'&nbsp;'.$data->nama_satuan; ?></td>
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
	foreach ($csr as $row):
	
?>
<div class="modal fade" id="editData<?php echo $row->csr_id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_edit">Edit Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('csr/status_kegiatan/update')?>">
			  <div class="modal-body">
			  	<div class="form-group">
                    <label for="">Penanggung Jawab</label>
					<input type="text" class="form-control <?php echo form_error('penanggung_jawab') ? 'is-invalid':'' ?>" 
					name="penanggung_jawab" value="<?php echo $row->penanggung_jawab ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('penanggung_jawab') ?>
					</div>
				</div>
			 	<div class="form-group">
                    <label for="">Rencana Jumlah Target Terpenuhi</label>
					<input type="text" class="form-control <?php echo form_error('jumlah_target') ? 'is-invalid':'' ?>" 
					name="jumlah_target" value="<?php echo $row->jumlah_target ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('jumlah_target') ?>
					</div>
				</div>
				<div class="form-group">
                    <label for="">Rencana Pagu Anggaran Terpenuhi</label>
					<input type="currency" class="form-control <?php echo form_error('dana') ? 'is-invalid':'' ?>" 
					name="dana" id="dana" value="<?php echo $row->dana ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('dana') ?>
					</div>
				</div>
			   <div class="form-group">
                    <label for="">Tanggal rencana kegiatan mulai</label>
					<input type="date" class="form-control <?php echo form_error('tgl_mulai') ? 'is-invalid':'' ?>" 
					name="tgl_mulai" value="<?php echo $row->tgl_mulai ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('tgl_mulai') ?>
					</div>
				</div>
				<div class="form-group">
                    <label for="">Tanggal rencana kegiatan selesai</label>
					<input type="date" class="form-control <?php echo form_error('tgl_selesai') ? 'is-invalid':'' ?>" 
					name="tgl_selesai" value="<?php echo $row->tgl_selesai ;?>">
					<div class="invalid-feedback">
					<?php echo form_error('tgl_selesai') ?>
					</div>
				</div>
			  </div>
			  	<input type="hidden" name="perusahaan_id" value="<?php echo $row->perusahaan_id;?>">
			  	<input type="hidden" name="usulan_id" value="<?php echo $row->usulan_id;?>">
                <input type="hidden" name="csr_id" value="<?php echo $row->csr_id;?>">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update</button>
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
		
	function deleteConfirm(url){
		$('#btn-delete').attr('href', url);
		$('#deleteModal').modal();
		}

	var currencyInput = document.querySelectorAll( 'input[type="currency"]' );

    for ( var i = 0; i < currencyInput.length; i++ ) {

        var currency = 'IDR'
        onBlur( {
            target: currencyInput[ i ]
        } )

        currencyInput[ i ].addEventListener( 'focus', onFocus )
        currencyInput[ i ].addEventListener( 'blur', onBlur )

        function localStringToNumber( s ) {
            return Number( String( s ).replace( /[^0-9.-]+/g, "" ) )
        }

        function onFocus( e ) {
            var value = e.target.value;
            e.target.value = value ? localStringToNumber( value ) : ''
        }

        function onBlur( e ) {
            var value = e.target.value

            var options = {
                maximumFractionDigits: 0,
                currency: currency,
                style: "currency",
                currencyDisplay: "symbol"
            }

            e.target.value = ( value || value === 0 ) ?
                localStringToNumber( value ).toLocaleString( undefined, options ) :
                ''
        }
    }
  </script>
</body>
</html>
