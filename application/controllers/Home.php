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
		$data['total_perusahaan']	= $this->perusahaan_model->getAll();
		$data['usulan_masuk']		= $this->usulan_model->countTotal();
		$data['usulan_validasi'] 	= $this->usulan_model->countValidasi();
		$data['usulan_diterima'] 	= $this->usulan_model->countDiterima();
		$data['laporan'] 			= $this->csr_model->countLaporan();

		$this->load->view('index',$data);
	}
}
