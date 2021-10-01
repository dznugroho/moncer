<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Usulan_terpilih extends CI_Controller
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
			$data['usulans']		= $this->csr_model->getUsulanTerpilih();
			$this->load->view('csr/usulan_terpilih', $data);
		}
	}

	public function show($id=null)
	{
		if(!isset($id)) redirect('csr/usulan_terpilih');

		if($this->session->userdata('role')=='1'){
			$data["usulan"]			= $this->csr_model->getById($id);
			$data["perusahaan"]		= $this->csr_model->getPerusahaan($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("csr/tinjau_usulanterpilih", $data);

		}
	}

	public function terima($id=null)
	{
		if($this->session->userdata('role')=='1'){

			$post	= $this->input->post();
			$csr	= $this->csr_model;
			
			$id					= $post["id"];
			$usulan_id			= $post["usulan_id"];
			$status_pilihan		= $post["status_pilihan"];
			$status_csr			= 2;
			
			$csr->terima($id,$usulan_id,$status_pilihan,$status_csr);
			$this->session->set_flashdata('success', 'Data has been updated');
			
			return redirect('csr/usulan_terpilih');
		}
	}

	public function tolak($id=null)
	{
		if($this->session->userdata('role')=='1'){

			$post	= $this->input->post();
			$csr	= $this->csr_model;
			
			$id					= $post["id"];
			$status_pilihan		= $post["status_pilihan"];
			
			$csr->tolak($id,$status_pilihan);
			$this->session->set_flashdata('success', 'Data has been updated');
			
			return redirect('csr/usulan_terpilih');
		}
	}

}
