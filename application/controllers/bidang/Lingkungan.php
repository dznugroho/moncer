<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Lingkungan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('bidang_model');
		$this->load->library('session');
		$this->cek_status();
	}

	public function index()
	{
		if($this->session->userdata('role')!='1') redirect('home');
		$data['lingkungans'] = $this->bidang_model->getLingkungan();

		$this->load->view('bidang/lingkungan', $data);
		
	}

	public function edit($id=null)
	{
		if(!isset($id)) redirect('bidang/lingkungan');

		$data['lingkungan'] = $this->bidang_model->getLingkunganById($id);
		if(!$data["lingkungan"]) show_404();

		$this->load->view('bidang/editlingkungan', $data);
		
	}
}
