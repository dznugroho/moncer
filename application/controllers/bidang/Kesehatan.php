<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Kesehatan extends CI_Controller
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
		$data['kesehatans'] = $this->bidang_model->getKesehatan();

		$this->load->view('bidang/kesehatan', $data);
		
	}

	public function edit($id=null)
	{
		if(!isset($id)) redirect('bidang/kesehatan');

		$data['kesehatan'] = $this->bidang_model->getPendidikanById($id);
		if(!$data["kesehatan"]) show_404();

		$this->load->view('bidang/editkesehatan', $data);
		
	}
}
