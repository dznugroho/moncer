<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Usulan_model extends CI_Model 
{
	private $table = "usulans";

	public $id;
	public $bidang_id;
	public $subbidang_id;
	public $nama_kegiatan;
	public $thn_pengusulan;
	public $jumlah_target;
	public $satuan_id;
	public $anggaran;
	public $hasil_kegiatan;
	public $kecamatan_id;
	public $desa_id;
	public $alamat_kegiatan;
	public $nama_pengusul;
	public $file = "default.pdf";
	public $status_pengajuan;
	public $ket_pengajuan;
	public $status_pendanaan;
	public $id_pengusul;

	public function rules()
	{
		return [
			['field'	=> 'thn_pengusulan',
			'label'		=> 'Tahun Pengusulan',
			'rules'		=> 'required'],

			['field'	=> 'nama_kegiatan',
			'label'		=> 'Nama Kegiatan',
			'rules'		=> 'required'],

			['field'	=> 'anggaran',
			'label'		=> 'Anggaran',
			'rules'		=> 'required'],

			['field'	=> 'jumlah_target',
			'label'		=> 'Jumlah Target',
			'rules'		=> 'required'],

			['field'	=> 'hasil_kegiatan',
			'label'		=> 'Hasil Kegiatan',
			'rules'		=> 'required'],

			['field'	=> 'alamat_kegiatan',
			'label'		=> 'Alamat Kegiatan',
			'rules'		=> 'required'],

			['field'	=> 'nama_pengusul',
			'label'		=> 'Nama Pengusul',
			'rules'		=> 'required']

			
		];
	}

	public function getSatuan()
	{
		return $this->db->select('*')
		->from('satuan')
		->get()
		->result();
	}

	public function countTotalPengajuan()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('*')
		                ->from('usulans')
		                ->where('id_pengusul', $id)
		                ->get()
		                ->result();
	}

	public function pengajuanDiproses()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('*')
		                ->from('usulans')
		                ->where('status_pengajuan', 1)
		                ->where('id_pengusul', $id)
		                ->get()
		                ->result();
	}

	public function pengajuanDiterima()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('*')
		                ->from('usulans')
		                ->where('status_pengajuan', 2)
		                ->where('id_pengusul', $id)
		                ->get()
		                ->result();
	}

	public function pengajuanDitolak()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('*')
		                ->from('usulans')
		                ->where('status_pengajuan', 3)
		                ->where('id_pengusul', $id)
		                ->get()
		                ->result();
	}

	public function chartBelumTerlaksana()
	{
		$perusahaan_id = $this->session->userdata('id');
		$chartbelum = $this->db
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
			->order_by('status_validasi', 2)
			->get()->row();

	}
	public function HasileBelum()
	{
		
	}

	public function countValidasi()
	{
		return $this->db->get_where('usulans', ['status_pengajuan !=' => 2])->result();
	}

	public function countDiterima()
	{
		return $this->db->get_where('usulans', ['status_pengajuan' => 2])->result();
	}

	public function getUsulan()
	{
		return $this->db->select('usulans.*,users.name,kecamatans.nama_kecamatan,
								desas.nama_desa,nama_satuan,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id',	'left')
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 1)
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->result();
	}

	public function getValidasi()
	{
		return $this->db->select('usulans.*,users.name,kecamatans.nama_kecamatan,
								desas.nama_desa,nama_satuan,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id',	'left')
			->where('status_pengajuan', 1)
			->or_where('status_pengajuan', 3)
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->result();
	}

	public function getUsulanDesa()
	{
		$id = $this->session->userdata('id');
		return $this->db->select('usulans.*,users.name,kecamatans.nama_kecamatan,
								desas.nama_desa,nama_satuan,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id',	'left')
			->where('id_pengusul', $id )
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->result();
	}

	public function getUsulanById($id)
	{
		return $this->db->select('usulans.*,users.name,users.kecamatan,users.desa,
								users.alamat,users.no_telp,nama_satuan,
								kecamatans.nama_kecamatan,desas.nama_desa,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->where('usulans.id', $id)
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->row();
	}

	public function cariData()
	{
		$subbidang_id	= $this->input->post('subbidang');
		$thn_pengusulan = $this->input->post('thn_pengusulan');

		return $this->db->select('usulans.*,users.name,kecamatans.nama_kecamatan,
								desas.nama_desa,nama_satuan,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'left')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'left')
			->join('desas',		'usulans.desa_id 		= desas.id',		'left')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'left')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'left')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->where('status_pengajuan', 2)
			->where('status_pendanaan', 1)
			->like('usulans.subbidang_id', $subbidang_id)
			->like('usulans.thn_pengusulan', $thn_pengusulan)
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
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->result();
	}

	public function getUsulanPerusahaanById($id)
	{
		return $this->db->select('usulans.*,csr.perusahaan_id,SUM(csr.dana) as total,
								kecamatans.nama_kecamatan,desas.nama_desa,nama_satuan,
								csr.status_csr,users.name,users.alamat,users.no_telp,
								bidangs.nama_bidang, subbidangs.nama_sub')
			->from('usulans')
			->join('users',		'usulans.id_pengusul	= users.id',		'right')
			->join('kecamatans','usulans.kecamatan_id	= kecamatans.id',	'right')
			->join('desas',		'usulans.desa_id 		= desas.id',		'right')
			->join('bidangs',	'usulans.bidang_id 		= bidangs.id',		'right')
			->join('subbidangs','usulans.subbidang_id	= subbidangs.id',	'right')
			->join('csr',		'usulans.id				= csr.usulan_id',	'right')
			->join('satuan',	'usulans.satuan_id		= satuan.satuan_id','left')
			->where('usulans.id', $id)
			->order_by('usulans.thn_pengusulan', 'DESC')
			->get()->row();
	}


	public function save()
	{

		$post = $this->input->post();
		$inputanggaran = $post["anggaran"];
		$pagu_anggaran = $result = preg_replace("/[^0-9]/", "", $inputanggaran);

		$this->bidang_id		= $post["bidang"];
		$this->subbidang_id		= $post["subbidang"];
		$this->nama_kegiatan	= $post["nama_kegiatan"];
		$this->thn_pengusulan	= $post["tahun_pengusulan"];
		$this->jumlah_target	= $post["jumlah_target"];
		$this->satuan_id		= $post["satuan_id"];
		$this->anggaran			= $pagu_anggaran;
		$this->hasil_kegiatan	= $post["hasil_kegiatan"];
		$this->kecamatan_id		= $post["kecamatan"];
		$this->desa_id			= $post["desa"];
		$this->alamat_kegiatan	= $post["alamat_kegiatan"];
		$this->nama_pengusul	= $post["nama_pengusul"];
		$this->file				= $this->uploadFile();
		$this->status_pengajuan	= 1;
		$this->ket_pengajuan	= "Dalam Proses";
		$this->status_pendanaan	= 1;
		$this->id_pengusul		= $this->session->userdata('id');

		return $this->db->insert($this->table, $this);
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
		$config['file_name']            = $this->session->userdata('id').time();
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
		
	public function update($id,$bidang_id,$subbidang_id,$nama_kegiatan,
						$thn_pengusulan,$jumlah_target,$satuan_id,$anggaran,
						$hasil_kegiatan,$kecamatan_id,$desa_id,
						$alamat_kegiatan,$nama_pengusul,$status_pengajuan,
						$id_pengusul,$file)
	{
		$this->db->set('bidang_id',			$bidang_id )
				->set('subbidang_id',		$subbidang_id)
				->set('nama_kegiatan',		$nama_kegiatan)
				->set('thn_pengusulan',		$thn_pengusulan)
				->set('jumlah_target',		$jumlah_target)
				->set('satuan_id',			$satuan_id)
				->set('anggaran', 			$anggaran)
				->set('hasil_kegiatan',	 	$hasil_kegiatan)
				->set('kecamatan_id',	 	$kecamatan_id)
				->set('desa_id', 			$desa_id)
				->set('alamat_kegiatan',	$alamat_kegiatan)
				->set('nama_pengusul', 		$nama_pengusul)
				->set('status_pengajuan', 	$status_pengajuan)
				->set('id_pengusul', 		$id_pengusul)
				->set('file', 				$file)
				->where('id',				$id)
				->update($this->table);
	}

	public function validasi_usulan($id,$status_pengajuan,$ket_pengajuan)
	{
		$this->db->set('status_pengajuan',	$status_pengajuan )
				->set('ket_pengajuan',		$ket_pengajuan)
				->where('id',				$id)
				->update($this->table);
	}

	public function savePilihKegiatan()
	{
		$post = $this->input->post();

		$perusahaan_id	= $this->session->userdata('id');
		$inputdana		= $post["dana"];
		$dana 			= preg_replace("/[^0-9]/", "", $inputdana);
		
		$data = array(
			'usulan_id'				=> $post["usulan_id"],
			'perusahaan_id'			=> $perusahaan_id,
			'penanggung_jawab'		=> $post["penanggung_jawab"],
			'jumlah_target'			=> $post["jumlah_target"],
			'dana'					=> $dana,
			'tgl_mulai'				=> $post["tgl_mulai"],
			'tgl_selesai'			=> $post["tgl_selesai"],
			);

		return $this->db->insert('csr', $data);
	}

	public function updateStatusPendanaan($usulan_id)
	{
		$this->db->set('status_pendanaan',	2)
				->where('id',				$usulan_id)
				->update('usulans');
	}

	public function delete($id)
	{
		$this->deleteFile($id);
		return $this->db->delete($this->table, array("id" => $id));
	}
	
	private function deleteFile($id)
	{
		$usulan = $this->getUsulanById($id);
		if ($usulan->file != "default.pdf") {
			$filename = explode(".", $usulan->file)[0];
			return array_map('unlink', glob(FCPATH."upload/file/$filename.*"));
		}
	}

	
}
