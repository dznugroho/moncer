<!DOCTYPE html>
<html>
<head>
<?php $this->load->view("_partials/head.php") ?>
</head>

<body id="page-top">

<div class="card-header text-center">
	<strong>
        LAPORAN KEGIATAN CSR
    </strong>
</div>
    <div class="card-body">
		<table class="table table-hover table-bordered" cellspacing="0">
		<thead>
				<tr>
				<th>No.</th>
				<th>Perusahaan Pelaksana CSR</th>
				<th>Penanggung Jawab CSR</th>
				<th>Anggaran Dana CSR</th>
				<th>Target Terpenuhi</th>
				<th>Tanggal Rencana Mulai</th>
				<th>Tanggal Selesai</th>
				<th>===</th>
				<th>Nama Bidang</th>
				<th>Nama Subbidang</th>
				<th>Nama Kegiatan</th>
				<th>Output Kegiatan</th>
				<th>Pagu Anggaran</th>
				<th>Target</th>
				<th>Lokasi Kegiatan</th>
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
					
					
					<?php }endforeach;?>
					
					<!-- <td class="td-btn">
						<a href="<?php echo site_url('csr/validasi_laporan/show/'.$data->id);?>" class="btn btn-info btn-sm"> Detail</a>
					</td> -->
					<td>===</td>
					
					<td><?php echo $data->nama_bidang;?></td>
					<td><?php echo $data->nama_sub;?></td>
					<td><?php echo $data->nama_kegiatan;?></td>
					<td><?php echo $data->hasil_kegiatan;?></td>
					<td><?php echo 'Rp.'.number_format($data->anggaran);?></td>
					<td><?php echo "$data->jumlah_target".'&nbsp; '.$data->nama_satuan;?></td>
					<td><?php echo $data->alamat_kegiatan;?></td>
				</tr>

			<?php endforeach; ?>
			</tbody>
		</table>
	</div>

	<!-- Page Specific JS File -->

	<script type="text/javascript">
		
		
		var css = '@page { size: landscape; }',
		head = document.head || document.getElementsByTagName('head')[0],
		style = document.createElement('style');

		style.type = 'text/css';
		style.media = 'print';

		if (style.styleSheet){
		style.styleSheet.cssText = css;
		} else {
		style.appendChild(document.createTextNode(css));
		}

		head.appendChild(style);

		window.print();
		
		
	
		
 
  </script>
</body>
</html>
