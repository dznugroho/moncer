<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Infrastruktur extends CI_Controller
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
		$data['infrastrukturs'] = $this->bidang_model->getInfrastruktur();

		$this->load->view('bidang/infrastruktur', $data);
		
	}

	public function edit($id=null)
	{
		if(!isset($id)) redirect('bidang/infrastruktur');

		$data['infrastruktur'] = $this->bidang_model->getInfrastrukturById($id);
		if(!$data["infrastruktur"]) show_404();

		$this->load->view('bidang/editinfrastruktur', $data);
		
	}
}
