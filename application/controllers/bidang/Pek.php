<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Pek extends CI_Controller
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
		$data['peks'] = $this->bidang_model->getPek();

		$this->load->view('bidang/pek', $data);
		
	}

	public function edit($id=null)
	{
		if(!isset($id)) redirect('bidang/pek');

		$data['pek'] = $this->bidang_model->getPekById($id);
		if(!$data["pek"]) show_404();

		$this->load->view('bidang/editpek', $data);
		
	}
}
