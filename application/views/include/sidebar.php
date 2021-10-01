			<!-- NAVBAR -->
			
<div class="main-sidebar">
	<aside id="sidebar-wrapper">
		<div class="sidebar-brand">
			<a href="<?= site_url('home')?>">MONCER</a>
		</div>
		<div class="sidebar-brand sidebar-brand-sm">
			<a href="<?= site_url('home')?>">CSR</a>
		</div>
		<ul class="sidebar-menu">
		 <?php
			$hal = $this->uri->segment(1);
			$hal2 = $this->uri->segment(2);
		 ?>
			<li class="menu-header">Dashboard</li>
			<li class="nav-item <?=($hal=='home')?'active':'';?>">
				<a href="<?= site_url('home')?>" class="nav-link">
				<i class="fas fa-fire"></i><span>Home</span></a>
			</li>

		 <?php if($this->session->userdata('role')=='1'):?>

			<li class="menu-header">Master Data</li>
			<li class="nav-item dropdown <?= ($hal2=='admin') || 
			($hal2=='desa') || ($hal2=='perusahaan') ?'active':'';?>">

				<a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-address-card"></i>
				<span>Data Pengguna</span></a>
			  <ul class="dropdown-menu">

				<li class="nav-item <?= ($hal2=='admin') ?'active':'';?>">
					<a class="nav-link" href="<?= site_url('user/admin')?>">Admin</a>
				</li>
				
				<li class="nav-item <?=($hal2=='desa')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('user/desa')?>">Desa</a>
				</li>
				
				<li class="nav-item <?=($hal2=='perusahaan')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('user/perusahaan')?>">Perusahaan</a>
				</li>

			  </ul>
			</li>

			<li class="nav-item dropdown <?= ($hal2=='pendidikan') || ($hal2=='kesehatan') || 
			($hal2=='lingkungan') || ($hal2=='pek') || ($hal2=='infrastruktur') ?'active':'';?>">
				
				<a href="#" class="nav-link has-dropdown"><i class="fas fa-dice-d6"></i>
				<span>Data Bidang</span></a>
			  <ul class="dropdown-menu">
								
				<li class="nav-item <?=($hal2=='pendidikan')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('bidang/pendidikan')?>">Bidang Pendidikan</a>
				</li>
				
				<li class="nav-item <?=($hal2=='kesehatan')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('bidang/kesehatan')?>">Bidang Kesehatan</a>
				</li>
				<li class="nav-item <?=($hal2=='lingkungan')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('bidang/lingkungan')?>">Bidang Lingkungan</a>
				</li>
				<li class="nav-item <?=($hal2=='pek')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('bidang/pek')?>">PEK</a>
				</li>
				<li class="nav-item <?=($hal2=='infrastruktur')?'active':'';?>">
					<a class="nav-link" href="<?= site_url('bidang/infrastruktur')?>">Bidang Infrastruktur</a>
				</li>

			  </ul>
			</li>

			<li class="nav-item <?=($hal=='wilayah')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('wilayah')?>">
				<i class="fas fa-chart-pie"></i><span> Data Wilayah</span></a>
			</li>

			<li class="menu-header">Kelola Usulan</li>

			<li class="nav-item <?=($hal2=='datausulan')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('usulan/datausulan')?>">
				<i class="fas fa-comment-alt"></i><span> Data Usulan</span></a>
			</li>

			<li class="nav-item <?=($hal2=='usulan_masuk')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('usulan/usulan_masuk')?>">
				<i class="fas fa-file-import"></i><span> Usulan Masuk</span></a>
			</li>

			<li class="nav-item <?=($hal2=='usulan_ditolak')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('usulan/usulan_ditolak')?>">
				<i class="fas fa-file-excel"></i><span> Usulan Ditolak</span></a>
			</li>

			<li class="menu-header">Kelola CSR</li>

			<li class="nav-item <?=($hal2=='dana_csr')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('csr/dana_csr')?>">
				<i class="fas fa-columns"></i><span> Pendanaan CSR</span></a>
			</li>

			<li class="nav-item <?=($hal2=='penyerahan_dana')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('csr/penyerahan_dana')?>">
				<i class="fas fa-columns"></i><span> Penyerahan Dana</span></a>
			</li>
			<li class="nav-item <?=($hal2=='pelaksanaan_csr')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('csr/pelaksanaan_csr')?>">
				<i class="fas fa-columns"></i><span> Pelaksanaan CSR</span></a>
			</li>

			<li class="nav-item <?=($hal2=='laporan_csr')?'active':'';?>">
				<a class="nav-link" href="<?= site_url('csr/laporan_csr')?>">
				<i class="fas fa-columns"></i><span> Laporan CSR</span></a>
			</li>			

			

			<li class="menu-header"></li>
			<li class="menu-header"></li>

		 <?php elseif($this->session->userdata('role')=='2'):?>
			<li class="menu-header">Profil</li>
			
			<li class="nav-item <?=($hal2=='profile_desa')?'active':'';?>">
				<a class="nav-link" href="<?php echo site_url('desa/profile_desa'); ?>">
				<i class="far fa-list-alt"></i> <span>Profil</span></a>
			</li>

			<li class="menu-header">CSR</li>
			
			<li class="nav-item <?=($hal2=='pengajuan_usulan')?'active':'';?>">
				<a class="nav-link" href="<?php echo site_url('desa/pengajuan_usulan'); ?>">
				<i class="far fa-file-alt"></i> <span>Pengajuan Usulan</span></a>
			</li>
			
			<li class="nav-item <?=($hal2=='status_pelaksanaan')?'active':'';?>">
				<a class="nav-link" href="<?php echo site_url('desa/status_pelaksanaan'); ?>">
				<i class="far fa-file-alt"></i> <span>Status Pelaksanaan</span></a>
			</li>

			<li class="nav-item <?=($hal2=='status_csr')?'active':'';?>">
				<a class="nav-link" href="<?php echo site_url('desa/status_csr'); ?>">
				<i class="far fa-file-alt"></i> <span>Status CSR</span></a>
			</li>

				
		 <?php elseif($this->session->userdata('role')=='3'):?>
			<li class="menu-header">Profil</li>
			
			<li class="nav-item <?=($hal2=='profil_perusahaan')?'active':'';?>">
				<a class="nav-link" href="<?php echo site_url('perusahaan/profil_perusahaan'); ?>">
				<i class="far fa-list-alt"></i> <span>Profil</span></a>
			</li>

			<li class="menu-header">Usulan Kegiatan</li>
			<li class="nav-item <?php echo ($hal2=='datausulan')?'active': '' ?>">
				<a class="nav-link" href="<?php echo site_url('perusahaan/datausulan'); ?>">
				<i class="far fa-list-alt"></i> <span>Data Usulan</span></a>
			</li>
			<li class="nav-item <?php echo ($hal2=='profil_perusahaan')?'active': '' ?>">
				<a class="nav-link" href="<?php echo site_url('status_usulankec'); ?>">
				<i class="far fa-file-alt"></i> <span>Status CSR</span></a>
			</li>
		
		 <?php endif;?>  
					
		</ul>
	</aside>
</div>
