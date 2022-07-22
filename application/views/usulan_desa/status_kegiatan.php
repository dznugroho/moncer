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
						<th>Status Pelaksanaan</th>
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
							<!--<td class="td-btn">-->
							<!--	<button data-toggle="modal" data-target="#konfirmasi_csr<?php echo $data->csr_id;?>" -->
							<!--	class="btn btn-primary btn-sm"> Konfirmasi</button>-->
							<!--</td>-->
							<?php
								foreach($laporan as $item):
									if ($data->id == $item->usulan_id) {
							?>
							
							<?php if ($item->konfirmasi_desa == 1){ ?>
							<td class="td-btn">
								<button data-toggle="modal" data-target="#konfirmasi_csr<?php echo $data->csr_id;?>" 
								class="btn btn-primary btn-sm"> Konfirmasi</button>
							</td>
							<?php }elseif ($item->konfirmasi_desa == 2){ ?>
							<td class="td-btn">
								<button data-toggle="modal" data-target="#konfirmasi_csr<?php echo $data->csr_id;?>" 
								class="btn btn-warning btn-sm"><i class="fas fa-sync"></i></button>
							</td>
							<?php }else{ ?>
							<td class="td-btn">
								<div class="badge badge-success" data-toggle="tooltip" data-placement="top"
							    title="" data-original-title="Sudah Dikonfirmasi"><i class="fas fa-check"></i></div>
							</td>
							<?php } ;?>
							
							<?php }endforeach;?>				
							
							<?php
								foreach($csr as $item):
									if ($data->id == $item->usulan_id) {
							?>
							<td><?php date_default_timezone_set('Asia/Jakarta');
								if($item->TGL_LEBAR == ""){
									if(date('Y-m-d') < $item->tgl_mulai){
										echo '<div class="badge badge-danger">Belum Terlaksana</div>';

									}elseif(date('Y-m-d') >= $item->tgl_mulai){
										echo '<div class="badge badge-info">Dalam Pelaksanaan</div>';
									}
								}else{
									echo '<div class="badge badge-success">Terlaksana</div>';
								}?>		
							</td>
							<td><?php echo $item->name;?></td>
							<td><?php echo strtoupper($item->penanggung_jawab);?></td>
							<td><?php echo 'Rp.'.number_format($item->dana);?></td>
							<td><?php echo $item->jumlah_target.'&nbsp;'.$data->nama_satuan; ?></td>
							<td><?php echo $item->tgl_mulai;?></td>
							<td><?php echo $item->tgl_selesai;?></td>
							
							<?php }endforeach;?>
                            <td>===</td>
							
							
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
	foreach ($laporan as $row):
	
?>
<div class="modal fade" id="konfirmasi_csr<?php echo $row->csr_id;?>" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal_edit">Konfirmasi Pelaksanaan CSR</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" method="post" action="<?php echo base_url('csr/status_kegiatan/konfirmasi_csr')?>">
			  <div class="modal-body">
			  	<div class="form-group">
					<label>Status Pelaksanaan</label>
					<select class="form-control" name="konfirmasi_desa" id="konfirmasi_desa">
						<option selected disabled>--Pilih Status--</option>
						<option value="2">Belum Terlaksana</option>
						<option value="3">Terlaksana</option>
					</select>
				</div>
			   <input type="hidden" name="csr_id" value="<?php echo $row->csr_id;?>" >
			  </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Konfirmasi</button>
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
