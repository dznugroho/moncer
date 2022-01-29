<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Csr_model extends CI_Model 
{
	private $table = "csr";

	public $csr_id;
	public $usulan_id;
	public $perusahaan_id;
	public $jumlah_target;
	public $satuan_id;
	public $dana;
	public $tgl_mulai;
	public $tgl_selesai;
	public $status_csr;


	public function countLaporan()
	{
		return $this->db->select('*')
		            ->from('laporan')
		            ->where('status_validasi', 3)
		            ->get()
		            ->result();
	}
	
	public function countusulanDidanai()
	{
		return $this->db->select('*')
		                ->from('csr')
		                ->where('status_csr',2)
		                ->get()
		                ->result();
	}

// FORM VALIDASI PENDANAAN CSR USER ADMIN

	public function getValidasiDana()
	{
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id			= satuan.satuan_id','left')
			->where('status_csr', 1)
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->get()->result();
	}

	public function getDatacsrVal()
	{
		return $this->db->distinct()
			->select('csr.*,users.name')
			->from('csr')
			->join('users',	'csr.perusahaan_id	= users.id', 'left')
			->where('status_csr',	1)
			->or_where('status_csr',	2)
			->get()->result();
	}

	public function validasiPendanaan($csr_id,$status_csr)
	{
		$this->db->set('status_csr',	$status_csr )
				->where('csr_id',		$csr_id)
				->update('csr');
	}

	public function saveLapKegiatan($csr_id)
	{
		$data = array(
			'csr_id'	=> $csr_id
		);
		return $this->db->insert('laporan', $data);

	}

	public function updateStatusPendanaan($usulan_id)
	{
		$this->db->set('status_pendanaan',	1)
				->where('id',				$usulan_id)
				->update('usulans');
	}

	// public function deleteLapKegiatan($csr_id)
	// {
	// 	return $this->db->delete('laporan', array("csr_id" => $csr_id));
	// }


// FORM VALIDASI LAPORAN KEGIATAN USER ADMIN

	public function getValidasiLaporan()
	{
		return $this->db->distinct()
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.penanggung_jawab,
					csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->join('laporan',	'laporan.csr_id			= csr.csr_id',		'left')
			->where('status_csr', 2)
			->where('status_validasi !=', 3)
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->order_by('status_validasi', 2)
			->get()->result();
	}

	public function getDataLapVal()
	{
		return $this->db->distinct()
			->select('laporan.*,csr.csr_id,csr.penanggung_jawab,
					csr.usulan_id,csr.perusahaan_id,csr.tgl_mulai,users.name')
			->from('laporan')
			->join('csr',	'laporan.csr_id		= csr.csr_id',	'left')
			->join('users',	'csr.perusahaan_id	= users.id', 'right')
			->get()->result();
	}

	public function validasiLaporan($csr_id,$status_validasi)
	{
		$this->db->set('status_validasi',	$status_validasi )	
				->where('csr_id',			$csr_id)
				->update('laporan');
	}

	
// FORM LAPORAN KEGIATAN USER ADMIN

	public function getLaporan()
	{
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.penanggung_jawab,
					csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->join('laporan',	'laporan.csr_id			= csr.csr_id',		'left')
			->where('status_csr', 2)
			->where('status_validasi', 3)
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->get()->result();
	}


// FORM STATUS KEGIATAN USER PERUSAHAAN

	public function getStatusKegiatan()
	{
		$id = $this->session->userdata('id');
		
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->where('status_pengajuan', 2)
			->where('perusahaan_id', $id)
			->order_by('csr.status_csr', 1)
			->get()->result();
	}

	public function getDataStatusKegiatan()
	{
		$id = $this->session->userdata('id');
		return $this->db->distinct()
			->select('csr.*,users.name')
			->from('csr')
			->join('users',	'csr.perusahaan_id	= users.id', 'left')
			->where('perusahaan_id', $id)
			// ->where('status_csr',	1)
			// ->or_where('status_csr',	2)
			->get()->result();
	}

	public function updateDataKegiatan($csr_id,$penanggung_jawab,$jumlah_target,
										$dana,$tgl_mulai,$tgl_selesai)
	{
		$this->db->set('penanggung_jawab',	$penanggung_jawab)
				->set('jumlah_target',	$jumlah_target)
				->set('dana',			$dana)
				->set('tgl_mulai',		$tgl_mulai)
				->set('tgl_selesai', 	$tgl_selesai)
				->where('csr_id',		$csr_id)
				->update('csr');
	}

	public function cekDataCSR($usulan_id,$perusahaan_id)
	{
		return $this->db->query("SELECT * FROM csr WHERE usulan_id='$usulan_id' AND perusahaan_id='$perusahaan_id' LIMIT 1");
	}

	public function delete($csr_id)
	{
		return $this->db->delete($this->table, array("csr_id" => $csr_id));
	}

	public function deleteCSR($usulan_id,$perusahaan_id)
	{ 
		return $this->db->query("DELETE FROM csr WHERE usulan_id='$usulan_id' AND perusahaan_id='$perusahaan_id'");
	}


// FORM LAPORAN KEGIATAN USER PERUSAHAAN

	public function getLaporanKegiatan()
	{
		$perusahaan_id = $this->session->userdata('id');
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,csr.penanggung_jawab,
					nama_satuan,users.name,csr.csr_id,csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->join('laporan',	'laporan.csr_id			= csr.csr_id',		'left')
			->where('perusahaan_id', $perusahaan_id)
			->where('status_csr', 2)
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->get()->result();
	}

	public function getDataLaporan()
	{
		$perusahaan_id = $this->session->userdata('id');
		return $this->db->distinct()
			->select('laporan.*,csr.penanggung_jawab,csr.csr_id,csr.usulan_id,csr.perusahaan_id,
					csr.tgl_mulai,users.name')
			->from('laporan')
			->join('csr',	'laporan.csr_id		= csr.csr_id',	'left')
			->join('users',	'csr.perusahaan_id	= users.id', 'right')
			->where('perusahaan_id', $perusahaan_id)
			->get()->result();
	}

	public function getUsulanById($csr_id)
	{
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id			= satuan.satuan_id','left')
			->where('csr.csr_id', $csr_id)
			->get()->row();
	}

	public function getLaporanById($csr_id)
	{
		return $this->db->select('laporan.*,csr.usulan_id,
								csr.perusahaan_id,csr.tgl_mulai,users.name')
			->from('laporan')
			->join('csr',	'laporan.csr_id		= csr.csr_id',	'left')
			->join('users',	'csr.perusahaan_id	= users.id', 'right')
			->where('laporan.csr_id', $csr_id)
			->get()->row();
	}

	public function updateLaporan($csr_id,$jumlah_target,$dana_akhir,
								$tgl_selesai,$status_validasi,$file_laporan)
	{
		$this->db->set('jumlah_target',		$jumlah_target)
				->set('dana_akhir',			$dana_akhir)
				->set('tgl_selesai', 		$tgl_selesai)
				->set('status_validasi', 	$status_validasi)
				->set('file_laporan', 		$file_laporan)
				->where('csr_id',			$csr_id)
				->update('laporan');
	}

	public function addFileLaporan($csr_id,$file_laporan){

        $this->db->set('file_laporan',	$file_laporan);
		$this->db->where('csr_id', 		$csr_id);
		$this->db->update('laporan');
	}

	public function uploadFileLaporan($csr_id)
	{
		$config['upload_path']          = './upload/laporan/';
		$config['allowed_types']        = 'pdf|docx|doc';
		$config['file_name']            = $csr_id.time();
		$config['overwrite']			= true;
		$config['max_size']             = 1024; // 1MB
		// $config['max_width']            = 1024;
		// $config['max_height']           = 768;

		$this->load->library('upload', $config);

		if ($this->upload->do_upload('file_laporan')) {
			return $this->upload->data("file_name");
		}
		
		return "default.pdf";
	}

// FORM STATUS KEGIATAN CSR USER DESA
	public function getStatusKegiatanDesa()
	{
		$id = $this->session->userdata('id');
		
		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->where('id_pengusul', $id)
			->where('status_pengajuan', 2)
			->where('status_csr', 2)
			
			->get()->result();
	}

	public function getDataStatusKegiatanDesa()
	{
		$id = $this->session->userdata('id');
		return $this->db->distinct()
		->select('laporan.tgl_selesai as TGL_LEBAR,csr.*,users.name')
		->from('csr')
		->join('laporan',	'laporan.csr_id		= csr.csr_id',	'left')
		->join('users',	'csr.perusahaan_id	= users.id', 'right')
		->get()->result();
	}
	
	public function getCariValidasi()
	{
		$bidang				= $this->input->post('bidang');
		$status_validasi	= $this->input->post('status_validasi');

		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.penanggung_jawab,
					csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->join('laporan',	'laporan.csr_id			= csr.csr_id',		'left')
			->where('status_csr', 2)
			
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->like('usulans.bidang_id', $bidang)
			->like('laporan.status_validasi', $status_validasi)
			->order_by('status_validasi', 2)
			->get()->result();
	}

	public function getCariLaporan()
	{
		$bidang				= $this->input->post('bidang');
		$status_validasi	= $this->input->post('status_validasi');

		return $this->db
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
					nama_satuan,users.name,csr.csr_id,csr.penanggung_jawab,
					csr.usulan_id,csr.status_csr,
					csr.perusahaan_id,bidangs.nama_bidang, subbidangs.nama_sub
								')
			->from('csr')
			->join('usulans',	'usulans.id				= csr.usulan_id',	'left')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->join('laporan',	'laporan.csr_id			= csr.csr_id',		'left')
			->where('status_csr', 2)
			->where('laporan.status_validasi', $status_validasi)
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 2)
			->where('usulans.bidang_id', $bidang)
			->order_by('status_validasi', 3)
			->get()->result();
	}

    public function KonfirmasiCSR($csr_id,$konfirmasi_desa)
	{
		$this->db->set('konfirmasi_desa',	$konfirmasi_desa )	
				->where('csr_id',			$csr_id)
				->update('laporan');
	}

}
