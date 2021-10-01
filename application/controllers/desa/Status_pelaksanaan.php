<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Status_pelaksanaan extends CI_Controller
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
		if($this->session->userdata('role')!='2') redirect('home');

	}

	public function index()
	{
		$data['kecamatans']	= $this->wilayah_model->getKecamatan();
		$data['desas']		= $this->wilayah_model->getDesa();
		$data['usulans'] 	= $this->usulan_model->getUsulanDesa();

		$this->load->view('usulan_desa/status_pelaksanaan', $data);
			
	}


}
