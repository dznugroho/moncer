<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('perusahaan_model');
		$this->load->model('usulan_model');
		$this->load->model('csr_model');
		$this->cek_status();
		
	}
	public function index()
	{
		// $data['total_perusahaan']	= $this->perusahaan_model->getAll();
		// USER ADMIN

		$id = $this->session->userdata('id');

		$data['usulan_validasi'] 	= $this->usulan_model->countValidasi();
		$data['usulan_diterima'] 	= $this->usulan_model->countDiterima();
		$data['laporan'] 			= $this->csr_model->countLaporan();
		$data['usulan_didanai']     = $this->csr_model->countusulanDidanai();
		
		// USER DESA
		$data['total_pengajuan']	= $this->usulan_model->countTotalPengajuan();
		$data['pengajuan_diproses']	= $this->usulan_model->pengajuanDiproses();
		$data['pengajuan_diterima']	= $this->usulan_model->pengajuanDiterima();
		$data['pengajuan_ditolak']	= $this->usulan_model->pengajuanDitolak();
		$data['isine']				= $this->usulan_model->getUsulanById($id);

		// USER PERUSAHAAN
		$data['usulan_danai']		= $this->csr_model->usulanDidanai();
		$data['pendanaan_diproses']	= $this->csr_model->pendanaanDiproses();
		$data['pendanaan_diterima']	= $this->csr_model->pendanaanDiterima();
		$data['pengajuan_ditolak']	= $this->usulan_model->pengajuanDitolak();
		// $data['chartPer']			= $this->usulan_model->chartDesa();

		$this->load->view('index',$data);
	}
}
