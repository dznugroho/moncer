<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Usulan_model extends CI_Model 
{
	private $table = "usulans";

	public $id;
	public $bidang_id;
	public $subbidang_id;
	public $nama_kegiatan;
	public $tgl_pengusulan;
	public $anggaran;
	public $kecamatan_id;
	public $desa_id;
	public $alamat_kegiatan;
	public $deskripsi;
	public $nama_pengusul;
	public $file = "default.pdf";
	public $status_pengajuan;
	public $id_pengusul;

	public function rules()
	{
		return [
			['field'	=> 'tgl_pengusulan',
			'label'		=> 'Tanggal Pengusulan',
			'rules'		=> 'required'],
			
			['field'	=> 'nama_kegiatan',
			'label'		=> 'Nama Kegiatan',
			'rules'		=> 'required'],

			['field'	=> 'nama_pengusul',
			'label'		=> 'Nama Pengusul',
			'rules'		=> 'required'],

			['field'	=> 'anggaran',
			'label'		=> 'Anggaran',
			'rules'		=> 'required']
		];
	}

	public function getUsulan()
	{
		return $this->db->select('usulans.*,kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 1)
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getUsulanDesa()
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
			->where('id_pengusul', $id )
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getUsulanMasuk()
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
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getUsulanDitolak()
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
			->order_by('usulans.created_at', 'DESC')
			->get()->result();
	}

	public function getById($id)
	{
		return $this->db->select('usulans.*,users.name,users.kecamatan,users.desa,
								users.alamat,users.no_telp,
								kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->where('usulans.id', $id)
			->order_by('usulans.created_at', 'DESC')
			->get()->row();
	}

	public function save()
	{

		$post = $this->input->post();

		$this->bidang_id		= $post["bidang"];
		$this->subbidang_id		= $post["subbidang"];
		$this->tgl_pengusulan	= $post["tgl_pengusulan"];
		$this->nama_kegiatan	= $post["nama_kegiatan"];
		$this->anggaran			= $post["anggaran"];
		$this->kecamatan_id		= $post["kecamatan"];
		$this->desa_id			= $post["desa"];
		$this->alamat_kegiatan	= $post["alamat_kegiatan"];
		$this->deskripsi		= $post["deskripsi"];
		$this->nama_pengusul	= $post["nama_pengusul"];
		$this->file				= $this->uploadFile();
		$this->status_pengajuan	= 1;
		$this->id_pengusul		= $this->session->userdata('id');

		return $this->db->insert($this->table, $this);
	}
		
	public function update($id,$bidang_id,$subbidang_id,$tgl_pengusulan,
							$nama_kegiatan,$anggaran,$kecamatan_id,$desa_id,
							$alamat_kegiatan,$deskripsi,
							$nama_pengusul,$id_pengusul,$file)
	{
		$this->db->set('bidang_id',			$bidang_id )
				->set('subbidang_id',		$subbidang_id)
				->set('tgl_pengusulan',		$tgl_pengusulan)
				->set('nama_kegiatan',		$nama_kegiatan)
				->set('anggaran', 			$anggaran)
				->set('kecamatan_id',	 	$kecamatan_id)
				->set('desa_id', 			$desa_id)
				->set('alamat_kegiatan',	$alamat_kegiatan)
				->set('deskripsi',	 		$deskripsi)
				->set('nama_pengusul', 		$nama_pengusul)
				->set('id_pengusul', 		$id_pengusul)
				->set('file', 				$file)
				->where('id',				$id)
				->update($this->table);
	}

	public function addFile($id,$file){

        $this->db->set('file', $file);
		$this->db->where('id', $id);
		$this->db->update($this->table);
	}

	public function uploadFile()
	{
		$config['upload_path']          = './upload/file/';
		$config['allowed_types']        = 'pdf|docx|doc';
		$config['file_name']            = $this->id_pengusul.time();
		$config['overwrite']			= true;
		$config['max_size']             = 1024; // 1MB
		// $config['max_width']            = 1024;
		// $config['max_height']           = 768;

		$this->load->library('upload', $config);

		if ($this->upload->do_upload('file')) {
			return $this->upload->data("file_name");
		}
		
		return "default.pdf";
	}

	public function delete($id)
	{
		$this->deleteFile($id);
		return $this->db->delete($this->table, array("id" => $id));
	}
	
	private function deleteFile($id)
	{
		$usulan = $this->getById($id);
		if ($usulan->file != "default.pdf") {
			$filename = explode(".", $usulan->file)[0];
			return array_map('unlink', glob(FCPATH."upload/file/$filename.*"));
		}
	}

	
}
