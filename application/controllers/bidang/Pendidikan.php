<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Pendidikan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
	}

	public function index()
	{
		if($this->session->userdata('role')!='1') redirect('home');
		$data['pendidikans'] = $this->bidang_model->getPendidikan();

		$this->load->view('bidang/pendidikan', $data);
		
	}

	public function edit($id=null)
	{
		if(!isset($id)) redirect('bidang/pendidikan');

		$data['pendidikan'] = $this->bidang_model->getPendidikanById($id);
		if(!$data["pendidikan"]) show_404();

		$this->load->view('bidang/editpendidikan', $data);
		
	}
}
