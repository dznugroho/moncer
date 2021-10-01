<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Csr_model extends CI_Model 
{
	private $table = "usulans";

	public function getDanaCSR()
	{
		
		return $this->db->distinct()
			->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub,
								')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('csr',		'usulans.id				= csr.usulan_id',	'right')
			->where('status_pengajuan', 2)
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}


	public function getPerusahaan($id)
	{
		return $this->db->select('csr.*,users.name,kecamatans.nama_kecamatan,
						desas.nama_desa, users.alamat,users.no_telp, users.email')
			->from('csr')
			->join('users',		'csr.perusahaan_id	= users.id',		'left')
			->join('kecamatans','users.kecamatan	= kecamatans.id',	'left')
			->join('desas',		'users.desa 		= desas.id',		'left')
			->where('usulan_id', $id)
			->order_by('csr.created_at', 'DESC')
			->get()->result();
	}

	public function getPerusahaanDiterima()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->where('status_pengajuan', 2)
			->where('status_csr', 2)
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getPerusahaanDitolak()
	{
		return $this->db->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->where('status_pengajuan', 1)
			->where('status_csr', 1)
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getStatusCsr()
	{
		return $this->db->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->where('status_pengajuan', 3)
			->where('status_csr', 1)
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getById($id)
	{
		return $this->db->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('csr',		'usulans.id				= csr.usulan_id',	'left')
			->where('usulans.id', $id)
			->order_by('usulans.created_at', 'DESC')
			->get()->row();
	}
		
	public function tutupdana($id,$status_pendanaan)
	{
		$this->db->set('status_pendanaan', 	$status_pendanaan)
				->where('id',				$id)
				->update('usulans');
	}

	public function bukadana($id,$status_pendanaan)
	{
		$this->db->set('status_pendanaan', 	$status_pendanaan)
				->where('id',				$id)
				->update('usulans');
	}
	// public function tutup($id,$usulan_id,$status_pendanaan,$status_csr)
	// {
	// 	$this->db->set('status_pendanaan', 	$status_pendanaan)
	// 			->set('status_csr_pilihan', $status_csr)
	// 			->where('id',				$id)
	// 			->update('csr');
		
	// 	$this->db->set('status_csr', 		$status_csr)
	// 			->where('id',				$usulan_id)
	// 			->update('usulans');
	// }

	public function tolak($id,$status_pendanaan)
	{
		$this->db->set('status_pendanaan', 	$status_pendanaan)
				->where('id',				$id)
				->update('csr');
		
	}

}
