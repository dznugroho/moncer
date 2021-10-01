<?php 
defined('BASEPATH') OR exit('No direct script allowed');

class Wilayah extends CI_Controller 
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('wilayah_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();

	}

	public function index()
	{

		$data['wilayahs'] = $this->wilayah_model->getAll();
		$this->load->view('wilayah/index', $data);
	}

	function getdesa(){
		$id = $this->input->post('id',TRUE);
		$data = $this->wilayah_model->getDesaID($id)->result();
		echo json_encode($data);
	}
}
