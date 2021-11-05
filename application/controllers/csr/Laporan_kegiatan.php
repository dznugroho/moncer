<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Laporan_kegiatan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('csr_model');
		$this->load->model('usulan_model');
		$this->load->model('admin_model');
		$this->load->model('desa_model');
		$this->load->model('perusahaan_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
	}

	public function embed()
    {
        $file_laporan = $this->uri->segment(4);
        echo "<embed src='".base_url('upload/laporan/'.$file_laporan)."' width='100%' height='100%'></embed>";
	}

	public function addFile()
	{
		$post 				= $this->input->post();
		$csr_id				= $post["csr_id"];

		$config['upload_path']          = './upload/laporan/';
		$config['allowed_types']        = 'pdf|docx|doc';
		$config['file_name']            = $csr_id.time();
		$config['overwrite']			= true;
		$config['max_size']             = 1024;
		
		$this->load->library('upload',$config);
		
		if($this->upload->do_upload("file_laporan")){
			$data = array('upload_data' => $this->upload->data());
			
			$csr_id			= $this->input->post('csr_id');
			$file_laporan 	= $data['upload_data']['file_name'];

		$this->csr_model->addFileLaporan($csr_id,$file_laporan);

		}
		redirect('csr/laporan_kegiatan');
			
	}

	public function index()
	{
		if($this->session->userdata('role')=='1'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getLaporan();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('csr/laporan_kegiatan', $data);
			// print_r($data['usulans']);
		}elseif($this->session->userdata('role') =='3'){
					
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getLaporanKegiatan();
			$data['laporan']		= $this->csr_model->getDataLaporan();
			$this->load->view('perusahaan/laporan_kegiatan', $data);
			// print_r($data['usulans']);
		}else{
			return redirect('home');
		}

	}

	public function cari()
	{
		$cari	= $this->input->post('cari');
		if ($cari == 1 ){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getCariValidasi();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('csr/laporan_kegiatan', $data);
		}else{
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getCariValidasi();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('laporan/print_laporan', $data);
		}
	}

	public function edit($csr_id=null)
	{
		if(!isset($csr_id)) redirect('perusahaan/datausulan');

		$data['bidangs']		= $this->bidang_model->getBidang();
		$data['subbidangs']		= $this->bidang_model->getSubbidang();
		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
		$data['desas']			= $this->wilayah_model->getDesa();
		$data["usulan"]			= $this->csr_model->getUsulanById($csr_id);
		$data["laporan"]		= $this->csr_model->getLaporanById($csr_id);

		$this->load->view("perusahaan/laporan_edit", $data);
		
	}

	public function update()
	{
		$csr				= $this->csr_model;
		$post				= $this->input->post();
		
		$inputdana			= $post["dana_akhir"];

		$csr_id				= $post["csr_id"];
		$jumlah_target		= $post["jumlah_target"];
		$dana_akhir			= preg_replace("/[^0-9]/", "", $inputdana);
		$tgl_selesai		= $post["tgl_selesai"];
		$status_validasi	= 2;

		if (!empty($_FILES["file_laporan"]["name"])) {
			$file_laporan = $csr->uploadFileLaporan($csr_id);
		} else {
			$file_laporan = $post["old_file"];
		}

		$this->csr_model->updateLaporan($csr_id,$jumlah_target,$dana_akhir,
									$tgl_selesai,$status_validasi,$file_laporan);
		// print_r($csr);
		$this->session->set_flashdata('success', 'Data has been updated');
		return redirect('csr/laporan_kegiatan');
		
	}
	
	public function show($id=null)
	{
		if(!isset($id)) redirect('csr/pelaksanaan_csr');

		if($this->session->userdata('role')=='1'){
			$data["usulan"]			= $this->csr_model->getById($id);
			$data["perusahaan"]		= $this->csr_model->getPerusahaan($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("csr/detail_penyerahan", $data);

		}
	}
}
