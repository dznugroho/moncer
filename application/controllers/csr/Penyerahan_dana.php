<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Penyerahan_dana extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('csr_model');
		$this->load->model('admin_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
	}

	public function index()
	{
		if($this->session->userdata('role')=='1'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['usulans']		= $this->csr_model->getDanaCSR();
			// $data['danas']		= $this->csr_model->getTotalDana();
			$this->load->view('csr/penyerahan_dana', $data);
		}
	}

	public function show($id=null)
	{
		if(!isset($id)) redirect('csr/penyerahan_dana');

		if($this->session->userdata('role')=='1'){
			$data["usulan"]			= $this->csr_model->getById($id);
			$data["perusahaan"]		= $this->csr_model->getPerusahaan($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("csr/tinjau_pendanaan", $data);

		}
	}

	public function tutup($id=null)
	{
		if($this->session->userdata('role')=='1'){

			
			$csr				= $this->csr_model;
			
			$id					= $this->uri->segment(4);
			$status_pendanaan	= 2;
			
			
			$csr->tutupdana($id,$status_pendanaan);
			$this->session->set_flashdata('success', 'Pendanaan Berhasil Ditutup');

			return redirect('csr/penyerahan_dana');
		}
	}

	public function buka($id=null)
	{
		if($this->session->userdata('role')=='1'){

			
			$csr				= $this->csr_model;
			
			$id					= $this->uri->segment(4);
			$status_pendanaan	= 1;
			
			
			$csr->bukadana($id,$status_pendanaan);
			$this->session->set_flashdata('success', 'Pendanaan Berhasil Dibuka');

			return redirect('csr/penyerahan_dana');
		}
	}
	
}
