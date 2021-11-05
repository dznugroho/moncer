<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Validasi_laporan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('csr_model');
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

	public function index()
	{
		if($this->session->userdata('role')=='1'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getValidasiLaporan();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('csr/validasi_laporan', $data);
			// print_r($data['usulans']);
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
			$this->load->view('csr/validasi_laporan', $data);
		}else{
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['usulans']		= $this->csr_model->getCariValidasi();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('laporan/print_validasi', $data);
		}
	}

	public function validasilaporan()
	{
		if($this->session->userdata('role')=='1'){
			
			$post				= $this->input->post();
			$csr_id				= $post["csr_id"];
			$status_validasi	= $post["status_validasi"];
			$ket_validasi		= $post["ket_validasi"];

			$this->csr_model->validasiLaporan($csr_id,$status_validasi,$ket_validasi);

			$this->session->set_flashdata('success', 'Status Pendanaan Telah Diubah');
			return redirect('csr/validasi_laporan');
		
		}
	}
	
	// public function edit($usulan_id=null)
	// {	
	// 	// if(!isset($usulan_id)) redirect('csr/pelaksanaan_csr');

	// 	$cekdata = $this->csr_model->getPelaksanaanById($usulan_id);

	// 	if($cekdata == FALSE){

	// 		$this->load->view("csr/tambah_pelaksanaan");

	// 	}else{
			
	// 		$data["pelaksanaan"]	= $this->csr_model->getPelaksanaanById($usulan_id);
	// 		if(!$data["pelaksanaan"]) show_404();

	// 		$this->load->view("csr/edit_pelaksanaan", $data);
	// 	}
	// }

	// public function store()
	// {

	// 	$this->csr_model->savePelaksanaan();

	// 	// print_r($csr);
	// 	$this->session->set_flashdata('success', 'Data has been saved');
	// 	return redirect('csr/pelaksanaan_csr');

	// }

	// public function update()
	// {
	// 	$csr		= $this->csr_model;
	// 	$post		= $this->input->post();
		

	// 	$usulan_id			= $post["usulan_id"];
	// 	$pelaksana_kegiatan	= $post["pelaksana_kegiatan"];
	// 	$jabatan_pelaksana	= $post["jabatan_pelaksana"];
	// 	$tgl_mulai			= $post["tgl_mulai"];
	// 	$tgl_selesai		= $post["tgl_selesai"];
	// 	$rincian_kegiatan	= $post["rincian_kegiatan"];
	// 	$status_pelaksanaan	= $post["status_pelaksanaan"];

	// 	if (!empty($_FILES["dokumen_pelaksanaan"]["name"])) {
	// 		$dokumen_pelaksanaan = $csr->uploadFilePelaksanaan();
	// 	} else {
	// 		$dokumen_pelaksanaan = $post["old_file"];
	// 	}

	// 	$csr->updatePelaksanaan($usulan_id,$pelaksana_kegiatan,
	// 					$jabatan_pelaksana,$tgl_mulai,$tgl_selesai,
	// 					$rincian_kegiatan,$dokumen_pelaksanaan,$status_pelaksanaan);
	// 	// print_r($csr);
	// 	$this->session->set_flashdata('success', 'Data has been saved');
	// 	return redirect('csr/pelaksanaan_csr');


		
	// }
	

}
