<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Datausulan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('usulan_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
		if($this->session->userdata('role')!='3') redirect('home');

	}

	public function index()
	{
		$data['kecamatans']	= $this->wilayah_model->getKecamatan();
		$data['desas']		= $this->wilayah_model->getDesa();
		$data['usulans'] 	= $this->usulan_model->getUsulan();

		$this->load->view('usulan/index', $data);
			
	}

	public function embed()
    {
        $file = $this->uri->segment(4);
        echo "<embed src='".base_url('upload/file/'.$file)."' width='100%' height='100%'></embed>";
	}
	
	public function update()
	{	
		$post		= $this->input->post();
		$usulan		= $this->usulan_model;
		
		$validation = $this->form_validation;
		$validation->set_rules($usulan->rules());

		if($validation->run() == FALSE){
			
			$id						= $this->uri->segment(3);
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['subbidangs']		= $this->bidang_model->getSubbidang();
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data["usulan"] 		= $usulan->getById($id);
			
			$this->load->view('usulan/create', $data);
			
		}else{

			$id					= $post["id"];
			$bidang_id			= $post["bidang"];
			$subbidang_id		= $post["subbidang"];
			$tahun_pengusulan	= $post["tahun_pengusulan"];
			$nama_kegiatan		= $post["nama_kegiatan"];
			$waktu_mulai		= $post["waktu_mulai"];
			$waktu_selesai		= $post["waktu_selesai"];
			$anggaran			= $post["anggaran"];
			$kecamatan_id		= $post["kecamatan"];
			$desa_id			= $post["desa"];
			$alamat_kegiatan	= $post["alamat_kegiatan"];
			$deskripsi			= $post["deskripsi"];
			$nama_institusi		= $post["nama_institusi"];
			$alamat_institusi	= $post["alamat_institusi"];
			$id_pengusul		= $this->session->userdata('id');
	
			if (!empty($_FILES["file"]["name"])) {
				$file 			= $usulan->uploadFile();
			} else {
				$file 			= $post["old_file"];
			}

			$usulan->update($id,$bidang_id,$subbidang_id,$tahun_pengusulan,
							$nama_kegiatan,$waktu_mulai,$waktu_selesai,$anggaran,
							$kecamatan_id,$desa_id,$alamat_kegiatan,$deskripsi,
							$nama_institusi,$alamat_institusi,$id_pengusul,$file);
			$this->session->set_flashdata('success', 'Data has been updated');
			return redirect('desa/pengajuan_usulan');
		}
	}

	public function show($id=null)
	{
		if(!isset($id)) redirect('desa/pengajuan_usulan');

			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['subbidangs']		= $this->bidang_model->getSubbidang();
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data["usulan"]			= $this->usulan_model->getById($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("usulan/detail", $data);
		
	}


}